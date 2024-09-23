@implementation SiriPresentationOptions

- (SiriPresentationOptions)initWithBuilder:(id)a3
{
  SiriPresentationOptions *v4;

  v4 = +[SiriPresentationOptions newWithBuilder:](SiriPresentationOptions, "newWithBuilder:", a3);

  return v4;
}

- (SiriPresentationOptions)initWithWakeScreen:(BOOL)a3 hideOtherWindowsDuringAppearance:(BOOL)a4 shouldAllowBiometricAutoUnlock:(BOOL)a5 shouldDeactivateScenesBelow:(BOOL)a6 rotationStyle:(int64_t)a7 requestSource:(int64_t)a8 inputType:(int64_t)a9
{
  SiriPresentationOptions *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SiriPresentationOptions;
  result = -[SiriPresentationOptions init](&v16, sel_init);
  if (result)
  {
    result->_wakeScreen = a3;
    result->_hideOtherWindowsDuringAppearance = a4;
    result->_shouldAllowBiometricAutoUnlock = a5;
    result->_shouldDeactivateScenesBelow = a6;
    result->_rotationStyle = a7;
    result->_requestSource = a8;
    result->_inputType = a9;
  }
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  const __CFString *v5;
  id v6;
  const __CFString *v7;
  id v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  id v12;
  unint64_t rotationStyle;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  objc_super v31;
  _QWORD v32[8];

  v32[7] = *MEMORY[0x1E0C80C00];
  v29 = objc_alloc(MEMORY[0x1E0CB3940]);
  v31.receiver = self;
  v31.super_class = (Class)SiriPresentationOptions;
  -[SiriPresentationOptions description](&v31, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_wakeScreen)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v30 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("wakeScreen = %@"), v5);
  v32[0] = v30;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_hideOtherWindowsDuringAppearance)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v28 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("hideOtherWindowsDuringAppearance = %@"), v7);
  v32[1] = v28;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_shouldAllowBiometricAutoUnlock)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v27 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("shouldAllowBiometricAutoUnlock = %@"), v9);
  v32[2] = v27;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_shouldDeactivateScenesBelow)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v26 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("shouldDeactivateScenesBelow = %@"), v11);
  v32[3] = v26;
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  rotationStyle = self->_rotationStyle;
  SiriPresentationRotationStyleGetName(rotationStyle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("rotationStyle = %ld (%@)"), rotationStyle, v14);
  v32[4] = v15;
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestSource);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("requestSource = %@"), v17);
  v32[5] = v18;
  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_inputType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("inputType = %@"), v20);
  v32[6] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("%@ {%@}"), v3, v23);

  return v24;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wakeScreen);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hideOtherWindowsDuringAppearance);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldAllowBiometricAutoUnlock);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldDeactivateScenesBelow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rotationStyle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestSource);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_inputType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  SiriPresentationOptions *v4;
  SiriPresentationOptions *v5;
  _BOOL4 wakeScreen;
  _BOOL4 hideOtherWindowsDuringAppearance;
  _BOOL4 shouldAllowBiometricAutoUnlock;
  _BOOL4 shouldDeactivateScenesBelow;
  int64_t rotationStyle;
  int64_t requestSource;
  int64_t inputType;
  BOOL v13;

  v4 = (SiriPresentationOptions *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      wakeScreen = self->_wakeScreen;
      if (wakeScreen == -[SiriPresentationOptions wakeScreen](v5, "wakeScreen")
        && (hideOtherWindowsDuringAppearance = self->_hideOtherWindowsDuringAppearance,
            hideOtherWindowsDuringAppearance == -[SiriPresentationOptions hideOtherWindowsDuringAppearance](v5, "hideOtherWindowsDuringAppearance"))&& (shouldAllowBiometricAutoUnlock = self->_shouldAllowBiometricAutoUnlock, shouldAllowBiometricAutoUnlock == -[SiriPresentationOptions shouldAllowBiometricAutoUnlock](v5, "shouldAllowBiometricAutoUnlock"))&& (shouldDeactivateScenesBelow = self->_shouldDeactivateScenesBelow, shouldDeactivateScenesBelow == -[SiriPresentationOptions shouldDeactivateScenesBelow](v5, "shouldDeactivateScenesBelow"))&& (rotationStyle = self->_rotationStyle, rotationStyle == -[SiriPresentationOptions rotationStyle](v5, "rotationStyle"))&& (requestSource = self->_requestSource, requestSource == -[SiriPresentationOptions requestSource](v5, "requestSource")))
      {
        inputType = self->_inputType;
        v13 = inputType == -[SiriPresentationOptions inputType](v5, "inputType");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriPresentationOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriPresentationOptions::wakeScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriPresentationOptions::hideOtherWindowsDuringAppearance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriPresentationOptions::shouldAllowBiometricAutoUnlock"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriPresentationOptions::shouldDeactivateScenesBelow"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriPresentationOptions::rotationStyle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriPresentationOptions::requestSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriPresentationOptions::inputType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "integerValue");
  return -[SiriPresentationOptions initWithWakeScreen:hideOtherWindowsDuringAppearance:shouldAllowBiometricAutoUnlock:shouldDeactivateScenesBelow:rotationStyle:requestSource:inputType:](self, "initWithWakeScreen:hideOtherWindowsDuringAppearance:shouldAllowBiometricAutoUnlock:shouldDeactivateScenesBelow:rotationStyle:requestSource:inputType:", v6, v8, v10, v12, v14, v16, v18);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 wakeScreen;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  wakeScreen = self->_wakeScreen;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", wakeScreen);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SiriPresentationOptions::wakeScreen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hideOtherWindowsDuringAppearance);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SiriPresentationOptions::hideOtherWindowsDuringAppearance"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldAllowBiometricAutoUnlock);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("SiriPresentationOptions::shouldAllowBiometricAutoUnlock"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldDeactivateScenesBelow);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("SiriPresentationOptions::shouldDeactivateScenesBelow"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rotationStyle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("SiriPresentationOptions::rotationStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestSource);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("SiriPresentationOptions::requestSource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_inputType);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("SiriPresentationOptions::inputType"));

}

- (BOOL)wakeScreen
{
  return self->_wakeScreen;
}

- (BOOL)hideOtherWindowsDuringAppearance
{
  return self->_hideOtherWindowsDuringAppearance;
}

- (BOOL)shouldAllowBiometricAutoUnlock
{
  return self->_shouldAllowBiometricAutoUnlock;
}

- (BOOL)shouldDeactivateScenesBelow
{
  return self->_shouldDeactivateScenesBelow;
}

- (int64_t)rotationStyle
{
  return self->_rotationStyle;
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

- (int64_t)inputType
{
  return self->_inputType;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SiriPresentationOptionsMutation *);
  _SiriPresentationOptionsMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SiriPresentationOptionsMutation *))a3;
  v4 = objc_alloc_init(_SiriPresentationOptionsMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SiriPresentationOptionsMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SiriPresentationOptionsMutation *);
  _SiriPresentationOptionsMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SiriPresentationOptionsMutation *))a3;
  if (v4)
  {
    v5 = -[_SiriPresentationOptionsMutation initWithBaseModel:]([_SiriPresentationOptionsMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SiriPresentationOptionsMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SiriPresentationOptions copy](self, "copy");
  }

  return v6;
}

@end
