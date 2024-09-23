@implementation CuttlefishCurrentItem

- (id)init:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  CuttlefishCurrentItem *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuttlefishCurrentItem;
  v9 = -[CuttlefishCurrentItem init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemPtr, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItem itemPtr](self, "itemPtr"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("itemPtr"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CuttlefishCurrentItem item](self, "item"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("item"));

}

- (CuttlefishCurrentItem)initWithCoder:(id)a3
{
  id v4;
  CuttlefishCurrentItem *v5;
  id v6;
  uint64_t v7;
  CKRecord *item;
  id v9;
  uint64_t v10;
  CuttlefishCurrentItemSpecifier *itemPtr;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CuttlefishCurrentItem;
  v5 = -[CuttlefishCurrentItem init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKRecord), CFSTR("item"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    item = v5->_item;
    v5->_item = (CKRecord *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CuttlefishCurrentItemSpecifier), CFSTR("itemPtr"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    itemPtr = v5->_itemPtr;
    v5->_itemPtr = (CuttlefishCurrentItemSpecifier *)v10;

  }
  return v5;
}

- (CuttlefishCurrentItemSpecifier)itemPtr
{
  return (CuttlefishCurrentItemSpecifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItemPtr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CKRecord)item
{
  return (CKRecord *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_itemPtr, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
