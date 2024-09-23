@implementation PCVersionedFilename

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCVersionedFilename;
  -[PCVersionedFilename dealloc](&v3, sel_dealloc);
}

- (PCVersionedFilename)initWithFilename:(id)a3
{
  PCVersionedFilename *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PCVersionedFilename;
  v4 = -[PCVersionedFilename init](&v7, sel_init);
  if (v4)
  {
    v4->_filename = (NSString *)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingPathExtension"), "copy");
    v4->_extension = (NSString *)objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "copy");
    v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v5, "setNumberStyle:", 1);
    v4->_version = +[PCVersionedFilename filenameVersion:formatter:](PCVersionedFilename, "filenameVersion:formatter:", v4->_filename, v5);

    v4->_baseFilename = (NSString *)objc_msgSend(+[PCVersionedFilename removeVersion:fromFilename:](PCVersionedFilename, "removeVersion:fromFilename:", v4->_version, v4->_filename), "copy");
  }
  return v4;
}

+ (id)nextAvailableURLForWritingToURL:(id)a3
{
  id v3;
  void *v4;
  PCVersionedFilename *v5;
  char v6;
  uint64_t v8;

  v3 = a3;
  v8 = 0;
  if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", &v8))
  {
    v4 = (void *)objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v5 = -[PCVersionedFilename initWithFilename:]([PCVersionedFilename alloc], "initWithFilename:", objc_msgSend(v3, "lastPathComponent"));
    do
    {
      v3 = (id)objc_msgSend(v4, "URLByAppendingPathComponent:", -[PCVersionedFilename nextFilename](v5, "nextFilename"));
      v8 = 0;
      v6 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", &v8);
      -[PCVersionedFilename incrementVersion](v5, "incrementVersion");
    }
    while ((v6 & 1) != 0);

  }
  return v3;
}

+ (id)nextAvailableURLForWritingURL:(id)a3 toURL:(id)a4 checkContentsForEquality:(BOOL)a5 contentsAreEqual:(BOOL *)a6
{
  _BOOL4 v7;
  id v8;
  int v10;
  void *v11;
  void *v12;
  PCVersionedFilename *v13;
  char v14;
  uint64_t v16;

  v7 = a5;
  v8 = a4;
  v16 = 0;
  v10 = objc_msgSend(a4, "checkResourceIsReachableAndReturnError:", &v16);
  if (a6)
    *a6 = 0;
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = -[PCVersionedFilename initWithFilename:]([PCVersionedFilename alloc], "initWithFilename:", objc_msgSend(v8, "lastPathComponent"));
    while (!v7
         || !objc_msgSend(v12, "contentsEqualAtPath:andPath:", objc_msgSend(a3, "path"), objc_msgSend(v8, "path")))
    {
      v8 = (id)objc_msgSend(v11, "URLByAppendingPathComponent:", -[PCVersionedFilename nextFilename](v13, "nextFilename"));
      v16 = 0;
      v14 = objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", &v16);
      -[PCVersionedFilename incrementVersion](v13, "incrementVersion");
      if ((v14 & 1) == 0)
        goto LABEL_11;
    }
    if (a6)
      *a6 = 1;
LABEL_11:

  }
  return v8;
}

- (id)nextFilename
{
  return (id)objc_msgSend(+[PCVersionedFilename appendVersion:toFilename:](PCVersionedFilename, "appendVersion:toFilename:", -[PCVersionedFilename version](self, "version") + 1, -[PCVersionedFilename baseFilename](self, "baseFilename")), "stringByAppendingPathExtension:", -[PCVersionedFilename extension](self, "extension"));
}

- (void)incrementVersion
{
  ++self->_version;
}

+ (unint64_t)filenameVersion:(id)a3 formatter:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  if ((unint64_t)objc_msgSend(v5, "count") >= 2
    && (v6 = (void *)objc_msgSend(a4, "numberFromString:", objc_msgSend(v5, "lastObject"))) != 0)
  {
    return objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    return 1;
  }
}

+ (id)removeVersion:(unint64_t)a3 fromFilename:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "rangeOfString:options:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3)), 4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return a4;
  else
    return (id)objc_msgSend(a4, "substringToIndex:", v5);
}

+ (id)appendVersion:(unint64_t)a3 toFilename:(id)a4
{
  return (id)objc_msgSend(a4, "stringByAppendingFormat:", CFSTR(" %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)baseFilename
{
  return self->_baseFilename;
}

- (void)setBaseFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
