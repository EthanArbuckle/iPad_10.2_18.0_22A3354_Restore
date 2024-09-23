@implementation _UIPhysicalButtonConfiguration

- (BOOL)isEqual:(id)a3
{
  _QWORD *v5;
  unint64_t v6;
  BOOL v7;

  if (a3 == self)
    return 1;
  if (!a3 || !_NSIsNSObject())
    return 0;
  v5 = a3;
  v6 = -[_UIPhysicalButtonConfiguration hash](self, "hash");
  v7 = v6 == objc_msgSend(v5, "hash")
    && -[_UIPhysicalButtonConfiguration _isEqualToConfigurationMinusGeneration:]((_BOOL8)self, (uint64_t)v5)
    && self->_generation == v5[5];

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_button);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_behavior);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_behaviorOptions);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_auditToken);
  v8 = (id)objc_msgSend(v3, "appendString:", self->_name);
  v9 = (id)objc_msgSend(v3, "appendBool:", self->_wantsSystemShellExclusivePriority);
  v10 = (id)objc_msgSend(v3, "appendInt64:", self->_generation);
  v11 = objc_msgSend(v3, "hash");

  return v11;
}

- (BOOL)_isEqualToConfigurationMinusGeneration:(_BOOL8)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  int v15;

  if (result)
  {
    v3 = result;
    v4 = objc_opt_class();
    if (v4 != objc_opt_class()
      || *(_QWORD *)(v3 + 16) != *(_QWORD *)(a2 + 16)
      || *(_QWORD *)(v3 + 24) != *(_QWORD *)(a2 + 24))
    {
      return 0;
    }
    v5 = *(void **)(a2 + 32);
    v6 = *(id *)(v3 + 32);
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (!v6 || !v7)
        goto LABEL_22;
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if (!v9)
        return 0;
    }
    v10 = *(void **)(a2 + 48);
    v6 = *(id *)(v3 + 48);
    v11 = v10;
    if (v6 == v11)
    {

    }
    else
    {
      v8 = v11;
      if (!v6 || !v11)
        goto LABEL_22;
      v12 = objc_msgSend(v6, "isEqual:", v11);

      if (!v12)
        return 0;
    }
    v13 = *(void **)(a2 + 56);
    v6 = *(id *)(v3 + 56);
    v14 = v13;
    if (v6 == v14)
    {

      return *(unsigned __int8 *)(v3 + 8) == *(unsigned __int8 *)(a2 + 8);
    }
    v8 = v14;
    if (v6 && v14)
    {
      v15 = objc_msgSend(v6, "isEqual:", v14);

      if (v15)
        return *(unsigned __int8 *)(v3 + 8) == *(unsigned __int8 *)(a2 + 8);
      return 0;
    }
LABEL_22:

    return 0;
  }
  return result;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_UIPhysicalButtonConfiguration)initWithBSXPCCoder:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  _UIPhysicalButtonConfiguration *v18;
  void *v20;

  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("behavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("behaviorOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wantsSystemShellExclusivePriority"));
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("generation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = v7 == 0;
  else
    v13 = 1;
  if (v13 || v11 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonConfiguration.m"), 728, CFSTR("Invalid encoded configuration: %@"), a3);

    v18 = 0;
  }
  else
  {
    v15 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](self, objc_msgSend(v6, "unsignedIntegerValue"), objc_msgSend(v7, "unsignedIntegerValue"), v8, objc_msgSend(v11, "unsignedLongLongValue"), v12);
    if (v15)
    {
      v16 = objc_msgSend(v9, "copy");
      v17 = (void *)v15[7];
      v15[7] = v16;

      *((_BYTE *)v15 + 8) = v10;
    }
    self = v15;
    v18 = self;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_behaviorOptions, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:]([_UIPhysicalButtonConfiguration alloc], self->_button, self->_behavior, self->_behaviorOptions, self->_generation, self->_auditToken);
  objc_msgSend(v4, "_setName:", self->_name);
  objc_msgSend(v4, "_setWantsSystemShellExclusivePriority:", self->_wantsSystemShellExclusivePriority);
  return v4;
}

- (void)_setWantsSystemShellExclusivePriority:(BOOL)a3
{
  self->_wantsSystemShellExclusivePriority = a3;
}

- (void)_setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)_button
{
  return self->_button;
}

- (unint64_t)_behavior
{
  return self->_behavior;
}

- (_UIPhysicalButtonBehaviorOptions)_behaviorOptions
{
  return (_UIPhysicalButtonBehaviorOptions *)(id)-[_UIPhysicalButtonBehaviorOptions copy](self->_behaviorOptions, "copy");
}

- (unint64_t)_generation
{
  return self->_generation;
}

+ (id)_cameraShutterConfigurationsWithOptionsProvider:(id)a3
{
  return +[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]((uint64_t)a1, _cameraShutterConfigurationsWithOptionsProvider__buttons, 4, (uint64_t)a3);
}

+ (id)_cameraShutterConfigurationsForButtons:(uint64_t)a3 buttonsCount:(uint64_t)a4 withOptionsProvider:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  objc_opt_self();
  v7 = (void *)objc_opt_new();
  do
  {
    v9 = *a2++;
    v8 = v9;
    if (a4)
    {
      (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (_UIPhysicalButtonBehaviorOptionsIsValidForBehavior(v10, 0))
    {
      v11 = objc_msgSend(v10, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_UIPhysicalButtonConfiguration.m"), 349, CFSTR("Invalid options object for camera shutter configurations: %@"), v10);

      +[_UIPhysicalButtonBehaviorCameraShutterOptions behaviorOptions](_UIPhysicalButtonBehaviorCameraShutterOptions, "behaviorOptions");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;

    +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:behavior:behaviorOptions:](_UIPhysicalButtonConfiguration, "_configurationWithPhysicalButton:behavior:behaviorOptions:", v8, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

    --a3;
  }
  while (a3);
  v15 = (void *)objc_msgSend(v7, "copy");

  return v15;
}

+ (id)_configurationWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 behaviorOptions:(id)a5
{
  _UIPhysicalButtonConfiguration *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  uint64_t bytes;

  v8 = [_UIPhysicalButtonConfiguration alloc];
  bytes = 0;
  do
  {
    v9 = CCRandomGenerateBytes(&bytes, 8uLL);
    if ((_DWORD)v9)
    {
      v12 = v9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint64_t _UIPhysicalButtonConfigurationRandomGeneration(void)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_UIPhysicalButtonConfiguration.m"), 287, CFSTR("Failed to create configuration generation with status: %d"), v12);

    }
    v10 = bytes;
    if (bytes)
      v11 = bytes == 0x3E1CC2CA76C17F8;
    else
      v11 = 1;
  }
  while (v11);
  objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](v8, a3, a4, a5, v10, v13);

  return v14;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_button);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_behavior);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_generation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("button"));
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("behavior"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_behaviorOptions, CFSTR("behaviorOptions"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_wantsSystemShellExclusivePriority, CFSTR("wantsSystemShellExclusivePriority"));
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("generation"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_auditToken, CFSTR("auditToken"));

}

- (id)_initWithPhysicalButton:(unint64_t)a3 behavior:(void *)a4 behaviorOptions:(uint64_t)a5 generation:(void *)a6 auditToken:
{
  id v6;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v6 = a1;
  if (!a1)
    return v6;
  v12 = objc_opt_class();
  if (v12 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, CFSTR("_UIPhysicalButtonConfiguration.m"), 445, CFSTR("_UIPhysicalButtonConfiguration cannot be subclassed"));

  }
  if ((_UIPhysicalButtonIsValid(a2) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, CFSTR("_UIPhysicalButtonConfiguration.m"), 447, CFSTR("Invalid button: %lu"), a2);

  }
  if ((_UIPhysicalButtonBehaviorIsValidForButton(a3, a2) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringFromUIPhysicalButton(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringFromUIPhysicalButtonBehavior(a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, CFSTR("_UIPhysicalButtonConfiguration.m"), 449, CFSTR("Invalid behavior for button: %@; behavior: %@"),
      v22,
      v23);

  }
  if (_UIPhysicalButtonBehaviorOptionsIsValidForBehavior(a4, a3))
  {
    if (a5)
      goto LABEL_10;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, CFSTR("_UIPhysicalButtonConfiguration.m"), 452, CFSTR("Invalid configuration generation: %llu"), 0);

    if (a6)
      goto LABEL_11;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButtonBehavior(a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, CFSTR("_UIPhysicalButtonConfiguration.m"), 451, CFSTR("Invalid options for %@: %@"), v25, a4);

  if (!a5)
    goto LABEL_15;
LABEL_10:
  if (a6)
    goto LABEL_11;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, CFSTR("_UIPhysicalButtonConfiguration.m"), 453, CFSTR("Invalid configuration auditToken: %@"), 0);

LABEL_11:
  v28.receiver = v6;
  v28.super_class = (Class)_UIPhysicalButtonConfiguration;
  v13 = objc_msgSendSuper2(&v28, sel_init);
  v6 = v13;
  if (v13)
  {
    v13[2] = a2;
    v13[3] = a3;
    v14 = objc_msgSend(a4, "copy");
    v15 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v14;

    *((_QWORD *)v6 + 5) = a5;
    v16 = objc_msgSend(a6, "copy");
    v17 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v16;

    *((_BYTE *)v6 + 8) = 0;
  }
  return v6;
}

+ (id)_volumeCameraShutterConfigurationsWithOptionsProvider:(id)a3
{
  return +[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]((uint64_t)a1, (uint64_t *)&_volumeCameraShutterConfigurationsWithOptionsProvider__buttons, 2, (uint64_t)a3);
}

+ (id)_cameraCaptureShutterConfigurationWithOptionsProvider:(id)a3
{
  return +[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]((uint64_t)a1, &_cameraCaptureShutterConfigurationWithOptionsProvider__buttons, 1, (uint64_t)a3);
}

+ (id)_cameraShutterConfigurationsWithOptions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74___UIPhysicalButtonConfiguration__cameraShutterConfigurationsWithOptions___block_invoke;
  v4[3] = &unk_1E16ECF70;
  v4[4] = a3;
  objc_msgSend(a1, "_cameraShutterConfigurationsWithOptionsProvider:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_cameraShutterConfigurations
{
  return (id)objc_msgSend(a1, "_cameraShutterConfigurationsWithOptionsProvider:", 0);
}

+ (id)_ringerButtonDynamicActionConfiguration
{
  void *v2;
  void *v3;

  +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:behavior:behaviorOptions:](_UIPhysicalButtonConfiguration, "_configurationWithPhysicalButton:behavior:behaviorOptions:", 3, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_volumeConfigurations
{
  void *v2;
  void *v3;
  void *v4;

  +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:behavior:behaviorOptions:](_UIPhysicalButtonConfiguration, "_configurationWithPhysicalButton:behavior:behaviorOptions:", 1, 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:behavior:behaviorOptions:](_UIPhysicalButtonConfiguration, "_configurationWithPhysicalButton:behavior:behaviorOptions:", 2, 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_UIPhysicalButtonConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonConfiguration.m"), 435, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonConfiguration init]", objc_opt_class());

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIPhysicalButtonConfiguration debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  _UIPhysicalButtonBehaviorOptions *behaviorOptions;
  void *v7;
  _UIPhysicalButtonBehaviorOptions *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButton(self->_button);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("button"));
  _NSStringFromUIPhysicalButtonBehavior(self->_behavior);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("behavior"));
  behaviorOptions = self->_behaviorOptions;
  if (behaviorOptions)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = behaviorOptions;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("(nil)");
  }
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v11, CFSTR("behaviorOptions"), 1);

  v13 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_generation, CFSTR("generation"));
  v14 = (id)objc_msgSend(v3, "appendInt:withName:", -[BSAuditToken pid](self->_auditToken, "pid"), CFSTR("pid"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIPhysicalButtonConfiguration *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_button);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_behavior);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_generation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("button"));
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("behavior"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_behaviorOptions, CFSTR("behaviorOptions"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_wantsSystemShellExclusivePriority, CFSTR("wantsSystemShellExclusivePriority"));
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("generation"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_auditToken, CFSTR("auditToken"));

}

- (_UIPhysicalButtonConfiguration)initWithCoder:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  _UIPhysicalButtonConfiguration *v20;
  void *v22;

  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("behavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("behaviorOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wantsSystemShellExclusivePriority"));
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("generation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6)
    v14 = v7 == 0;
  else
    v14 = 1;
  if (v14 || v11 == 0 || v12 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonConfiguration.m"), 636, CFSTR("Invalid encoded configuration: %@"), a3);

    v20 = 0;
  }
  else
  {
    v17 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](self, objc_msgSend(v6, "unsignedIntegerValue"), objc_msgSend(v7, "unsignedIntegerValue"), v8, objc_msgSend(v11, "unsignedLongLongValue"), v12);
    if (v17)
    {
      v18 = objc_msgSend(v9, "copy");
      v19 = (void *)v17[7];
      v17[7] = v18;

      *((_BYTE *)v17 + 8) = v10;
    }
    self = v17;
    v20 = self;
  }

  return v20;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;

  v5 = (const char *)objc_msgSend(CFSTR("button"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("behavior"), "UTF8String");
  objc_msgSend(CFSTR("behaviorOptions"), "UTF8String");
  objc_msgSend(CFSTR("name"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("wantsSystemShellExclusivePriority"), "UTF8String");
  v8 = (const char *)objc_msgSend(CFSTR("generation"), "UTF8String");
  objc_msgSend(CFSTR("auditToken"), "UTF8String");
  xpc_dictionary_set_uint64(a3, v5, self->_button);
  xpc_dictionary_set_uint64(a3, v6, self->_behavior);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(a3, v7, self->_wantsSystemShellExclusivePriority);
  xpc_dictionary_set_uint64(a3, v8, self->_generation);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (_UIPhysicalButtonConfiguration)initWithXPCDictionary:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t uint64;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  _UIPhysicalButtonConfiguration *v15;
  uint64_t v16;
  NSString *name;

  v4 = (const char *)objc_msgSend(CFSTR("button"), "UTF8String");
  v5 = (const char *)objc_msgSend(CFSTR("behavior"), "UTF8String");
  objc_msgSend(CFSTR("behaviorOptions"), "UTF8String");
  objc_msgSend(CFSTR("name"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("wantsSystemShellExclusivePriority"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("generation"), "UTF8String");
  objc_msgSend(CFSTR("auditToken"), "UTF8String");
  uint64 = xpc_dictionary_get_uint64(a3, v4);
  v9 = xpc_dictionary_get_uint64(a3, v5);
  v10 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v11 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  v12 = xpc_dictionary_get_BOOL(a3, v6);
  v13 = xpc_dictionary_get_uint64(a3, v7);
  v14 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v15 = (_UIPhysicalButtonConfiguration *)-[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](self, uint64, v9, v10, v13, v14);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v15->_wantsSystemShellExclusivePriority = v12;
  }

  return v15;
}

- (BSAuditToken)_auditToken
{
  return self->_auditToken;
}

- (NSString)_name
{
  return self->_name;
}

- (BOOL)_wantsSystemShellExclusivePriority
{
  return self->_wantsSystemShellExclusivePriority;
}

@end
