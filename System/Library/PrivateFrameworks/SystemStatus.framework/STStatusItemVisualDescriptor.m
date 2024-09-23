@implementation STStatusItemVisualDescriptor

- (NSString)description
{
  return (NSString *)-[STStatusItemVisualDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusItemVisualDescriptor packageName](self, "packageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke;
  v31[3] = &unk_1E91E4B00;
  v8 = v4;
  v32 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v31);

  -[STStatusItemVisualDescriptor systemImageName](self, "systemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_2;
  v29[3] = &unk_1E91E4B00;
  v11 = v8;
  v30 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v29);

  -[STStatusItemVisualDescriptor imageName](self, "imageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_3;
  v27[3] = &unk_1E91E4B00;
  v14 = v11;
  v28 = v14;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", v13, v27);

  -[STStatusItemVisualDescriptor textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_4;
  v25[3] = &unk_1E91E4B00;
  v17 = v14;
  v26 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v25);

  v19 = -[STStatusItemVisualDescriptor isCallToAction](self, "isCallToAction");
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_5;
  v23[3] = &unk_1E91E4B28;
  v24 = v17;
  v20 = v17;
  v21 = (id)objc_msgSend(v5, "appendBool:counterpart:", v19, v23);
  LOBYTE(v19) = objc_msgSend(v5, "isEqual");

  return v19;
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "packageName");
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemImageName");
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageName");
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "textLabel");
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCallToAction");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusItemVisualDescriptor packageName](self, "packageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STStatusItemVisualDescriptor systemImageName](self, "systemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[STStatusItemVisualDescriptor imageName](self, "imageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendString:", v8);

  -[STStatusItemVisualDescriptor textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendString:", v10);

  v12 = (id)objc_msgSend(v3, "appendBool:", -[STStatusItemVisualDescriptor isCallToAction](self, "isCallToAction"));
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusItemVisualDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemVisualDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemVisualDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusItemVisualDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  STStatusItemVisualDescriptor *v14;

  v4 = a4;
  v6 = a3;
  -[STStatusItemVisualDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__STStatusItemVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E91E4AD8;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

id __80__STStatusItemVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "packageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v3, CFSTR("packageName"), 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "systemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("systemImageName"), 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:skipIfEmpty:", v7, CFSTR("imageName"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v9, CFSTR("textLabel"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isCallToAction"), CFSTR("callToAction"), 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[STStatusItemVisualDescriptor packageName](self, "packageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("packageName"));

  -[STStatusItemVisualDescriptor systemImageName](self, "systemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("systemImageName"));

  -[STStatusItemVisualDescriptor imageName](self, "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("imageName"));

  -[STStatusItemVisualDescriptor textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("textLabel"));

  objc_msgSend(v8, "encodeBool:forKey:", -[STStatusItemVisualDescriptor isCallToAction](self, "isCallToAction"), CFSTR("callToAction"));
}

- (STStatusItemVisualDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  STStatusItemVisualDescriptor *v11;
  uint64_t v12;
  NSString *packageName;
  uint64_t v14;
  NSString *systemImageName;
  uint64_t v16;
  NSString *imageName;
  uint64_t v18;
  NSString *textLabel;
  objc_super v21;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("packageName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("systemImageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("imageName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("textLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("callToAction"));

  v21.receiver = self;
  v21.super_class = (Class)STStatusItemVisualDescriptor;
  v11 = -[STStatusItemVisualDescriptor init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v6, "copy");
    packageName = v11->_packageName;
    v11->_packageName = (NSString *)v12;

    v14 = objc_msgSend(v7, "copy");
    systemImageName = v11->_systemImageName;
    v11->_systemImageName = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    imageName = v11->_imageName;
    v11->_imageName = (NSString *)v16;

    v18 = objc_msgSend(v9, "copy");
    textLabel = v11->_textLabel;
    v11->_textLabel = (NSString *)v18;

    v11->_callToAction = v10;
  }

  return v11;
}

- (STStatusItemVisualDescriptor)initWithPlistRepresentation:(id)a3
{
  id v4;
  STStatusItemVisualDescriptor *v5;
  void *v6;
  uint64_t v7;
  NSString *systemImageName;
  uint64_t v9;
  NSString *textLabel;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STStatusItemVisualDescriptor;
  v5 = -[STStatusItemVisualDescriptor init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("SystemImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("InternalSymbolName"));
    v7 = objc_claimAutoreleasedReturnValue();
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v7;

    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("TextLabel"));
    v9 = objc_claimAutoreleasedReturnValue();
    textLabel = v5->_textLabel;
    v5->_textLabel = (NSString *)v9;

    v5->_callToAction = objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("IsCallToAction"));
    if (!v5->_textLabel && !v5->_systemImageName && !v5->_imageName && !v5->_packageName)
    {
      STSystemStatusLogBundleLoading();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1D12C7000, v11, OS_LOG_TYPE_ERROR, "A visual descriptor should have a systemImage, image, package, or textLabel — but this one doesn't!", v13, 2u);
      }

    }
  }

  return v5;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)textLabel
{
  return self->_textLabel;
}

- (BOOL)isCallToAction
{
  return self->_callToAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
}

+ (id)visualDescriptorForStatusItemWithIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__STStatusItemVisualDescriptor_BuiltIns__visualDescriptorForStatusItemWithIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = _MergedGlobals_1_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_MergedGlobals_1_0, block);
  objc_msgSend((id)qword_1ED0CB3C0, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __86__STStatusItemVisualDescriptor_BuiltIns__visualDescriptorForStatusItemWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_defaultVisualDescriptors");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0CB3C0;
  qword_1ED0CB3C0 = v1;

}

+ (id)_defaultVisualDescriptors
{
  void *v2;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setSystemImageName:", CFSTR("airplane"));
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("com.apple.systemstatus.status-item.AirplaneMode"));

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSystemImageName:", CFSTR("airplayvideo"));
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("com.apple.systemstatus.status-item.AirPlay"));

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSystemImageName:", CFSTR("alarm.fill"));
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("com.apple.systemstatus.status-item.Alarm"));

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setSystemImageName:", CFSTR("carplay"));
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("com.apple.systemstatus.status-item.CarPlay"));

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSystemImageName:", CFSTR("display.trianglebadge.exclamationmark"));
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("com.apple.systemstatus.status-item.DisplayWarning"));

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setSystemImageName:", CFSTR("drop.triangle.fill"));
  objc_msgSend(v8, "setImageName:", CFSTR("LiquidDetection"));
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("com.apple.systemstatus.status-item.LiquidDetection"));

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setSystemImageName:", CFSTR("lock.rotation"));
  objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("com.apple.systemstatus.status-item.RotationLock"));

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setImageName:", CFSTR("Student"));
  objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("com.apple.systemstatus.status-item.Student"));

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setSystemImageName:", CFSTR("teletype"));
  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("com.apple.systemstatus.status-item.TTY"));

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setImageName:", CFSTR("VPN"));
  objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("com.apple.systemstatus.status-item.VPN"));

  return v2;
}

@end
