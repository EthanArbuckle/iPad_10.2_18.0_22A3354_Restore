@implementation PXGadgetSectionHeader

+ (id)titleFontForHeaderStyle:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;

  if (a3 < 4)
  {
    v5 = 3;
LABEL_5:
    v6 = 32770;
    goto LABEL_6;
  }
  if (a3 - 4 < 2)
  {
    v5 = 5;
    goto LABEL_5;
  }
  if (a3 != 6)
    goto LABEL_10;
  v5 = 4;
  v6 = 0x8000;
LABEL_6:
  MEMORY[0x1A85CC970](v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGadgetSectionHeader+iOS.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("font"));

    v7 = 0;
  }
  return v7;
}

+ (id)buttonFontForButtonType:(unint64_t)a3
{
  return (id)PXCappedFontWithTextStyle();
}

- (PXGadgetSectionHeader)initWithConfigurationBlock:(id)a3
{
  void (**v4)(id, PXGadgetSectionHeader *);
  char *v5;
  PXGadgetSectionHeader *v6;
  void *v7;
  objc_super v9;

  v4 = (void (**)(id, PXGadgetSectionHeader *))a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGadgetSectionHeader;
  v5 = -[PXGadgetSectionHeader init](&v9, sel_init);
  v6 = (PXGadgetSectionHeader *)v5;
  if (v5)
  {
    *((_QWORD *)v5 + 13) = 0;
    *((_QWORD *)v5 + 16) = 0;
    *(_OWORD *)(v5 + 152) = PXDefaultSectionHeaderInsets;
    *(_OWORD *)(v5 + 168) = unk_1A7C0A1A0;
    v7 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = &__block_literal_global_138_182867;

    if (v4)
      v4[2](v4, v6);
  }

  return v6;
}

- (PXGadgetSectionHeader)initWithGadget:(id)a3
{
  id v4;
  id v5;
  PXGadgetSectionHeader *v6;
  _QWORD v8[4];
  PXGadgetSectionHeader *v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PXGadgetSectionHeader_initWithGadget___block_invoke;
  v8[3] = &unk_1E5132708;
  v9 = self;
  v10 = v4;
  v5 = v4;
  v6 = -[PXGadgetSectionHeader initWithConfigurationBlock:](v9, "initWithConfigurationBlock:", v8);

  return v6;
}

- (UIFont)headerFont
{
  return (UIFont *)+[PXGadgetSectionHeader titleFontForHeaderStyle:](PXGadgetSectionHeader, "titleFontForHeaderStyle:", -[PXGadgetSectionHeader headerStyle](self, "headerStyle"));
}

- (BOOL)shouldShowAccessoryButton
{
  return -[PXGadgetSectionHeader buttonType](self, "buttonType") != 0;
}

- (NSString)buttonTitle
{
  unint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;

  v3 = -[PXGadgetSectionHeader buttonType](self, "buttonType");
  switch(v3)
  {
    case 6uLL:
      -[PXGadgetSectionHeader customButtonTitle](self, "customButtonTitle");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (__CFString *)v7;
      return (NSString *)v8;
    case 5uLL:
      PXLocalizedStringFromTable(CFSTR("PXGadgetAccessoryButtonTypeClear"), CFSTR("PhotosUICore"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1uLL:
      -[PXGadgetSectionHeader customButtonTitle](self, "customButtonTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = v4;
      }
      else
      {
        PXLocalizedStringFromTable(CFSTR("PXForYouSeeAllGenericButtonTitle"), CFSTR("PhotosUICore"));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v6;

      break;
    default:
      v8 = &stru_1E5149688;
      break;
  }
  return (NSString *)v8;
}

- (UIFont)buttonFont
{
  return (UIFont *)+[PXGadgetSectionHeader buttonFontForButtonType:](PXGadgetSectionHeader, "buttonFontForButtonType:", -[PXGadgetSectionHeader buttonType](self, "buttonType"));
}

- (UIImage)buttonImage
{
  return (UIImage *)objc_msgSend((id)objc_opt_class(), "buttonImageForButtonType:", -[PXGadgetSectionHeader buttonType](self, "buttonType"));
}

- (BOOL)shouldShowDivider
{
  unint64_t v3;
  _BOOL4 v4;
  BOOL result;

  v3 = -[PXGadgetSectionHeader headerStyle](self, "headerStyle");
  if (!-[PXGadgetSectionHeader isFirstSection](self, "isFirstSection"))
  {
    if (v3 == 5)
      return 0;
    return v3 != 2;
  }
  v4 = -[PXGadgetSectionHeader shouldShowDividerOnFirstSection](self, "shouldShowDividerOnFirstSection");
  result = 0;
  if (v4 && v3 != 5)
    return v3 != 2;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[PXGadgetSectionHeader gadgetSpec](self, "gadgetSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)headerHeight
{
  double result;

  +[PXGadgetSpec sectionHeaderHeightForStyle:dividerHidden:](PXGadgetSpec, "sectionHeaderHeightForStyle:dividerHidden:", -[PXGadgetSectionHeader headerStyle](self, "headerStyle"), -[PXGadgetSectionHeader shouldShowDivider](self, "shouldShowDivider") ^ 1);
  return result;
}

- (double)titleHeight
{
  double result;

  +[PXGadgetSpec sectionHeaderTitleHeightForStyle:dividerHidden:](PXGadgetSpec, "sectionHeaderTitleHeightForStyle:dividerHidden:", -[PXGadgetSectionHeader headerStyle](self, "headerStyle"), -[PXGadgetSectionHeader shouldShowDivider](self, "shouldShowDivider"));
  return result;
}

- (double)titleTopSpacing
{
  double result;

  +[PXGadgetSpec sectionHeaderTopSpacingForStyle:](PXGadgetSpec, "sectionHeaderTopSpacingForStyle:", -[PXGadgetSectionHeader headerStyle](self, "headerStyle"));
  return result;
}

- (double)titleBottomSpacing
{
  double result;

  +[PXGadgetSpec sectionHeaderTitleBottomSpacingForStyle:](PXGadgetSpec, "sectionHeaderTitleBottomSpacingForStyle:", -[PXGadgetSectionHeader headerStyle](self, "headerStyle"));
  return result;
}

- (void)setHeaderStyle:(unint64_t)a3
{
  if (self->_headerStyle != a3)
  {
    self->_headerStyle = a3;
    -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 13);
  }
}

- (void)setHeaderTitle:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;

  v7 = (NSString *)a3;
  v5 = self->_headerTitle;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSString isEqualToString:](v7, "isEqualToString:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_headerTitle, a3);
      -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 5);
    }
  }

}

- (void)setButtonType:(unint64_t)a3
{
  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 2);
  }
}

- (void)setCustomButtonTitle:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;

  v7 = (NSString *)a3;
  v5 = self->_customButtonTitle;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSString isEqualToString:](v7, "isEqualToString:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_customButtonTitle, a3);
      -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setAccessoryButtonPressed:(id)a3
{
  void *v4;
  id accessoryButtonPressed;

  if (self->_accessoryButtonPressed != a3)
  {
    v4 = _Block_copy(a3);
    accessoryButtonPressed = self->_accessoryButtonPressed;
    self->_accessoryButtonPressed = v4;

    -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 2);
  }
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;

  v5 = (PXGadgetSpec *)a3;
  if (self->_gadgetSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)setIsFirstSection:(BOOL)a3
{
  if (self->_isFirstSection != a3)
  {
    self->_isFirstSection = a3;
    -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 8);
  }
}

- (void)setShouldShowDividerOnFirstSection:(BOOL)a3
{
  if (self->_shouldShowDividerOnFirstSection != a3)
  {
    self->_shouldShowDividerOnFirstSection = a3;
    if (self->_isFirstSection)
      -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 8);
  }
}

- (void)setWantsMultilineTitle:(BOOL)a3
{
  if (self->_wantsMultilineTitle != a3)
  {
    self->_wantsMultilineTitle = a3;
    -[PXGadgetSectionHeader signalChange:](self, "signalChange:", 16);
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGadgetSectionHeader;
  -[PXGadgetSectionHeader performChanges:](&v3, sel_performChanges_, a3);
}

- (void)performChangesWithGadget:(id)a3 additionalChanges:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PXGadgetSectionHeader_performChangesWithGadget_additionalChanges___block_invoke;
  v10[3] = &unk_1E5132730;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PXGadgetSectionHeader performChanges:](self, "performChanges:", v10);

}

- (void)_configureWithGadget:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "headerStyle");
  else
    v5 = 0;
  -[PXGadgetSectionHeader setHeaderStyle:](self, "setHeaderStyle:", v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "localizedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetSectionHeader setHeaderTitle:](self, "setHeaderTitle:", v6);

  }
  else
  {
    -[PXGadgetSectionHeader setHeaderTitle:](self, "setHeaderTitle:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v4, "accessoryButtonType");
  else
    v7 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (v7 == 6 || v7 == 1))
  {
    objc_msgSend(v4, "accessoryButtonTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[PXGadgetSectionHeader setButtonType:](self, "setButtonType:", v7);
  -[PXGadgetSectionHeader setCustomButtonTitle:](self, "setCustomButtonTitle:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v4, "wantsMultilineTitle");
  else
    v9 = 0;
  -[PXGadgetSectionHeader setWantsMultilineTitle:](self, "setWantsMultilineTitle:", v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__PXGadgetSectionHeader__configureWithGadget___block_invoke;
    v11[3] = &unk_1E5132758;
    v12 = v4;
    -[PXGadgetSectionHeader setAccessoryButtonPressed:](self, "setAccessoryButtonPressed:", v11);

  }
  objc_msgSend(v4, "gadgetSpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeader setGadgetSpec:](self, "setGadgetSpec:", v10);

}

- (unint64_t)headerStyle
{
  return self->_headerStyle;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)customButtonTitle
{
  return self->_customButtonTitle;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (BOOL)isFirstSection
{
  return self->_isFirstSection;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (BOOL)shouldShowDividerOnFirstSection
{
  return self->_shouldShowDividerOnFirstSection;
}

- (BOOL)wantsMultilineTitle
{
  return self->_wantsMultilineTitle;
}

- (id)accessoryButtonPressed
{
  return self->_accessoryButtonPressed;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessoryButtonPressed, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_customButtonTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

void __46__PXGadgetSectionHeader__configureWithGadget___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  objc_msgSend(*(id *)(a1 + 32), "userDidSelectAccessoryButton:", a2);
  v3 = (void *)MEMORY[0x1E0D09910];
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = objc_msgSend(*(id *)(a1 + 32), "gadgetType");
  if (v5 > 0x16)
    v6 = 0;
  else
    v6 = off_1E513EE30[v5];
  v9 = v6;
  PXGadgetAccessoryButtonTypeDescription(objc_msgSend(*(id *)(a1 + 32), "accessoryButtonType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.gadgetWithType%@SelectedAccessoryButtonWithType%@"), v9, v7);
  objc_msgSend(v3, "sendEvent:withPayload:", v8, MEMORY[0x1E0C9AA70]);

}

void __68__PXGadgetSectionHeader_performChangesWithGadget_additionalChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_configureWithGadget:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __40__PXGadgetSectionHeader_initWithGadget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureWithGadget:", *(_QWORD *)(a1 + 40));
}

+ (id)buttonImageForButtonType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  if (buttonImageForButtonType__onceToken != -1)
    dispatch_once(&buttonImageForButtonType__onceToken, &__block_literal_global_182879);
  v4 = (void *)buttonImageForButtonType__imageCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    +[PXGadgetSectionHeader _buttonImageNameForButtonType:](PXGadgetSectionHeader, "_buttonImageNameForButtonType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v9 = (void *)buttonImageForButtonType__imageCache;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v6, v10);

      }
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (id)_buttonImageNameForButtonType:(unint64_t)a3
{
  if (a3 - 2 > 2)
    return 0;
  else
    return off_1E5132778[a3 - 2];
}

void __50__PXGadgetSectionHeader_buttonImageForButtonType___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)buttonImageForButtonType__imageCache;
  buttonImageForButtonType__imageCache = (uint64_t)v0;

}

@end
