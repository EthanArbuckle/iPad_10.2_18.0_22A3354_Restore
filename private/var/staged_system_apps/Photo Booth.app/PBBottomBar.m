@implementation PBBottomBar

- (void)_commonPBBottomBarInitialization
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[PBBottomBar setBarStyle:](self, "setBarStyle:", 1);
  -[PBBottomBar _setHidesShadow:](self, "_setHidesShadow:", 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(objc_msgSend(-[PBBottomBar subviews](self, "subviews", 0), "firstObject"), "subviews");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_class(_UIBackdropView, v5);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          v7 = v10;
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "setGroupName:", CFSTR("PBBottomBarBackdropViewGroup"));
}

- (PBBottomBar)initWithFrame:(CGRect)a3
{
  PBBottomBar *v3;
  PBBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBBottomBar;
  v3 = -[PBBottomBar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PBBottomBar _commonPBBottomBarInitialization](v3, "_commonPBBottomBarInitialization");
  return v4;
}

- (PBBottomBar)initWithCoder:(id)a3
{
  PBBottomBar *v3;
  PBBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBBottomBar;
  v3 = -[PBBottomBar initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[PBBottomBar _commonPBBottomBarInitialization](v3, "_commonPBBottomBarInitialization");
  return v4;
}

+ (double)defaultHeightForBottomBar
{
  return 77.0;
}

- (NSString)backdropViewGroupName
{
  return (NSString *)CFSTR("PBBottomBarBackdropViewGroup");
}

@end
