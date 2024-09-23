@implementation UIMenuSystem

+ (UIMenuSystem)mainSystem
{
  return (UIMenuSystem *)+[_UIMainMenuSystem _sharedSystem](_UIMainMenuSystem, "_sharedSystem");
}

- (UIMenuSystem)initWithRootMenuChildren:(id)a3
{
  id v4;
  UIMenuSystem *v5;
  void *v6;
  _UIMenuBuilder *v7;
  _UIMenuBuilder *defaultBuilder;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIMenuSystem;
  v5 = -[UIMenuSystem init](&v10, sel_init);
  if (v5)
  {
    +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.root"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UIMenuBuilder initWithRootMenu:]([_UIMenuBuilder alloc], "initWithRootMenu:", v6);
    defaultBuilder = v5->_defaultBuilder;
    v5->_defaultBuilder = v7;

    -[_UIMenuBuilder setSystem:](v5->_defaultBuilder, "setSystem:", v5);
  }

  return v5;
}

- (void)setNeedsRevalidate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D8], "defaultQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("_UIMenuSystemShouldRevalidateNotification"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueNotification:postingStyle:coalesceMask:forModes:", v4, 2, 3, v5);

}

- (void)setNeedsRebuild
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D8], "defaultQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("_UIMenuSystemShouldRebuildNotification"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueNotification:postingStyle:coalesceMask:forModes:", v3, 1, 3, 0);

}

+ (UIMenuSystem)contextSystem
{
  return (UIMenuSystem *)+[_UIContextMenuSystem _sharedSystem](_UIContextMenuSystem, "_sharedSystem");
}

- (id)_newBuilderFromResponderChain:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y;
  double x;
  _UIMenuBuilder *defaultBuilder;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  y = a4.y;
  x = a4.x;
  defaultBuilder = self->_defaultBuilder;
  v10 = a5;
  v11 = a3;
  v12 = (void *)-[_UIMenuBuilder copy](defaultBuilder, "copy");
  -[UIMenuSystem _buildMenuWithBuilder:fromResponderChain:atLocation:inCoordinateSpace:](self, "_buildMenuWithBuilder:fromResponderChain:atLocation:inCoordinateSpace:", v12, v11, v10, x, y);

  objc_msgSend(v12, "menuForIdentifier:", CFSTR("com.apple.menu.root"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_immutableCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "replaceMenuForIdentifier:withMenu:", CFSTR("com.apple.menu.root"), v14);

  return v12;
}

- (BOOL)_buildMenuWithBuilder:(id)a3 fromResponderChain:(id)a4 atLocation:(CGPoint)a5 inCoordinateSpace:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  v11 = v9;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    while (1)
    {
      v14 = objc_msgSend(v8, "_changeCount");
      objc_msgSend(v13, "buildMenuWithBuilder:", v8);
      if (objc_msgSend(v8, "_changeCount") > v14)
        break;
      objc_msgSend(v13, "nextResponder");
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
      if (!v15)
        goto LABEL_8;
    }

    LOBYTE(v13) = 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }
LABEL_8:

  return (char)v13;
}

- (void)_setInitialBuildingResponder:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuSystem.m"), 86, CFSTR("_setInitialBuildingResponder should only be called on the main menu system."));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBuilder, 0);
}

@end
