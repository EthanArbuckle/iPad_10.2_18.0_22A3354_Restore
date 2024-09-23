@implementation PFSPair

+ (id)pairWithType:(int64_t)a3 value:(id)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithType:value:", a3, a4);
}

+ (id)pairWithPair:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithPair:", a3);
}

+ (id)pair
{
  return objc_alloc_init((Class)a1);
}

- (PFSPair)initWithType:(int64_t)a3 value:(id)a4
{
  PFSPair *v6;
  PFSPair *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFSPair;
  v6 = -[PFSPair init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[PFSPair p_SetType:](v6, "p_SetType:", a3);
    -[PFSPair p_SetValue:](v7, "p_SetValue:", a4);
  }
  return v7;
}

- (PFSPair)initWithPair:(id)a3
{
  return -[PFSPair initWithType:value:](self, "initWithType:value:", objc_msgSend(a3, "type"), objc_msgSend(a3, "value"));
}

- (PFSPair)init
{
  return -[PFSPair initWithType:value:](self, "initWithType:value:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFSPair;
  -[PFSPair dealloc](&v3, "dealloc");
}

- (PFSPair)initWithCoder:(id)a3
{
  uint64_t v5;
  double v6;
  id v7;

  v5 = objc_opt_class(NSNumber);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(a3, "decodeObject")).n128_u64[0];
  return -[PFSPair initWithType:value:](self, "initWithType:value:", objc_msgSend(v7, "integerValue"), objc_msgSend(a3, "decodeObject", v6));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->mType));
  objc_msgSend(a3, "encodeObject:", self->mValue);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id mType;

  if (a3 == self)
    return 1;
  v5 = objc_opt_class(PFSPair);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0 && (mType = (id)self->mType, mType == objc_msgSend(a3, "type")))
    return objc_msgSend(self->mValue, "isEqual:", objc_msgSend(a3, "value"));
  else
    return 0;
}

- (unint64_t)hash
{
  int64_t mType;

  mType = self->mType;
  return (unint64_t)objc_msgSend(self->mValue, "hash") ^ mType;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<PFSPair>%ld,%@</PFSPair>"), self->mType, objc_msgSend(self->mValue, "description"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(self->mValue, "copyWithZone:");
  v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithType:value:", self->mType, v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(self->mValue, "copyWithZone:");
  v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(PFSMutablePair), "allocWithZone:", a3), "initWithType:value:", self->mType, v5);

  return v6;
}

- (int64_t)type
{
  return self->mType;
}

- (id)value
{
  return self->mValue;
}

- (void)p_SetType:(int64_t)a3
{
  self->mType = a3;
}

- (void)p_SetValue:(id)a3
{
  id mValue;

  mValue = self->mValue;
  if (mValue != a3)
  {

    self->mValue = a3;
  }
}

- (id)stringValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSString, a2);
  return (id)TSUDynamicCast(v3, self->mValue);
}

- (id)numberValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSNumber, a2);
  return (id)TSUDynamicCast(v3, self->mValue);
}

@end
