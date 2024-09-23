@implementation WBSAction

+ (id)actionWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = objc_alloc_init((Class)a1);
  v16 = objc_msgSend(v14, "copy");

  v17 = (void *)*((_QWORD *)v15 + 2);
  *((_QWORD *)v15 + 2) = v16;

  objc_storeStrong((id *)v15 + 3, a4);
  v18 = (void *)objc_msgSend(v13, "copy");

  if (v18)
  {
    v19 = v18;
    v20 = (void *)*((_QWORD *)v15 + 4);
    *((_QWORD *)v15 + 4) = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v15 + 4);
    *((_QWORD *)v15 + 4) = v21;

  }
  v23 = MEMORY[0x1A85D45E4](v12);

  v24 = (void *)*((_QWORD *)v15 + 1);
  *((_QWORD *)v15 + 1) = v23;

  return v15;
}

+ (id)toggleSectionExpandedAction
{
  return +[WBSAction actionWithTitle:image:identifier:handler:](WBSAction, "actionWithTitle:image:identifier:handler:", &stru_1E5449658, 0, CFSTR("com.apple.Safari.SectionToggleExpanded"), &__block_literal_global_0);
}

- (id)makeUIAction
{
  void *v3;
  void *v4;
  NSString *title;
  UIImage *image;
  NSString *identifier;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1A85D45E4](self->_handler, a2);
  v4 = (void *)MEMORY[0x1E0CEA2A8];
  title = self->_title;
  image = self->_image;
  identifier = self->_identifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25__WBSAction_makeUIAction__block_invoke;
  v11[3] = &unk_1E5441460;
  v12 = v3;
  v8 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", title, image, identifier, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", self->_accessibilityIdentifier);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p; title = %@; image = %@; identifier = %@>"),
               objc_opt_class(),
               self,
               self->_title,
               self->_image,
               self->_identifier);
}

- (BOOL)isEqual:(id)a3
{
  WBSAction *v4;
  BOOL v5;

  v4 = (WBSAction *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4->_identifier);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)performAction
{
  (*((void (**)(void))self->_handler + 2))();
}

uint64_t __25__WBSAction_makeUIAction__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
