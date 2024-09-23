@implementation PKRemoteAddSecureElementPassViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "View service terminated with error: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteAddSecureElementPassViewController didFinishWithPasses:error:](self, "didFinishWithPasses:error:", 0, v6);

}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKRemoteAddSecureElementPassViewController parentViewController](self, "parentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didFinishWithPasses:error:", v7, v6);

}

@end
