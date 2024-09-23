@implementation NCUserNotificationsUIKitDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1)
    dispatch_once(&standardDefaults___once, &__block_literal_global_23);
  return (id)standardDefaults___instance;
}

void __52__NCUserNotificationsUIKitDefaults_standardDefaults__block_invoke()
{
  NCUserNotificationsUIKitDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(NCUserNotificationsUIKitDefaults);
  v1 = (void *)standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;

}

- (NCUserNotificationsUIKitDefaults)init
{
  return (NCUserNotificationsUIKitDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.springboard"));
}

- (id)configurationActions
{
  NSMutableArray *configurationMenuProperties;
  _QWORD v4[5];

  configurationMenuProperties = self->_configurationMenuProperties;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke;
  v4[3] = &unk_1E8D1DF18;
  v4[4] = self;
  -[NSMutableArray bs_map:](configurationMenuProperties, "bs_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)MEMORY[0x1E0DC3428];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke_2;
  v13 = &unk_1E8D1DC30;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v7 = v3;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, 0, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setState:", v5, v10, v11, v12, v13, v14);

  return v8;
}

void __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3 ^ 1u);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, *(_QWORD *)(a1 + 40));

}

- (CGRect)listDebugHUDFrame
{
  NSString *v2;
  NSString *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  -[NCUserNotificationsUIKitDefaults listDebugHUDRectString](self, "listDebugHUDRectString");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v12 = CGRectFromString(v2);
    x = v12.origin.x;
    y = v12.origin.y;
    width = v12.size.width;
    height = v12.size.height;
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setListDebugHUDFrame:(CGRect)a3
{
  id v4;

  NSStringFromCGRect(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults setListDebugHUDRectString:](self, "setListDebugHUDRectString:", v4);

}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showListDebugHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:](self, "_bind:key:defaultValue:", v3, CFSTR("NCShowNotificationListDebugHUD"), 0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "listDebugGuides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:](self, "_bind:key:defaultValue:", v4, CFSTR("NCListDebugGuides"), 0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldForceHapticTouchForPreview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:](self, "_bind:key:defaultValue:", v5, CFSTR("NCForceHapticTouchForPreview"), 0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldUseReactiveList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:onlyIf:](self, "_bind:key:defaultValue:onlyIf:", v6, CFSTR("NCUseModernList"), 1, _NCReactiveListUI());

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showClockInList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:onlyIf:](self, "_bind:key:defaultValue:onlyIf:", v7, CFSTR("NCShowClockInList"), 1, _NCReactiveListUI());

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "highlightPlatterLightEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:onlyIf:](self, "_bind:key:defaultValue:onlyIf:", v8, CFSTR("NCHighlightsPlatterLightEnabled"), 1, _NCReactiveListUI());

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "allowStackingInHighlights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:onlyIf:](self, "_bind:key:defaultValue:onlyIf:", v9, CFSTR("NCAllowStackingInHighlights"), 1, _NCReactiveListUI());

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "listDebugHUDPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("NCListDebugHUDPage"), &unk_1E8D5FA58, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "listDebugHUDRectString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("NCListDebugHUDRectString"), 0, 4);

}

- (id)observeDefault:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[NCUserNotificationsUIKitDefaults _activeDefault:](self, "_activeDefault:", v8))
  {
    v13.receiver = self;
    v13.super_class = (Class)NCUserNotificationsUIKitDefaults;
    -[BSAbstractDefaultDomain observeDefault:onQueue:withBlock:](&v13, sel_observeDefault_onQueue_withBlock_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)observeDefaults:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[5];

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__NCUserNotificationsUIKitDefaults_observeDefaults_onQueue_withBlock___block_invoke;
  v14[3] = &unk_1E8D1DF18;
  v14[4] = self;
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "bs_compactMap:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)NCUserNotificationsUIKitDefaults;
  -[BSAbstractDefaultDomain observeDefaults:onQueue:withBlock:](&v13, sel_observeDefaults_onQueue_withBlock_, v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __70__NCUserNotificationsUIKitDefaults_observeDefaults_onQueue_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (objc_msgSend(v2, "_activeDefault:", v3))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)_bind:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  -[NCUserNotificationsUIKitDefaults _bind:key:defaultValue:onlyIf:](self, "_bind:key:defaultValue:onlyIf:", a3, a4, a5, 1);
}

- (void)_bind:(id)a3 key:(id)a4 defaultValue:(BOOL)a5 onlyIf:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *configurationMenuProperties;
  id v15;

  v6 = a6;
  v7 = a5;
  v15 = a3;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v15, v11, v12, 4);

  if (!self->_configurationMenuProperties)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    configurationMenuProperties = self->_configurationMenuProperties;
    self->_configurationMenuProperties = v13;

    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
LABEL_3:
    -[NSMutableArray addObject:](self->_configurationMenuProperties, "addObject:", v15);
LABEL_4:

}

- (BOOL)_activeDefault:(id)a3
{
  id v4;
  NSMutableArray *configurationMenuProperties;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  configurationMenuProperties = self->_configurationMenuProperties;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NCUserNotificationsUIKitDefaults__activeDefault___block_invoke;
  v8[3] = &unk_1E8D1DF40;
  v9 = v4;
  v6 = v4;
  LOBYTE(configurationMenuProperties) = -[NSMutableArray bs_containsObjectPassingTest:](configurationMenuProperties, "bs_containsObjectPassingTest:", v8);

  return (char)configurationMenuProperties;
}

uint64_t __51__NCUserNotificationsUIKitDefaults__activeDefault___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationMenuProperties, 0);
}

@end
