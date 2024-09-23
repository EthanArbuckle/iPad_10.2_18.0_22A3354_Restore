@implementation SHDataFetcherFileInfo

+ (id)dataFetcherForSourceURL:(id)a3
{
  objc_msgSend(a3, "isFileURL");
  return (id)objc_opt_new();
}

- (SHDataFetcherFileInfo)initWithData:(id)a3 suggestedFileName:(id)a4
{
  id v7;
  id v8;
  SHDataFetcherFileInfo *v9;
  SHDataFetcherFileInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHDataFetcherFileInfo;
  v9 = -[SHDataFetcherFileInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_suggestedFileName, a4);
  }

  return v10;
}

- (SHDataFetcherFileInfo)initWithDataURL:(id)a3 suggestedFileName:(id)a4
{
  id v7;
  id v8;
  SHDataFetcherFileInfo *v9;
  SHDataFetcherFileInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHDataFetcherFileInfo;
  v9 = -[SHDataFetcherFileInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataFilePathURL, a3);
    objc_storeStrong((id *)&v10->_suggestedFileName, a4);
  }

  return v10;
}

- (SHDataFetcherFileInfo)initWithDataURL:(id)a3
{
  id v4;
  void *v5;
  SHDataFetcherFileInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SHDataFetcherFileInfo initWithDataURL:suggestedFileName:](self, "initWithDataURL:suggestedFileName:", v4, v5);

  return v6;
}

- (int)compressionType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE90528];
  v3 = (void *)MEMORY[0x24BDBCF48];
  -[SHDataFetcherFileInfo suggestedFileName](self, "suggestedFileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "supportedCompressionTypeFromFilePathExtension:", v6);

  return (int)v2;
}

- (NSString)suggestedExtension
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[SHDataFetcherFileInfo suggestedFileName](self, "suggestedFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSData)data
{
  NSData *data;
  NSData *v3;
  void *v4;
  void *v5;

  data = self->_data;
  if (data)
  {
    v3 = data;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBCE50];
    -[SHDataFetcherFileInfo dataFilePathURL](self, "dataFilePathURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataWithContentsOfURL:", v5);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSURL)dataFilePathURL
{
  return self->_dataFilePathURL;
}

- (NSString)suggestedFileName
{
  return self->_suggestedFileName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)uniqueHash
{
  return self->_uniqueHash;
}

- (void)setUniqueHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_uniqueHash, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_suggestedFileName, 0);
  objc_storeStrong((id *)&self->_dataFilePathURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
