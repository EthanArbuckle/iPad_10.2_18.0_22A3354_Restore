@implementation RWIProtocolRuntimeTypeSet

- (RWIProtocolRuntimeTypeSet)initWithIsFunction:(BOOL)a3 isUndefined:(BOOL)a4 isNull:(BOOL)a5 isBoolean:(BOOL)a6 isInteger:(BOOL)a7 isNumber:(BOOL)a8 isString:(BOOL)a9 isObject:(BOOL)a10 isSymbol:(BOOL)a11 isBigInt:(BOOL)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  RWIProtocolRuntimeTypeSet *v18;
  RWIProtocolRuntimeTypeSet *v19;
  RWIProtocolRuntimeTypeSet *v20;
  objc_super v22;

  v12 = a8;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RWIProtocolRuntimeTypeSet;
  v18 = -[RWIProtocolJSONObject init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    -[RWIProtocolRuntimeTypeSet setIsFunction:](v18, "setIsFunction:", v17);
    -[RWIProtocolRuntimeTypeSet setIsUndefined:](v19, "setIsUndefined:", v16);
    -[RWIProtocolRuntimeTypeSet setIsNull:](v19, "setIsNull:", v15);
    -[RWIProtocolRuntimeTypeSet setIsBoolean:](v19, "setIsBoolean:", v14);
    -[RWIProtocolRuntimeTypeSet setIsInteger:](v19, "setIsInteger:", v13);
    -[RWIProtocolRuntimeTypeSet setIsNumber:](v19, "setIsNumber:", v12);
    -[RWIProtocolRuntimeTypeSet setIsString:](v19, "setIsString:", a9);
    -[RWIProtocolRuntimeTypeSet setIsObject:](v19, "setIsObject:", a10);
    -[RWIProtocolRuntimeTypeSet setIsSymbol:](v19, "setIsSymbol:", a11);
    -[RWIProtocolRuntimeTypeSet setIsBigInt:](v19, "setIsBigInt:", a12);
    v20 = v19;
  }

  return v19;
}

- (void)setIsFunction:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isFunction"));
}

- (BOOL)isFunction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isFunction"));
}

- (void)setIsUndefined:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isUndefined"));
}

- (BOOL)isUndefined
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isUndefined"));
}

- (void)setIsNull:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isNull"));
}

- (BOOL)isNull
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isNull"));
}

- (void)setIsBoolean:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isBoolean"));
}

- (BOOL)isBoolean
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isBoolean"));
}

- (void)setIsInteger:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isInteger"));
}

- (BOOL)isInteger
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isInteger"));
}

- (void)setIsNumber:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isNumber"));
}

- (BOOL)isNumber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isNumber"));
}

- (void)setIsString:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isString"));
}

- (BOOL)isString
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isString"));
}

- (void)setIsObject:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isObject"));
}

- (BOOL)isObject
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isObject"));
}

- (void)setIsSymbol:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isSymbol"));
}

- (BOOL)isSymbol
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isSymbol"));
}

- (void)setIsBigInt:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isBigInt"));
}

- (BOOL)isBigInt
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeTypeSet;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isBigInt"));
}

@end
