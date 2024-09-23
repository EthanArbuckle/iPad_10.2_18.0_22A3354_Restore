@implementation _UISupplementalPhraseItem

- (_UISupplementalPhraseItem)initWithTISupplementalPhraseItem:(id)a3
{
  id v5;
  id *v6;
  _UISupplementalPhraseItem *v7;
  _UISupplementalPhraseItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISupplementalPhraseItem;
  v6 = -[_UISupplementalItem _init](&v10, sel__init);
  v7 = (_UISupplementalPhraseItem *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    v8 = v7;
  }

  return v7;
}

- (_UISupplementalPhraseItem)initWithTISupplementalPhraseItem:(id)a3 icon:(id)a4
{
  id v7;
  id v8;
  id *v9;
  _UISupplementalPhraseItem *v10;
  void *v11;
  _UISupplementalPhraseItem *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISupplementalPhraseItem;
  v9 = -[_UISupplementalItem _init](&v14, sel__init);
  v10 = (_UISupplementalPhraseItem *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    v11 = (void *)objc_msgSend(v8, "copy");
    -[_UISupplementalItem setIcon:](v10, "setIcon:", v11);

    v12 = v10;
  }

  return v10;
}

- (_UISupplementalPhraseItem)initWithTitle:(id)a3
{
  id v4;
  _UISupplementalPhraseItem *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISupplementalPhraseItem;
  v5 = -[_UISupplementalItem _init](&v8, sel__init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDD10]), "initWithTitle:", v4);
    v5 = -[_UISupplementalPhraseItem initWithTISupplementalPhraseItem:icon:](v5, "initWithTISupplementalPhraseItem:icon:", v6, 0);

  }
  return v5;
}

- (_UISupplementalPhraseItem)initWithTitle:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  _UISupplementalPhraseItem *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UISupplementalPhraseItem;
  v8 = -[_UISupplementalItem _init](&v11, sel__init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDD10]), "initWithTitle:", v6);
    v8 = -[_UISupplementalPhraseItem initWithTISupplementalPhraseItem:icon:](v8, "initWithTISupplementalPhraseItem:icon:", v9, v7);

  }
  return v8;
}

- (unint64_t)_identifier
{
  return objc_msgSend(self->super._internal, "identifier");
}

- (NSString)title
{
  return (NSString *)objc_msgSend(self->super._internal, "title");
}

- (_UISupplementalPhraseItem)initWithCoder:(id)a3
{
  id v4;
  _UISupplementalPhraseItem *v5;
  uint64_t v6;
  id internal;
  _UISupplementalPhraseItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISupplementalPhraseItem;
  v5 = -[_UISupplementalItem initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unwrappedObject"));
    v6 = objc_claimAutoreleasedReturnValue();
    internal = v5->super._internal;
    v5->super._internal = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalPhraseItem;
  v4 = a3;
  -[_UISupplementalItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->super._internal, CFSTR("unwrappedObject"), v5.receiver, v5.super_class);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_UISupplementalPhraseItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title=\"%@\", identifier=%llu>"),
    v4,
    self,
    v5,
    objc_msgSend(self->super._internal, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
