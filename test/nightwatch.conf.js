// we use a nightwatch.conf.js file so we can include comments and helper functions
module.exports = {
  "src_folders": [
    "test/e2e"// Where you are storing your Nightwatch e2e tests
  ],
  "output_folder": "./reports", // reports (test outcome) output by nightwatch
  "selenium": {
    "start_process": false,
    "server_path": "/opt/selenium/selenium-server-standalone.jar",
    "log_path": "test/e2e/reports",
    "host": "127.0.0.1",
    "port": 4444,
    "cli_args": {
      "webdriver.chrome.driver": "/opt/selenium/chromedriver-2.35"
    }
  },
  "test_settings": {
    "default": {
      "selenium_port": 4444,
      "selenium_host": "localhost",
      "silent": true,
      "desiredCapabilities": {
        "javascriptEnabled": true,
        "acceptSslCerts": true,
        "browserName": "chrome",
        "chromeOptions" : {
          "args" : ["headless", "no-sandbox", "disable-gpu"]
        }
      },
      "globals": {
        "waitForConditionTimeout": 5000 // sometimes internet is slow so wait.
      },
    }
},
}
