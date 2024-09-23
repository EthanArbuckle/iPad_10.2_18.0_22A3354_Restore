@implementation _UIStatusBarDataEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)entry
{
  return objc_alloc_init((Class)a1);
}

+ (id)disabledEntry
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setEnabled:", 0);
  return v2;
}

- (_UIStatusBarDataEntry)init
{
  _UIStatusBarDataEntry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarDataEntry;
  v2 = -[_UIStatusBarDataEntry init](&v4, sel_init);
  -[_UIStatusBarDataEntry setEnabled:](v2, "setEnabled:", 1);
  return v2;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash") << self->_enabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setEnabled:", self->_enabled);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
}

- (_UIStatusBarDataEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry init](&v7, sel_init);
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("enabled"), v7.receiver, v7.super_class);

  -[_UIStatusBarDataEntry setEnabled:](v4, "setEnabled:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  int enabled;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    enabled = self->_enabled;
    v6 = enabled == objc_msgSend(v4, "isEnabled");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataEntry;
  -[NSObject _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_UIStatusBarDataEntry _ui_descriptionBuilder](self, "_ui_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)initFromData:(id *)a3 type:(int)a4
{
  _UIStatusBarDataEntry *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataEntry;
  v6 = -[_UIStatusBarDataEntry init](&v8, sel_init);
  -[_UIStatusBarDataEntry setEnabled:](v6, "setEnabled:", a3->var0[a4]);
  return v6;
}

@end
