@implementation PLCoalitionDataObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalStruct, 0);
  objc_storeStrong((id *)&self->_launchdName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSString)launchdName
{
  return self->_launchdName;
}

- (BOOL)isUIKitApp
{
  return self->_isUIKitApp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setLaunchdName:(id)a3
{
  NSString *v4;
  NSString *launchdName;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "containsString:", CFSTR("/")))
  {
    objc_msgSend(v6, "lastPathComponent");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (NSString *)v6;
  }
  launchdName = self->_launchdName;
  self->_launchdName = v4;

}

- (void)setIsUIKitApp:(BOOL)a3
{
  self->_isUIKitApp = a3;
}

- (void)setCoalitionID:(unint64_t)a3
{
  self->_coalitionID = a3;
}

- (void)setCoalStruct:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[PLCoalitionDataObject coalStruct](self, "coalStruct");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLCoalitionDataObject coalStruct](self, "coalStruct");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "pointerValue");

    if (v5)
      free(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)PLCoalitionDataObject;
  -[PLCoalitionDataObject dealloc](&v6, sel_dealloc);
}

- (NSValue)coalStruct
{
  return (NSValue *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)coalitionID
{
  return self->_coalitionID;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PLCoalitionDataObject coalitionID](self, "coalitionID");
  -[PLCoalitionDataObject launchdName](self, "launchdName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoalitionDataObject bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ID: %llu\nLaunchdName: %@\nBundleID: %@\n"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
