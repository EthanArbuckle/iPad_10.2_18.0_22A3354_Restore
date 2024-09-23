@implementation SiriLanguageInput

- (NSString)language
{
  void *v2;
  __CFString *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUsername"));

  if (v3)
    v4 = (void *)CFPreferencesCopyValue(CFSTR("Session Language"), CFSTR("com.apple.assistant.backedup"), v3, kCFPreferencesAnyHost);
  else
    v4 = 0;

  return (NSString *)v4;
}

- (SiriLanguageInput)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriLanguageInput;
  return -[EligibilityInput initWithInputType:status:process:](&v3, "initWithInputType:status:process:", 10, 0, CFSTR("eligibilityd"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriLanguageInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (SiriLanguageInput)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriLanguageInput;
  return -[EligibilityInput initWithCoder:](&v4, "initWithCoder:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriLanguageInput;
  return -[EligibilityInput copyWithZone:](&v4, "copyWithZone:", a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriLanguageInput;
  return -[EligibilityInput hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SiriLanguageInput *v4;
  uint64_t v5;
  char isKindOfClass;
  objc_super v8;

  v4 = (SiriLanguageInput *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriLanguageInput;
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
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriLanguageInput language](self, "language"));
  v8.receiver = self;
  v8.super_class = (Class)SiriLanguageInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[SiriLanguageInput language:\"%@\" %@]"), v3, v5));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
