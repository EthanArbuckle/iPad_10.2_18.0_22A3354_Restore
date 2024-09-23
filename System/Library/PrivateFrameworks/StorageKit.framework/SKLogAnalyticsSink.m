@implementation SKLogAnalyticsSink

- (void)sendEventWithName:(id)a3 eventPayloadBuilder:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  SKGetOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v6[2](v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_22FE50000, v7, OS_LOG_TYPE_INFO, "Sending event %@ with payload %@", (uint8_t *)&v9, 0x16u);

  }
}

@end
