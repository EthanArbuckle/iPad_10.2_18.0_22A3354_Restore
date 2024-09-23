@implementation USOSerializedIdentifier

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6
{
  return -[USOSerializedIdentifier initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:](self, "initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:", a3, a4, a5, a6, 0, 0);
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7
{
  return -[USOSerializedIdentifier initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:](self, "initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:", a3, a4, a5, a6, a7, 0);
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8
{
  return -[USOSerializedIdentifier initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:groupIndex:](self, "initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:groupIndex:", a3, a4, a5, a6, a7, a8, 0);
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8 groupIndex:(id)a9
{
  return -[USOSerializedIdentifier initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:groupIndex:interpretationGroup:](self, "initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:groupIndex:interpretationGroup:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8 groupIndex:(id)a9 interpretationGroup:(id)a10
{
  id v16;
  id v17;
  USOSerializedIdentifier *v18;
  USOSerializedIdentifier *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)USOSerializedIdentifier;
  v18 = -[USOSerializedIdentifier init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_nodeIndex = a3;
    objc_storeStrong((id *)&v18->_value, a4);
    objc_storeStrong((id *)&v19->_appBundleId, a5);
    objc_storeStrong((id *)&v19->_namespaceString, a6);
    objc_storeStrong((id *)&v19->_probability, a7);
    objc_storeStrong((id *)&v19->_sourceComponent, a8);
    objc_storeStrong((id *)&v19->_groupIndex, a9);
    objc_storeStrong((id *)&v19->_interpretationGroup, a10);
  }

  return v19;
}

- (USOSerializedIdentifier)initWithCoder:(id)a3
{
  id v4;
  USOSerializedIdentifier *v5;
  void *v6;
  uint64_t v7;
  NSString *value;
  uint64_t v9;
  NSString *appBundleId;
  uint64_t v11;
  NSString *namespaceString;
  uint64_t v13;
  NSNumber *probability;
  uint64_t v15;
  NSNumber *sourceComponent;
  uint64_t v17;
  NSNumber *groupIndex;
  uint64_t v19;
  NSNumber *interpretationGroup;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)USOSerializedIdentifier;
  v5 = -[USOSerializedIdentifier init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_nodeIndex = objc_msgSend(v6, "unsignedLongLongValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v7 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
    v9 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespaceString"));
    v11 = objc_claimAutoreleasedReturnValue();
    namespaceString = v5->_namespaceString;
    v5->_namespaceString = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("probability"));
    v13 = objc_claimAutoreleasedReturnValue();
    probability = v5->_probability;
    v5->_probability = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceComponent"));
    v15 = objc_claimAutoreleasedReturnValue();
    sourceComponent = v5->_sourceComponent;
    v5->_sourceComponent = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIndex"));
    v17 = objc_claimAutoreleasedReturnValue();
    groupIndex = v5->_groupIndex;
    v5->_groupIndex = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interpretationGroup"));
    v19 = objc_claimAutoreleasedReturnValue();
    interpretationGroup = v5->_interpretationGroup;
    v5->_interpretationGroup = (NSNumber *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", -[USOSerializedIdentifier nodeIndex](self, "nodeIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("nodeIndex"));

  -[USOSerializedIdentifier value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("value"));

  -[USOSerializedIdentifier appBundleId](self, "appBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("appBundleId"));

  -[USOSerializedIdentifier namespaceString](self, "namespaceString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("namespaceString"));

  -[USOSerializedIdentifier probability](self, "probability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("probability"));

  -[USOSerializedIdentifier sourceComponent](self, "sourceComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("sourceComponent"));

  -[USOSerializedIdentifier groupIndex](self, "groupIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("groupIndex"));

  -[USOSerializedIdentifier interpretationGroup](self, "interpretationGroup");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("interpretationGroup"));

}

- (unint64_t)nodeIndex
{
  return self->_nodeIndex;
}

- (void)setNodeIndex:(unint64_t)a3
{
  self->_nodeIndex = a3;
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)namespaceString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)probability
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)sourceComponent
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)groupIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)interpretationGroup
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpretationGroup, 0);
  objc_storeStrong((id *)&self->_groupIndex, 0);
  objc_storeStrong((id *)&self->_sourceComponent, 0);
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_namespaceString, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
