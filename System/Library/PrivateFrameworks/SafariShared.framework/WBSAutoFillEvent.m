@implementation WBSAutoFillEvent

- (WBSAutoFillEvent)initWithUsername:(id)a3 tabID:(id)a4 isPrivateTab:(BOOL)a5 url:(id)a6
{
  id v10;
  id v11;
  id v12;
  WBSAutoFillEvent *v13;
  uint64_t v14;
  NSString *username;
  uint64_t v16;
  NSURL *url;
  WBSAutoFillEvent *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBSAutoFillEvent;
  v13 = -[WBSAutoFillEvent init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    username = v13->_username;
    v13->_username = (NSString *)v14;

    objc_storeStrong((id *)&v13->_tabID, a4);
    v13->_isPrivateTab = a5;
    v16 = objc_msgSend(v12, "copy");
    url = v13->_url;
    v13->_url = (NSURL *)v16;

    v13->_machTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v18 = v13;
  }

  return v13;
}

- (unint64_t)timeIntervalSinceTimestamp
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_machTimestamp;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)WBSAutoFillEvent;
  -[WBSAutoFillEvent description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; user = '%@'; tabID = %@; isPrivate = %{BOOL}d timestamp = %lld>"),
    v4,
    self->_username,
    self->_tabID,
    self->_isPrivateTab,
    self->_machTimestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)tabID
{
  return self->_tabID;
}

- (void)setTabID:(id)a3
{
  objc_storeStrong((id *)&self->_tabID, a3);
}

- (BOOL)isPrivateTab
{
  return self->_isPrivateTab;
}

- (void)setIsPrivateTab:(BOOL)a3
{
  self->_isPrivateTab = a3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)machTimestamp
{
  return self->_machTimestamp;
}

- (void)setMachTimestamp:(unint64_t)a3
{
  self->_machTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_tabID, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
