@implementation STSTapToProvisionAppletData

- (STSTapToProvisionAppletData)initWithVersion:(id)a3
{
  id v5;
  STSTapToProvisionAppletData *v6;
  STSTapToProvisionAppletData *v7;
  NSArray *supportedPNOs;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STSTapToProvisionAppletData;
  v6 = -[STSTapToProvisionAppletData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_version, a3);
    supportedPNOs = v7->_supportedPNOs;
    v7->_supportedPNOs = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v7;
}

+ (id)fromOR:(id)a3
{
  id v3;
  STSTapToProvisionAppletData *v4;
  void *v5;
  STSTapToProvisionAppletData *v6;

  v3 = a3;
  v4 = [STSTapToProvisionAppletData alloc];
  objc_msgSend(v3, "provisionAppletVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[STSTapToProvisionAppletData initWithVersion:](v4, "initWithVersion:", v5);
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Applet Data : (version = %@"), self->_version);
}

- (NSString)version
{
  return self->_version;
}

- (NSArray)supportedPNOs
{
  return self->_supportedPNOs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPNOs, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
