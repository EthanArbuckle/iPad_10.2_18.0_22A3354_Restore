@implementation SKDiskImageCreateParams

- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4
{
  return -[SKDiskImageCreateParams initWithNumBlocks:volumeName:format:](self, "initWithNumBlocks:volumeName:format:", a3, a4, 1);
}

- (SKDiskImageCreateParams)initWithNumBlocks:(unint64_t)a3 volumeName:(id)a4 format:(int64_t)a5
{
  id v9;
  SKDiskImageCreateParams *v10;
  SKDiskImageCreateParams *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SKDiskImageCreateParams;
  v10 = -[SKDiskImageCreateParams init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_format = a5;
    v10->_numBlocks = a3;
    objc_storeStrong((id *)&v10->_volumeName, a4);
    v11->_stdinPassPhrase = 0;
    v11->_encryption = 0;
  }

  return v11;
}

- (SKDiskImageCreateParams)initWithFormat:(int64_t)a3 sourceURL:(id)a4
{
  id v7;
  SKDiskImageCreateParams *v8;
  SKDiskImageCreateParams *v9;
  NSString *volumeName;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKDiskImageCreateParams;
  v8 = -[SKDiskImageCreateParams init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_source, a4);
    v9->_format = a3;
    v9->_numBlocks = 0;
    volumeName = v9->_volumeName;
    v9->_volumeName = 0;

    v9->_stdinPassPhrase = 0;
    v9->_encryption = 0;
  }

  return v9;
}

- (SKDiskImageCreateParams)initWithDisk:(id)a3
{
  return -[SKDiskImageCreateParams initWithDisk:format:](self, "initWithDisk:format:", a3, 4);
}

- (SKDiskImageCreateParams)initWithDisk:(id)a3 format:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SKDiskImageCreateParams *v11;

  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "diskIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("/dev/%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SKDiskImageCreateParams initWithFormat:sourceURL:](self, "initWithFormat:sourceURL:", a4, v10);

  return v11;
}

- (SKDiskImageCreateParams)initWithDiskImage:(id)a3
{
  return -[SKDiskImageCreateParams initWithDiskImage:format:](self, "initWithDiskImage:format:", a3, 4);
}

- (SKDiskImageCreateParams)initWithDiskImage:(id)a3 format:(int64_t)a4
{
  void *v6;
  SKDiskImageCreateParams *v7;

  objc_msgSend(a3, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKDiskImageCreateParams initWithFormat:sourceURL:](self, "initWithFormat:sourceURL:", a4, v6);

  return v7;
}

- (id)redactedDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { source: %@, format: %d, numBlocks: %lld }>"), v5, self->_source, self->_format, self->_numBlocks);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: { source: %@, format: %d, numBlocks: %lld, volumeName: %@ }>"), v5, self->_source, self->_format, self->_numBlocks, self->_volumeName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diCreateParamsWithURL:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  Class *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = -[SKDiskImageCreateParams format](self, "format");
  if (v7 == 1)
  {
    v8 = (Class *)0x24BE2D0A8;
  }
  else
  {
    if (v7 != 6)
    {
      +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 250, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v8 = (Class *)0x24BE2D0B0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithURL:numBlocks:error:", v6, -[SKDiskImageCreateParams numBlocks](self, "numBlocks"), a4);
  v10 = -[SKDiskImageCreateParams stdinPassPhrase](self, "stdinPassPhrase");
  v11 = objc_msgSend(v9, "readPassphraseFlags");
  if (v10)
    v12 = v11 | 8;
  else
    v12 = v11;
  objc_msgSend(v9, "setReadPassphraseFlags:", v12);
  v13 = -[SKDiskImageCreateParams encryption](self, "encryption");
  if (v13 == 2)
    v14 = 2;
  else
    v14 = v13 == 1;
  objc_msgSend(v9, "setEncryptionMethod:", v14);
LABEL_13:

  return v9;
}

- (id)diConvertParamsWithOutputURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "URLByResolvingSymlinksInPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDiskImageCreateParams source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByResolvingSymlinksInPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
    SKGetOSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[SKDiskImageCreateParams source](self, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315394;
      v30 = "-[SKDiskImageCreateParams diConvertParamsWithOutputURL:error:]";
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_22FE50000, v13, OS_LOG_TYPE_DEFAULT, "%s: Creating image in place %@", (uint8_t *)&v29, 0x16u);

    }
    v15 = objc_alloc(MEMORY[0x24BE2D0A0]);
    -[SKDiskImageCreateParams source](self, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initForInplaceWithURL:error:", v16, a4);
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x24BE2D0A0]);
    -[SKDiskImageCreateParams source](self, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "initWithInputURL:outputURL:error:", v16, v6, a4);
  }
  v19 = (void *)v17;

  if (v19)
  {
    v20 = -[SKDiskImageCreateParams format](self, "format") - 1;
    if (v20 >= 6)
    {
      +[SKError nilWithSKErrorCode:error:](SKError, "nilWithSKErrorCode:error:", 250, a4);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v19, "setOutputFormat:", qword_22FE7D658[v20]);
      v21 = -[SKDiskImageCreateParams stdinPassPhrase](self, "stdinPassPhrase");
      v22 = objc_msgSend(v19, "readPassphraseFlags");
      if (v21)
        v23 = v22 | 8;
      else
        v23 = v22;
      objc_msgSend(v19, "setReadPassphraseFlags:", v23);
      v24 = -[SKDiskImageCreateParams encryption](self, "encryption");
      if (v24 == 2)
        v25 = 2;
      else
        v25 = v24 == 1;
      objc_msgSend(v19, "setEncryptionMethod:", v25);
      v26 = v19;
    }
    v27 = v26;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (int64_t)encryption
{
  return self->_encryption;
}

- (void)setEncryption:(int64_t)a3
{
  self->_encryption = a3;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (NSString)volumeName
{
  return self->_volumeName;
}

- (void)setVolumeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);
}

@end
