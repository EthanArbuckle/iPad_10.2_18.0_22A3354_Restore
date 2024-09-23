@implementation OADEffect

- (OADEffect)initWithType:(int)a3
{
  OADEffect *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADEffect;
  result = -[OADEffect init](&v5, sel_init);
  if (result)
    result->mType = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && self->mType == v4[2];

  return v6;
}

- (int)type
{
  return self->mType;
}

- (unint64_t)hash
{
  return self->mType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADEffect copyWithZone:]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADEffect.mm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 27, 0, "Abstract method not overridden by %@", v6);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v7 = (void *)MEMORY[0x24BDBCE88];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v10, "-[OADEffect copyWithZone:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADEffect;
  -[OADEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
