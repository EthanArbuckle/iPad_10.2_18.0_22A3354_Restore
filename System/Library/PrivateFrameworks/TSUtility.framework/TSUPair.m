@implementation TSUPair

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

- (TSUPair)initWithFirst:(id)a3 second:(id)a4
{
  TSUPair *v6;
  TSUPair *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSUPair;
  v6 = -[TSUPair init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[TSUPair p_SetFirst:](v6, "p_SetFirst:", a3);
    -[TSUPair p_SetSecond:](v7, "p_SetSecond:", a4);
  }
  return v7;
}

- (TSUPair)initWithPair:(id)a3
{
  return -[TSUPair initWithFirst:second:](self, "initWithFirst:second:", objc_msgSend(a3, "first"), objc_msgSend(a3, "second"));
}

- (TSUPair)init
{
  return -[TSUPair initWithFirst:second:](self, "initWithFirst:second:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[TSUPair p_SetFirst:](self, "p_SetFirst:", 0);
  -[TSUPair p_SetSecond:](self, "p_SetSecond:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSUPair;
  -[TSUPair dealloc](&v3, sel_dealloc);
}

- (TSUPair)initWithCoder:(id)a3
{
  return -[TSUPair initWithFirst:second:](self, "initWithFirst:second:", objc_msgSend(a3, "decodeObject"), objc_msgSend(a3, "decodeObject"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", -[TSUPair first](self, "first"));
  objc_msgSend(a3, "encodeObject:", -[TSUPair second](self, "second"));
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(-[TSUPair first](self, "first"), "isEqual:", objc_msgSend(a3, "first"));
      if (v5)
        LOBYTE(v5) = objc_msgSend(-[TSUPair second](self, "second"), "isEqual:", objc_msgSend(a3, "second"));
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(-[TSUPair first](self, "first"), "hash");
  return objc_msgSend(-[TSUPair second](self, "second"), "hash") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), objc_msgSend(-[TSUPair first](self, "first"), "description"), objc_msgSend(-[TSUPair second](self, "second"), "description"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(-[TSUPair first](self, "first"), "copyWithZone:", a3);
  v6 = (void *)objc_msgSend(-[TSUPair second](self, "second"), "copyWithZone:", a3);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(-[TSUPair first](self, "first"), "copyWithZone:", a3);
  v6 = (void *)objc_msgSend(-[TSUPair second](self, "second"), "copyWithZone:", a3);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)first
{
  return self->mFirst;
}

- (id)second
{
  return self->mSecond;
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

@end
