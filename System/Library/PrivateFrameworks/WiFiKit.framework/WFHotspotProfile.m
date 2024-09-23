@implementation WFHotspotProfile

- (WFHotspotProfile)initWithProfile:(id)a3 anqpResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  WFHotspotProfile *v11;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  os_log_type_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v14))
      goto LABEL_20;
    v20 = 136315138;
    v21 = "-[WFHotspotProfile initWithProfile:anqpResponse:]";
    v15 = "%s: nil profile";
LABEL_14:
    v16 = v13;
    v17 = v14;
    v18 = 12;
    goto LABEL_19;
  }
  if (!v7)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v14))
      goto LABEL_20;
    v20 = 136315138;
    v21 = "-[WFHotspotProfile initWithProfile:anqpResponse:]";
    v15 = "%s: nil anqp response";
    goto LABEL_14;
  }
  objc_msgSend(v6, "scanAttributes");
  v9 = WiFiNetworkCreate();
  if (!v9)
  {
    WFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v13 || !os_log_type_enabled(v13, v19))
      goto LABEL_20;
    v20 = 136315394;
    v21 = "-[WFHotspotProfile initWithProfile:anqpResponse:]";
    v22 = 2112;
    v23 = v6;
    v15 = "%s: failed to create network from profile %@";
    v16 = v13;
    v17 = v19;
    v18 = 22;
LABEL_19:
    _os_log_impl(&dword_219FC8000, v16, v17, v15, (uint8_t *)&v20, v18);
LABEL_20:

    v11 = 0;
    goto LABEL_5;
  }
  v10 = (const void *)v9;
  WiFiNetworkMerge();
  v11 = -[WFNetworkProfile initWithNetworkRef:](self, "initWithNetworkRef:", v10);
  CFRelease(v10);
LABEL_5:

  return v11;
}

@end
