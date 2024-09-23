@implementation ORProvisionAppletData

- (ORProvisionAppletData)initWithProvisionAppletVersion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ORProvisionAppletData *v10;
  uint64_t v11;
  NSString *provisionAppletVersion;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ORProvisionAppletData;
  v10 = -[ORProvisionAppletData init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    provisionAppletVersion = v10->_provisionAppletVersion;
    v10->_provisionAppletVersion = (NSString *)v11;

  }
  return v10;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("{provisionAppletVersion=%@}"), v2, v3, v4, self->_provisionAppletVersion);
}

- (ORProvisionAppletData)initWithVersion:(id)a3 supportedPNOs:(id)a4
{
  return (ORProvisionAppletData *)((uint64_t (*)(ORProvisionAppletData *, char *, id, id))MEMORY[0x24BEDD108])(self, sel_initWithProvisionAppletVersion_, a3, a4);
}

- (NSString)version
{
  return self->_provisionAppletVersion;
}

- (NSArray)supportedPNOs
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_provisionAppletVersion, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ORProvisionAppletData)initWithCoder:(id)a3
{
  id v4;
  ORProvisionAppletData *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *provisionAppletVersion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORProvisionAppletData;
  v5 = -[ORProvisionAppletData init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("provisionAppletVersion"), v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    provisionAppletVersion = v5->_provisionAppletVersion;
    v5->_provisionAppletVersion = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_provisionAppletVersion, (uint64_t)CFSTR("provisionAppletVersion"), v3, v4);
}

- (NSString)provisionAppletVersion
{
  return self->_provisionAppletVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionAppletVersion, 0);
}

@end
