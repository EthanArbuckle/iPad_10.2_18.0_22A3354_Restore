@implementation WLSourceDeviceRecordSummary

+ (WLSourceDeviceRecordSummary)summaryWithInfo:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  WLSourceDeviceRecordSummary *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WLSourceDeviceRecordSummary initWithInfo:account:]([WLSourceDeviceRecordSummary alloc], "initWithInfo:account:", v6, v5);

  return v7;
}

+ (id)_numberFormatter
{
  if (_numberFormatter_onceToken != -1)
    dispatch_once(&_numberFormatter_onceToken, &__block_literal_global_3);
  return (id)_numberFormatter_numberFormatter;
}

void __47__WLSourceDeviceRecordSummary__numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_numberFormatter_numberFormatter;
  _numberFormatter_numberFormatter = (uint64_t)v0;

}

- (WLSourceDeviceRecordSummary)initWithInfo:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  WLSourceDeviceRecordSummary *v8;
  WLSourceDeviceRecordSummary *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *relativePath;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSDictionary *metadata;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  WLSourceDeviceRecordSummary *v28;
  void *v29;
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = -[WLSourceDeviceRecordSummary init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a4);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemID"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemSize"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[WLSourceDeviceRecordSummary _numberFormatter](WLSourceDeviceRecordSummary, "_numberFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberFromString:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_itemSize = objc_msgSend(v14, "unsignedIntegerValue");

    }
    else
    {
      v9->_itemSize = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relativePath"));
    v15 = objc_claimAutoreleasedReturnValue();
    relativePath = v9->_relativePath;
    v9->_relativePath = (NSString *)v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metaData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v17, "length"))
    {
      objc_msgSend(v17, "dataUsingEncoding:", 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v18, 0, &v31);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v31;
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v19;

      if (v20)
      {
        v29 = v17;
        v30 = v20;
        v28 = v9;
        _WLLog();
      }

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bucket"), v28, v29, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "length"))
      {
        objc_msgSend(v24, "lowercaseString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("camera"));

        if ((v26 & 1) == 0)
          -[WLSourceDeviceRecordSummary setBucket:](v9, "setBucket:", v22);
      }

    }
  }

  return v9;
}

- (WLSourceDeviceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (unint64_t)sqlID
{
  return self->_sqlID;
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void)setModifiedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)storeDataAsFile
{
  return self->_storeDataAsFile;
}

- (void)setStoreDataAsFile:(BOOL)a3
{
  self->_storeDataAsFile = a3;
}

- (NSString)dataFilePath
{
  return self->_dataFilePath;
}

- (void)setDataFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)downloadSegmentCount
{
  return self->_downloadSegmentCount;
}

- (void)setDownloadSegmentCount:(unint64_t)a3
{
  self->_downloadSegmentCount = a3;
}

- (BOOL)didDownload
{
  return self->_didDownload;
}

- (void)setDidDownload:(BOOL)a3
{
  self->_didDownload = a3;
}

- (NSString)bucket
{
  return self->_bucket;
}

- (void)setBucket:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_dataFilePath, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
