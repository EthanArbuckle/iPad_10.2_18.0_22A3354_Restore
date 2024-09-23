@implementation UIKeyboardSuggestedInputMode

- (UIKeyboardSuggestedInputMode)initWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  UIKeyboardSuggestedInputMode *v5;
  UIKeyboardSuggestedInputMode *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardSuggestedInputMode;
  v5 = -[UIKeyboardInputMode initWithIdentifier:](&v8, sel_initWithIdentifier_, a3);
  v6 = v5;
  if (v5)
    -[UIKeyboardSuggestedInputMode setEnabled:](v5, "setEnabled:", v4);
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIKeyboardInputMode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIKeyboardSuggestedInputMode enabled](self, "enabled");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier: %@, enabled: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

@end
