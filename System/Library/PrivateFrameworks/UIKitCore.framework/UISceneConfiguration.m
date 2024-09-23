@implementation UISceneConfiguration

- (id)_initWithConfiguration:(id)a3
{
  id *v4;
  UISceneConfiguration *v5;
  UISceneConfiguration *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)UISceneConfiguration;
  v5 = -[UISceneConfiguration init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_name, v4[2]);
    v6->_hadResolutionErrorsOnLoad = 0;
    objc_storeStrong((id *)&v6->_role, v4[3]);
    v6->_sceneClass = (Class)v4[4];
    v6->_delegateClass = (Class)v4[5];
    objc_storeStrong((id *)&v6->_storyboard, v4[6]);
    v6->_isDefault = *((_BYTE *)v4 + 9);
    v6->_fromPlist = *((_BYTE *)v4 + 10);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UISceneConfiguration _initWithConfiguration:](+[UISceneConfiguration allocWithZone:](UISceneConfiguration, "allocWithZone:", a3), "_initWithConfiguration:", self);
}

- (UIStoryboard)storyboard
{
  return self->_storyboard;
}

- (Class)sceneClass
{
  return self->_sceneClass;
}

- (void)setDelegateClass:(Class)delegateClass
{
  NSString *name;
  UISceneConfiguration *v6;

  if (self->_delegateClass != delegateClass)
  {
    name = self->_name;
    self->_name = 0;
    v6 = self;

    *(_WORD *)&v6->_isDefault = 0;
    self->_delegateClass = delegateClass;
  }
}

- (void)setStoryboard:(UIStoryboard *)storyboard
{
  UIStoryboard **p_storyboard;
  NSString *name;
  UISceneConfiguration *v7;
  UIStoryboard *v8;

  p_storyboard = &self->_storyboard;
  v8 = storyboard;
  if ((-[UIStoryboard isEqual:](v8, "isEqual:", *p_storyboard) & 1) == 0)
  {
    name = self->_name;
    self->_name = 0;
    v7 = self;

    *(_WORD *)&v7->_isDefault = 0;
    objc_storeStrong((id *)p_storyboard, storyboard);
  }

}

- (void)setSceneClass:(Class)sceneClass
{
  NSString *name;
  UISceneConfiguration *v6;

  if (self->_sceneClass != sceneClass)
  {
    name = self->_name;
    self->_name = 0;
    v6 = self;

    *(_WORD *)&v6->_isDefault = 0;
    self->_sceneClass = sceneClass;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)_fromPlist
{
  return self->_fromPlist;
}

- (BOOL)_isDefault
{
  return self->_isDefault;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UISceneConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_name, CFSTR("name"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  char has_internal_diagnostics;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  UISceneConfiguration *v13;
  char v14;

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v4);

  objc_msgSend(v6, "appendString:withName:", self->_name, CFSTR("name"));
  objc_msgSend(v6, "appendString:withName:", self->_role, CFSTR("role"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E16B4008;
  v7 = v6;
  v14 = has_internal_diagnostics;
  v12 = v7;
  v13 = self;
  v8 = (id)objc_msgSend(v7, "modifyBody:", v11);
  v9 = v7;

  return v9;
}

- (Class)delegateClass
{
  return self->_delegateClass;
}

- (BOOL)_hadResolutionErrorsOnLoad
{
  return self->_hadResolutionErrorsOnLoad;
}

- (UISceneSessionRole)role
{
  return self->_role;
}

- (BOOL)isEqual:(id)a3
{
  UISceneConfiguration *v4;
  void *v5;
  unint64_t v6;
  NSString *role;
  NSString *name;
  Class sceneClass;
  Class delegateClass;
  UIStoryboard *storyboard;
  char v12;

  v4 = (UISceneConfiguration *)a3;
  if (v4 == self)
    goto LABEL_20;
  v5 = (void *)objc_opt_class();
  if (!objc_msgSend(v5, "isEqual:", objc_opt_class()))
    goto LABEL_19;
  v6 = -[UISceneConfiguration hash](self, "hash");
  if (v6 != -[UISceneConfiguration hash](v4, "hash"))
    goto LABEL_19;
  role = self->_role;
  if (role != v4->_role && (!role || !-[NSString isEqualToString:](role, "isEqualToString:")))
    goto LABEL_19;
  name = self->_name;
  if (name != v4->_name && (!name || !-[NSString isEqualToString:](name, "isEqualToString:")))
    goto LABEL_19;
  sceneClass = self->_sceneClass;
  if (sceneClass != v4->_sceneClass && (!sceneClass || !-[objc_class isEqual:](sceneClass, "isEqual:")))
    goto LABEL_19;
  delegateClass = self->_delegateClass;
  if (delegateClass != v4->_delegateClass
    && (!delegateClass || !-[objc_class isEqual:](delegateClass, "isEqual:")))
  {
    goto LABEL_19;
  }
  storyboard = self->_storyboard;
  if (storyboard == v4->_storyboard)
  {
LABEL_20:
    v12 = 1;
    goto LABEL_21;
  }
  if (!storyboard)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_21;
  }
  v12 = -[UIStoryboard isEqual:](storyboard, "isEqual:");
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  NSString *role;
  unint64_t v4;
  NSString *name;
  Class sceneClass;
  Class delegateClass;
  UIStoryboard *storyboard;

  role = self->_role;
  if (role)
    v4 = -[NSString hash](role, "hash") + 113569;
  else
    v4 = 337;
  name = self->_name;
  if (name)
    v4 = -[NSString hash](name, "hash") + 337 * v4;
  sceneClass = self->_sceneClass;
  if (sceneClass)
    v4 = -[objc_class hash](sceneClass, "hash") + 337 * v4;
  delegateClass = self->_delegateClass;
  if (delegateClass)
    v4 = -[objc_class hash](delegateClass, "hash") + 337 * v4;
  storyboard = self->_storyboard;
  if (storyboard)
    return -[UIStoryboard hash](storyboard, "hash") + 337 * v4;
  return v4;
}

- (UISceneConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  UISceneConfiguration *v12;
  UISceneConfiguration *v13;
  void *v14;
  NSString *v15;
  Class v16;
  Class v17;
  unint64_t v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  char v22;
  unint64_t v23;
  void *v24;
  NSString *v25;
  Class v26;
  Class v27;
  unint64_t v28;
  NSObject *v29;
  const char *v30;
  unint64_t v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  UIStoryboard *storyboard;
  UISceneConfiguration *v42;
  objc_class *v44;
  NSString *v45;
  _BYTE buf[24];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("_UISceneConfigurationName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("_UISceneConfigurationSessionRole"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = CFSTR("UISceneSessionRoleNone");
  v11 = v10;

  if (!v6)
  {
    v13 = -[UISceneConfiguration initWithName:sessionRole:](self, "initWithName:sessionRole:", 0, v11);
    v12 = v13;
    if (!v13)
      goto LABEL_46;
    if (v11 == CFSTR("UISceneSessionRoleNone"))
      v13->_hadResolutionErrorsOnLoad = 1;
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("_UISceneConfigurationSceneClassName"));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();

    v16 = NSClassFromString(v15);
    v17 = v16;
    if (!v15 || v16)
    {
      if (v15)
      {
        objc_opt_self();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[objc_class isSubclassOfClass:](v17, "isSubclassOfClass:", v21);

        if ((v22 & 1) == 0)
        {
          v12->_hadResolutionErrorsOnLoad = 1;
          v23 = qword_1ECD7CD00;
          if (!qword_1ECD7CD00)
          {
            v23 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v23, (unint64_t *)&qword_1ECD7CD00);
          }
          v19 = *(NSObject **)(v23 + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            v20 = "Encoded configuration for %@ contained a UIScene class named \"%@\", but it was not actually a subclass of UIScene!";
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      v12->_hadResolutionErrorsOnLoad = 1;
      v18 = qword_1ECD7CCF8;
      if (!qword_1ECD7CCF8)
      {
        v18 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD7CCF8);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        v20 = "Encoded configuration for %@ contained a UIScene class named \"%@\", but no class with that name could be found.";
LABEL_21:
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
      }
    }
    objc_opt_self();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, CFSTR("_UISceneConfigurationDelegateClassName"));
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();

    v26 = NSClassFromString(v25);
    v27 = v26;
    if (!v25 || v26)
    {
      if (v25 && (-[objc_class conformsToProtocol:](v26, "conformsToProtocol:", &unk_1EE09E738) & 1) == 0)
      {
        v12->_hadResolutionErrorsOnLoad = 1;
        v31 = qword_1ECD7CD10;
        if (!qword_1ECD7CD10)
        {
          v31 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v31, (unint64_t *)&qword_1ECD7CD10);
        }
        v29 = *(NSObject **)(v31 + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v15;
          v30 = "Encoded configuration for %@ contained a UISceneDelegate class named \"%@\", but it does not actually co"
                "nform to the UISceneDelegate protocol!";
          goto LABEL_34;
        }
      }
    }
    else
    {
      v12->_hadResolutionErrorsOnLoad = 1;
      v28 = qword_1ECD7CD08;
      if (!qword_1ECD7CD08)
      {
        v28 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&qword_1ECD7CD08);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        v30 = "Encoded configuration for %@ contained a UISceneDelegate class named \"%@\", but no class with that name could be found.";
LABEL_34:
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x16u);
      }
    }
    v44 = v27;
    v45 = v15;
    v32 = v17;
    objc_opt_self();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, CFSTR("_UISceneConfigurationStoryboardName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v35, CFSTR("_UISceneConfigurationStoryboardBundleID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      if (v36)
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v36);
      else
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v34, v37, v44, v45, *(_OWORD *)buf, *(_QWORD *)&buf[16]);
      v38 = objc_claimAutoreleasedReturnValue();

      if (v38)
        goto LABEL_45;
      v12->_hadResolutionErrorsOnLoad = 1;
      v39 = qword_1ECD7CD18;
      if (!qword_1ECD7CD18)
      {
        v39 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v39, (unint64_t *)&qword_1ECD7CD18);
      }
      v40 = *(NSObject **)(v39 + 8);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        v47 = v36;
        _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_ERROR, "Encoded configuration for %@ contained a storyboard named \"%@\" from bundle \"%@\", but the storyboard could not be found.", buf, 0x20u);
      }
    }
    v38 = 0;
LABEL_45:
    v12->_sceneClass = v32;
    v12->_delegateClass = v44;
    storyboard = v12->_storyboard;
    v12->_storyboard = (UIStoryboard *)v38;

    goto LABEL_46;
  }
  v12 = -[UISceneConfiguration initWithName:sessionRole:](self, "initWithName:sessionRole:", v6, v11);
LABEL_46:
  v42 = v12;

  return v42;
}

+ (UISceneConfiguration)configurationWithName:(NSString *)name sessionRole:(UISceneSessionRole)sessionRole
{
  NSString *v6;
  NSString *v7;
  void *v8;

  v6 = sessionRole;
  v7 = name;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:sessionRole:", v7, v6);

  return (UISceneConfiguration *)v8;
}

- (UISceneConfiguration)initWithName:(NSString *)name sessionRole:(UISceneSessionRole)sessionRole
{
  NSString *v6;
  NSString *v7;
  UISceneConfiguration *v8;
  UISceneConfiguration *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  NSString *role;
  char v27;
  void *v28;
  uint64_t v29;
  NSString *v30;
  NSString *v31;
  Class v32;
  Class v33;
  unint64_t v34;
  NSObject *v35;
  const __CFString *v36;
  const char *v37;
  void *v38;
  char v39;
  unint64_t v40;
  const __CFString *v41;
  NSString *v42;
  Class v43;
  unint64_t v44;
  NSObject *v45;
  const __CFString *v46;
  const char *v47;
  unint64_t v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  NSString *v52;
  NSString *v53;
  void *v54;
  void *v55;
  NSString *v56;
  void *v57;
  uint64_t v58;
  UIStoryboard *v59;
  unint64_t v60;
  NSObject *v61;
  const __CFString *v62;
  UIStoryboard *v63;
  unint64_t v65;
  NSObject *v66;
  void *v67;
  NSString *v68;
  NSString *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  UIStoryboard *storyboard;
  NSString *v74;
  void *v75;
  _QWORD v76[5];
  _QWORD v77[4];
  NSString *v78;
  objc_super v79;
  uint8_t buf[4];
  const __CFString *v81;
  __int16 v82;
  NSString *v83;
  __int16 v84;
  NSString *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = name;
  v7 = sessionRole;
  v79.receiver = self;
  v79.super_class = (Class)UISceneConfiguration;
  v8 = -[UISceneConfiguration init](&v79, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_role, sessionRole);
    *(_WORD *)&v9->_isDefault = 0;
    objc_msgSend((id)UIApp, "_infoPlistSceneConfigurations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)UIApp, "_infoPlistCanvasDefinitions");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v10)
    {
      if (v11)
      {
        v22 = _UICanvasCanvasSystemTypeFromFrameType(v7);
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __49__UISceneConfiguration_initWithName_sessionRole___block_invoke_102;
        v76[3] = &__block_descriptor_40_e29_B32__0__NSDictionary_8Q16_B24l;
        v76[4] = v22;
        v23 = objc_msgSend(v12, "indexOfObjectPassingTest:", v76);
        v24 = v9->_name;
        v9->_name = 0;

        _UICanvasFrameSystemTypeFromCanvasType(v22);
        v25 = objc_claimAutoreleasedReturnValue();
        role = v9->_role;
        v9->_role = (NSString *)v25;

        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v9->_hadResolutionErrorsOnLoad = v6 != 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v23);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("UICanvasClassName"));
          v68 = (NSString *)objc_claimAutoreleasedReturnValue();
          v9->_sceneClass = NSClassFromString(v68);

          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("UICanvasDelegateClassName"));
          v69 = (NSString *)objc_claimAutoreleasedReturnValue();
          v9->_delegateClass = NSClassFromString(v69);

          objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("UIMainStoryboardFile"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (v70)
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v70, v71);
            v72 = objc_claimAutoreleasedReturnValue();
            storyboard = v9->_storyboard;
            v9->_storyboard = (UIStoryboard *)v72;

          }
        }
      }
      else if (v6)
      {
        v9->_hadResolutionErrorsOnLoad = 1;
        v65 = qword_1ECD7CCF0;
        if (!qword_1ECD7CCF0)
        {
          v65 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v65, (unint64_t *)&qword_1ECD7CCF0);
        }
        v66 = *(NSObject **)(v65 + 8);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v81 = (const __CFString *)v6;
          _os_log_impl(&dword_185066000, v66, OS_LOG_TYPE_ERROR, "Info.plist contained no UIScene configuration dictionary (looking for configuration named \"%@\")", buf, 0xCu);
        }
      }
      goto LABEL_65;
    }
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));
    objc_msgSend(v10, "objectForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 && (!v14 || !objc_msgSend(v14, "count")))
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("UIWindowSceneSessionRoleExternalDisplay"));
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    if (v6)
    {
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __49__UISceneConfiguration_initWithName_sessionRole___block_invoke;
      v77[3] = &unk_1E16B5B08;
      v17 = v6;
      v78 = v17;
      v18 = objc_msgSend(v15, "indexOfObjectPassingTest:", v77);
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v15, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_hadResolutionErrorsOnLoad = 1;
        v20 = _MergedGlobals_960;
        if (!_MergedGlobals_960)
        {
          v20 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&_MergedGlobals_960);
        }
        v21 = *(NSObject **)(v20 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v81 = (const __CFString *)v17;
          v82 = 2112;
          v83 = v7;
          v84 = 2112;
          v85 = v7;
          _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Info.plist contained no configuration named \"%@\" for %@. Falling back to first defined description for %@", buf, 0x20u);
        }
      }
      else
      {
        objc_msgSend(v15, "objectAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v19, "isEqualToDictionary:", v28);

      if (!v19)
        goto LABEL_64;
    }
    else
    {
      objc_msgSend(v15, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 1;
      if (!v19)
      {
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
    }
    v9->_isDefault = v27;
    v9->_fromPlist = 1;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UISceneConfigurationName"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v9->_name;
    v9->_name = (NSString *)v29;

    v9->_hadResolutionErrorsOnLoad = 0;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UISceneClassName"));
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    v32 = NSClassFromString(v31);
    v33 = v32;
    v9->_sceneClass = v32;
    v75 = v12;
    if (!v31 || v32)
    {
      if (v31)
      {
        objc_opt_self();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[objc_class isSubclassOfClass:](v33, "isSubclassOfClass:", v38);

        if ((v39 & 1) == 0)
        {
          v9->_hadResolutionErrorsOnLoad = 1;
          v40 = qword_1ECD7CCD0;
          if (!qword_1ECD7CCD0)
          {
            v40 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v40, (unint64_t *)&qword_1ECD7CCD0);
          }
          v35 = *(NSObject **)(v40 + 8);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v41 = CFSTR("(no name)");
            *(_DWORD *)buf = 138412802;
            if (v6)
              v41 = (const __CFString *)v6;
            v81 = v41;
            v82 = 2112;
            v83 = v7;
            v84 = 2112;
            v85 = v31;
            v37 = "Info.plist configuration \"%@\" for %@ contained UISceneClassName, \"%@\", but it is not a subclass of UIScene.";
            goto LABEL_36;
          }
        }
      }
    }
    else
    {
      v9->_hadResolutionErrorsOnLoad = 1;
      v34 = qword_1ECD7CCC8;
      if (!qword_1ECD7CCC8)
      {
        v34 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v34, (unint64_t *)&qword_1ECD7CCC8);
      }
      v35 = *(NSObject **)(v34 + 8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = CFSTR("(no name)");
        *(_DWORD *)buf = 138412802;
        if (v6)
          v36 = (const __CFString *)v6;
        v81 = v36;
        v82 = 2112;
        v83 = v7;
        v84 = 2112;
        v85 = v31;
        v37 = "Info.plist configuration \"%@\" for %@ contained UISceneClassName key, but could not load class with name \"%@\".";
LABEL_36:
        _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, v37, buf, 0x20u);
      }
    }
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UISceneDelegateClassName"));
    v42 = (NSString *)objc_claimAutoreleasedReturnValue();
    v43 = NSClassFromString(v42);
    v9->_delegateClass = v43;
    if (!v42 || v43)
    {
      if (!v42 || (-[objc_class conformsToProtocol:](v43, "conformsToProtocol:", &unk_1EE09E738) & 1) != 0)
        goto LABEL_54;
      v9->_hadResolutionErrorsOnLoad = 1;
      v48 = qword_1ECD7CCE0;
      if (!qword_1ECD7CCE0)
      {
        v48 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v48, (unint64_t *)&qword_1ECD7CCE0);
      }
      v45 = *(NSObject **)(v48 + 8);
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      v49 = CFSTR("(no name)");
      *(_DWORD *)buf = 138412802;
      if (v6)
        v49 = (const __CFString *)v6;
      v81 = v49;
      v82 = 2112;
      v83 = v7;
      v84 = 2112;
      v85 = v42;
      v47 = "Info.plist configuration \"%@\" for %@ contained UISceneDelegateClassName, \"%@\", but it does not conform t"
            "o the UISceneDelegate protocol.";
    }
    else
    {
      v9->_hadResolutionErrorsOnLoad = 1;
      v44 = qword_1ECD7CCD8;
      if (!qword_1ECD7CCD8)
      {
        v44 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v44, (unint64_t *)&qword_1ECD7CCD8);
      }
      v45 = *(NSObject **)(v44 + 8);
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      v46 = CFSTR("(no name)");
      *(_DWORD *)buf = 138412802;
      if (v6)
        v46 = (const __CFString *)v6;
      v81 = v46;
      v82 = 2112;
      v83 = v7;
      v84 = 2112;
      v85 = v42;
      v47 = "Info.plist configuration \"%@\" for %@ contained UISceneDelegateClassName key, but could not load class with name \"%@\".";
    }
    _os_log_impl(&dword_185066000, v45, OS_LOG_TYPE_ERROR, v47, buf, 0x20u);
LABEL_54:
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UISceneStoryboardFile"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v74 = v42;
      v51 = v19;
      v52 = v7;
      v53 = v6;
      v54 = v15;
      v55 = v10;
      v56 = v31;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", v50, v57);
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = v9->_storyboard;
      v9->_storyboard = (UIStoryboard *)v58;

      v31 = v56;
      v10 = v55;
      v15 = v54;
      v6 = v53;
      v7 = v52;
      v19 = v51;
      v42 = v74;
      if (!v9->_storyboard)
      {
        v9->_hadResolutionErrorsOnLoad = 1;
        v60 = qword_1ECD7CCE8;
        if (!qword_1ECD7CCE8)
        {
          v60 = __UILogCategoryGetNode("SceneConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v60, (unint64_t *)&qword_1ECD7CCE8);
        }
        v61 = *(NSObject **)(v60 + 8);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v62 = CFSTR("(no name)");
          *(_DWORD *)buf = 138412802;
          if (v6)
            v62 = (const __CFString *)v6;
          v81 = v62;
          v82 = 2112;
          v83 = v7;
          v84 = 2112;
          v85 = v74;
          _os_log_impl(&dword_185066000, v61, OS_LOG_TYPE_ERROR, "Info.plist configuration \"%@\" for %@ contained UIMainStoryboardFile key, but could not find storyboard with name %@.", buf, 0x20u);
        }
      }
    }
    else
    {
      v63 = v9->_storyboard;
      v9->_storyboard = 0;

    }
    v12 = v75;
    goto LABEL_64;
  }
LABEL_66:

  return v9;
}

uint64_t __49__UISceneConfiguration_initWithName_sessionRole___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectForKey:", CFSTR("UISceneConfigurationName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));
  else
    v5 = 0;

  return v5;
}

id __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "activeMultilinePrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v12 = &unk_1E16B1B50;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v13 = v4;
    v14 = v5;
    objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("flags"), v3, &v9);

  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("sceneClass"), v9, v10, v11, v12);
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("delegateClass"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("storyboard"));
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v15;

  v15 = a3;
  if (self->_name && self->_fromPlist)
  {
    objc_msgSend(v15, "encodeObject:forKey:");
    objc_msgSend(v15, "encodeObject:forKey:", self->_role, CFSTR("_UISceneConfigurationSessionRole"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("_UISceneConfigurationEncodingBundleVersion"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("_UISceneConfigurationEncodingBundleShortVersionString"));

    objc_msgSend(v15, "encodeObject:forKey:", self->_role, CFSTR("_UISceneConfigurationSessionRole"));
    NSStringFromClass(self->_sceneClass);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("_UISceneConfigurationSceneClassName"));

    NSStringFromClass(self->_delegateClass);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("_UISceneConfigurationDelegateClassName"));

    -[UIStoryboard name](self->_storyboard, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("_UISceneConfigurationStoryboardName"));

    -[UIStoryboard bundle](self->_storyboard, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      -[UIStoryboard bundle](self->_storyboard, "bundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("_UISceneConfigurationStoryboardBundleID"));

  }
}

void __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B4008;
  v9 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

BOOL __49__UISceneConfiguration_initWithName_sessionRole___block_invoke_102(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  _BOOL8 v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("UICanvasType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v6 = (void *)objc_msgSend(v6, "integerValue");
  v8 = *(_QWORD *)(a1 + 32) == (_QWORD)v6;
  *a4 = v8;

  return v8;
}

- (UISceneConfiguration)init
{
  return -[UISceneConfiguration initWithName:sessionRole:](self, "initWithName:sessionRole:", 0, CFSTR("UISceneSessionRoleNone"));
}

- (id)_initWithLoadErrorForSessionRole:(id)a3
{
  id result;

  result = -[UISceneConfiguration initWithName:sessionRole:](self, "initWithName:sessionRole:", 0, a3);
  if (result)
    *((_BYTE *)result + 8) = 1;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[UISceneConfiguration debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__UISceneConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9), CFSTR("isDefault"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10), CFSTR("isFromPlist"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("hadResolutionErrorsOnLoad"));
}

@end
