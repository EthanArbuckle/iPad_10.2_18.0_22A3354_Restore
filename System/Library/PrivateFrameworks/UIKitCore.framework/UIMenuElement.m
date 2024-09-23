@implementation UIMenuElement

- (void)_setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  if (self->_subtitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    subtitle = self->_subtitle;
    self->_subtitle = v4;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryAction, 0);
  objc_storeStrong((id *)&self->__imageOrName, 0);
  objc_storeStrong((id *)&self->__internalIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSubtitle:(NSString *)subtitle
{
  objc_setProperty_nonatomic_copy(self, a2, subtitle, 16);
}

- (BOOL)_isLoadingPlaceholder
{
  return 0;
}

- (UIImage)image
{
  _UIMenuImageOrName **p_imageOrName;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  p_imageOrName = &self->__imageOrName;
  -[_UIMenuImageOrName _asMenuElementImageName](self->__imageOrName, "_asMenuElementImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      _UIImageWithName(v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    objc_storeStrong((id *)p_imageOrName, v7);
  }
  else
  {
    -[_UIMenuImageOrName _asMenuElementImage](*p_imageOrName, "_asMenuElementImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIImage *)v7;
}

- (_UIMenuImageOrName)_imageOrName
{
  return self->__imageOrName;
}

- (NSString)title
{
  return self->_title;
}

- (id)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (unint64_t)_preferredDisplayMode
{
  return self->__preferredDisplayMode;
}

- (void)set_accessoryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIAction)_accessoryAction
{
  return self->__accessoryAction;
}

- (UIMenuElement)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIMenuElement *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *internalIdentifier;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UIMenuElement;
  v11 = -[UIMenuElement init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v9;
    objc_storeStrong((id *)&v11->__imageOrName, v16);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();
    internalIdentifier = v11->__internalIdentifier;
    v11->__internalIdentifier = (NSString *)v18;

  }
  return v11;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)set_internalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSString)_internalIdentifier
{
  return self->__internalIdentifier;
}

- (void)_setImage:(id)a3
{
  _UIMenuImageOrName *v5;
  _UIMenuImageOrName **p_imageOrName;
  _UIMenuImageOrName *imageOrName;
  _UIMenuImageOrName *v8;

  v5 = (_UIMenuImageOrName *)a3;
  imageOrName = self->__imageOrName;
  p_imageOrName = &self->__imageOrName;
  if (imageOrName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_imageOrName, a3);
    v5 = v8;
  }

}

- (BOOL)_isInlineGroup
{
  if (-[UIMenuElement _isLeaf](self, "_isLeaf"))
    return 0;
  else
    return -[UIMenuElement options](self, "options") & 1;
}

- (BOOL)_omitsInlineTitle
{
  _BOOL4 v3;

  v3 = -[UIMenuElement _isInlineGroup](self, "_isInlineGroup");
  if (v3)
    LOBYTE(v3) = -[UIMenuElement behaviorOptions](self, "behaviorOptions") & 1;
  return v3;
}

- (BOOL)_canBeHighlighted
{
  void *v3;
  BOOL v4;

  if (!-[UIMenuElement _isLeaf](self, "_isLeaf"))
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return (-[UIMenuElement attributes](self, "attributes") & 1) == 0;
  -[UIMenuElement primaryActionHandler](self, "primaryActionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_isVisible
{
  BOOL v3;
  UIMenuElement *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[UIMenuElement _isLeaf](self, "_isLeaf"))
    return (-[UIMenuElement attributes](self, "attributes") & 4) == 0;
  v4 = self;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIMenuElement children](v4, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_isVisible") & 1) != 0)
        {
          v3 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[UIMenuElement headerView](v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;
LABEL_13:

  return v3;
}

- (id)_customContentView
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIMenuElement contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isLeaf
{
  return 0;
}

- (UIMenuElement)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIMenuElement *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  NSAttributedString *attributedTitle;
  uint64_t v11;
  NSString *subtitle;
  void *v13;
  void *v14;
  _UIMenuImageOrName *v15;
  _UIMenuImageOrName *imageOrName;
  uint64_t v17;
  NSString *accessibilityIdentifier;
  void *v19;
  void *v20;
  NSString *v21;
  void *internalIdentifier;
  uint64_t v23;
  NSString *v24;
  objc_super v26;

  v4 = coder;
  v26.receiver = self;
  v26.super_class = (Class)UIMenuElement;
  v5 = -[UIMenuElement init](&v26, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E16EDF20;
    objc_storeStrong((id *)&v5->_title, v8);

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedTitle"));
    v9 = objc_claimAutoreleasedReturnValue();
    attributedTitle = v5->_attributedTitle;
    v5->_attributedTitle = (NSAttributedString *)v9;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v11 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v11;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
      v15 = (_UIMenuImageOrName *)objc_claimAutoreleasedReturnValue();
    }
    imageOrName = v5->__imageOrName;
    v5->__imageOrName = v15;

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    accessibilityIdentifier = v5->_accessibilityIdentifier;
    v5->_accessibilityIdentifier = (NSString *)v17;

    v5->__preferredDisplayMode = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("preferredDisplayMode"));
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internalIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      internalIdentifier = v5->__internalIdentifier;
      v5->__internalIdentifier = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      internalIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(internalIdentifier, "UUIDString");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v5->__internalIdentifier;
      v5->__internalIdentifier = (NSString *)v23;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSAttributedString *attributedTitle;
  NSString *subtitle;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "encodeObject:forKey:", self->_title, CFSTR("title"));
  attributedTitle = self->_attributedTitle;
  if (attributedTitle)
    objc_msgSend(v12, "encodeObject:forKey:", attributedTitle, CFSTR("attributedTitle"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v12, "encodeObject:forKey:", subtitle, CFSTR("subtitle"));
  -[_UIMenuImageOrName _asMenuElementImageName](self->__imageOrName, "_asMenuElementImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMenuImageOrName _asMenuElementImage](self->__imageOrName, "_asMenuElementImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = CFSTR("imageName");
    v9 = v12;
    v10 = v6;
  }
  else
  {
    v11 = v12;
    if (!v7)
      goto LABEL_10;
    v8 = CFSTR("image");
    v9 = v12;
    v10 = v7;
  }
  objc_msgSend(v9, "encodeObject:forKey:", v10, v8);
  v11 = v12;
LABEL_10:
  objc_msgSend(v11, "encodeObject:forKey:", self->_accessibilityIdentifier, CFSTR("accessibilityIdentifier"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->__preferredDisplayMode, CFSTR("preferredDisplayMode"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v12, "encodeObject:forKey:", self->__internalIdentifier, CFSTR("internalIdentifier"));

}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  return 0;
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  return 0;
}

- (id)_immutableCopy
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuElement.m"), 145, CFSTR("Menu child must be a menu, action or command"));

  return 0;
}

- (void)_setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v4;

  }
}

- (void)_setPreferredDisplayMode:(unint64_t)a3
{
  self->__preferredDisplayMode = a3;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
