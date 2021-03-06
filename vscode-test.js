// GNG provenance: https://github.com/redhat-developer/vscode-extension-tester/wiki/Writing-Simple-Tests

// import the webdriver and the high level browser wrapper
import { VSBrowser, WebDriver } from 'vscode-extension-tester';

// Create a Mocha suite
describe('My Test Suite', () => {
  let browser: VSBrowser;
  let driver: WebDriver

  // initialize the browser and webdriver
  before(async () => {
    browser = VSBrowser.instance;
    driver = browser.driver;
  });

  // test whatever we want using webdriver, here we are just checking the page title
  it('My Test Case', async () => {
    const title = await driver.getTitle();
    assert.equals(title, 'whatever');
  });
});