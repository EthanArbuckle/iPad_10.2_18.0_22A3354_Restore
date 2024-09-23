@implementation WAMessageAWD

- (WAMessageAWD)init
{
  WAMessageAWD *v2;
  void *v3;
  uint64_t v4;
  NSString *uuid;
  NSMutableDictionary *v6;
  NSMutableDictionary *mutableFields;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WAMessageAWD;
  v2 = -[WAMessageAWD init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mutableFields = v2->_mutableFields;
    v2->_mutableFields = v6;

  }
  return v2;
}

- (WAMessageAWD)initWithKey:(id)a3 andFields:(id)a4 isRootMessage:(BOOL)a5 originalClassName:(id)a6 uuid:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  WAMessageAWD *v16;
  WAMessageAWD *v17;
  uint64_t v18;
  NSString *originalClassName;
  uint64_t v20;
  NSString *key;
  uint64_t v22;
  NSString *uuid;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSMutableDictionary *mutableFields;
  NSMutableDictionary *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  NSString *v44;
  NSMutableDictionary *v45;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  NSMutableDictionary *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v54.receiver = self;
  v54.super_class = (Class)WAMessageAWD;
  v16 = -[WAMessageAWD init](&v54, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_11;
  v16->_isRootMessage = a5;
  v18 = objc_msgSend(v14, "mutableCopy");
  originalClassName = v17->_originalClassName;
  v17->_originalClassName = (NSString *)v18;

  v20 = objc_msgSend(v12, "mutableCopy");
  key = v17->_key;
  v17->_key = (NSString *)v20;

  v22 = objc_msgSend(v15, "mutableCopy");
  uuid = v17->_uuid;
  v17->_uuid = (NSString *)v22;

  if (v17->_uuid)
  {
    if (v13)
      goto LABEL_4;
LABEL_9:
    v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mutableFields = v17->_mutableFields;
    v17->_mutableFields = v45;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "UUIDString");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v17->_uuid;
  v17->_uuid = (NSString *)v43;

  if (!v13)
    goto LABEL_9;
LABEL_4:
  v47 = (void *)MEMORY[0x24BDBCF20];
  v48 = (void *)MEMORY[0x24BDD1620];
  v24 = v13;
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v51 = v12;
  v28 = objc_opt_class();
  v49 = v15;
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v50 = v14;
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = v25;
  v13 = v24;
  objc_msgSend(v47, "setWithObjects:", v34, v26, v27, v28, v29, v30, v31, v32, v33, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, &v53);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v53;
  v52 = v37;
  objc_msgSend(v48, "unarchivedObjectOfClasses:fromData:error:", v35, v36, &v52);
  v38 = objc_claimAutoreleasedReturnValue();
  mutableFields = (NSMutableDictionary *)v52;

  v15 = v49;
  v40 = v17->_mutableFields;
  v17->_mutableFields = (NSMutableDictionary *)v38;

  v14 = v50;
  v12 = v51;
  if (mutableFields)
  {
    WALogCategoryDefaultHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v56 = "-[WAMessageAWD initWithKey:andFields:isRootMessage:originalClassName:uuid:]";
      v57 = 1024;
      v58 = 60;
      v59 = 2112;
      v60 = mutableFields;
      _os_log_impl(&dword_212581000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to archivedDataWithRootObject: %@ ", buf, 0x1Cu);
    }

    goto LABEL_10;
  }
LABEL_11:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WAMessageAWD uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)fieldForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *originalClassName;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSString *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  _BYTE v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WAMessageAWD mutableFields](self, "mutableFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      originalClassName = self->_originalClassName;
      *(_DWORD *)buf = 136446978;
      v33 = "-[WAMessageAWD fieldForKey:]";
      v34 = 1024;
      *(_DWORD *)v35 = 85;
      *(_WORD *)&v35[4] = 2112;
      *(_QWORD *)&v35[6] = v4;
      *(_WORD *)&v35[14] = 2112;
      *(_QWORD *)&v35[16] = originalClassName;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to access field with key: %@ (message original classname: %@) but it doesn't exist. Most common reason is protobuf change without population logic update", buf, 0x26u);
    }
    v26 = v4;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[WAMessageAWD mutableFields](self, "mutableFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[WAMessageAWD mutableFields](self, "mutableFields");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          WALogCategoryDefaultHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = objc_msgSend(v17, "isRepeatable");
            v20 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
            *(_DWORD *)buf = 136446978;
            v33 = "-[WAMessageAWD fieldForKey:]";
            v34 = 1024;
            *(_DWORD *)v35 = 90;
            *(_WORD *)&v35[4] = 1024;
            *(_DWORD *)&v35[6] = v19;
            *(_WORD *)&v35[10] = 2080;
            *(_QWORD *)&v35[12] = v20;
            _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_INFO, "%{public}s::%d:Found repeatable %d Key:: %s", buf, 0x22u);
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    WALogCategoryDefaultHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v4 = v26;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      v25 = self->_originalClassName;
      *(_DWORD *)buf = 138412546;
      v33 = (const char *)v26;
      v34 = 2112;
      *(_QWORD *)v35 = v25;
      _os_log_fault_impl(&dword_212581000, v21, OS_LOG_TYPE_FAULT, "Attempt to access field with key: %@ (message original classname: %@)", buf, 0x16u);
    }

  }
  -[WAMessageAWD mutableFields](self, "mutableFields");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v20 = (void *)MEMORY[0x24BDD1620];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  v21 = v15;
  objc_msgSend(v20, "unarchivedObjectOfClasses:fromData:error:", v13, v14, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;

  if (v17)
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "-[WAMessageAWD copyWithZone:]";
      v25 = 1024;
      v26 = 104;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWD copyWithZone failed, unarchive/archive error: %@", buf, 0x1Cu);
    }

  }
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[WAMessageAWD key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAMessageAWD originalClassName](self, "originalClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("WAMessageAWD %@ (%@) (ID: 0x%02x) fields:\n"), v5, v6, -[WAMessageAWD metricID](self, "metricID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WAMessageAWD mutableFields](self, "mutableFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[WAMessageAWD mutableFields](self, "mutableFields");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendFormat:", CFSTR("               %@ %@\n"), v14, v16);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *mutableFields;
  id v5;

  mutableFields = self->_mutableFields;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mutableFields, CFSTR("_mutableFields"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("_key"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRootMessage, CFSTR("_isRootMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalClassName, CFSTR("_originalClassName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_metricID, CFSTR("_metricID"));

}

- (WAMessageAWD)initWithCoder:(id)a3
{
  id v4;
  WAMessageAWD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *mutableFields;
  uint64_t v17;
  NSString *key;
  uint64_t v19;
  NSString *originalClassName;
  uint64_t v21;
  NSString *uuid;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WAMessageAWD;
  v5 = -[WAMessageAWD init](&v25, sel_init);
  if (v5)
  {
    v24 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_mutableFields"));
    v15 = objc_claimAutoreleasedReturnValue();
    mutableFields = v5->_mutableFields;
    v5->_mutableFields = (NSMutableDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_key"));
    v17 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v17;

    v5->_isRootMessage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRootMessage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalClassName"));
    v19 = objc_claimAutoreleasedReturnValue();
    originalClassName = v5->_originalClassName;
    v5->_originalClassName = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid"));
    v21 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v21;

    v5->_metricID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_metricID"));
  }

  return v5;
}

- (void)addField:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WAMessageAWD mutableFields](self, "mutableFields");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)setMetricID:(unint64_t)a3
{
  self->_metricID = a3;
}

- (void)setIsRootMessage:(BOOL)a3
{
  self->_isRootMessage = a3;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)setOriginalClassName:(id)a3
{
  objc_storeStrong((id *)&self->_originalClassName, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setMutableFields:(id)a3
{
  objc_storeStrong((id *)&self->_mutableFields, a3);
}

- (NSMutableDictionary)mutableFields
{
  return self->_mutableFields;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isRootMessage
{
  return self->_isRootMessage;
}

- (NSString)originalClassName
{
  return self->_originalClassName;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)metricID
{
  return self->_metricID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_originalClassName, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_mutableFields, 0);
}

@end
