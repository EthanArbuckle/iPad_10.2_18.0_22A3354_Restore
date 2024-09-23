@implementation SDActivityPayloadRequestRecord

- (void)dealloc
{
  objc_super v3;

  -[RPCompanionLinkClient invalidate](self->_linkClient, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SDActivityPayloadRequestRecord;
  -[SDActivityPayloadRequestRecord dealloc](&v3, "dealloc");
}

- (id)description
{
  RPCompanionLinkClient *linkClient;
  __CFString *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *command;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  linkClient = self->_linkClient;
  if (linkClient)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("linkClient: <%@>, "), linkClient));
  else
    v4 = &stru_10072FE60;
  v5 = (objc_class *)objc_opt_class(self, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = SFHexStringForData(self->_advertisementPayload);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  command = self->_command;
  v15.receiver = self;
  v15.super_class = (Class)SDActivityPayloadRequestRecord;
  v11 = -[SDActivityRequestRecord description](&v15, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, advertisementPayload:%@, command:%@, %@%@>"), v7, self, v9, command, v4, v12));

  return v13;
}

- (NSData)advertisementPayload
{
  return self->_advertisementPayload;
}

- (void)setAdvertisementPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (RPCompanionLinkClient)linkClient
{
  return self->_linkClient;
}

- (void)setLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_linkClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkClient, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

@end
