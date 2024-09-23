@implementation WBSStartPageCustomizationItem

+ (id)itemWithIdentifier:(id)a3 title:(id)a4 icon:(id)a5 enabled:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  v13 = objc_alloc_init((Class)a1);
  v14 = (void *)v13[2];
  v13[2] = v10;
  v15 = v10;

  v16 = objc_msgSend(v12, "copy");
  v17 = (void *)v13[3];
  v13[3] = v16;

  v18 = (void *)v13[4];
  v13[4] = v11;

  *((_BYTE *)v13 + 8) = a6;
  return v13;
}

+ (id)itemWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  WBSStartPageSectionIdentifierTitle(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    WBSStartPageSectionIdentifierIcon(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "itemWithIdentifier:title:icon:enabled:", v6, v7, v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_enabled)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; title = %@; enabled = %@>"),
               v4,
               self,
               self->_identifier,
               self->_title,
               v5);
}

- (WBSStartPageCustomizationItem)itemWithEnabled:(BOOL)a3
{
  id *v5;
  uint64_t v6;
  id v7;

  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v5 + 2, self->_identifier);
  v6 = -[NSString copy](self->_title, "copy");
  v7 = v5[3];
  v5[3] = (id)v6;

  objc_storeStrong(v5 + 4, self->_icon);
  *((_BYTE *)v5 + 8) = a3;
  return (WBSStartPageCustomizationItem *)v5;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end
