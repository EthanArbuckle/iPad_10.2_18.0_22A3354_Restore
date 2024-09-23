@implementation TVModalPresenterConfiguration

- (TVModalPresenterConfiguration)init
{
  return -[TVModalPresenterConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (TVModalPresenterConfiguration)initWithDictionary:(id)a3
{
  id v4;
  TVModalPresenterConfiguration *v5;
  TVModalPresenterConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVModalPresenterConfiguration;
  v5 = -[TVModalPresenterConfiguration init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TVModalPresenterConfiguration _configureWithDictionary:](v5, "_configureWithDictionary:", v4);

  return v6;
}

- (void)_configureWithDictionary:(id)a3
{
  void *v4;
  CGFloat v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  CGFloat v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  CGFloat *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  UIView *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  int64_t v47;
  void *v48;
  char v49;
  NSString *v50;
  NSString *barButtonID;
  void *v52;
  double v53;
  double v54;
  UIView *sourceView;
  UIView *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;

  v66 = a3;
  objc_msgSend(v66, "objectForKey:", CFSTR("popover"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = 0.0;
  v63 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v6 = v4) != 0)
  {
    v7 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("barButtonID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v65 = v8;
    else
      v65 = 0;
    objc_msgSend(v7, "objectForKey:", CFSTR("height"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "doubleValue");
      v11 = v13;
    }
    v62 = v7;
    objc_msgSend(v7, "objectForKey:", CFSTR("width"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      v5 = v15;
    }

    v9 = 3;
    v10 = 7;
  }
  else
  {
    v62 = 0;
    v65 = 0;
    v9 = 0;
    v10 = 5;
    v11 = 0.0;
  }
  objc_msgSend(v66, "objectForKey:", CFSTR("playback"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
    v10 = 0;
    v9 = 2;
  }
  objc_msgSend(v66, "objectForKey:", CFSTR("formSheet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v21 = v19) != 0)
  {
    v64 = v21;
    objc_msgSend(v21, "objectForKey:", CFSTR("height"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "doubleValue");
      v23 = v24;
    }
    objc_msgSend(v64, "objectForKey:", CFSTR("width"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "doubleValue");
      v20 = v26;
    }

    v9 = 1;
    v10 = 2;
  }
  else
  {
    v64 = 0;
    v23 = 0.0;
  }
  objc_msgSend(v66, "objectForKey:", CFSTR("navigationBarHidden"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v59 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v57 = objc_msgSend(v27, "BOOLValue");
  else
    v57 = 1;
  v28 = (CGFloat *)MEMORY[0x24BDBF090];
  objc_msgSend(v66, "objectForKey:", CFSTR("useCustomPresenter"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v61 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v29, "BOOLValue"))
    v9 = 4;
  v30 = *v28;
  v31 = v28[1];
  v32 = v28[2];
  v33 = v28[3];
  objc_msgSend(v66, "objectForKey:", CFSTR("sourceview"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v60 = v19;
  v58 = v29;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = 0;
    goto LABEL_33;
  }
  v35 = v34;
  v36 = v35;
  if (!v35)
  {
LABEL_33:
    v39 = 0;
    goto LABEL_38;
  }
  v37 = v10;
  objc_msgSend(v35, "objectForKey:", CFSTR("sourceviewObj"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v39 = v38;
  else
    v39 = 0;
  objc_msgSend(v36, "objectForKey:", CFSTR("sourceviewRect"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v40, "CGRectValue");
    v30 = v41;
    v31 = v42;
    v32 = v43;
    v33 = v44;
  }

  v10 = v37;
LABEL_38:
  objc_msgSend(v66, "objectForKey:", CFSTR("overridePresentationStyle"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;
  if ((objc_msgSend(v46, "isEqualToString:", CFSTR("currentContext")) & 1) != 0)
  {
    v47 = 6;
  }
  else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("formSheet")) & 1) != 0)
  {
    v9 = 1;
    v47 = 2;
  }
  else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("fullscreen")) & 1) != 0)
  {
    v47 = 5;
  }
  else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v47 = -1;
  }
  else if (objc_msgSend(v46, "isEqualToString:", CFSTR("pageSheet")))
  {
    v47 = 1;
  }
  else
  {
    v47 = v10;
  }
  objc_msgSend(v66, "objectForKey:", CFSTR("allowsModalOverModal"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v49 = objc_msgSend(v48, "BOOLValue");
  else
    v49 = 0;
  v50 = (NSString *)objc_msgSend(v65, "copy");
  barButtonID = self->_barButtonID;
  self->_barButtonID = v50;

  self->_configurationType = v9;
  if (*MEMORY[0x24BDBF148] == v20)
  {
    v52 = v63;
    if (*(double *)(MEMORY[0x24BDBF148] + 8) == v23)
    {
      objc_msgSend(MEMORY[0x24BDF6F98], "defaultFormSheetSize");
      v20 = v53;
      v23 = v54;
    }
  }
  else
  {
    v52 = v63;
  }
  self->_formSheetSize.width = v20;
  self->_formSheetSize.height = v23;
  self->_navigationBarHidden = v57;
  self->_popoverSize.width = v5;
  self->_popoverSize.height = v11;
  self->_allowsModalOverModal = v49;
  self->_allowsMenuDismissal = 1;
  sourceView = self->_sourceView;
  self->_presentationStyle = v47;
  self->_sourceView = v39;
  v56 = v39;

  self->_sourceRect.origin.x = v30;
  self->_sourceRect.origin.y = v31;
  self->_sourceRect.size.width = v32;
  self->_sourceRect.size.height = v33;

}

- (BOOL)allowsModalOverModal
{
  return self->_allowsModalOverModal;
}

- (void)setAllowsModalOverModal:(BOOL)a3
{
  self->_allowsModalOverModal = a3;
}

- (BOOL)allowsMenuDismissal
{
  return self->_allowsMenuDismissal;
}

- (void)setAllowsMenuDismissal:(BOOL)a3
{
  self->_allowsMenuDismissal = a3;
}

- (NSString)barButtonID
{
  return self->_barButtonID;
}

- (void)setBarButtonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (CGSize)formSheetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_formSheetSize.width;
  height = self->_formSheetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFormSheetSize:(CGSize)a3
{
  self->_formSheetSize = a3;
}

- (CGSize)popoverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_popoverSize.width;
  height = self->_popoverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPopoverSize:(CGSize)a3
{
  self->_popoverSize = a3;
}

- (BOOL)navigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
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

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_barButtonID, 0);
}

@end
