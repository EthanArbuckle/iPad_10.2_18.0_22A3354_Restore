@implementation PUAirPlayScreen

- (PUAirPlayScreen)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAirPlayScreen.m"), 35, CFSTR("%s is not available as initializer"), "-[PUAirPlayScreen init]");

  abort();
}

- (PUAirPlayScreen)initWithScreen:(id)a3
{
  id v5;
  PUAirPlayScreen *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PUAirPlayScreen;
  v6 = -[PUAirPlayScreen init](&v16, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PUAirPlayScreen.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("screen"));

    }
    -[PUAirPlayScreen _setScreen:](v6, "_setScreen:", v5);
    objc_msgSend(v5, "_displayID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAirPlayScreen _setIdentifier:](v6, "_setIdentifier:", v7);

    objc_msgSend(v5, "bounds");
    -[PUAirPlayScreen _setSize:](v6, "_setSize:", v8, v9);
    -[PUAirPlayScreen screen](v6, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mirroredScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = 2;
    else
      v12 = 1;
    -[PUAirPlayScreen _setType:](v6, "_setType:", v12);
    +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addKeyObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWindow setHidden:](self->__window, "setHidden:", 1);
  -[UIWindow setRootViewController:](self->__window, "setRootViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUAirPlayScreen;
  -[PUAirPlayScreen dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUAirPlayScreen identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PUAirPlayScreen isEqualToAirPlayScreen:](self, "isEqualToAirPlayScreen:", v4);

  return v5;
}

- (BOOL)isEqualToAirPlayScreen:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen screen](self, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (unint64_t)placeholderType
{
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v2 = -[PUAirPlayScreen type](self, "type");
  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 2)
    v5 = objc_msgSend(v3, "placeholderForMirroredScreen");
  else
    v5 = objc_msgSend(v3, "placeholderForSecondScreen");
  v6 = v5;

  return v6;
}

- (void)setRootViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->_rootViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_rootViewController, a3);
    -[PUAirPlayScreen _updateWindow](self, "_updateWindow");
    v5 = v6;
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  CGSize v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen _typeName](self, "_typeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen size](self, "size");
  NSStringFromCGSize(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen rootViewController](self, "rootViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("nil");
  if (v8)
    v10 = (const __CFString *)v8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type = %@; size = %@; rootViewController = %@>"),
    v5,
    self,
    v6,
    v7,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  objc_super v24;
  CGSize v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)PUAirPlayScreen;
  -[PUAirPlayScreen description](&v24, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PUAirPlayScreen _typeName](self, "_typeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tType: %@"), v5);

  -[PUAirPlayScreen size](self, "size");
  NSStringFromCGSize(v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tSize: %@"), v6);

  -[PUAirPlayScreen rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tRoot: %@"), v7);

  -[PUAirPlayScreen screen](self, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pl_briefDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tBacking screen: %@"), v9);

  -[PUAirPlayScreen _window](self, "_window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pl_briefDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tWindow: %@"), v11);

  -[PUAirPlayScreen _window](self, "_window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  NSStringFromCGRect(v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\tFrame: %@"), v13);

  -[PUAirPlayScreen _window](self, "_window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isHidden"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\tHidden: %@"), v15);

  -[PUAirPlayScreen _window](self, "_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pl_briefDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\tScreen: %@"), v18);

  -[PUAirPlayScreen screen](self, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen _window](self, "_window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "screen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 == v21)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tBacking and window screens match: %@"), v22);

  return (NSString *)v4;
}

- (NSString)_typeName
{
  unint64_t v2;

  v2 = -[PUAirPlayScreen type](self, "type");
  if (v2 > 2)
    return 0;
  else
    return &off_1E589BC08[v2]->isa;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PUAirPlayScreen screen](self, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUAirPlayScreen _associatedWindowScene](self, "_associatedWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_associatedWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUAirPlayScreen screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connectedScenes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            objc_msgSend(v10, "screen");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11 == v2)
              goto LABEL_13;

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    v10 = 0;
LABEL_13:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateWindow
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];

  PLAirPlayGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Updating PUAirPlayScreen", buf, 2u);
  }

  -[PUAirPlayScreen screen](self, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen _associatedWindowScene](self, "_associatedWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen _window](self, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAirPlayScreen rootViewController](self, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverscanCompensation:", 2);
  objc_msgSend(v4, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "compensateForOverscan");

  if (v17)
  {
    objc_msgSend(v4, "overscanCompensationInsets");
    v9 = v9 + v18;
    v11 = v11 + v19;
    v13 = v13 - (v18 + v20);
    v15 = v15 - (v19 + v21);
  }
  if (!v4 || !v5)
  {
    PLAirPlayGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEFAULT, "\tUnderlying UIScreen is missing; discarding window and removing any content",
        v35,
        2u);
    }

    -[PUAirPlayScreen _setWindow:](self, "_setWindow:", 0);
    v7 = 0;
    goto LABEL_17;
  }
  if (!v6 && v7)
  {
    PLAirPlayGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEFAULT, "\tAirPlay screen has content but no window; creating one",
        v34,
        2u);
    }

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v5);
    -[PUAirPlayScreen _setWindow:](self, "_setWindow:", v6);
    goto LABEL_12;
  }
  if (!v6 || v7)
  {
    if (v6 && v7)
    {
      objc_msgSend(v6, "rootViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 != v7)
      {
        PLAirPlayGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1AAB61000, v31, OS_LOG_TYPE_DEFAULT, "\tLoading new root controller in existing window", v32, 2u);
        }

      }
    }
    else if (!v7)
    {
LABEL_17:
      v28 = 0;
      goto LABEL_18;
    }
LABEL_12:
    objc_msgSend(v6, "rootViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 != v7)
    {
      v24 = *MEMORY[0x1E0C9D538];
      v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v7, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFrame:", v24, v25, v13, v15);

    }
    goto LABEL_17;
  }
  PLAirPlayGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1AAB61000, v29, OS_LOG_TYPE_DEFAULT, "\tAirPlay screen has a window but no content; removing window from the UIScreen",
      v33,
      2u);
  }

  -[PUAirPlayScreen _setWindow:](self, "_setWindow:", 0);
  v7 = 0;
  v28 = 1;
LABEL_18:
  objc_msgSend(v6, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v6, "setRootViewController:", v7);
  objc_msgSend(v6, "setHidden:", v28);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  int v11;
  void *v12;

  v7 = a4;
  v8 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAirPlayScreen.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[settings isKindOfClass:[PUAirPlaySettings class]]"));

  }
  NSStringFromSelector(sel_compensateForOverscan);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
    -[PUAirPlayScreen _updateWindow](self, "_updateWindow");
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)_setScreen:(id)a3
{
  objc_storeStrong((id *)&self->_screen, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)_setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (UIWindow)_window
{
  return self->__window;
}

- (void)_setWindow:(id)a3
{
  objc_storeStrong((id *)&self->__window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__window, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

+ (PUAirPlayScreen)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAirPlayScreen.m"), 39, CFSTR("%s is not available as initializer"), "+[PUAirPlayScreen new]");

  abort();
}

@end
