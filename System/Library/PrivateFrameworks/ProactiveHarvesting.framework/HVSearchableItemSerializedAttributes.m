@implementation HVSearchableItemSerializedAttributes

- (HVSearchableItemSerializedAttributes)initWithAttributeSetData:(id)a3 attributeSetCoder:(id)a4 htmlContentData:(id)a5
{
  id v10;
  id v11;
  id v12;
  HVSearchableItemSerializedAttributes *v13;
  HVSearchableItemSerializedAttributes *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVSearchableItemSerializedAttributes.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributeSetData"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HVSearchableItemSerializedAttributes.m"), 13, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributeSetCoder"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HVSearchableItemSerializedAttributes;
  v13 = -[HVSearchableItemSerializedAttributes init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_attributeSetData, a3);
    objc_storeStrong((id *)&v14->_attributeSetCoder, a4);
    objc_storeStrong((id *)&v14->_htmlContentData, a5);
  }

  return v14;
}

- (BOOL)isEqualToSerializedAttributes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSData *attributeSetData;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  CSCoder *attributeSetCoder;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSData *htmlContentData;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_attributeSetData != 0;
  objc_msgSend(v4, "attributeSetData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  attributeSetData = self->_attributeSetData;
  if (attributeSetData)
  {
    objc_msgSend(v5, "attributeSetData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSData isEqual:](attributeSetData, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_attributeSetCoder != 0;
  objc_msgSend(v5, "attributeSetCoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  attributeSetCoder = self->_attributeSetCoder;
  if (attributeSetCoder)
  {
    objc_msgSend(v5, "attributeSetCoder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CSCoder isEqual:](attributeSetCoder, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_htmlContentData != 0;
  objc_msgSend(v5, "htmlContentData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    htmlContentData = self->_htmlContentData;
    if (htmlContentData)
    {
      objc_msgSend(v5, "htmlContentData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSData isEqual:](htmlContentData, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  HVSearchableItemSerializedAttributes *v4;
  HVSearchableItemSerializedAttributes *v5;
  BOOL v6;

  v4 = (HVSearchableItemSerializedAttributes *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[HVSearchableItemSerializedAttributes isEqualToSerializedAttributes:](self, "isEqualToSerializedAttributes:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_attributeSetData, "hash");
  v4 = -[CSCoder hash](self->_attributeSetCoder, "hash") - v3 + 32 * v3;
  return -[NSData hash](self->_htmlContentData, "hash") - v4 + 32 * v4;
}

- (NSData)attributeSetData
{
  return self->_attributeSetData;
}

- (CSCoder)attributeSetCoder
{
  return self->_attributeSetCoder;
}

- (NSData)htmlContentData
{
  return self->_htmlContentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_attributeSetCoder, 0);
  objc_storeStrong((id *)&self->_attributeSetData, 0);
}

+ (id)serializedAttributesWithAttributeSetData:(id)a3 attributeSetCoder:(id)a4 htmlContentData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeSetData:attributeSetCoder:htmlContentData:", v10, v9, v8);

  return v11;
}

@end
