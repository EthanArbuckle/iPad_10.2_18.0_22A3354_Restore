@implementation WBSAvailableAppWithExtension

- (WBSAvailableAppWithExtension)initWithAdamID:(id)a3 platformSpecificBundleID:(id)a4
{
  id v6;
  id v7;
  WBSAvailableAppWithExtension *v8;
  uint64_t v9;
  NSString *adamID;
  uint64_t v11;
  NSString *platformSpecificBundleID;
  WBSAvailableAppWithExtension *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSAvailableAppWithExtension;
  v8 = -[WBSAvailableAppWithExtension init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    adamID = v8->_adamID;
    v8->_adamID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    platformSpecificBundleID = v8->_platformSpecificBundleID;
    v8->_platformSpecificBundleID = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)platformSpecificBundleID
{
  return self->_platformSpecificBundleID;
}

- (NSString)requiredTeamID
{
  return self->_requiredTeamID;
}

- (void)setRequiredTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredTeamID, 0);
  objc_storeStrong((id *)&self->_platformSpecificBundleID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
