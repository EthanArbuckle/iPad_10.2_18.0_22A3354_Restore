@implementation INImageServiceConnection(Workflow)

- (void)wf_accessBundleContentForBundleIdentifiers:()Workflow withBlock:
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v9 = 0;
  LOBYTE(a1) = objc_msgSend(a1, "accessBundleContentForBundleIdentifiers:withBlock:error:", a3, v6, &v9);
  v7 = v9;
  if ((a1 & 1) == 0)
  {
    getWFIntentExecutionLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[INImageServiceConnection(Workflow) wf_accessBundleContentForBundleIdentifiers:withBlock:]";
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s -[INImageServiceConnection wf_accessBundleContentForBundleIdentifiers] failed with error: %{public}@", buf, 0x16u);
    }

    v6[2](v6);
  }

}

@end
