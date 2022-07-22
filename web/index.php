<?php
$KEYCLOAK_BASE_URL = 'http://localhost:8081';
$KEYCLOAK_REALM = 'test_realm';
$KEYCLOAK_CLIENT_ID = 'test_client';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
    <script src="<?= $KEYCLOAK_BASE_URL ?>/js/keycloak.js"></script>
    <script>
        var keycloak = null;
        var status_label = null;

        function initKeycloak() {
            var status_label = document.querySelector('#status_label');
            keycloak = new Keycloak({
              url: '<?= $KEYCLOAK_BASE_URL ?>',
              realm: '<?= $KEYCLOAK_REALM ?>',
              clientId: '<?= $KEYCLOAK_CLIENT_ID ?>'
            });
            keycloak.init({
                // dibutuhkan, kalau gak akan error inisialisasi. ref: https://stackoverflow.com/a/72069273
                checkLoginIframe: false,
            }).then(function(authenticated) {
                status_label.innerText = authenticated ? 'authenticated' : 'not authenticated';
            }).catch(function() {
                alert('failed to initialize');
            });
        }

      // memanfaatkan fungsi bawaan keycloak utk load user profile dari keycloak
      function loadKeycloakUserProfile() {
          keycloak.loadUserProfile()
          .then((profile) => {
              alert(JSON.stringify(profile));
          }).catch(function() {
              alert('Failed to load user profile');
          });
      }

    </script>
</head>
<body onload="initKeycloak()">
    status: <span id="status_label"></span>

    <button onclick="keycloak.login()">Login</button>
    <button onclick="keycloak.logout()">Logout</button>

    <button onclick="loadKeycloakUserProfile()">load user profile from keycloak</button>
</body>
</html>
