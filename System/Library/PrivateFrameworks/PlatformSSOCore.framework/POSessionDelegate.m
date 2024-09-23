@implementation POSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v6 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(a4, "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "serverTrust");

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
  {
    PO_LOG_POLoginConfiguration();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[POSessionDelegate URLSession:didReceiveChallenge:completionHandler:].cold.1(v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1818]), "initWithTrust:", v8);
    v6[2](v6, 0, v10);

  }
  else
  {
    v6[2](v6, 1, 0);
  }

}

- (void)URLSession:(os_log_t)log didReceiveChallenge:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24440D000, log, OS_LOG_TYPE_DEBUG, "Platform SSO test mode enabled", v1, 2u);
}

@end
