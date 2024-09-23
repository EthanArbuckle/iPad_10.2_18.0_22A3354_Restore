@implementation MBFileID

+ (MBFileID)fileIDWithDomain:(id)a3 relativePath:(id)a4
{
  return -[MBFileID initWithDomain:relativePath:]([MBFileID alloc], "initWithDomain:relativePath:", a3, a4);
}

+ (MBFileID)fileIDWithDomainName:(id)a3 relativePath:(id)a4
{
  return -[MBFileID initWithDomainName:relativePath:]([MBFileID alloc], "initWithDomainName:relativePath:", a3, a4);
}

+ (MBFileID)fileIDWithString:(id)a3
{
  return -[MBFileID initWithString:]([MBFileID alloc], "initWithString:", a3);
}

+ (MBFileID)fileIDWithData:(id)a3
{
  return -[MBFileID initWithData:]([MBFileID alloc], "initWithData:", a3);
}

- (MBFileID)initWithBytes:(const void *)a3
{
  MBFileID *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBFileID;
  result = -[MBFileID init](&v6, "init");
  if (result)
  {
    v5 = *(_OWORD *)a3;
    *(_DWORD *)&result->_bytes[16] = *((_DWORD *)a3 + 4);
    *(_OWORD *)result->_bytes = v5;
  }
  return result;
}

- (MBFileID)initWithDecoder:(id)a3
{
  MBFileID *v4;
  MBFileID *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MBFileID;
  v4 = -[MBFileID init](&v7, "init");
  v5 = v4;
  if (v4)
    objc_msgSend(a3, "decodeBytes:length:", v4->_bytes, 20);
  return v5;
}

- (MBFileID)initWithDomain:(id)a3 relativePath:(id)a4
{
  return -[MBFileID initWithDomainName:relativePath:](self, "initWithDomainName:relativePath:", objc_msgSend(a3, "name"), a4);
}

- (MBFileID)initWithDomainName:(id)a3 relativePath:(id)a4
{
  MBFileID *v7;
  MBFileID *v8;
  id v9;
  MBFileID *v10;
  objc_super v12;
  objc_super v13;

  if (!a4)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Null relative path"));
  if ((objc_msgSend(a4, "isEqualToString:", &stru_1000DBB88) & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)MBFileID;
    v7 = -[MBFileID init](&v12, "init");
    v8 = v7;
    if (v7)
      MBGetFileIDBytes(a3, a4, v7->_bytes, 20);
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(a4, "fileSystemRepresentation"));
    v13.receiver = self;
    v13.super_class = (Class)MBFileID;
    v10 = -[MBFileID init](&v13, "init");
    v8 = v10;
    if (v10)
      MBGetFileIDBytes(a3, v9, v10->_bytes, 20);

  }
  return v8;
}

- (MBFileID)initWithString:(id)a3
{
  MBFileID *v4;
  MBFileID *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MBFileID;
  v4 = -[MBFileID init](&v7, "init");
  v5 = v4;
  if (v4 && (MBBytesWithString(a3, v4->_bytes, 20) & 1) == 0)
  {

    return 0;
  }
  return v5;
}

- (MBFileID)initWithData:(id)a3
{
  if (objc_msgSend(a3, "length") == (id)20)
    return -[MBFileID initWithBytes:](self, "initWithBytes:", objc_msgSend(a3, "bytes"));

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MBFileID initWithBytes:](+[MBFileID allocWithZone:](MBFileID, "allocWithZone:", a3), "initWithBytes:", self->_bytes);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class(MBFileID);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    return -[MBFileID isEqualToFileID:](self, "isEqualToFileID:", a3);
  else
    return 0;
}

- (BOOL)isEqualToFileID:(id)a3
{
  return *(_QWORD *)self->_bytes == *((_QWORD *)a3 + 1)
      && *(_QWORD *)&self->_bytes[8] == *((_QWORD *)a3 + 2)
      && *(_DWORD *)&self->_bytes[16] == (unint64_t)*((unsigned int *)a3 + 6);
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t i;

  result = 0;
  for (i = 8; i != 28; ++i)
    result = *((unsigned __int8 *)&self->super.isa + i) - result + 32 * result;
  return result;
}

- (const)bytes
{
  return self->_bytes;
}

- (unint64_t)length
{
  return 20;
}

- (NSData)data
{
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_bytes, 20);
}

- (NSString)filenamePrefix
{
  return -[NSString substringToIndex:](-[MBFileID filename](self, "filename"), "substringToIndex:", 2);
}

- (NSString)filenameWithPrefix
{
  return -[NSString stringByAppendingPathComponent:](-[MBFileID filenamePrefix](self, "filenamePrefix"), "stringByAppendingPathComponent:", -[MBFileID filename](self, "filename"));
}

- (NSString)string
{
  return (NSString *)MBStringWithBytes(self->_bytes, 20);
}

- (void)encode:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:", self->_bytes, 20);
}

@end
