@implementation MBDatabase

+ (id)databaseWithFile:(id)a3 domainManager:(id)a4 error:(id *)a5
{
  return -[MBDatabase initWithFile:domainManager:error:]([MBDatabase alloc], "initWithFile:domainManager:error:", a3, a4, a5);
}

+ (id)databaseWithDrive:(id)a3 path:(id)a4 domainManager:(id)a5 error:(id *)a6
{
  return -[MBDatabase initWithDrive:path:domainManager:error:]([MBDatabase alloc], "initWithDrive:path:domainManager:error:", a3, a4, a5, a6);
}

- (MBDatabase)initWithData:(id)a3 domainManager:(id)a4 error:(id *)a5
{
  MBDatabase *v7;
  double v8;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MBDatabase;
  v7 = -[MBDatabase init](&v12, "init");
  if (v7)
  {
    v7->_decoder = -[MBDecoder initWithData:]([MBDecoder alloc], "initWithData:", a3);
    v7->_domainManager = (MBDomainManager *)a4;
    if (-[MBDecoder decodeInt32](v7->_decoder, "decodeInt32") != 1835164770)
    {
      v11 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 11, CFSTR("Incorrect database magic number"));
LABEL_11:
      objc_exception_throw(v11);
    }
    -[MBDecoder decodeVersion](v7->_decoder, "decodeVersion");
    v7->_version = v8;
    if (v8 < 5.0 || v8 >= 6.0)
    {
      v11 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 203, CFSTR("Unsupported database version: %0.1f"), *(_QWORD *)&v7->_version);
      goto LABEL_11;
    }
    v7->_offsetBase = -[MBDecoder offset](v7->_decoder, "offset");
  }
  return v7;
}

- (MBDatabase)initWithFile:(id)a3 domainManager:(id)a4 error:(id *)a5
{
  NSData *v8;

  v8 = +[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", a3, 8);
  if (v8)
    return -[MBDatabase initWithData:domainManager:error:](self, "initWithData:domainManager:error:", v8, a4, a5);

  return 0;
}

- (MBDatabase)initWithDrive:(id)a3 path:(id)a4 domainManager:(id)a5 error:(id *)a6
{
  id v9;

  v9 = objc_msgSend(a3, "dataAtPath:options:error:", a4, &off_1000E5098, a6);
  if (v9)
    return -[MBDatabase initWithData:domainManager:error:](self, "initWithData:domainManager:error:", v9, a5, a6);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDatabase;
  -[MBDatabase dealloc](&v3, "dealloc");
}

- (id)fileAtOffset:(unint64_t)a3
{
  -[MBDecoder setOffset:](self->_decoder, "setOffset:", self->_offsetBase + a3);
  return +[MBFile fileWithDecoder:database:](MBFile, "fileWithDecoder:database:", self->_decoder, self);
}

- (id)fileEnumerator
{
  MBDecoder *v3;

  v3 = -[MBDecoder initWithData:]([MBDecoder alloc], "initWithData:", -[MBDecoder data](self->_decoder, "data"));
  -[MBDecoder setOffset:](v3, "setOffset:", self->_offsetBase);
  return -[MBDatabaseFileEnumerator initWithDecoder:database:]([MBDatabaseFileEnumerator alloc], "initWithDecoder:database:", v3, self);
}

- (id)enumerateFiles:(id)a3
{
  id v4;
  id v5;

  v4 = -[MBDatabase fileEnumerator](self, "fileEnumerator");
  do
    v5 = objc_msgSend(v4, "nextObject");
  while (v5 && ((*((uint64_t (**)(id, id))a3 + 2))(a3, v5) & 1) != 0);
  return 0;
}

- (id)indexFromDatabaseIgnoringTruncation:(BOOL)a3
{
  id v4;
  MBDecoder *v5;
  id v6;
  id v7;
  char *v8;
  unint64_t offsetBase;
  MBFile *v10;
  MBDomain *v11;
  id v12;

  v4 = +[MBDatabaseIndex databaseIndex](MBDatabaseIndex, "databaseIndex");
  v5 = -[MBDecoder initWithData:]([MBDecoder alloc], "initWithData:", -[MBDecoder data](self->_decoder, "data"));
  -[MBDecoder setOffset:](v5, "setOffset:", self->_offsetBase);
  v6 = -[MBDecoder offset](v5, "offset");
  if (v6 < (id)-[NSData length](-[MBDecoder data](v5, "data"), "length"))
  {
    do
    {
      v7 = objc_alloc_init((Class)NSAutoreleasePool);
      v8 = -[MBDecoder offset](v5, "offset");
      offsetBase = self->_offsetBase;
      v10 = +[MBFile fileWithDecoder:database:](MBFile, "fileWithDecoder:database:", v5, self);
      objc_msgSend(v4, "setOffset:flags:forFileID:", &v8[-offsetBase], +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", -[MBFile mode](v10, "mode")), -[MBFile fileID](v10, "fileID"));
      v11 = -[MBFile domain](v10, "domain");
      if (v11 != -[MBFile nonRedirectedDomain](v10, "nonRedirectedDomain"))
        objc_msgSend(v4, "setDomainRedirects:", 1);
      objc_msgSend(v7, "drain");
      v12 = -[MBDecoder offset](v5, "offset");
    }
    while (v12 < (id)-[NSData length](-[MBDecoder data](v5, "data"), "length"));
  }
  return v4;
}

- (void)close
{
  -[MBDecoder close](self->_decoder, "close");
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_opt_class(self);
  -[MBDatabase version](self, "version");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: version=%0.1f>"), v3, v4);
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (double)version
{
  return self->_version;
}

@end
