@implementation SBSFeatureFlag

- (SBSFeatureFlag)initWith:(id)a3 andFeature:(id)a4 andValue:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSFeatureFlag *v12;
  SBSFeatureFlag *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBSFeatureFlag;
  v12 = -[SBSFeatureFlag init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_domain, a3);
    objc_storeStrong((id *)&v13->_feature, a4);
    objc_storeStrong((id *)&v13->_value, a5);
  }

  return v13;
}

- (SBSFeatureFlag)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SBSFeatureFlag *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  NSString *domain;
  uint64_t v12;
  NSString *feature;
  uint64_t v14;
  NSNumber *value;
  SBSFeatureFlag *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSFeatureFlag;
  v5 = -[SBSFeatureFlag init](&v19, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v10 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feature"));
    v12 = objc_claimAutoreleasedReturnValue();
    feature = v5->_feature;
    v5->_feature = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v14 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v14;

LABEL_6:
    v16 = v5;
    goto LABEL_12;
  }
LABEL_9:
  _SBSLoggingFacility();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SBSFeatureFlag initWithDictionaryRepresentation:]";
    v22 = 2112;
    v23 = v4;
    _os_log_error_impl(&dword_222D7A000, v17, OS_LOG_TYPE_ERROR, "%s: Trying to set feature flag with incorrect entry: %@", buf, 0x16u);
  }

  v16 = 0;
LABEL_12:

  return v16;
}

- (NSDictionary)dictionaryRepresentation
{
  __int128 v2;
  _QWORD v4[3];
  __int128 v5;
  NSNumber *value;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_OWORD *)&self->_domain;
  v4[0] = CFSTR("domain");
  v4[1] = CFSTR("feature");
  v5 = v2;
  v4[2] = CFSTR("value");
  value = self->_value;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v5, v4, 3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
