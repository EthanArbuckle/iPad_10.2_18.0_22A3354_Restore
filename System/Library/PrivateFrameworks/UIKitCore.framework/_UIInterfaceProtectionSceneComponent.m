@implementation _UIInterfaceProtectionSceneComponent

- (_UIInterfaceProtectionSceneComponent)initWithScene:(id)a3
{
  id v4;
  _UIInterfaceProtectionSceneComponent *v5;
  UISceneSystemProtectionManager *v6;
  UISceneSystemProtectionManager *protectionManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIInterfaceProtectionSceneComponent;
  v5 = -[_UIInterfaceProtectionSceneComponent init](&v9, sel_init);
  if (v5)
  {
    v6 = (UISceneSystemProtectionManager *)-[UISceneSystemProtectionManager _init]([UISceneSystemProtectionManager alloc]);
    protectionManager = v5->_protectionManager;
    v5->_protectionManager = v6;

    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v5;
}

- (uint64_t)underAppProtection
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "isUserAuthenticationEnabled");
  return result;
}

- (void)setUnderAppProtection:(uint64_t)a1
{
  char v2;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if (a1)
  {
    v2 = a2;
    if (objc_msgSend(*(id *)(a1 + 16), "isUserAuthenticationEnabled") != a2)
    {
      v4 = *(_QWORD *)(a1 + 16);
      if (v4)
        *(_BYTE *)(v4 + 8) = v2;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("UISceneSystemProtectionDidChangeNotification"), WeakRetained);

    }
  }
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_invalidateTraitOverrides
{
  void *v2;
  id WeakRetained;

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(WeakRetained, "_componentDidUpdateTraitOverrides:", a1);

  }
}

- (UITraitCollection)_traitOverrides
{
  UITraitCollection *traitOverrides;
  UITraitCollection *v4;
  UITraitCollection *v5;

  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    +[UITraitCollection _traitCollectionWithInterfaceProtectionState:](UITraitCollection, "_traitCollectionWithInterfaceProtectionState:", -[UISceneSystemProtectionManager isUserAuthenticationEnabled](self->_protectionManager, "isUserAuthenticationEnabled"));
    v4 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_protectionManager, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
}

@end
