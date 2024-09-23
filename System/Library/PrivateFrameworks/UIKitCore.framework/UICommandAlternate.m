@implementation UICommandAlternate

+ (UICommandAlternate)alternateWithTitle:(NSString *)title action:(SEL)action modifierFlags:(UIKeyModifierFlags)modifierFlags
{
  NSString *v7;
  UICommandAlternate *v8;

  v7 = title;
  v8 = -[UICommandAlternate initWithTitle:action:modifierFlags:]([UICommandAlternate alloc], "initWithTitle:action:modifierFlags:", v7, action, modifierFlags);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICommandAlternate)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UICommandAlternate *v5;
  uint64_t v6;
  NSString *title;
  NSString *v8;
  objc_super v10;

  v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)UICommandAlternate;
  v5 = -[UICommandAlternate init](&v10, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_action = NSSelectorFromString(v8);

    v5->_modifierFlags = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("modifierFlags"));
  }

  return v5;
}

- (UICommandAlternate)initWithModifierFlags:(int64_t)a3
{
  return -[UICommandAlternate initWithTitle:action:modifierFlags:](self, "initWithTitle:action:modifierFlags:", &stru_1E16EDF20, 0, a3);
}

- (UICommandAlternate)initWithTitle:(id)a3 action:(SEL)a4 modifierFlags:(int64_t)a5
{
  id v8;
  UICommandAlternate *v9;
  uint64_t v10;
  NSString *title;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UICommandAlternate;
  v9 = -[UICommandAlternate init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    title = v9->_title;
    v9->_title = (NSString *)v10;

    v9->_action = a4;
    v9->_modifierFlags = a5;
  }

  return v9;
}

- (int64_t)_leafKeyModifierFlags
{
  return self->_modifierFlags;
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;
  id sender;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "__isKindOfUIResponder"))
  {
    objc_storeStrong(&self->_sender, a4);
    objc_msgSend(v6, "targetForAction:withSender:", self->_action, self);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    sender = self->_sender;
    self->_sender = 0;

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  void *v5;
  id v6;

  title = self->_title;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", title, CFSTR("title"));
  NSStringFromSelector(self->_action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("action"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_modifierFlags, CFSTR("modifierFlags"));
}

- (unint64_t)hash
{
  return self->_modifierFlags;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_modifierFlags == v4[3];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (SEL)action
{
  return self->_action;
}

- (UIKeyModifierFlags)modifierFlags
{
  return self->_modifierFlags;
}

- (id)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
