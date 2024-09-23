@implementation _UIOEditMenuPresentationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_UIOEditMenuPresentationConfiguration)configurationWithMenu:(id)a3 preferredArrowDirection:(int64_t)a4 sourceRect:(CGRect)a5 enforcesMenuControllerLifecycle:(BOOL)a6 initialUserInterfaceStyle:(int64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(void **)(v15 + 16);
  *(_QWORD *)(v15 + 16) = v17;

  v19 = *(void **)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v14;

  *(CGFloat *)(v15 + 48) = x;
  *(CGFloat *)(v15 + 56) = y;
  *(CGFloat *)(v15 + 64) = width;
  *(CGFloat *)(v15 + 72) = height;
  *(_BYTE *)(v15 + 8) = a6;
  *(_QWORD *)(v15 + 32) = a4;
  *(_QWORD *)(v15 + 40) = a7;
  *(CGFloat *)(v15 + 80) = x;
  *(CGFloat *)(v15 + 88) = y;
  *(CGFloat *)(v15 + 96) = width;
  *(CGFloat *)(v15 + 104) = height;
  return (_UIOEditMenuPresentationConfiguration *)(id)v15;
}

- (_UIOEditMenuPresentationConfiguration)configurationWithTargetOrigin:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  CGSize size;
  CGSize v8;

  y = a3.y;
  x = a3.x;
  v6 = objc_opt_new();
  objc_storeStrong((id *)(v6 + 16), self->_identifier);
  objc_storeStrong((id *)(v6 + 24), self->_menu);
  *(_QWORD *)(v6 + 32) = self->_preferredArrowDirection;
  size = self->_sourceRect.size;
  *(CGPoint *)(v6 + 48) = self->_sourceRect.origin;
  *(CGSize *)(v6 + 64) = size;
  *(_BYTE *)(v6 + 8) = self->_enforcesMenuControllerLifecycle;
  *(_QWORD *)(v6 + 40) = self->_initialUserInterfaceStyle;
  v8 = self->_targetRect.size;
  *(CGFloat *)(v6 + 80) = x;
  *(CGFloat *)(v6 + 88) = y;
  *(CGSize *)(v6 + 96) = v8;
  return (_UIOEditMenuPresentationConfiguration *)(id)v6;
}

- (_UIOEditMenuPresentationConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIOEditMenuPresentationConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  UIMenu *menu;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGSize size;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIOEditMenuPresentationConfiguration;
  v5 = -[_UIOEditMenuPresentationConfiguration init](&v19, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", MEMORY[0x1E0C9AA60]);
    v9 = objc_claimAutoreleasedReturnValue();
    menu = v5->_menu;
    v5->_menu = (UIMenu *)v9;

    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("menuIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMenuElement set_internalIdentifier:](v5->_menu, "set_internalIdentifier:", v12);

    v5->_preferredArrowDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredArrowDirection"));
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("sourceRect"));
    v5->_sourceRect.origin.x = v13;
    v5->_sourceRect.origin.y = v14;
    v5->_sourceRect.size.width = v15;
    v5->_sourceRect.size.height = v16;
    v5->_enforcesMenuControllerLifecycle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enforcesMenuControllerLifecycle"));
    v5->_initialUserInterfaceStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialUserInterfaceStyle"));
    size = v5->_sourceRect.size;
    v5->_targetRect.origin = v5->_sourceRect.origin;
    v5->_targetRect.size = size;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  -[UIMenuElement _internalIdentifier](self->_menu, "_internalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("menuIdentifier"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_preferredArrowDirection, CFSTR("preferredArrowDirection"));
  objc_msgSend(v6, "encodeCGRect:forKey:", CFSTR("sourceRect"), self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  objc_msgSend(v6, "encodeBool:forKey:", self->_enforcesMenuControllerLifecycle, CFSTR("enforcesMenuControllerLifecycle"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_initialUserInterfaceStyle, CFSTR("initialUserInterfaceStyle"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)targetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetRect.origin.x;
  y = self->_targetRect.origin.y;
  width = self->_targetRect.size.width;
  height = self->_targetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)enforcesMenuControllerLifecycle
{
  return self->_enforcesMenuControllerLifecycle;
}

- (int64_t)preferredArrowDirection
{
  return self->_preferredArrowDirection;
}

- (int64_t)initialUserInterfaceStyle
{
  return self->_initialUserInterfaceStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
