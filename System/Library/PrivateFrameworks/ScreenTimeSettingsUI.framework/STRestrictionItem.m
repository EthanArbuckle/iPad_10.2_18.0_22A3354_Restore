@implementation STRestrictionItem

- (STRestrictionItem)initWithConfiguration:(id)a3 restrictionKey:(id)a4 labelName:(id)a5 type:(unint64_t)a6 restrictionValue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  STRestrictionItem *v17;
  uint64_t v18;
  NSString *rmConfiguration;
  uint64_t v20;
  NSString *payloadKey;
  uint64_t v22;
  NSString *uiLabel;
  uint64_t v24;
  id otherInfo;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labelName"));

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)STRestrictionItem;
  v17 = -[STRestrictionItem init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    rmConfiguration = v17->_rmConfiguration;
    v17->_rmConfiguration = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    payloadKey = v17->_payloadKey;
    v17->_payloadKey = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    uiLabel = v17->_uiLabel;
    v17->_uiLabel = (NSString *)v22;

    v17->_restrictionType = a6;
    v24 = objc_msgSend(v16, "copy");
    otherInfo = v17->_otherInfo;
    v17->_otherInfo = (id)v24;

  }
  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[STRestrictionItem rmConfiguration](self, "rmConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[STRestrictionItem payloadKey](self, "payloadKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "rmConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRestrictionItem rmConfiguration](self, "rmConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "payloadKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRestrictionItem payloadKey](self, "payloadKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[STRestrictionItem rmConfiguration](self, "rmConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRestrictionItem payloadKey](self, "payloadKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Conf:%@ Key:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", self->_rmConfiguration, self->_payloadKey, self->_uiLabel, self->_restrictionType, self->_otherInfo);
}

- (NSString)rmConfiguration
{
  return self->_rmConfiguration;
}

- (NSString)payloadKey
{
  return self->_payloadKey;
}

- (NSString)uiLabel
{
  return self->_uiLabel;
}

- (unint64_t)restrictionType
{
  return self->_restrictionType;
}

- (id)otherInfo
{
  return self->_otherInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_otherInfo, 0);
  objc_storeStrong((id *)&self->_uiLabel, 0);
  objc_storeStrong((id *)&self->_payloadKey, 0);
  objc_storeStrong((id *)&self->_rmConfiguration, 0);
}

@end
