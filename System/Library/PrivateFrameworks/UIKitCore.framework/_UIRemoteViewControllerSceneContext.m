@implementation _UIRemoteViewControllerSceneContext

+ (id)contextForWindow:(void *)a3 inScene:
{
  id v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (v5)
  {
    v7 = (objc_class *)v6;
    objc_msgSend(v5, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v5, "_enhancedWindowingEnabled");
    objc_msgSend(v4, "_systemReferenceAngle");
    v10 = v9;
    v28 = objc_msgSend(v4, "_systemReferenceAngleMode");
    objc_msgSend(v5, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v11, "isCaptured");

    objc_msgSend(v5, "keyboardSceneDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hardwareKeyboardExclusivityIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = [v7 alloc];
    v27 = v8;
    objc_msgSend(v8, "displayIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "referenceDisplayModeStatus");
    objc_msgSend(v5, "systemShellHostingEnvironment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "systemShellHostingSpaceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "renderingEnvironment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "systemDisplayIdentifier");
    v20 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    v23 = (void *)v13;
    v24 = (void *)objc_msgSend(v22, "initWithDisplayIdentity:screenReferenceDisplayModeStatus:enhancedWindowEnabled:systemReferenceAngle:systemReferenceAngleMode:isCapturingContentForAdditionalRenderingDestination:hardwareKeyboardExclusivityIdentifier:systemShellHostingSpaceIdentifier:systemDisplayIdentifier:", v15, v16, v29, v28, v26, v13, v10, v18, v21);

    v4 = v20;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (_UIRemoteViewControllerSceneContext)initWithDisplayIdentity:(id)a3 screenReferenceDisplayModeStatus:(int64_t)a4 enhancedWindowEnabled:(BOOL)a5 systemReferenceAngle:(double)a6 systemReferenceAngleMode:(unint64_t)a7 isCapturingContentForAdditionalRenderingDestination:(BOOL)a8 hardwareKeyboardExclusivityIdentifier:(id)a9 systemShellHostingSpaceIdentifier:(id)a10 systemDisplayIdentifier:(id)a11
{
  id v17;
  id v18;
  id v19;
  _UIRemoteViewControllerSceneContext *v20;
  _UIRemoteViewControllerSceneContext *v21;
  id v25;
  objc_super v26;

  v25 = a3;
  v17 = a9;
  v18 = a10;
  v19 = a11;
  v26.receiver = self;
  v26.super_class = (Class)_UIRemoteViewControllerSceneContext;
  v20 = -[_UIRemoteViewControllerSceneContext init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_displayIdentity, a3);
    v21->_screenReferenceDisplayModeStatus = a4;
    v21->_enhancedWindowingEnabled = a5;
    v21->_systemReferenceAngle = a6;
    v21->_systemReferenceAngleMode = a7;
    v21->_isCapturingContentForAdditionalRenderingDestination = a8;
    objc_storeStrong((id *)&v21->_hardwareKeyboardExclusivityIdentifier, a9);
    objc_storeStrong((id *)&v21->_systemShellHostingSpaceIdentifier, a10);
    objc_storeStrong((id *)&v21->_systemDisplayIdentifier, a11);
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  FBSDisplayIdentity *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (id *)v4;
    v6 = (FBSDisplayIdentity *)v5[4];
    if (v6 == self->_displayIdentity
      && v5[5] == (id)self->_screenReferenceDisplayModeStatus
      && self->_enhancedWindowingEnabled == *((unsigned __int8 *)v5 + 9)
      && *((double *)v5 + 6) == self->_systemReferenceAngle
      && v5[7] == (id)self->_systemReferenceAngleMode
      && self->_isCapturingContentForAdditionalRenderingDestination == objc_msgSend(v5, "isCapturingContentForAdditionalRenderingDestination"))
    {
      v7 = v5[8];
      if (BSEqualStrings())
      {
        objc_msgSend(v5, "systemShellHostingSpaceIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualStrings())
        {
          objc_msgSend(v5, "systemDisplayIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = BSEqualStrings();

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayIdentity, CFSTR("displayIdentity"));
  v5 = (id)objc_msgSend(v3, "ui_appendReferenceDisplayModeStatus:withName:", self->_screenReferenceDisplayModeStatus, CFSTR("screenReferenceDisplayModeStatus"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_enhancedWindowingEnabled, CFSTR("enhancedWindowingEnabled"));
  _UISStringForSystemReferenceAngleMode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("systemReferenceAngleMode"));

  v8 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("systemReferenceAngle"), self->_systemReferenceAngle);
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", self->_isCapturingContentForAdditionalRenderingDestination, CFSTR("isCapturingContentForAdditionalRenderingDestination"));
  objc_msgSend(v3, "appendString:withName:", self->_hardwareKeyboardExclusivityIdentifier, CFSTR("hardwareKeyboardExclusivityIdentifier"));
  objc_msgSend(v3, "appendString:withName:", self->_systemShellHostingSpaceIdentifier, CFSTR("systemShellHostingSpaceIdentifier"));
  objc_msgSend(v3, "appendString:withName:", self->_systemDisplayIdentifier, CFSTR("systemDisplayIdentifier"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIRemoteViewControllerSceneContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _UIRemoteViewControllerSceneContext *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UIRemoteViewControllerSceneContextDisplayIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_UIRemoteViewControllerSceneContextScreenReferenceDisplayModeStatus"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIRemoteViewControllerSceneContextEnhancedWindowingEnabled"));
  objc_msgSend(v4, "_ui_decodeCGFloatForKey:", CFSTR("_UIRemoteViewControllerSceneContextSystemReferenceAngle"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_UIRemoteViewControllerSceneContextSystemReferenceAngleMode"));
  v11 = objc_msgSend(v4, "_ui_decodeBoolForKey:defaultValue:", CFSTR("_UIRemoteViewControllerSceneContextIsCapturingContentForAdditionalRenderingDestination"), 0);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UIRemoteViewControllerSceneContextHardwareKeyboardExclusivityIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UIRemoteViewControllerSceneContextSystemShellHostingSpaceIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UIRemoteViewControllerSceneContextSystemDisplayIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_UIRemoteViewControllerSceneContext initWithDisplayIdentity:screenReferenceDisplayModeStatus:enhancedWindowEnabled:systemReferenceAngle:systemReferenceAngleMode:isCapturingContentForAdditionalRenderingDestination:hardwareKeyboardExclusivityIdentifier:systemShellHostingSpaceIdentifier:systemDisplayIdentifier:]([_UIRemoteViewControllerSceneContext alloc], "initWithDisplayIdentity:screenReferenceDisplayModeStatus:enhancedWindowEnabled:systemReferenceAngle:systemReferenceAngleMode:isCapturingContentForAdditionalRenderingDestination:hardwareKeyboardExclusivityIdentifier:systemShellHostingSpaceIdentifier:systemDisplayIdentifier:", v5, v6, v7, v10, v11, v12, v9, v13, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  FBSDisplayIdentity *displayIdentity;
  id v5;

  displayIdentity = self->_displayIdentity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayIdentity, CFSTR("_UIRemoteViewControllerSceneContextDisplayIdentity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_screenReferenceDisplayModeStatus, CFSTR("_UIRemoteViewControllerSceneContextScreenReferenceDisplayModeStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enhancedWindowingEnabled, CFSTR("_UIRemoteViewControllerSceneContextEnhancedWindowingEnabled"));
  objc_msgSend(v5, "_ui_encodeCGFloat:forKey:", CFSTR("_UIRemoteViewControllerSceneContextSystemReferenceAngle"), self->_systemReferenceAngle);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_systemReferenceAngleMode, CFSTR("_UIRemoteViewControllerSceneContextSystemReferenceAngleMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCapturingContentForAdditionalRenderingDestination, CFSTR("_UIRemoteViewControllerSceneContextIsCapturingContentForAdditionalRenderingDestination"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareKeyboardExclusivityIdentifier, CFSTR("_UIRemoteViewControllerSceneContextHardwareKeyboardExclusivityIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemShellHostingSpaceIdentifier, CFSTR("_UIRemoteViewControllerSceneContextSystemShellHostingSpaceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemDisplayIdentifier, CFSTR("_UIRemoteViewControllerSceneContextSystemDisplayIdentifier"));

}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  return self->_isCapturingContentForAdditionalRenderingDestination;
}

- (NSString)systemShellHostingSpaceIdentifier
{
  return self->_systemShellHostingSpaceIdentifier;
}

- (NSString)systemDisplayIdentifier
{
  return self->_systemDisplayIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareKeyboardExclusivityIdentifier, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_systemDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_systemShellHostingSpaceIdentifier, 0);
}

@end
