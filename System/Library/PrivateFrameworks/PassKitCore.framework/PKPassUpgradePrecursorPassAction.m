@implementation PKPassUpgradePrecursorPassAction

- (PKPassUpgradePrecursorPassAction)initWithDictionary:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassAction;
  v5 = -[PKPassUpgradePrecursorPassAction init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPassUpgradePrecursorPassActionTypeFromString(v6);

  }
  return v5;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  v5 = self->_type - 1;
  if (v5 > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD3378[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  const __CFString *v5;

  v4 = self->_type - 1;
  if (v4 > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD3378[v4];
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("type"));
}

- (PKPassUpgradePrecursorPassAction)initWithCoder:(id)a3
{
  id v4;
  PKPassUpgradePrecursorPassAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPassUpgradePrecursorPassAction;
  v5 = -[PKPassUpgradePrecursorPassAction init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPassUpgradePrecursorPassActionTypeFromString(v6);

  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end
