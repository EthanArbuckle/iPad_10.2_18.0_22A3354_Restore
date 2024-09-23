@implementation WAMessage

- (WAMessage)initWithMetricName:(id)a3 options:(int64_t)a4
{
  id v6;
  WAMessage *v7;
  uint64_t v8;
  NSString *metricName;
  uint64_t v10;
  NSMutableDictionary *metricInfo;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WAMessage;
  v7 = -[WAMessage init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    metricName = v7->_metricName;
    v7->_metricName = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    metricInfo = v7->_metricInfo;
    v7->_metricInfo = (NSMutableDictionary *)v10;

    v7->_options = a4;
  }

  return v7;
}

- (void)addFieldForKey:(id)a3 value:(id)a4 options:(int64_t)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = +[WAUtil isInternalInstall](WAUtil, "isInternalInstall");
  if ((a5 & 1) != 0 && v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v9) & 1) == 0)
      {
        WALogCategoryDefaultHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v20 = v8;
          v21 = 2112;
          v22 = (id)objc_opt_class();
          v23 = 2112;
          v24 = v9;
          v16 = v22;
          _os_log_fault_impl(&dword_212581000, v11, OS_LOG_TYPE_FAULT, "CODE FIX NEEDED! Field cannot be sent to CoreAnalytics, removing CA option from field %@ (%@): %@", buf, 0x20u);

        }
        a5 = 0;
      }
    }
  }
  if ((objc_msgSend(v8, "containsString:", CFSTR("channelFlags")) & 1) != 0
    || objc_msgSend(v8, "containsString:", CFSTR("ChannelFlags")))
  {
    -[WAMessage addFieldsForChannelFlagLikeKey:value:options:](self, "addFieldsForChannelFlagLikeKey:value:options:", v8, v9, a5);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5, CFSTR("value"), CFSTR("options"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WAMessage metricInfo](self, "metricInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WAMessage metricInfo](self, "metricInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v13, v8);

  }
}

- (void)addFieldsForChannelFlagLikeKey:(id)a3 value:(id)a4 options:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __int16 v12;
  __int16 v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[WAMessage metricInfo](self, "metricInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Flags"), &stru_24CDE2220);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v12 = objc_msgSend(v9, "unsignedIntValue");
    v13 = v12;
    if ((v12 & 8) != 0)
    {
      v14 = CFSTR("2");
    }
    else if ((v12 & 0x10) != 0)
    {
      v14 = CFSTR("5");
    }
    else
    {
      if ((v12 & 0x2000) == 0)
      {
LABEL_10:
        if ((v13 & 0x800) != 0)
        {
          v19 = CFSTR("160");
          goto LABEL_18;
        }
        if ((v13 & 0x400) != 0)
        {
          v19 = CFSTR("80");
          goto LABEL_18;
        }
        if ((v13 & 4) != 0)
        {
          v19 = CFSTR("40");
          goto LABEL_18;
        }
        if ((v13 & 2) != 0)
        {
          v19 = CFSTR("20");
LABEL_18:
          -[WAMessage metricInfo](self, "metricInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = CFSTR("value");
          v24[1] = CFSTR("options");
          v25[0] = v19;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("BW"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v22, v23);

        }
LABEL_19:

        goto LABEL_20;
      }
      v14 = CFSTR("6");
    }
    -[WAMessage metricInfo](self, "metricInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = CFSTR("value");
    v26[1] = CFSTR("options");
    v27[0] = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v11, CFSTR("Band"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, v18);

    goto LABEL_10;
  }
LABEL_20:

}

- (void)addFieldsFromDictionary:(id)a3 options:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WAMessage addFieldForKey:value:options:](self, "addFieldForKey:value:options:", v12, v13, a4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  WAMessage *v4;

  v4 = -[WAMessage init](+[WAMessage allocWithZone:](WAMessage, "allocWithZone:", a3), "init");
  -[WAMessage setMetricName:](v4, "setMetricName:", self->_metricName);
  -[WAMessage setMetricInfo:](v4, "setMetricInfo:", self->_metricInfo);
  -[WAMessage setOptions:](v4, "setOptions:", self->_options);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *metricName;
  id v5;

  metricName = self->_metricName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", metricName, CFSTR("_metricName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metricInfo, CFSTR("_metricInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("_options"));

}

- (WAMessage)initWithCoder:(id)a3
{
  id v4;
  WAMessage *v5;
  uint64_t v6;
  NSString *metricName;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *metricInfo;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WAMessage;
  v5 = -[WAMessage init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_metricName"));
    v6 = objc_claimAutoreleasedReturnValue();
    metricName = v5->_metricName;
    v5->_metricName = (NSString *)v6;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v21, v20, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_metricInfo"));
    v17 = objc_claimAutoreleasedReturnValue();
    metricInfo = v5->_metricInfo;
    v5->_metricInfo = (NSMutableDictionary *)v17;

    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_options"));
  }

  return v5;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (void)setMetricName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)metricInfo
{
  return self->_metricInfo;
}

- (void)setMetricInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricInfo, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end
