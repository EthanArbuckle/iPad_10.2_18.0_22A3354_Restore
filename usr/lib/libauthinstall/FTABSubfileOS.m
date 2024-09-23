@implementation FTABSubfileOS

- (FTABSubfileOS)initWithTag:(id)a3 dataPointer:(const void *)a4 dataLength:(unsigned int)a5
{
  id v8;
  FTABSubfileOS *v9;
  uint64_t v10;
  NSString *tag;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FTABSubfileOS;
  v9 = -[FTABSubfileOS init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    v9->_dataPointer = (const char *)a4;
    v9->_dataLength = a5;
  }

  return v9;
}

- (FTABSubfileOS)initWithTag:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  FTABSubfileOS *v8;
  uint64_t v9;
  NSString *tag;
  uint64_t v11;
  NSData *data;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FTABSubfileOS;
  v8 = -[FTABSubfileOS init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tag = v8->_tag;
    v8->_tag = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v11;

    v8->_dataPointer = (const char *)-[NSData bytes](v8->_data, "bytes");
    v8->_dataLength = -[NSData length](v8->_data, "length");
  }

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_dataPointer, self->_dataLength);
}

- (id)generateHashSHA256
{
  CC_SHA256_CTX v4;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(&v4, 0, sizeof(v4));
  CC_SHA256_Init(&v4);
  CC_SHA256_Update(&v4, self->_dataPointer, self->_dataLength);
  CC_SHA256_Final(md, &v4);
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
}

- (id)generateHashSHA384
{
  CC_SHA512_CTX v4;
  unsigned __int8 md[48];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(&v4, 0, sizeof(v4));
  CC_SHA384_Init(&v4);
  CC_SHA384_Update(&v4, self->_dataPointer, self->_dataLength);
  CC_SHA384_Final(md, &v4);
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 48);
}

- (id)generateHashSHA512
{
  CC_SHA512_CTX v4;
  unsigned __int8 md[64];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(&v4, 0, sizeof(v4));
  CC_SHA512_Init(&v4);
  CC_SHA512_Update(&v4, self->_dataPointer, self->_dataLength);
  CC_SHA512_Final(md, &v4);
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 64);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Subfile: type=%@, length=%u"), self->_tag, self->_dataLength);
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (const)dataPointer
{
  return self->_dataPointer;
}

- (unsigned)dataLength
{
  return self->_dataLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
