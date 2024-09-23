@implementation FTABSubfileBackDeploy

- (FTABSubfileBackDeploy)initWithTag:(id)a3 dataPointer:(const void *)a4 dataLength:(unsigned int)a5
{
  id v8;
  FTABSubfileBackDeploy *v9;
  NSString *v10;
  NSString *tag;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FTABSubfileBackDeploy;
  v9 = -[FTABSubfileBackDeploy init](&v13, "init");
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    tag = v9->_tag;
    v9->_tag = v10;

    v9->_dataPointer = (const char *)a4;
    v9->_dataLength = a5;
  }

  return v9;
}

- (FTABSubfileBackDeploy)initWithTag:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  FTABSubfileBackDeploy *v8;
  NSString *v9;
  NSString *tag;
  NSData *v11;
  NSData *data;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FTABSubfileBackDeploy;
  v8 = -[FTABSubfileBackDeploy init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    tag = v8->_tag;
    v8->_tag = v9;

    v11 = (NSData *)objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = v11;

    v8->_dataPointer = (const char *)-[NSData bytes](v8->_data, "bytes");
    v8->_dataLength = -[NSData length](v8->_data, "length");
  }

  return v8;
}

- (NSData)data
{
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_dataPointer, self->_dataLength);
}

- (id)generateHashSHA256
{
  CC_SHA256_CTX v4;
  unsigned __int8 md[32];

  memset(&v4, 0, sizeof(v4));
  CC_SHA256_Init(&v4);
  CC_SHA256_Update(&v4, self->_dataPointer, self->_dataLength);
  CC_SHA256_Final(md, &v4);
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 32);
}

- (id)generateHashSHA384
{
  CC_SHA512_CTX v4;
  unsigned __int8 md[48];

  memset(&v4, 0, sizeof(v4));
  CC_SHA384_Init(&v4);
  CC_SHA384_Update(&v4, self->_dataPointer, self->_dataLength);
  CC_SHA384_Final(md, &v4);
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 48);
}

- (id)generateHashSHA512
{
  CC_SHA512_CTX v4;
  unsigned __int8 md[64];

  memset(&v4, 0, sizeof(v4));
  CC_SHA512_Init(&v4);
  CC_SHA512_Update(&v4, self->_dataPointer, self->_dataLength);
  CC_SHA512_Final(md, &v4);
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 64);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subfile: type=%@, length=%u"), self->_tag, self->_dataLength);
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
