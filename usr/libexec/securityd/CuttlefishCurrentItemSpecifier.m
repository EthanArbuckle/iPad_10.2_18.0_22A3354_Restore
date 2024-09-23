@implementation CuttlefishCurrentItemSpecifier

- (id)init:(id)a3 zoneID:(id)a4
{
  id v7;
  id v8;
  CuttlefishCurrentItemSpecifier *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuttlefishCurrentItemSpecifier;
  v9 = -[CuttlefishCurrentItemSpecifier init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemPtrName, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItemSpecifier itemPtrName](self, "itemPtrName"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("itemPtrName"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItemSpecifier zoneID](self, "zoneID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("zoneID"));

}

- (CuttlefishCurrentItemSpecifier)initWithCoder:(id)a3
{
  id v4;
  CuttlefishCurrentItemSpecifier *v5;
  id v6;
  uint64_t v7;
  NSString *zoneID;
  id v9;
  uint64_t v10;
  NSString *itemPtrName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CuttlefishCurrentItemSpecifier;
  v5 = -[CuttlefishCurrentItemSpecifier init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("zoneID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("itemPtrName"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    itemPtrName = v5->_itemPtrName;
    v5->_itemPtrName = (NSString *)v10;

  }
  return v5;
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)itemPtrName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItemPtrName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemPtrName, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
