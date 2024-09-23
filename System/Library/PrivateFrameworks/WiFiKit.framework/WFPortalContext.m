@implementation WFPortalContext

- (WFPortalContext)initWithCaptiveProfile:(id)a3
{
  id v4;
  WFPortalContext *v5;
  uint64_t v6;
  NSString *venueInfoURL;
  uint64_t v8;
  WFPortalContext *userPortalURL;
  NSObject *v11;
  os_log_type_t v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFPortalContext;
  v5 = -[WFPortalContext init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE14B48]);
      v6 = objc_claimAutoreleasedReturnValue();
      venueInfoURL = v5->_venueInfoURL;
      v5->_venueInfoURL = (NSString *)v6;

      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE14B40]);
      v8 = objc_claimAutoreleasedReturnValue();
      userPortalURL = (WFPortalContext *)v5->_userPortalURL;
      v5->_userPortalURL = (NSString *)v8;
    }
    else
    {
      WFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(4uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 4 && v11 && os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[WFPortalContext initWithCaptiveProfile:]";
        _os_log_impl(&dword_219FC8000, v11, v12, "%s: nil captiveProfile", buf, 0xCu);
      }

      userPortalURL = v5;
      v5 = 0;
    }
  }
  else
  {
    userPortalURL = 0;
  }

  return v5;
}

- (id)portalURLForDisplay
{
  void *v3;

  -[WFPortalContext venueInfoURL](self, "venueInfoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[WFPortalContext venueInfoURL](self, "venueInfoURL");
  else
    -[WFPortalContext userPortalURL](self, "userPortalURL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)venueInfoURL
{
  return self->_venueInfoURL;
}

- (void)setVenueInfoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)userPortalURL
{
  return self->_userPortalURL;
}

- (void)setUserPortalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPortalURL, 0);
  objc_storeStrong((id *)&self->_venueInfoURL, 0);
}

@end
