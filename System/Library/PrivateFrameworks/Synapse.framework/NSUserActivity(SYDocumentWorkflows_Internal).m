@implementation NSUserActivity(SYDocumentWorkflows_Internal)

- (void)loadDocumentWithHandler:()SYDocumentWorkflows_Internal
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void (**v8)(id, uint64_t);

  v8 = a3;
  -[NSUserActivity _syDocument](a1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[NSUserActivity(SYDocumentWorkflows_Internal) loadDocumentWithHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("user activity doesn't have a document."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v5 = (void *)v4;
  v8[2](v8, v4);

}

- (void)loadDocumentWithHandler:()SYDocumentWorkflows_Internal .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BCC38000, log, OS_LOG_TYPE_FAULT, "user activity doesn't have a document.", v1, 2u);
}

@end
