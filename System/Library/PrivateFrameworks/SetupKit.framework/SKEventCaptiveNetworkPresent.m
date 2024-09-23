@implementation SKEventCaptiveNetworkPresent

- (SKEventCaptiveNetworkPresent)initWithCaptiveURL:(id)a3 interfaceIdentifier:(id)a4 ssid:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKEventCaptiveNetworkPresent *v11;
  uint64_t v12;
  NSString *captiveInterfaceIdentifier;
  uint64_t v14;
  NSString *captiveSSID;
  uint64_t v16;
  NSURL *captiveURL;
  SKEventCaptiveNetworkPresent *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SKEvent initWithEventType:](self, "initWithEventType:", 200);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    captiveInterfaceIdentifier = v11->_captiveInterfaceIdentifier;
    v11->_captiveInterfaceIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    captiveSSID = v11->_captiveSSID;
    v11->_captiveSSID = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    captiveURL = v11->_captiveURL;
    v11->_captiveURL = (NSURL *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)descriptionWithLevel:(int)a3
{
  id v3;
  id v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v10;

  if ((a3 & 0x8000000) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v3 = 0;

  }
  CUAppendF();
  v4 = v3;

  CUAppendF();
  v5 = v4;

  CUAppendF();
  v6 = (__CFString *)v5;

  v7 = &stru_24D22B2A0;
  if (v6)
    v7 = v6;
  v8 = v7;

  return v8;
}

- (NSString)captiveInterfaceIdentifier
{
  return self->_captiveInterfaceIdentifier;
}

- (NSString)captiveSSID
{
  return self->_captiveSSID;
}

- (NSURL)captiveURL
{
  return self->_captiveURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captiveURL, 0);
  objc_storeStrong((id *)&self->_captiveSSID, 0);
  objc_storeStrong((id *)&self->_captiveInterfaceIdentifier, 0);
}

@end
