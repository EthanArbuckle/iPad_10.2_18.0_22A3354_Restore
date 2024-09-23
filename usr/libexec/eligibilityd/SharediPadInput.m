@implementation SharediPadInput

- (BOOL)isSharediPad
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v3 = objc_msgSend(v2, "isSharedIPad");

  return v3;
}

- (SharediPadInput)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SharediPadInput;
  return -[EligibilityInput initWithInputType:status:process:](&v3, "initWithInputType:status:process:", 12, 0, CFSTR("eligibilityd"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SharediPadInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (SharediPadInput)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SharediPadInput;
  return -[EligibilityInput initWithCoder:](&v4, "initWithCoder:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SharediPadInput;
  return -[EligibilityInput copyWithZone:](&v4, "copyWithZone:", a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SharediPadInput;
  return -[EligibilityInput hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SharediPadInput *v4;
  uint64_t v5;
  char isKindOfClass;
  objc_super v8;

  v4 = (SharediPadInput *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SharediPadInput;
  if (-[EligibilityInput isEqual:](&v8, "isEqual:", v4))
  {
    if (v4 == self)
    {
      isKindOfClass = 1;
    }
    else
    {
      v5 = objc_opt_class(self);
      isKindOfClass = objc_opt_isKindOfClass(v4, v5);
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)description
{
  const __CFString *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[SharediPadInput isSharediPad](self, "isSharediPad"))
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v8.receiver = self;
  v8.super_class = (Class)SharediPadInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[SharediPadInput isSharediPad:%@ %@]"), v3, v5));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
