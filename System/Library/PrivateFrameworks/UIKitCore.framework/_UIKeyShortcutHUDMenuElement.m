@implementation _UIKeyShortcutHUDMenuElement

+ (id)elementWithUIMenuElement:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[_UIKeyShortcutHUDMenuElement uiMenuElement](self, "uiMenuElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[_UIKeyShortcutHUDMenuElement uiMenuElement](self, "uiMenuElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKeyShortcutHUDMenuElement;
  -[_UIKeyShortcutHUDMenuElement description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[_UIKeyShortcutHUDMenuElement uiMenuElement](self, "uiMenuElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKeyShortcutHUDMenuElement uiMenuElement](self, "uiMenuElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(": %@"), v6);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIKeyShortcutHUDMenuElement *v4;
  _UIKeyShortcutHUDMenuElement *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (_UIKeyShortcutHUDMenuElement *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UIKeyShortcutHUDMenuElement uiMenuElement](self, "uiMenuElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyShortcutHUDMenuElement uiMenuElement](v5, "uiMenuElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return -[UIMenuElement hash](self->_uiMenuElement, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIKeyShortcutHUDMenuElement uiMenuElement](self, "uiMenuElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("menuElement"));

}

- (_UIKeyShortcutHUDMenuElement)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDMenuElement *v5;
  void *v6;
  uint64_t v7;
  UIMenuElement *uiMenuElement;

  v4 = a3;
  v5 = -[_UIKeyShortcutHUDMenuElement init](self, "init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("menuElement"));
    v7 = objc_claimAutoreleasedReturnValue();
    uiMenuElement = v5->_uiMenuElement;
    v5->_uiMenuElement = (UIMenuElement *)v7;

  }
  return v5;
}

- (UIMenuElement)uiMenuElement
{
  return self->_uiMenuElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiMenuElement, 0);
}

@end
