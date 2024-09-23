@implementation HKSPSleepFocusConfiguration

- (id)sleepFocusConfigurationUpdatingUUID:(id)a3 state:(unint64_t)a4
{
  id v6;
  HKSPSleepFocusConfiguration *v7;

  v6 = a3;
  v7 = -[HKSPSleepFocusConfiguration initWithUUID:mirrorsFocusModes:state:]([HKSPSleepFocusConfiguration alloc], "initWithUUID:mirrorsFocusModes:state:", v6, -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes"), a4);

  return v7;
}

- (id)sleepFocusConfigurationUpdatingMirrorsFocusModes:(BOOL)a3
{
  _BOOL8 v3;
  HKSPSleepFocusConfiguration *v5;
  void *v6;
  HKSPSleepFocusConfiguration *v7;

  v3 = a3;
  v5 = [HKSPSleepFocusConfiguration alloc];
  -[HKSPSleepFocusConfiguration uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKSPSleepFocusConfiguration initWithUUID:mirrorsFocusModes:state:](v5, "initWithUUID:mirrorsFocusModes:state:", v6, v3, -[HKSPSleepFocusConfiguration state](self, "state"));

  return v7;
}

- (HKSPSleepFocusConfiguration)initWithUUID:(id)a3 mirrorsFocusModes:(BOOL)a4 state:(unint64_t)a5
{
  id v8;
  HKSPSleepFocusConfiguration *v9;
  uint64_t v10;
  NSUUID *uuid;
  HKSPSleepFocusConfiguration *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSleepFocusConfiguration;
  v9 = -[HKSPSleepFocusConfiguration init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    v9->_mirrorsFocusModes = a4;
    v9->_state = a5;
    v12 = v9;
  }

  return v9;
}

- (BOOL)hasSleepFocusMode
{
  void *v2;
  BOOL v3;

  -[HKSPSleepFocusConfiguration uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKSPSleepFocusConfiguration *v4;
  HKSPSleepFocusConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPSleepFocusConfiguration *v9;
  id v10;
  _BOOL8 v11;
  HKSPSleepFocusConfiguration *v12;
  id v13;
  unint64_t v14;
  HKSPSleepFocusConfiguration *v15;
  id v16;
  char v17;
  _QWORD v19[4];
  HKSPSleepFocusConfiguration *v20;
  _QWORD v21[4];
  HKSPSleepFocusConfiguration *v22;
  _QWORD v23[4];
  HKSPSleepFocusConfiguration *v24;

  v4 = (HKSPSleepFocusConfiguration *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepFocusConfiguration uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __39__HKSPSleepFocusConfiguration_isEqual___block_invoke;
      v23[3] = &unk_1E4E3A970;
      v9 = v5;
      v24 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", v7, v23);

      v11 = -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes");
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_2;
      v21[3] = &unk_1E4E3B3B0;
      v12 = v9;
      v22 = v12;
      v13 = (id)objc_msgSend(v6, "appendBool:counterpart:", v11, v21);
      v14 = -[HKSPSleepFocusConfiguration state](self, "state");
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_3;
      v19[3] = &unk_1E4E3B3D8;
      v20 = v12;
      v15 = v12;
      v16 = (id)objc_msgSend(v6, "appendUnsignedInteger:counterpart:", v14, v19);
      v17 = objc_msgSend(v6, "isEqual");

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

uint64_t __39__HKSPSleepFocusConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "uuid");
}

uint64_t __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mirrorsFocusModes");
}

uint64_t __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "state");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepFocusConfiguration uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = (id)objc_msgSend(v3, "appendBool:", -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes"));
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[HKSPSleepFocusConfiguration state](self, "state"));
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepFocusConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKSPSleepFocusConfiguration hasSleepFocusMode](self, "hasSleepFocusMode"))
  {
    -[HKSPSleepFocusConfiguration uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("uuid"));

    v6 = -[HKSPSleepFocusConfiguration state](self, "state");
    if (v6 > 3)
      v7 = CFSTR("Unconfigured");
    else
      v7 = off_1E4E3D360[v6];
    objc_msgSend(v3, "appendString:withName:", v7, CFSTR("state"));
  }
  else
  {
    v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepFocusConfiguration hasSleepFocusMode](self, "hasSleepFocusMode"), CFSTR("hasSleepFocusMode"));
  }
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes"), CFSTR("mirrorsFocusModes"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepFocusConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unint64_t)defaultConfigurationState
{
  return 1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)mirrorsFocusModes
{
  return self->_mirrorsFocusModes;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)readFromDefaults:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  HKSPSleepFocusConfiguration *v7;
  void *v8;
  HKSPSleepFocusConfiguration *v9;

  v3 = a3;
  objc_msgSend(v3, "hksp_objectForKey:", CFSTR("SleepFocusUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hksp_BOOLForKey:", CFSTR("MirrorsSleepFocusMode"));
  v6 = objc_msgSend(v3, "hksp_integerForKey:", CFSTR("SleepFocusState"));

  v7 = [HKSPSleepFocusConfiguration alloc];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  v9 = -[HKSPSleepFocusConfiguration initWithUUID:mirrorsFocusModes:state:](v7, "initWithUUID:mirrorsFocusModes:state:", v8, v5, v6);

  return v9;
}

- (void)writeToDefaults:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HKSPSleepFocusConfiguration uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hksp_setObject:forKey:", v5, CFSTR("SleepFocusUUID"));

  objc_msgSend(v6, "hksp_setBool:forKey:", -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes"), CFSTR("MirrorsSleepFocusMode"));
  objc_msgSend(v6, "hksp_setInteger:forKey:", -[HKSPSleepFocusConfiguration state](self, "state"), CFSTR("SleepFocusState"));

}

@end
