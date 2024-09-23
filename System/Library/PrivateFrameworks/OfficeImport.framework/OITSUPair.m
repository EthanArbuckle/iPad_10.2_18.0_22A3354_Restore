@implementation OITSUPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFirst:second:", a3, a4);
}

+ (id)pairWithPair:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPair:", a3);
}

+ (id)pair
{
  return objc_alloc_init((Class)a1);
}

- (OITSUPair)initWithFirst:(id)a3 second:(id)a4
{
  OITSUPair *v6;
  OITSUPair *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OITSUPair;
  v6 = -[OITSUPair init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[OITSUPair p_SetFirst:](v6, "p_SetFirst:", a3);
    -[OITSUPair p_SetSecond:](v7, "p_SetSecond:", a4);
  }
  return v7;
}

- (OITSUPair)initWithPair:(id)a3
{
  return -[OITSUPair initWithFirst:second:](self, "initWithFirst:second:", objc_msgSend(a3, "first"), objc_msgSend(a3, "second"));
}

- (OITSUPair)init
{
  return -[OITSUPair initWithFirst:second:](self, "initWithFirst:second:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[OITSUPair p_SetFirst:](self, "p_SetFirst:", 0);
  -[OITSUPair p_SetSecond:](self, "p_SetSecond:", 0);
  v3.receiver = self;
  v3.super_class = (Class)OITSUPair;
  -[OITSUPair dealloc](&v3, sel_dealloc);
}

- (OITSUPair)initWithCoder:(id)a3
{
  return -[OITSUPair initWithFirst:second:](self, "initWithFirst:second:", objc_msgSend(a3, "decodeObject"), objc_msgSend(a3, "decodeObject"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", -[OITSUPair first](self, "first"));
  objc_msgSend(a3, "encodeObject:", -[OITSUPair second](self, "second"));
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  if (a3 == self)
  {
LABEL_6:
    LOBYTE(v7) = 1;
    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  v5 = -[OITSUPair first](self, "first");
  v6 = objc_msgSend(a3, "first");
  if (!(v5 | v6) || (v7 = objc_msgSend((id)v5, "isEqual:", v6)) != 0)
  {
    v8 = -[OITSUPair second](self, "second");
    v9 = objc_msgSend(a3, "second");
    if (v8 | v9)
    {
      LOBYTE(v7) = objc_msgSend((id)v8, "isEqual:", v9);
      return v7;
    }
    goto LABEL_6;
  }
  return v7;
}

- (int64_t)compare:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int64_t result;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = (objc_class *)objc_opt_class();
  v6 = TSUCheckedDynamicCast(v5, (uint64_t)a3);
  if (!v6)
    return -1;
  v7 = (void *)v6;
  v8 = -[OITSUPair first](self, "first");
  if (v8 != (id)objc_msgSend(v7, "first"))
  {
    if (!-[OITSUPair first](self, "first"))
      return -1;
    if (!objc_msgSend(v7, "first"))
      return 1;
    -[OITSUPair first](self, "first");
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUPair compare:]");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUPair.m");
      -[OITSUPair first](self, "first");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 109, 0, "unable to perform comparison on %{public}@", objc_opt_class());
LABEL_16:
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      return -1;
    }
    result = objc_msgSend(-[OITSUPair first](self, "first"), "compare:", objc_msgSend(v7, "first"));
    if (result)
      return result;
  }
  v10 = -[OITSUPair second](self, "second");
  if (v10 == (id)objc_msgSend(v7, "second"))
    return 0;
  if (-[OITSUPair second](self, "second"))
  {
    if (objc_msgSend(v7, "second"))
    {
      -[OITSUPair second](self, "second");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        return objc_msgSend(-[OITSUPair second](self, "second"), "compare:", objc_msgSend(v7, "second"));
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUPair compare:]");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUPair.m");
      -[OITSUPair second](self, "second");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 126, 0, "unable to perform comparison on %{public}@", objc_opt_class());
      goto LABEL_16;
    }
    return 1;
  }
  return -1;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(-[OITSUPair first](self, "first"), "hash");
  return objc_msgSend(-[OITSUPair second](self, "second"), "hash") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), objc_msgSend(-[OITSUPair first](self, "first"), "description"), objc_msgSend(-[OITSUPair second](self, "second"), "description"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(-[OITSUPair first](self, "first"), "copyWithZone:", a3);
  v6 = (void *)objc_msgSend(-[OITSUPair second](self, "second"), "copyWithZone:", a3);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(-[OITSUPair first](self, "first"), "copyWithZone:", a3);
  v6 = (void *)objc_msgSend(-[OITSUPair second](self, "second"), "copyWithZone:", a3);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (void)p_SetFirst:(id)a3
{
  id mFirst;

  mFirst = self->mFirst;
  if (mFirst != a3)
  {

    self->mFirst = a3;
  }
}

- (void)p_SetSecond:(id)a3
{
  id mSecond;

  mSecond = self->mSecond;
  if (mSecond != a3)
  {

    self->mSecond = a3;
  }
}

- (id)first
{
  return self->mFirst;
}

- (id)second
{
  return self->mSecond;
}

@end
