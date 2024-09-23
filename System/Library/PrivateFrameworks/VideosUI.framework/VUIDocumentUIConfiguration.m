@implementation VUIDocumentUIConfiguration

- (NSString)viewControllerIdentifier
{
  return self->_viewControllerIdentifier;
}

- (NSString)viewControllerDocumentIdentifier
{
  return self->_viewControllerDocumentIdentifier;
}

- (NSString)loadingViewText
{
  return self->_loadingViewText;
}

- (void)setViewControllerDocumentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationTitle, 0);
  objc_storeStrong((id *)&self->_loadingViewText, 0);
  objc_storeStrong((id *)&self->_viewControllerDocumentIdentifier, 0);
  objc_storeStrong((id *)&self->_viewControllerIdentifier, 0);
}

+ (VUIDocumentUIConfiguration)uiConfigurationWithDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  VUIDocumentUIConfigurationFormSheet *v13;
  void *v14;
  VUIDocumentUIConfigurationFormSheetFullscreen *v15;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("transitionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_presentationTypeFromString:", v5);

  objc_msgSend(v3, "vui_stringForKey:", CFSTR("viewControllerId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("viewControllerDocumentId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("loadingViewText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("navigationTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("animated"), 1);
  v21 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("navBarHidden"), 0);
  v20 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("navBarAdjustedToSizeClass"), 0);
  v19 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("interactivePopGestureAllowed"), 1);
  v11 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("modalOverModalAllowed"), 0);
  v22 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("prefersLargeTitle"), 1);
  v23 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("isComingFromExtras"), 0);
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("documentType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v6)
  {
    case 2:
    case 3:
    case 14:
      v13 = objc_alloc_init(VUIDocumentUIConfigurationModal);
      -[VUIDocumentUIConfigurationModal setModalOverModalAllowed:](v13, "setModalOverModalAllowed:", v11);
      -[VUIDocumentUIConfigurationModal setPresentOnPresentingVC:](v13, "setPresentOnPresentingVC:", objc_msgSend(v12, "isEqualToString:", CFSTR("modalOverPlayback")) ^ 1);
      break;
    case 4:
      v13 = objc_alloc_init(VUIDocumentUIConfigurationFormSheet);
      v17 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("tapDismissable"), 1);
      objc_msgSend((id)objc_opt_class(), "_preferredSizeFromConfig:", v3);
      -[VUIDocumentUIConfigurationFormSheet setPreferredSize:](v13, "setPreferredSize:");
      -[VUIDocumentUIConfigurationFormSheet setTapDismissable:](v13, "setTapDismissable:", v17);
      -[VUIDocumentUIConfigurationFormSheet setPrefersGrabberVisible:](v13, "setPrefersGrabberVisible:", objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("prefersGrabberVisible"), 0));
      objc_msgSend((id)objc_opt_class(), "_detentsFromDictionary:inConfig:", v3, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDocumentUIConfigurationFormSheet setDetents:](v13, "setDetents:", v14);

      v15 = (VUIDocumentUIConfigurationFormSheetFullscreen *)v13;
      goto LABEL_7;
    case 5:
      v13 = objc_alloc_init(VUIDocumentUIConfigurationPopover);
      v18 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", CFSTR("presentationAdjustedToSizeClass"), 0);
      objc_msgSend((id)objc_opt_class(), "_preferredSizeFromConfig:", v3);
      -[VUIDocumentUIConfigurationFormSheet setPreferredSize:](v13, "setPreferredSize:");
      -[VUIDocumentUIConfigurationModal setModalOverModalAllowed:](v13, "setModalOverModalAllowed:", v11);
      -[VUIDocumentUIConfigurationFormSheet setPopOverArrowDirection:](v13, "setPopOverArrowDirection:", 15);
      -[VUIDocumentUIConfigurationFormSheet setPresentationAdjustedToSizeClass:](v13, "setPresentationAdjustedToSizeClass:", v18);
      break;
    case 9:
      v15 = objc_alloc_init(VUIDocumentUIConfigurationFormSheetFullscreen);
      v13 = (VUIDocumentUIConfigurationFormSheet *)v15;
LABEL_7:
      -[VUIDocumentUIConfigurationModal setModalOverModalAllowed:](v15, "setModalOverModalAllowed:", v11);
      break;
    default:
      v13 = objc_alloc_init(VUIDocumentUIConfiguration);
      break;
  }
  -[VUIDocumentUIConfiguration setViewControllerIdentifier:](v13, "setViewControllerIdentifier:", v7);
  -[VUIDocumentUIConfiguration setViewControllerDocumentIdentifier:](v13, "setViewControllerDocumentIdentifier:", v8);
  -[VUIDocumentUIConfiguration setNavigationBarHidden:](v13, "setNavigationBarHidden:", v21);
  -[VUIDocumentUIConfiguration setNavigationBarAdjustedToSizeClass:](v13, "setNavigationBarAdjustedToSizeClass:", v20);
  -[VUIDocumentUIConfiguration setIsInteractivePopGestureAllowed:](v13, "setIsInteractivePopGestureAllowed:", v19);
  -[VUIDocumentUIConfiguration setType:](v13, "setType:", v6);
  -[VUIDocumentUIConfiguration setAnimated:](v13, "setAnimated:", v24);
  -[VUIDocumentUIConfiguration setLoadingViewText:](v13, "setLoadingViewText:", v9);
  -[VUIDocumentUIConfiguration setShouldWrapModalInNavigationController:](v13, "setShouldWrapModalInNavigationController:", 1);
  -[VUIDocumentUIConfiguration setPrefersLargeTitle:](v13, "setPrefersLargeTitle:", v22);
  -[VUIDocumentUIConfiguration setNavigationTitle:](v13, "setNavigationTitle:", v10);
  -[VUIDocumentUIConfiguration setIsComingFromExtras:](v13, "setIsComingFromExtras:", v23);

  return (VUIDocumentUIConfiguration *)v13;
}

- (VUIDocumentUIConfiguration)init
{
  VUIDocumentUIConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIDocumentUIConfiguration;
  result = -[VUIDocumentUIConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_shouldWrapModalInNavigationController = 1;
    result->_prefersLargeTitle = 1;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VUIDocumentUIConfiguration *v4;
  VUIDocumentUIConfiguration *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v17;

  v4 = (VUIDocumentUIConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VUIDocumentUIConfiguration type](self, "type");
      if (v6 == -[VUIDocumentUIConfiguration type](v5, "type"))
      {
        -[VUIDocumentUIConfiguration viewControllerIdentifier](self, "viewControllerIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDocumentUIConfiguration viewControllerIdentifier](v5, "viewControllerIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          -[VUIDocumentUIConfiguration viewControllerDocumentIdentifier](self, "viewControllerDocumentIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIDocumentUIConfiguration viewControllerDocumentIdentifier](v5, "viewControllerDocumentIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 == v11
            && (v12 = -[VUIDocumentUIConfiguration isAnimated](self, "isAnimated"),
                v12 == -[VUIDocumentUIConfiguration isAnimated](v5, "isAnimated"))
            && (v13 = -[VUIDocumentUIConfiguration isNavigationBarHidden](self, "isNavigationBarHidden"),
                v13 == -[VUIDocumentUIConfiguration isNavigationBarHidden](v5, "isNavigationBarHidden"))
            && (v14 = -[VUIDocumentUIConfiguration isNavigationBarAdjustedToSizeClass](self, "isNavigationBarAdjustedToSizeClass"), v14 == -[VUIDocumentUIConfiguration isNavigationBarAdjustedToSizeClass](v5, "isNavigationBarAdjustedToSizeClass"))&& (v15 = -[VUIDocumentUIConfiguration isInteractivePopGestureAllowed](self, "isInteractivePopGestureAllowed"), v15 == -[VUIDocumentUIConfiguration isInteractivePopGestureAllowed](v5, "isInteractivePopGestureAllowed")))
          {
            v17 = -[VUIDocumentUIConfiguration shouldWrapModalInNavigationController](self, "shouldWrapModalInNavigationController");
            v9 = v17 ^ -[VUIDocumentUIConfiguration shouldWrapModalInNavigationController](v5, "shouldWrapModalInNavigationController") ^ 1;
          }
          else
          {
            LOBYTE(v9) = 0;
          }

        }
        else
        {
          LOBYTE(v9) = 0;
        }

      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

+ (CGSize)_preferredSizeFromConfig:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "vui_numberForKey:", CFSTR("preferredWidth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "vui_numberForKey:", CFSTR("preferredHeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = v6;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (int64_t)_presentationTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") && (objc_msgSend(v3, "isEqualToString:", CFSTR("Push")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Zoom")) & 1) != 0)
    {
      v4 = 15;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FullScreen")) & 1) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OverFullScreen")) & 1) != 0)
    {
      v4 = 14;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BlurOverFullScreen")) & 1) != 0)
    {
      v4 = 3;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pop")) & 1) != 0)
    {
      v4 = 6;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dismiss")) & 1) != 0)
    {
      v4 = 7;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PopOrDismiss")) & 1) != 0)
    {
      v4 = 8;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DismissAndPush")) & 1) != 0)
    {
      v4 = 12;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DismissAndZoom")) & 1) != 0)
    {
      v4 = 16;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Popover")) & 1) != 0)
    {
      v4 = 5;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FormSheet")) & 1) != 0)
    {
      v4 = 4;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FormSheetFullscreen")))
    {
      v4 = 9;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)_detentsFromDictionary:(id)a3 inConfig:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  id val;
  _QWORD v20[4];
  id v21;
  id location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  val = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v18, "vui_arrayForKey:", CFSTR("detents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("medium"), v18))
        {
          objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("large")))
        {
          objc_msgSend(MEMORY[0x1E0DC3C78], "largeDetent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("custom")))
        {
          objc_initWeak(&location, val);
          v13 = (void *)MEMORY[0x1E0DC3C78];
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __62__VUIDocumentUIConfiguration__detentsFromDictionary_inConfig___block_invoke;
          v20[3] = &unk_1E9FA3230;
          objc_copyWeak(&v21, &location);
          objc_msgSend(v13, "customDetentWithIdentifier:resolver:", CFSTR("custom"), v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
    v15 = v5;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

double __62__VUIDocumentUIConfiguration__detentsFromDictionary_inConfig___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "preferredSize");
  if (v2 == 0.0)
    v3 = *MEMORY[0x1E0DC5388];
  else
    v3 = v2;

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setViewControllerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)isNavigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (BOOL)isNavigationBarAdjustedToSizeClass
{
  return self->_navigationBarAdjustedToSizeClass;
}

- (void)setNavigationBarAdjustedToSizeClass:(BOOL)a3
{
  self->_navigationBarAdjustedToSizeClass = a3;
}

- (BOOL)isInteractivePopGestureAllowed
{
  return self->_isInteractivePopGestureAllowed;
}

- (void)setIsInteractivePopGestureAllowed:(BOOL)a3
{
  self->_isInteractivePopGestureAllowed = a3;
}

- (void)setLoadingViewText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)prefersLargeTitle
{
  return self->_prefersLargeTitle;
}

- (void)setPrefersLargeTitle:(BOOL)a3
{
  self->_prefersLargeTitle = a3;
}

- (NSString)navigationTitle
{
  return self->_navigationTitle;
}

- (void)setNavigationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isComingFromExtras
{
  return self->_isComingFromExtras;
}

- (void)setIsComingFromExtras:(BOOL)a3
{
  self->_isComingFromExtras = a3;
}

- (BOOL)shouldWrapModalInNavigationController
{
  return self->_shouldWrapModalInNavigationController;
}

- (void)setShouldWrapModalInNavigationController:(BOOL)a3
{
  self->_shouldWrapModalInNavigationController = a3;
}

@end
