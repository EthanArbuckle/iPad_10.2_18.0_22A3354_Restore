@implementation _UISceneHostingIntelligenceSupportActionToClient

+ (id)actionForCollectRemoteContentInVisibleRect:(CGRect)a3 withRemoteContextWrapper:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (objc_class *)MEMORY[0x1E0D017D0];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setObject:forSetting:", &unk_1E1A9A818, 0);
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forSetting:", v12, 1);

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forSetting:", v13, 2);
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v11, 0);

  return v14;
}

- (void)executeActionForWindowHostingScene:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  CGRect v22;

  v21 = a3;
  -[_UISceneHostingIntelligenceSupportActionToClient info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = v21;
  if (!v6)
  {
    -[_UISceneHostingIntelligenceSupportActionToClient info](self, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForSetting:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_CGRectValue");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[_UISceneHostingIntelligenceSupportActionToClient info](self, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForSetting:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", +[_UIApplicationIntelligenceSupport remoteContextWrapperClass](_UIApplicationIntelligenceSupport, "remoteContextWrapperClass"), v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22.origin.x = v11;
      v22.origin.y = v13;
      v22.size.width = v15;
      v22.size.height = v17;
      if (!CGRectIsNull(v22) && v20)
        +[_UIApplicationIntelligenceSupport collectRemoteContentForWindowHostingScene:inVisibleRect:withRemoteContextWrapper:](_UIApplicationIntelligenceSupport, "collectRemoteContentForWindowHostingScene:inVisibleRect:withRemoteContextWrapper:", v21, v20, v11, v13, v15, v17);

    }
    v7 = v21;
  }

}

@end
