@implementation SBSAppDragLocalContext

- (SBSAppDragLocalContext)initWithUniqueIdentifier:(id)a3 withLaunchActions:(id)a4 startLocation:(int64_t)a5
{
  id v8;
  id v9;
  SBSAppDragLocalContext *v10;
  uint64_t v11;
  NSString *uniqueIdentifier;
  uint64_t v13;
  NSSet *launchActions;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBSAppDragLocalContext;
  v10 = -[SBSAppDragLocalContext init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    launchActions = v10->_launchActions;
    v10->_launchActions = (NSSet *)v13;

    v10->_startLocation = a5;
  }

  return v10;
}

- (id)description
{
  return -[SBSAppDragLocalContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (void)setGridSizeClass:(id)a3
{
  __CFString *v4;
  id v5;
  __CFString *v6;
  NSString *v7;
  NSString *gridSizeClass;

  if (a3 && (unint64_t)a3 <= 5)
  {
    v4 = off_1E2890000[(_QWORD)a3 - 1];
    v5 = a3;
    v6 = v4;
  }
  else
  {
    v6 = (__CFString *)a3;
  }
  v7 = (NSString *)-[__CFString copy](v6, "copy");
  gridSizeClass = self->_gridSizeClass;
  self->_gridSizeClass = v7;

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSAppDragLocalContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_containedIconIdentifiers, CFSTR("containedIconIdentifiers"), 1);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_launchActions, CFSTR("launchActions"), 1);
  v9 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_startLocation, CFSTR("startLocation"));
  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_launchActions, CFSTR("launchActions"), 1);
  v11 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_launchURL, CFSTR("launchURL"), 1);
  v12 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_draggedSceneIdentifier, CFSTR("draggedSceneIdentifier"), 1);
  v13 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_portaledPreview, CFSTR("portaledPreview"), 1);
  v14 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_cancelsViaScaleAndFade, CFSTR("cancelsViaScaleAndFade"), 1);
  v15 = (id)objc_msgSend(v4, "appendBool:withName:", self->_sourceLocal, CFSTR("sourceLocal"));
  v16 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_droppedIconIdentifier, CFSTR("droppedIconIdentifier"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSAppDragLocalContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (int64_t)startLocation
{
  return self->_startLocation;
}

- (NSSet)containedIconIdentifiers
{
  return self->_containedIconIdentifiers;
}

- (void)setContainedIconIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)activeCustomIconDataSourceUniqueIdentifier
{
  return self->_activeCustomIconDataSourceUniqueIdentifier;
}

- (void)setActiveCustomIconDataSourceUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)customIconDataSourceConfigurations
{
  return self->_customIconDataSourceConfigurations;
}

- (void)setCustomIconDataSourceConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (NSString)draggedSceneIdentifier
{
  return self->_draggedSceneIdentifier;
}

- (void)setDraggedSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (UIView)portaledPreview
{
  return self->_portaledPreview;
}

- (void)setPortaledPreview:(id)a3
{
  objc_storeStrong((id *)&self->_portaledPreview, a3);
}

- (BOOL)cancelsViaScaleAndFade
{
  return self->_cancelsViaScaleAndFade;
}

- (void)setCancelsViaScaleAndFade:(BOOL)a3
{
  self->_cancelsViaScaleAndFade = a3;
}

- (BOOL)isSourceLocal
{
  return self->_sourceLocal;
}

- (void)setSourceLocal:(BOOL)a3
{
  self->_sourceLocal = a3;
}

- (NSString)droppedIconIdentifier
{
  return self->_droppedIconIdentifier;
}

- (void)setDroppedIconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedIconIdentifier, 0);
  objc_storeStrong((id *)&self->_portaledPreview, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_customIconDataSourceConfigurations, 0);
  objc_storeStrong((id *)&self->_activeCustomIconDataSourceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_containedIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
