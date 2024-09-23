@implementation SSVMediaContentTasteItemUpdate

- (void)encodeWithCoder:(id)a3
{
  SSVMediaContentTasteItem *item;
  id v5;

  item = self->_item;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", item, CFSTR("SSVMediaContentTasteItemUpdateItem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updateDate, CFSTR("SSVMediaContentTasteItemUpdateUpdateDate"));

}

- (SSVMediaContentTasteItemUpdate)initWithCoder:(id)a3
{
  id v4;
  SSVMediaContentTasteItemUpdate *v5;
  uint64_t v6;
  SSVMediaContentTasteItem *item;
  uint64_t v8;
  NSDate *updateDate;

  v4 = a3;
  v5 = -[SSVMediaContentTasteItemUpdate init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSVMediaContentTasteItemUpdateItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (SSVMediaContentTasteItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSVMediaContentTasteItemUpdateUpdateDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    updateDate = v5->_updateDate;
    v5->_updateDate = (NSDate *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSVMediaContentTasteItemUpdate)initWithXPCEncoding:(id)a3
{
  id v4;
  uint64_t v5;
  id NSSecureCodingObjectForXPCObject;
  SSVMediaContentTasteItemUpdate *v7;

  v4 = a3;
  v5 = objc_opt_class();
  NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(v4, v5);

  v7 = (SSVMediaContentTasteItemUpdate *)NSSecureCodingObjectForXPCObject;
  return v7;
}

- (SSVMediaContentTasteItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void)setUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
