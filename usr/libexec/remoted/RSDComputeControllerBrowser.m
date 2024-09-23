@implementation RSDComputeControllerBrowser

- (OS_nw_browser)nw_browser
{
  return self->_nw_browser;
}

- (void)setNw_browser:(id)a3
{
  objc_storeStrong((id *)&self->_nw_browser, a3);
}

- (OS_os_transaction)browser_tx
{
  return self->_browser_tx;
}

- (void)setBrowser_tx:(id)a3
{
  objc_storeStrong((id *)&self->_browser_tx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browser_tx, 0);
  objc_storeStrong((id *)&self->_nw_browser, 0);
}

@end
