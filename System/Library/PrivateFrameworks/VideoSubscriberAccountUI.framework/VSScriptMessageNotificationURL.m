@implementation VSScriptMessageNotificationURL

void __VSScriptMessageNotificationURL_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSScriptMessageNotificationURL_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSScriptMessageNotificationURL___vs_lazy_init_variable;
  VSScriptMessageNotificationURL___vs_lazy_init_variable = v0;

}

id __VSScriptMessageNotificationURL_block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v0, "setScheme:", CFSTR("com.apple.VideoSubscriberAccount"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPath:", v2);

  objc_msgSend(v0, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [components URL] parameter must not be nil."));
  objc_msgSend(v0, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
