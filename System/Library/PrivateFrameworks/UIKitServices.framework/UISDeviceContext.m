@implementation UISDeviceContext

uint64_t __63__UISDeviceContext__dictionaryWithOnlyValidKeysFromDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isDeviceInfoValue:appropriateForKey:", a3, a2);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

void __28__UISDeviceContext__allKeys__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "_keysToValueTypes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithArray:", v3);
  v5 = (void *)qword_1ECDA5960;
  qword_1ECDA5960 = v4;

}

- (double)deviceInfoFloatValueForKey:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v10;

  v5 = a3;
  if (!-[UISDeviceContext _isDeviceInfoType:appropriateForKey:](self, "_isDeviceInfoType:appropriateForKey:", 3, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDeviceContext.m"), 65, CFSTR("%s values aren't valid for the key '%@'"), "Float", v5);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_deviceInfoKeysToValues, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (UISDeviceContext)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  UISDeviceContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceContextInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[UISDeviceContext initWithDeviceInfoValues:](self, "initWithDeviceInfoValues:", v5);
  return v6;
}

- (int64_t)deviceInfoIntegerValueForKey:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v9;

  v5 = a3;
  if (!-[UISDeviceContext _isDeviceInfoType:appropriateForKey:](self, "_isDeviceInfoType:appropriateForKey:", 2, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDeviceContext.m"), 74, CFSTR("%s values aren't valid for the key '%@'"), "Integer", v5);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_deviceInfoKeysToValues, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (BOOL)_isDeviceInfoValue:(id)a3 appropriateForKey:(id)a4
{
  id v6;

  v6 = a4;
  LOBYTE(a3) = -[UISDeviceContext _isDeviceInfoType:appropriateForKey:](self, "_isDeviceInfoType:appropriateForKey:", -[UISDeviceContext _valueTypeForValue:](self, "_valueTypeForValue:", a3), v6);

  return (char)a3;
}

- (BOOL)_isDeviceInfoType:(int64_t)a3 appropriateForKey:(id)a4
{
  int64_t v5;
  char v6;

  v5 = -[UISDeviceContext _valueTypeForKey:](self, "_valueTypeForKey:", a4);
  return !(((v5 & a3) < 0) ^ v6 | ((v5 & a3) == 0));
}

- (int64_t)_valueTypeForValue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = 4;
    else
      v4 = 0;
  }

  return v4;
}

- (int64_t)_valueTypeForKey:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v12;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDeviceContext.m"), 140, CFSTR("Key '%@' isn't valid"), v5);

  }
  objc_msgSend((id)objc_opt_class(), "_keysToValueTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "integerValue");
  else
    v10 = 0;

  return v10;
}

+ (id)_keysToValueTypes
{
  if (qword_1ECDA5958 != -1)
    dispatch_once(&qword_1ECDA5958, &__block_literal_global_10);
  return (id)_MergedGlobals_15;
}

+ (id)_allKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__UISDeviceContext__allKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDA5968 != -1)
    dispatch_once(&qword_1ECDA5968, block);
  return (id)qword_1ECDA5960;
}

+ (id)defaultContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D23000], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("UISDeviceContextDeviceClassKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "deviceClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = &unk_1E2CBAD58;
  v11[1] = CFSTR("UISDeviceContextDeviceIdiomKey");
  v11[2] = CFSTR("UISDeviceContextHomeButtonTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "homeButtonType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("UISDeviceContextDeviceCornerRadiusKey");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  MGGetFloat32Answer();
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceInfoValues:", v8);
  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSDictionary *deviceInfoKeysToValues;
  id v5;
  id v6;

  deviceInfoKeysToValues = self->_deviceInfoKeysToValues;
  v5 = a3;
  -[UISDeviceContext _dictionaryWithOnlyValidKeysFromDictionary:](self, "_dictionaryWithOnlyValidKeysFromDictionary:", deviceInfoKeysToValues);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("DeviceContextInfo"));

}

- (UISDeviceContext)initWithDeviceInfoValues:(id)a3
{
  id v4;
  UISDeviceContext *v5;
  UISDeviceContext *v6;
  uint64_t v7;
  NSDictionary *deviceInfoKeysToValues;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISDeviceContext;
  v5 = -[UISDeviceContext init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UISDeviceContext _dictionaryWithOnlyValidKeysFromDictionary:](v5, "_dictionaryWithOnlyValidKeysFromDictionary:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    deviceInfoKeysToValues = v6->_deviceInfoKeysToValues;
    v6->_deviceInfoKeysToValues = (NSDictionary *)v7;

  }
  return v6;
}

- (id)_dictionaryWithOnlyValidKeysFromDictionary:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__UISDeviceContext__dictionaryWithOnlyValidKeysFromDictionary___block_invoke;
  v4[3] = &unk_1E2CAFB78;
  v4[4] = self;
  objc_msgSend(a3, "bs_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfoKeysToValues, 0);
}

void __37__UISDeviceContext__keysToValueTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UISDeviceContextDeviceClassKey");
  v2[1] = CFSTR("UISDeviceContextDeviceIdiomKey");
  v3[0] = &unk_1E2CBAD70;
  v3[1] = &unk_1E2CBAD70;
  v2[2] = CFSTR("UISDeviceContextHomeButtonTypeKey");
  v2[3] = CFSTR("UISDeviceContextDeviceCornerRadiusKey");
  v3[2] = &unk_1E2CBAD70;
  v3[3] = &unk_1E2CBAD88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v0;

}

- (BOOL)hasDeviceInfoValueForKey:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  void *v11;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDeviceContext.m"), 60, CFSTR("Key '%@' isn't valid"), v5);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_deviceInfoKeysToValues, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (BOOL)deviceInfoBoolValueForKey:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v9;

  v5 = a3;
  if (!-[UISDeviceContext _isDeviceInfoType:appropriateForKey:](self, "_isDeviceInfoType:appropriateForKey:", 2, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDeviceContext.m"), 79, CFSTR("%s values aren't valid for the key '%@'"), "Integer", v5);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_deviceInfoKeysToValues, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (id)deviceInfoStringValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!-[UISDeviceContext _isDeviceInfoType:appropriateForKey:](self, "_isDeviceInfoType:appropriateForKey:", 4, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDeviceContext.m"), 84, CFSTR("%s values aren't valid for the key '%@'"), "String", v5);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_deviceInfoKeysToValues, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UISDeviceContext initWithDeviceInfoValues:]([UISMutableDeviceContext alloc], "initWithDeviceInfoValues:", self->_deviceInfoKeysToValues);
}

- (BOOL)isEqual:(id)a3
{
  UISDeviceContext *v4;
  UISDeviceContext *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UISDeviceContext *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UISDeviceContext _rawDeviceInfoKeysToValues](self, "_rawDeviceInfoKeysToValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISDeviceContext _rawDeviceInfoKeysToValues](v5, "_rawDeviceInfoKeysToValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  return ~-[NSDictionary hash](self->_deviceInfoKeysToValues, "hash");
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_deviceInfoKeysToValues, CFSTR("DeviceInfoKeysToValues"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_rawDeviceInfoKeysToValues
{
  return self->_deviceInfoKeysToValues;
}

@end
