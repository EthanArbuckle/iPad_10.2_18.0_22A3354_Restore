@implementation APPCPolicyData

- (NSString)userStatus
{
  return self->_userStatus;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_policyType)));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("policyType"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_policyValue, CFSTR("policyValue"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_isXLFormat, CFSTR("isXLFormat"));
  objc_msgSend(v3, "setValue:forKey:", self->_containerType, CFSTR("containerType"));
  objc_msgSend(v3, "setValue:forKey:", self->_adType, CFSTR("adType"));
  objc_msgSend(v3, "setValue:forKey:", self->_expression, CFSTR("expression"));
  objc_msgSend(v3, "setValue:forKey:", self->_placementDescriptor, CFSTR("placementDescriptor"));
  objc_msgSend(v3, "setValue:forKey:", self->_adFormatType, CFSTR("adFormatType"));
  objc_msgSend(v3, "setValue:forKey:", self->_userStatus, CFSTR("userStatus"));
  objc_msgSend(v3, "setValue:forKey:", self->_targetingExpression, CFSTR("targetingExpression"));
  objc_msgSend(v3, "setValue:forKey:", self->_dataAdapters, CFSTR("dataAdapters"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APPCPolicyData)initWithCoder:(id)a3
{
  id v4;
  APPCPolicyData *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSNumber *policyValue;
  id v15;
  uint64_t v16;
  NSString *containerType;
  id v18;
  uint64_t v19;
  NSString *adType;
  id v21;
  uint64_t v22;
  NSString *expression;
  uint64_t v24;
  NSArray *targetingExpression;
  uint64_t v26;
  NSDictionary *dataAdapters;
  id v28;
  uint64_t v29;
  NSString *placementDescriptor;
  id v31;
  uint64_t v32;
  NSString *adFormatType;
  id v34;
  uint64_t v35;
  NSString *userStatus;
  id v37;
  uint64_t v38;
  NSNumber *isXLFormat;

  v4 = a3;
  v5 = -[APPCPolicyData init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSArray);
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(NSString), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_opt_class(NSDictionary);
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(NSString), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v5->_policyType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("policyType"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("policyValue"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    policyValue = v5->_policyValue;
    v5->_policyValue = (NSNumber *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("containerType"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    containerType = v5->_containerType;
    v5->_containerType = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("adType"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    adType = v5->_adType;
    v5->_adType = (NSString *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("expression"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    expression = v5->_expression;
    v5->_expression = (NSString *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("targetingExpression")));
    targetingExpression = v5->_targetingExpression;
    v5->_targetingExpression = (NSArray *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("dataAdapters")));
    dataAdapters = v5->_dataAdapters;
    v5->_dataAdapters = (NSDictionary *)v26;

    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("placementDescriptor"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    placementDescriptor = v5->_placementDescriptor;
    v5->_placementDescriptor = (NSString *)v29;

    v31 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("adFormatType"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    adFormatType = v5->_adFormatType;
    v5->_adFormatType = (NSString *)v32;

    v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("userStatus"));
    v35 = objc_claimAutoreleasedReturnValue(v34);
    userStatus = v5->_userStatus;
    v5->_userStatus = (NSString *)v35;

    v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("isXLFormat"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    isXLFormat = v5->_isXLFormat;
    v5->_isXLFormat = (NSNumber *)v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[APPCPolicyData policyType](self, "policyType"), CFSTR("policyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData policyValue](self, "policyValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("policyValue"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData containerType](self, "containerType"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("containerType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData adType](self, "adType"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("adType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData expression](self, "expression"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("expression"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData targetingExpression](self, "targetingExpression"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("targetingExpression"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData dataAdapters](self, "dataAdapters"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dataAdapters"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData placementDescriptor](self, "placementDescriptor"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("placementDescriptor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData adFormatType](self, "adFormatType"));
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("adFormatType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APPCPolicyData userStatus](self, "userStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("userStatus"));

  v14 = (id)objc_claimAutoreleasedReturnValue(-[APPCPolicyData isXLFormat](self, "isXLFormat"));
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("isXLFormat"));

}

- (APPCPolicyData)initWithPolicyType:(int64_t)a3 policyValue:(id)a4 isXLFormat:(id)a5
{
  id v9;
  id v10;
  APPCPolicyData *v11;
  APPCPolicyData *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)APPCPolicyData;
  v11 = -[APPCPolicyData init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_policyType = a3;
    objc_storeStrong((id *)&v11->_policyValue, a4);
    objc_storeStrong((id *)&v12->_isXLFormat, a5);
  }

  return v12;
}

- (int64_t)policyType
{
  return self->_policyType;
}

- (NSNumber)policyValue
{
  return self->_policyValue;
}

- (NSNumber)isXLFormat
{
  return self->_isXLFormat;
}

- (NSString)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
  objc_storeStrong((id *)&self->_expression, a3);
}

- (NSArray)targetingExpression
{
  return self->_targetingExpression;
}

- (void)setTargetingExpression:(id)a3
{
  objc_storeStrong((id *)&self->_targetingExpression, a3);
}

- (NSDictionary)dataAdapters
{
  return self->_dataAdapters;
}

- (void)setDataAdapters:(id)a3
{
  objc_storeStrong((id *)&self->_dataAdapters, a3);
}

- (NSString)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(id)a3
{
  objc_storeStrong((id *)&self->_containerType, a3);
}

- (NSString)adType
{
  return self->_adType;
}

- (void)setAdType:(id)a3
{
  objc_storeStrong((id *)&self->_adType, a3);
}

- (NSString)placementDescriptor
{
  return self->_placementDescriptor;
}

- (void)setPlacementDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_placementDescriptor, a3);
}

- (NSString)adFormatType
{
  return self->_adFormatType;
}

- (void)setAdFormatType:(id)a3
{
  objc_storeStrong((id *)&self->_adFormatType, a3);
}

- (void)setUserStatus:(id)a3
{
  objc_storeStrong((id *)&self->_userStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_adFormatType, 0);
  objc_storeStrong((id *)&self->_placementDescriptor, 0);
  objc_storeStrong((id *)&self->_adType, 0);
  objc_storeStrong((id *)&self->_containerType, 0);
  objc_storeStrong((id *)&self->_dataAdapters, 0);
  objc_storeStrong((id *)&self->_targetingExpression, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_isXLFormat, 0);
  objc_storeStrong((id *)&self->_policyValue, 0);
}

@end
