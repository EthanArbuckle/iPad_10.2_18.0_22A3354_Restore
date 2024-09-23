@implementation PKContactFieldConfiguration

+ (id)contactFieldConfigurationWithDictionary:(id)a3
{
  id v3;
  void *v4;
  __objc2_class **v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "PKStringForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("text"), "isEqualToString:", v4) & 1) != 0)
  {

    v5 = off_1E2AA0920;
  }
  else
  {
    v6 = objc_msgSend(CFSTR("picker"), "isEqualToString:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = off_1E2AA0240;
  }
  v7 = (void *)objc_msgSend(objc_alloc(*v5), "initWithDictionary:", v3);
LABEL_7:

  return v7;
}

- (PKContactFieldConfiguration)init
{

  return 0;
}

- (PKContactFieldConfiguration)initWithType:(int64_t)a3
{
  PKContactFieldConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKContactFieldConfiguration;
  result = -[PKContactFieldConfiguration init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t type;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  v4 = v3;
  type = self->_type;
  v6 = CFSTR("unknown");
  if (type == 2)
    v6 = CFSTR("picker");
  if (type == 1)
    v7 = CFSTR("text");
  else
    v7 = v6;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("type"), v7);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
}

- (PKContactFieldConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKContactFieldConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKContactFieldConfiguration;
  v5 = -[PKContactFieldConfiguration init](&v7, sel_init);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end
