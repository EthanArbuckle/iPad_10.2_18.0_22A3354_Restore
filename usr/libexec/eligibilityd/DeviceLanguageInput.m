@implementation DeviceLanguageInput

- (NSArray)deviceLanguages
{
  void *v2;
  __CFString *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUsername"));

  if (v3)
    v4 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication, v3, kCFPreferencesAnyHost);
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (NSString)primaryLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale systemLanguages](NSLocale, "systemLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLanguageInput deviceLanguages](self, "deviceLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  return (NSString *)v6;
}

- (DeviceLanguageInput)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeviceLanguageInput;
  return -[EligibilityInput initWithInputType:status:process:](&v3, "initWithInputType:status:process:", 7, 0, CFSTR("eligibilityd"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeviceLanguageInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (DeviceLanguageInput)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DeviceLanguageInput;
  return -[EligibilityInput initWithCoder:](&v4, "initWithCoder:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DeviceLanguageInput;
  return -[EligibilityInput copyWithZone:](&v4, "copyWithZone:", a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeviceLanguageInput;
  return -[EligibilityInput hash](&v3, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DeviceLanguageInput *v4;
  uint64_t v5;
  char isKindOfClass;
  objc_super v8;

  v4 = (DeviceLanguageInput *)a3;
  v8.receiver = self;
  v8.super_class = (Class)DeviceLanguageInput;
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
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLanguageInput primaryLanguage](self, "primaryLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLanguageInput deviceLanguages](self, "deviceLanguages"));
  v9.receiver = self;
  v9.super_class = (Class)DeviceLanguageInput;
  v5 = -[EligibilityInput description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[DeviceLanguageInput deviceLanguages:(%@)\"%@\" %@]"), v3, v4, v6));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
