@implementation _UISupplementalItem

- (id)_init
{
  _UISupplementalItem *v2;
  _UISupplementalItem *v3;
  _UISupplementalItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISupplementalItem;
  v2 = -[_UISupplementalItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)_uiSupplementalItemWithTISupplementalItem:(id)a3 icon:(id)a4
{
  id v5;
  id v6;
  _UISupplementalPersonItem *v7;
  _UISupplementalPersonItem *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[_UISupplementalPersonItem initWithTISupplementalPersonItem:icon:]([_UISupplementalPersonItem alloc], "initWithTISupplementalPersonItem:icon:", v5, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = -[_UISupplementalPhraseItem initWithTISupplementalPhraseItem:icon:]([_UISupplementalPhraseItem alloc], "initWithTISupplementalPhraseItem:icon:", v5, v6);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (unint64_t)_identifier
{
  return 0;
}

- (_UISupplementalItem)initWithCoder:(id)a3
{
  id v4;
  _UISupplementalItem *v5;
  uint64_t v6;
  UIImage *icon;
  _UISupplementalItem *v8;

  v4 = a3;
  v5 = -[_UISupplementalItem _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v6 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (UIImage *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_internal, 0);
}

@end
