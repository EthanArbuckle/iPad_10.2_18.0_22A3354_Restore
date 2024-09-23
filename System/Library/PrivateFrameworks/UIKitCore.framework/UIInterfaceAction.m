@implementation UIInterfaceAction

+ (BOOL)changedProperties:(id)a3 containsAny:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

+ (UIInterfaceAction)actionWithTitle:(id)a3 type:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:type:customContentViewController:customContentView:handler:", v9, a4, 0, 0, v8);

  return (UIInterfaceAction *)v10;
}

+ (UIInterfaceAction)actionWithCustomContentViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:type:customContentViewController:customContentView:handler:", &stru_1E16EDF20, 100, v4, 0, 0);

  return (UIInterfaceAction *)v5;
}

+ (UIInterfaceAction)actionWithCustomContentView:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:type:customContentViewController:customContentView:handler:", &stru_1E16EDF20, 100, 0, v7, v6);

  return (UIInterfaceAction *)v8;
}

- (UIInterfaceAction)initWithTitle:(id)a3 type:(int64_t)a4 customContentViewController:(id)a5 customContentView:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  UIInterfaceAction *v17;
  UIInterfaceAction *v18;
  void *v19;
  id handler;
  uint64_t v21;
  NSPointerArray *weakDisplayPropertyObservers;
  objc_super v24;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)UIInterfaceAction;
  v17 = -[UIInterfaceAction init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    v18->_titleAlignment = 1;
    v18->_type = a4;
    v19 = _Block_copy(v16);
    handler = v18->_handler;
    v18->_handler = v19;

    objc_storeStrong((id *)&v18->_customContentViewController, a5);
    objc_storeStrong((id *)&v18->_customContentView, a6);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v21 = objc_claimAutoreleasedReturnValue();
    weakDisplayPropertyObservers = v18->_weakDisplayPropertyObservers;
    v18->_weakDisplayPropertyObservers = (NSPointerArray *)v21;

    v18->_enabled = 1;
  }

  return v18;
}

- (void)_setVisualStyle:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_visualStyle) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualStyle, a3);
    -[UIInterfaceAction _notifyObserversVisualStyleDidChange](self, "_notifyObserversVisualStyleDidChange");
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIInterfaceAction;
  -[UIInterfaceAction description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_title, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" title = %@"), self->_title);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (self->_customContentView)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" customContentView = %@"), self->_customContentView);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitle:type:customContentViewController:customContentView:handler:", self->_title, self->_type, self->_customContentViewController, self->_customContentView, self->_handler);
  *(_QWORD *)(v4 + 48) = self->_titleAlignment;
  objc_storeStrong((id *)(v4 + 56), self->_classificationTitle);
  *(_BYTE *)(v4 + 8) = self->_enabled;
  objc_storeStrong((id *)(v4 + 64), self->_leadingImage);
  *(CGSize *)(v4 + 136) = self->_leadingImageLayoutSize;
  objc_storeStrong((id *)(v4 + 72), self->_trailingImage);
  *(CGSize *)(v4 + 152) = self->_trailingImageLayoutSize;
  return (id)v4;
}

+ (void)_setInterfaceActionCanInvokeActionsWithoutPresentingController:(BOOL)a3
{
  __interfaceActionCanInvokeActionsWithoutPresentingController = a3;
}

+ (id)_observableDisplayProperties
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("titleAlignment"), CFSTR("leadingImage"), CFSTR("leadingImageLayoutSize"), CFSTR("trailingImage"), CFSTR("trailingImageLayoutSize"), CFSTR("enabled"), CFSTR("preferred"), 0);
}

- (void)setTitle:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_title) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("title"));
  }

}

- (void)setTitleAlignment:(int64_t)a3
{
  if (self->_titleAlignment != a3)
  {
    self->_titleAlignment = a3;
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("titleAlignment"));
  }
}

- (void)setLeadingImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_leadingImage) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingImage, a3);
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("leadingImage"));
  }

}

- (void)setTrailingImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_trailingImage) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_trailingImage, a3);
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("trailingImage"));
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("enabled"));
  }
}

- (UIView)customContentView
{
  UIView *customContentView;
  UIView *v3;
  void *v4;

  customContentView = self->_customContentView;
  if (customContentView)
  {
    v3 = customContentView;
  }
  else
  {
    -[UIInterfaceAction customContentViewController](self, "customContentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setIsPreferred:(BOOL)a3
{
  if (self->_preferred != a3)
  {
    self->_preferred = a3;
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("preferred"));
  }
}

- (void)_setIsFocused:(BOOL)a3
{
  if (self->_focused != a3)
  {
    self->_focused = a3;
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("focused"));
  }
}

- (void)_setTitleTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_titleTextColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("titleTextColor"));
  }

}

- (void)_setImageTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_imageTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_imageTintColor, a3);
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("imageTintColor"));
  }

}

- (CGSize)_layoutSizeForImageProperty:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("LayoutSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceAction valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "CGSizeValue");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setLeadingImageLayoutSize:(CGSize)a3
{
  if (self->_leadingImageLayoutSize.width != a3.width || self->_leadingImageLayoutSize.height != a3.height)
  {
    self->_leadingImageLayoutSize = a3;
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("leadingImageLayoutSize"));
  }
}

- (CGSize)leadingImageLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_leadingImageLayoutSize.width;
  height = self->_leadingImageLayoutSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    -[UIImage size](self->_leadingImage, "size");
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTrailingImageLayoutSize:(CGSize)a3
{
  if (self->_trailingImageLayoutSize.width != a3.width || self->_trailingImageLayoutSize.height != a3.height)
  {
    self->_trailingImageLayoutSize = a3;
    -[UIInterfaceAction _notifyObserversDidChangeActionProperty:](self, "_notifyObserversDidChangeActionProperty:", CFSTR("trailingImageLayoutSize"));
  }
}

- (CGSize)trailingImageLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_trailingImageLayoutSize.width;
  height = self->_trailingImageLayoutSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    -[UIImage size](self->_trailingImage, "size");
  result.height = height;
  result.width = width;
  return result;
}

- (void)_invokeHandlerWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id handler;
  void (**v7)(id, UIInterfaceAction *, _BYTE *);
  char v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[UIInterfaceAction _presentingController](self, "_presentingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    handler = self->_handler;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__UIInterfaceAction__invokeHandlerWithCompletionBlock___block_invoke;
    v9[3] = &unk_1E16B1BF8;
    v10 = v4;
    objc_msgSend(v5, "interfaceAction:invokeActionHandler:completion:", self, handler, v9);

  }
  else if (__interfaceActionCanInvokeActionsWithoutPresentingController)
  {
    v7 = (void (**)(id, UIInterfaceAction *, _BYTE *))self->_handler;
    if (v7)
    {
      v8 = 0;
      v7[2](v7, self, &v8);
    }
  }

}

uint64_t __55__UIInterfaceAction__invokeHandlerWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_addActionDisplayPropertyObserver:(id)a3
{
  NSPointerArray *weakDisplayPropertyObservers;
  id v5;

  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  v5 = a3;
  -[NSPointerArray compact](weakDisplayPropertyObservers, "compact");
  -[NSPointerArray addPointer:](self->_weakDisplayPropertyObservers, "addPointer:", v5);

}

- (void)_removeActionDisplayPropertyObserver:(id)a3
{
  NSPointerArray *weakDisplayPropertyObservers;
  id v5;
  void *v6;
  uint64_t v7;

  weakDisplayPropertyObservers = self->_weakDisplayPropertyObservers;
  v5 = a3;
  -[NSPointerArray compact](weakDisplayPropertyObservers, "compact");
  -[NSPointerArray allObjects](self->_weakDisplayPropertyObservers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSPointerArray removePointerAtIndex:](self->_weakDisplayPropertyObservers, "removePointerAtIndex:", v7);
}

- (void)_notifyObserversVisualStyleDidChange
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSPointerArray compact](self->_weakDisplayPropertyObservers, "compact");
  WeakRetained = objc_loadWeakRetained((id *)&self->__visualRepresentation);
  objc_msgSend(WeakRetained, "interfaceAction:reloadDisplayedContentVisualStyle:", self, self->_visualStyle);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)-[NSPointerArray copy](self->_weakDisplayPropertyObservers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "interfaceAction:reloadDisplayedContentVisualStyle:", self, self->_visualStyle);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_notifyObserversDidChangeActionProperty:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSPointerArray compact](self->_weakDisplayPropertyObservers, "compact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->__visualRepresentation);
  objc_msgSend(WeakRetained, "interfaceAction:reloadDisplayedContentActionProperties:", self, v5);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)-[NSPointerArray copy](self->_weakDisplayPropertyObservers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "interfaceAction:reloadDisplayedContentActionProperties:", self, v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIViewController)customContentViewController
{
  return self->_customContentViewController;
}

- (void)setCustomContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_customContentViewController, a3);
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (NSString)classificationTitle
{
  return self->_classificationTitle;
}

- (void)setClassificationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIImage)leadingImage
{
  return self->_leadingImage;
}

- (UIImage)trailingImage
{
  return self->_trailingImage;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSPointerArray)weakDisplayPropertyObservers
{
  return self->_weakDisplayPropertyObservers;
}

- (UIInterfaceActionRepresentationView)_visualRepresentation
{
  return (UIInterfaceActionRepresentationView *)objc_loadWeakRetained((id *)&self->__visualRepresentation);
}

- (void)_setVisualRepresentation:(id)a3
{
  objc_storeWeak((id *)&self->__visualRepresentation, a3);
}

- (_UIInterfaceActionPresenting)_presentingController
{
  return (_UIInterfaceActionPresenting *)objc_loadWeakRetained((id *)&self->__presentingController);
}

- (void)_setPresentingController:(id)a3
{
  objc_storeWeak((id *)&self->__presentingController, a3);
}

- (BOOL)_isPreferred
{
  return self->_preferred;
}

- (BOOL)_isFocused
{
  return self->_focused;
}

- (UIInterfaceActionVisualStyle)_visualStyle
{
  return self->_visualStyle;
}

- (UIColor)_titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)_imageTintColor
{
  return self->_imageTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->__presentingController);
  objc_destroyWeak((id *)&self->__visualRepresentation);
  objc_storeStrong((id *)&self->_weakDisplayPropertyObservers, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_classificationTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customContentViewController, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
}

@end
