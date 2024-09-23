@implementation SiriCoreSyncRecord

- (SiriCoreSyncRecord)initWithKey:(id)a3 identifier:(id)a4 priority:(int)a5 debugValue:(id)a6 dataValue:(id)a7 addedValue:(id)a8 appMeta:(id)a9
{
  id v16;
  id v17;
  SiriCoreSyncRecord *v18;
  SiriCoreSyncRecord *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SiriCoreSyncRecord;
  v18 = -[SiriCoreSyncRecord init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a4);
    v19->_itemPriority = a5;
    objc_storeStrong((id *)&v19->_key, a3);
    objc_storeStrong((id *)&v19->_debugValue, a6);
    objc_storeStrong((id *)&v19->_dataValue, a7);
    objc_storeStrong((id *)&v19->_addedValue, a8);
    objc_storeStrong((id *)&v19->_metaValue, a9);
    -[SiriCoreSyncRecord setUpdateTimeToNow](v19, "setUpdateTimeToNow", v21, v22, v23, v24);
    -[SiriCoreSyncRecord updateHash](v19, "updateHash");
  }

  return v19;
}

- (void)updateHash
{
  const char *v3;
  CC_LONG v4;
  NSData *dataValue;
  NSData *addedValue;
  NSData *v7;
  NSData *checkHash;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CC_SHA256(&self->_itemPriority, 4u, md);
  if (self->_identifier)
  {
    v3 = -[NSString UTF8String](self->_key, "UTF8String");
    v4 = strlen(v3);
    CC_SHA256(v3, v4, md);
  }
  dataValue = self->_dataValue;
  if (dataValue)
    CC_SHA256(-[NSData bytes](dataValue, "bytes"), -[NSData length](self->_dataValue, "length"), md);
  addedValue = self->_addedValue;
  if (addedValue)
    CC_SHA256(-[NSData bytes](addedValue, "bytes"), -[NSData length](self->_addedValue, "length"), md);
  if (self->_metaValue)
    CC_SHA256(-[NSData bytes](self->_addedValue, "bytes"), -[NSData length](self->_metaValue, "length"), md);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 8);
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  checkHash = self->_checkHash;
  self->_checkHash = v7;

}

- (void)setUpdateTimeToNow
{
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  self->_updateTime = v3;

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriCoreSyncRecord;
  -[SiriCoreSyncRecord description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" key:%@,priority:%d,id:%@,data:%luB,added:%luB,meta:%luB,hash:%@,time:%.0f"), self->_key, self->_itemPriority, self->_identifier, -[NSData length](self->_dataValue, "length"), -[NSData length](self->_addedValue, "length"), -[NSData length](self->_metaValue, "length"), self->_checkHash, *(_QWORD *)&self->_updateTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)itemPriority
{
  return self->_itemPriority;
}

- (void)setItemPriority:(int)a3
{
  self->_itemPriority = a3;
}

- (NSString)debugValue
{
  return self->_debugValue;
}

- (void)setDebugValue:(id)a3
{
  objc_storeStrong((id *)&self->_debugValue, a3);
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (NSData)addedValue
{
  return self->_addedValue;
}

- (void)setAddedValue:(id)a3
{
  objc_storeStrong((id *)&self->_addedValue, a3);
}

- (NSData)metaValue
{
  return self->_metaValue;
}

- (void)setMetaValue:(id)a3
{
  objc_storeStrong((id *)&self->_metaValue, a3);
}

- (double)updateTime
{
  return self->_updateTime;
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (NSData)checkHash
{
  return self->_checkHash;
}

- (void)setCheckHash:(id)a3
{
  objc_storeStrong((id *)&self->_checkHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkHash, 0);
  objc_storeStrong((id *)&self->_metaValue, 0);
  objc_storeStrong((id *)&self->_addedValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_debugValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)syncRecordWithKey:(id)a3 identifier:(id)a4 priority:(int)a5 debugValue:(id)a6 dataValue:(id)a7 addedValue:(id)a8 appMeta:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SiriCoreSyncRecord *v21;

  v12 = *(_QWORD *)&a5;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  v21 = -[SiriCoreSyncRecord initWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:]([SiriCoreSyncRecord alloc], "initWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:", v20, v19, v12, v18, v17, v16, v15);

  return v21;
}

+ (id)syncRecordWithKey:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  SiriCoreSyncRecord *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSyncRecord initWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:]([SiriCoreSyncRecord alloc], "initWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:", v6, v5, 0, 0, 0, 0, 0);

  return v7;
}

@end
