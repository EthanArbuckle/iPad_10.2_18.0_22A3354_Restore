@implementation SXWebContentComponentExposureEvent

- (SXWebContentComponentExposureEvent)initWithComponent:(id)a3
{
  id v4;
  SXWebContentComponentExposureEvent *v5;
  uint64_t v6;
  NSString *componentIdentifier;
  uint64_t v8;
  NSURL *URL;
  void *v10;
  uint64_t v11;
  NSString *exposureIdentifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXWebContentComponentExposureEvent;
  v5 = -[SXAnalyticsEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "URL");
    v8 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    exposureIdentifier = v5->_exposureIdentifier;
    v5->_exposureIdentifier = (NSString *)v11;

  }
  return v5;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)exposureIdentifier
{
  return self->_exposureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end
