@implementation _UIDeleteCursorAccessory

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDeleteCursorAccessory;
  -[_UICursorAccessory encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDeleteCursorAccessory;
  return -[_UICursorAccessory hash](&v3, sel_hash);
}

- (_UIDeleteCursorAccessory)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDeleteCursorAccessory;
  return -[_UICursorAccessory initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (id)descriptionBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDeleteCursorAccessory;
  -[_UICursorAccessory descriptionBuilder](&v3, sel_descriptionBuilder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)identifier
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDeleteCursorAccessory;
  -[_UICursorAccessory identifier](&v5, sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("del"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICursorAccessory setIdentifier:](self, "setIdentifier:", v3);
  }
  return v3;
}

@end
