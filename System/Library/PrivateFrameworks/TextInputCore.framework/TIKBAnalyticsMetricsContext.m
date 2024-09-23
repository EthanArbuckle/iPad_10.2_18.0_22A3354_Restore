@implementation TIKBAnalyticsMetricsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingParameters, 0);
  objc_storeStrong((id *)&self->_keyboardConfiguration, 0);
  objc_storeStrong((id *)&self->_layoutName, 0);
  objc_storeStrong((id *)&self->_secondaryRegion, 0);
  objc_storeStrong((id *)&self->_secondaryLanguage, 0);
  objc_storeStrong((id *)&self->_inputVariant, 0);
}

- (NSDictionary)testingParameters
{
  return self->_testingParameters;
}

- (NSString)secondaryRegion
{
  return self->_secondaryRegion;
}

- (NSString)secondaryLanguage
{
  return self->_secondaryLanguage;
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (unsigned)keyboardType
{
  return self->_keyboardType;
}

- (NSString)inputVariant
{
  return self->_inputVariant;
}

- (TIKBAnalyticsMetricsContext)initWithKeyboardState:(id)a3 activeInputModes:(id)a4 testingParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  TIKBAnalyticsMetricsContext *v22;
  TIKBAnalyticsMetricsContext *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  NSString *layoutName;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  NSString *keyboardConfiguration;
  uint64_t v35;
  NSDictionary *testingParameters;
  void *v38;
  void *v39;
  __CFString *v40;
  objc_super v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "inputMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguage();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetRegion();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetVariant();
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    -[TIKBAnalyticsMetricsContext defaultLanguageOrRegionFromInputMode:](self, "defaultLanguageOrRegionFromInputMode:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_3;
  }
  -[TIKBAnalyticsMetricsContext defaultLanguageOrRegionFromInputMode:](self, "defaultLanguageOrRegionFromInputMode:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v15 = CFSTR("None");
  if (!v14)
    v14 = CFSTR("None");
  v16 = CFSTR("None");
  v40 = v14;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v39 = v13;
    v17 = v12;
    v18 = v10;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "normalizedIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    TIInputModeGetLanguage();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetRegion();
    v21 = objc_claimAutoreleasedReturnValue();
    v15 = (__CFString *)v21;
    if (v16)
    {
      if (v21)
      {
LABEL_8:

        v10 = v18;
        v12 = v17;
        v13 = v39;
        v14 = v40;
        goto LABEL_9;
      }
    }
    else
    {
      -[TIKBAnalyticsMetricsContext defaultLanguageOrRegionFromInputMode:](self, "defaultLanguageOrRegionFromInputMode:", v20);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_8;
    }
    -[TIKBAnalyticsMetricsContext defaultLanguageOrRegionFromInputMode:](self, "defaultLanguageOrRegionFromInputMode:", v20);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  v41.receiver = self;
  v41.super_class = (Class)TIKBAnalyticsMetricsContext;
  v22 = -[TIAnalyticsMetricsContext initWithInputLanguage:inputRegion:](&v41, sel_initWithInputLanguage_inputRegion_, v12, v13);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_inputVariant, v14);
    objc_storeStrong((id *)&v23->_secondaryLanguage, v16);
    objc_storeStrong((id *)&v23->_secondaryRegion, v15);
    objc_msgSend(v8, "layoutState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23->_userInterfaceIdiom = objc_msgSend(v24, "userInterfaceIdiom");

    v23->_keyboardType = 0;
    v38 = v10;
    if (objc_msgSend(v8, "hardwareKeyboardMode"))
    {
      v23->_keyboardType = 5;
      objc_msgSend(v8, "layoutState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hardwareLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "floatingKeyboardMode"))
      {
        v23->_keyboardType = 3;
        v23->_userInterfaceIdiom = 1;
      }
      else
      {
        if (objc_msgSend(v8, "splitKeyboardMode"))
        {
          v27 = 4;
        }
        else if (objc_msgSend(v8, "landscapeOrientation"))
        {
          v27 = 2;
        }
        else
        {
          v27 = 1;
        }
        v23->_keyboardType = v27;
      }
      objc_msgSend(v8, "layoutState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "softwareLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = v26;
    v29 = objc_msgSend(v26, "copy");
    layoutName = v23->_layoutName;
    v23->_layoutName = (NSString *)v29;

    if (!v23->_layoutName)
      v23->_layoutName = (NSString *)CFSTR("Unknown");
    TIInputModeGetFullInputModeIdentifier();
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!v31)
      v31 = CFSTR("None");
    v33 = -[__CFString copy](v31, "copy");
    keyboardConfiguration = v23->_keyboardConfiguration;
    v23->_keyboardConfiguration = (NSString *)v33;

    v10 = v38;
    _deepCopyOfStringDictionary(v38);
    v35 = objc_claimAutoreleasedReturnValue();
    testingParameters = v23->_testingParameters;
    v23->_testingParameters = (NSDictionary *)v35;

    v14 = v40;
  }

  return v23;
}

+ (id)keyboardTypeEnumToString:(unsigned __int8)a3
{
  unsigned int v3;
  __CFString *v4;
  void *v5;
  _QWORD v7[7];

  v3 = a3;
  v7[6] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("Unknown");
  v7[0] = CFSTR("Unknown");
  v7[1] = CFSTR("Portrait");
  v7[2] = CFSTR("Landscape");
  v7[3] = CFSTR("Floating,");
  v7[4] = CFSTR("Split");
  v7[5] = CFSTR("Hardware");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") > (unint64_t)v3)
  {
    objc_msgSend(v5, "objectAtIndex:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 userInterfaceIdiom:(int64_t)a7
{
  return -[TIKBAnalyticsMetricsContext initWithInputLanguage:inputRegion:layoutName:keyboardType:userInterfaceIdiom:testingParameters:](self, "initWithInputLanguage:inputRegion:layoutName:keyboardType:userInterfaceIdiom:testingParameters:", a3, a4, a5, a6, a7, MEMORY[0x1E0C9AA70]);
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 keyboardConfiguration:(id)a7 userInterfaceIdiom:(int64_t)a8
{
  uint64_t v9;

  LOBYTE(v9) = a6;
  return -[TIKBAnalyticsMetricsContext initWithInputLanguage:inputRegion:inputVariant:secondaryLanguage:secondaryRegion:layoutName:keyboardType:keyboardConfiguration:userInterfaceIdiom:testingParameters:](self, "initWithInputLanguage:inputRegion:inputVariant:secondaryLanguage:secondaryRegion:layoutName:keyboardType:keyboardConfiguration:userInterfaceIdiom:testingParameters:", a3, a4, 0, 0, 0, a5, v9, a7, a8, MEMORY[0x1E0C9AA70]);
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 userInterfaceIdiom:(int64_t)a7 testingParameters:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = a6;
  return -[TIKBAnalyticsMetricsContext initWithInputLanguage:inputRegion:inputVariant:secondaryLanguage:secondaryRegion:layoutName:keyboardType:keyboardConfiguration:userInterfaceIdiom:testingParameters:](self, "initWithInputLanguage:inputRegion:inputVariant:secondaryLanguage:secondaryRegion:layoutName:keyboardType:keyboardConfiguration:userInterfaceIdiom:testingParameters:", a3, a4, 0, 0, 0, a5, v9, 0, a7, a8);
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 inputVariant:(id)a5 secondaryLanguage:(id)a6 secondaryRegion:(id)a7 layoutName:(id)a8 keyboardType:(unsigned __int8)a9 keyboardConfiguration:(id)a10 userInterfaceIdiom:(int64_t)a11 testingParameters:(id)a12
{
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  __CFString *v22;
  id v23;
  TIKBAnalyticsMetricsContext *v24;
  __CFString *v25;
  uint64_t v26;
  NSString *inputVariant;
  __CFString *v28;
  uint64_t v29;
  NSString *secondaryLanguage;
  __CFString *v31;
  uint64_t v32;
  NSString *secondaryRegion;
  uint64_t v34;
  NSString *layoutName;
  __CFString *v36;
  uint64_t v37;
  NSString *keyboardConfiguration;
  uint64_t v39;
  NSDictionary *testingParameters;
  objc_super v42;

  v18 = (__CFString *)a5;
  v19 = (__CFString *)a6;
  v20 = (__CFString *)a7;
  v21 = a8;
  v22 = (__CFString *)a10;
  v23 = a12;
  v42.receiver = self;
  v42.super_class = (Class)TIKBAnalyticsMetricsContext;
  v24 = -[TIAnalyticsMetricsContext initWithInputLanguage:inputRegion:](&v42, sel_initWithInputLanguage_inputRegion_, a3, a4);
  if (v24)
  {
    if (v18)
      v25 = v18;
    else
      v25 = CFSTR("None");
    v26 = -[__CFString copy](v25, "copy");
    inputVariant = v24->_inputVariant;
    v24->_inputVariant = (NSString *)v26;

    if (v19)
      v28 = v19;
    else
      v28 = CFSTR("None");
    v29 = -[__CFString copy](v28, "copy");
    secondaryLanguage = v24->_secondaryLanguage;
    v24->_secondaryLanguage = (NSString *)v29;

    if (v20)
      v31 = v20;
    else
      v31 = CFSTR("None");
    v32 = -[__CFString copy](v31, "copy");
    secondaryRegion = v24->_secondaryRegion;
    v24->_secondaryRegion = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    layoutName = v24->_layoutName;
    v24->_layoutName = (NSString *)v34;

    v24->_keyboardType = a9;
    if (v22)
      v36 = v22;
    else
      v36 = CFSTR("None");
    v37 = -[__CFString copy](v36, "copy");
    keyboardConfiguration = v24->_keyboardConfiguration;
    v24->_keyboardConfiguration = (NSString *)v37;

    v24->_userInterfaceIdiom = a11;
    _deepCopyOfStringDictionary(v23);
    v39 = objc_claimAutoreleasedReturnValue();
    testingParameters = v24->_testingParameters;
    v24->_testingParameters = (NSDictionary *)v39;

  }
  return v24;
}

- (id)defaultLanguageOrRegionFromInputMode:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "length"))
      v5 = v4;
    else
      v5 = CFSTR("Empty");
  }
  else
  {
    v5 = CFSTR("Unknown");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKBAnalyticsMetricsContext;
  v4 = a3;
  -[TIAnalyticsMetricsContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputVariant, CFSTR("inputVariant"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryLanguage, CFSTR("secondaryLanguage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryRegion, CFSTR("secondaryRegion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_layoutName, CFSTR("layoutName"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_keyboardType, CFSTR("keyboardType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardConfiguration, CFSTR("keyboardConfiguration"));
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_userInterfaceIdiom), CFSTR("userInterfaceIdiom"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_testingParameters, CFSTR("testingParameters"));

}

- (TIKBAnalyticsMetricsContext)initWithCoder:(id)a3
{
  id v4;
  TIKBAnalyticsMetricsContext *v5;
  void *v6;
  uint64_t v7;
  NSString *inputVariant;
  void *v9;
  uint64_t v10;
  NSString *secondaryLanguage;
  void *v12;
  uint64_t v13;
  NSString *secondaryRegion;
  void *v15;
  uint64_t v16;
  NSString *layoutName;
  void *v18;
  uint64_t v19;
  NSString *keyboardConfiguration;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *testingParameters;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TIKBAnalyticsMetricsContext;
  v5 = -[TIAnalyticsMetricsContext initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputVariant"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    inputVariant = v5->_inputVariant;
    v5->_inputVariant = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryLanguage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    secondaryLanguage = v5->_secondaryLanguage;
    v5->_secondaryLanguage = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryRegion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    secondaryRegion = v5->_secondaryRegion;
    v5->_secondaryRegion = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v16;

    v5->_keyboardType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("keyboardType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardConfiguration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    keyboardConfiguration = v5->_keyboardConfiguration;
    v5->_keyboardConfiguration = (NSString *)v19;

    v5->_userInterfaceIdiom = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("userInterfaceIdiom"));
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("testingParameters"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    _deepCopyOfStringDictionary(v24);
    v25 = objc_claimAutoreleasedReturnValue();
    testingParameters = v5->_testingParameters;
    v5->_testingParameters = (NSDictionary *)v25;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TIKBAnalyticsMetricsContext;
  v5 = -[TIAnalyticsMetricsContext copyWithZone:](&v19, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_inputVariant, "copyWithZone:", a3);
    v7 = (void *)v5[4];
    v5[4] = v6;

    v8 = -[NSString copyWithZone:](self->_secondaryLanguage, "copyWithZone:", a3);
    v9 = (void *)v5[5];
    v5[5] = v8;

    v10 = -[NSString copyWithZone:](self->_secondaryRegion, "copyWithZone:", a3);
    v11 = (void *)v5[6];
    v5[6] = v10;

    v12 = -[NSString copyWithZone:](self->_layoutName, "copyWithZone:", a3);
    v13 = (void *)v5[7];
    v5[7] = v12;

    *((_BYTE *)v5 + 24) = self->_keyboardType;
    v14 = -[NSString copyWithZone:](self->_keyboardConfiguration, "copyWithZone:", a3);
    v15 = (void *)v5[8];
    v5[8] = v14;

    v5[9] = self->_userInterfaceIdiom;
    v16 = -[NSDictionary copyWithZone:](self->_testingParameters, "copyWithZone:", a3);
    v17 = (void *)v5[10];
    v5[10] = v16;

  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  NSDictionary *testingParameters;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)TIKBAnalyticsMetricsContext;
  v3 = 257 * -[TIAnalyticsMetricsContext hash](&v21, sel_hash);
  v4 = 257 * (-[NSString hash](self->_inputVariant, "hash") + v3);
  v5 = 257 * (-[NSString hash](self->_secondaryLanguage, "hash") + v4);
  v6 = 257 * (-[NSString hash](self->_secondaryRegion, "hash") + v5);
  v7 = 257 * (257 * (-[NSString hash](self->_layoutName, "hash") + v6) + self->_keyboardType);
  v8 = 257 * (v7 + -[NSString hash](self->_keyboardConfiguration, "hash")) + self->_userInterfaceIdiom;
  testingParameters = self->_testingParameters;
  if (testingParameters)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSDictionary allKeys](testingParameters, "allKeys", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          -[NSDictionary objectForKey:](self->_testingParameters, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v15, "hash") + 257 * v8;

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TIKBAnalyticsMetricsContext *v4;
  TIKBAnalyticsMetricsContext *v5;
  TIKBAnalyticsMetricsContext *v6;
  NSString *inputVariant;
  NSString *secondaryLanguage;
  NSString *secondaryRegion;
  NSString *layoutName;
  NSDictionary *testingParameters;
  NSDictionary *v12;
  char v13;
  objc_super v15;

  v4 = (TIKBAnalyticsMetricsContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)TIKBAnalyticsMetricsContext;
    if (-[TIAnalyticsMetricsContext isEqual:](&v15, sel_isEqual_, v6)
      && self->_keyboardType == v6->_keyboardType
      && self->_userInterfaceIdiom == v6->_userInterfaceIdiom
      && ((inputVariant = self->_inputVariant, !((unint64_t)inputVariant | (unint64_t)v6->_inputVariant))
       || -[NSString isEqualToString:](inputVariant, "isEqualToString:"))
      && ((secondaryLanguage = self->_secondaryLanguage,
           !((unint64_t)secondaryLanguage | (unint64_t)v6->_secondaryLanguage))
       || -[NSString isEqualToString:](secondaryLanguage, "isEqualToString:"))
      && ((secondaryRegion = self->_secondaryRegion,
           !((unint64_t)secondaryRegion | (unint64_t)v6->_secondaryRegion))
       || -[NSString isEqualToString:](secondaryRegion, "isEqualToString:"))
      && ((layoutName = self->_layoutName, !((unint64_t)layoutName | (unint64_t)v6->_layoutName))
       || -[NSString isEqualToString:](layoutName, "isEqualToString:")))
    {
      testingParameters = self->_testingParameters;
      v12 = v6->_testingParameters;
      if (testingParameters)
        v13 = -[NSDictionary isEqual:](testingParameters, "isEqual:", v12);
      else
        v13 = v12 == 0;
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

  return v13;
}

- (NSString)keyboardConfiguration
{
  return self->_keyboardConfiguration;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unsigned)keyboardTypeStringToEnum:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Unknown");
  v7[1] = CFSTR("Portrait");
  v7[2] = CFSTR("Landscape");
  v7[3] = CFSTR("Floating,");
  v7[4] = CFSTR("Split");
  v7[5] = CFSTR("Hardware");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "indexOfObject:", v4);

  return v3;
}

+ (id)userInterfaceIdiomToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unspecified");
  else
    return off_1EA100A08[a3];
}

+ (int64_t)userInterfaceIdiomStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Phone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pad")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TV")))
  {
    v4 = 2;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

@end
