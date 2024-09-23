@implementation UISSceneRequestOptions

- (NSSet)actions
{
  return self->_actions;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UISSceneRequestOptions;
  v4 = a3;
  -[FBSWorkspaceSceneRequestOptions encodeWithBSXPCCoder:](&v10, sel_encodeWithBSXPCCoder_, v4);
  -[FBSWorkspaceSceneRequestOptions identifier](self, "identifier", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[UISSceneRequestOptions sourceIdentifier](self, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceIdentifier"));

  -[UISSceneRequestOptions interactionIdentifier](self, "interactionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("interactionIdentifier"));

  -[UISSceneRequestOptions actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v8, CFSTR("actions"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[UISSceneRequestOptions sceneRequestIntent](self, "sceneRequestIntent"), CFSTR("sceneRequestIntent"));
  -[UISSceneRequestOptions scenePlacementConfiguration](self, "scenePlacementConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("placementConfiguration"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestFullscreen](self, "requestFullscreen"), CFSTR("requestFullscreen"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestBackground](self, "requestBackground"), CFSTR("requestBackground"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestCenterSlot](self, "requestCenterSlot"), CFSTR("requestCenterSlot"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions preserveLayout](self, "preserveLayout"), CFSTR("preserveLayout"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneRequestOptions requestQuickLookScene](self, "requestQuickLookScene"), CFSTR("requestQuickLookScene"));

}

- (UISSceneRequestOptions)initWithBSXPCCoder:(id)a3
{
  id v4;
  UISSceneRequestOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISSceneRequestOptions;
  v5 = -[FBSWorkspaceSceneRequestOptions initWithBSXPCCoder:](&v13, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSWorkspaceSceneRequestOptions setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("sourceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISSceneRequestOptions setSourceIdentifier:](v5, "setSourceIdentifier:", v7);

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("interactionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISSceneRequestOptions setInteractionIdentifier:](v5, "setInteractionIdentifier:", v8);

    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("actions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISSceneRequestOptions setActions:](v5, "setActions:", v10);

    -[UISSceneRequestOptions setSceneRequestIntent:](v5, "setSceneRequestIntent:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sceneRequestIntent")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placementConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISSceneRequestOptions setScenePlacementConfiguration:](v5, "setScenePlacementConfiguration:", v11);

    -[UISSceneRequestOptions setRequestFullscreen:](v5, "setRequestFullscreen:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestFullscreen")));
    -[UISSceneRequestOptions setRequestBackground:](v5, "setRequestBackground:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestBackground")));
    -[UISSceneRequestOptions setRequestCenterSlot:](v5, "setRequestCenterSlot:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestCenterSlot")));
    -[UISSceneRequestOptions setPreserveLayout:](v5, "setPreserveLayout:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preserveLayout")));
    -[UISSceneRequestOptions setRequestQuickLookScene:](v5, "setRequestQuickLookScene:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestQuickLookScene")));
  }

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISSceneRequestOptions;
  if (-[UISSceneRequestOptions isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)requestFullscreen
{
  return self->_requestFullscreen;
}

- (void)setRequestFullscreen:(BOOL)a3
{
  self->_requestFullscreen = a3;
}

- (BOOL)requestBackground
{
  return self->_requestBackground;
}

- (void)setRequestBackground:(BOOL)a3
{
  self->_requestBackground = a3;
}

- (BOOL)preserveLayout
{
  return self->_preserveLayout;
}

- (void)setPreserveLayout:(BOOL)a3
{
  self->_preserveLayout = a3;
}

- (int64_t)sceneRequestIntent
{
  return self->_sceneRequestIntent;
}

- (void)setSceneRequestIntent:(int64_t)a3
{
  self->_sceneRequestIntent = a3;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setInteractionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)requestQuickLookScene
{
  return self->_requestQuickLookScene;
}

- (void)setRequestQuickLookScene:(BOOL)a3
{
  self->_requestQuickLookScene = a3;
}

- (UISScenePlacementConfiguration)scenePlacementConfiguration
{
  return self->_scenePlacementConfiguration;
}

- (void)setScenePlacementConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_scenePlacementConfiguration, a3);
}

- (BOOL)requestCenterSlot
{
  return self->_requestCenterSlot;
}

- (void)setRequestCenterSlot:(BOOL)a3
{
  self->_requestCenterSlot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePlacementConfiguration, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end
