@implementation _SBSystemStatusStatusBarOverridesArchiveRecord

- (_SBSystemStatusStatusBarOverridesArchiveRecord)initWithStatusBarData:(id)a3 andSuppressedBackgroundActivityIdentifiers:(id)a4
{
  id v7;
  id v8;
  _SBSystemStatusStatusBarOverridesArchiveRecord *v9;
  uint64_t v10;
  STStatusBarData *statusBarData;
  uint64_t v12;
  NSSet *suppressedBackgroundActivityIdentifiers;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  _SBSystemStatusStatusBarOverridesArchiveRecord *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[_SBSystemStatusStatusBarOverridesArchiveRecord init](self, "init");
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    statusBarData = v9->_statusBarData;
    v9->_statusBarData = (STStatusBarData *)v10;

    v12 = objc_msgSend(v8, "copy");
    suppressedBackgroundActivityIdentifiers = v9->_suppressedBackgroundActivityIdentifiers;
    v9->_suppressedBackgroundActivityIdentifiers = (NSSet *)v12;

  }
  if (-[_SBSystemStatusStatusBarOverridesArchiveRecord isEmpty](v9, "isEmpty"))
  {
    SBLogStatusBarish();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%@ is empty! %@", (uint8_t *)&v17, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEmpty
{
  STStatusBarData *statusBarData;
  int v4;
  NSSet *suppressedBackgroundActivityIdentifiers;

  statusBarData = self->_statusBarData;
  if (!statusBarData || (v4 = -[STStatusBarData isEmpty](statusBarData, "isEmpty")) != 0)
  {
    suppressedBackgroundActivityIdentifiers = self->_suppressedBackgroundActivityIdentifiers;
    if (suppressedBackgroundActivityIdentifiers)
      LOBYTE(v4) = -[NSSet count](suppressedBackgroundActivityIdentifiers, "count") == 0;
    else
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)recordByApplyingRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[_SBSystemStatusStatusBarOverridesArchiveRecord statusBarData](self, "statusBarData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataByApplyingOverlay:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SBSystemStatusStatusBarOverridesArchiveRecord suppressedBackgroundActivityIdentifiers](self, "suppressedBackgroundActivityIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suppressedBackgroundActivityIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStatusBarData:andSuppressedBackgroundActivityIdentifiers:", v7, v10);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[_SBSystemStatusStatusBarOverridesArchiveRecord statusBarData](self, "statusBarData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke;
  v20[3] = &unk_1E8EA4320;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", v7, v20);

  -[_SBSystemStatusStatusBarOverridesArchiveRecord suppressedBackgroundActivityIdentifiers](self, "suppressedBackgroundActivityIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = 3221225472;
  v17 = __58___SBSystemStatusStatusBarOverridesArchiveRecord_isEqual___block_invoke_2;
  v18 = &unk_1E8EA4320;
  v19 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", v11, &v15);

  LOBYTE(v11) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);
  return (char)v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBSystemStatusStatusBarOverridesArchiveRecord statusBarData](self, "statusBarData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[_SBSystemStatusStatusBarOverridesArchiveRecord suppressedBackgroundActivityIdentifiers](self, "suppressedBackgroundActivityIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (id)description
{
  return -[_SBSystemStatusStatusBarOverridesArchiveRecord descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_SBSystemStatusStatusBarOverridesArchiveRecord statusBarData](self, "statusBarData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("statusBarData"));

  -[_SBSystemStatusStatusBarOverridesArchiveRecord suppressedBackgroundActivityIdentifiers](self, "suppressedBackgroundActivityIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("suppressedBackgroundActivityIdentifiers"));

}

- (_SBSystemStatusStatusBarOverridesArchiveRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SBSystemStatusStatusBarOverridesArchiveRecord *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusBarData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("suppressedBackgroundActivityIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_SBSystemStatusStatusBarOverridesArchiveRecord initWithStatusBarData:andSuppressedBackgroundActivityIdentifiers:](self, "initWithStatusBarData:andSuppressedBackgroundActivityIdentifiers:", v5, v9);
  return v10;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBSystemStatusStatusBarOverridesArchiveRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[_SBSystemStatusStatusBarOverridesArchiveRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBSystemStatusStatusBarOverridesArchiveRecord _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[_SBSystemStatusStatusBarOverridesArchiveRecord _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _SBSystemStatusStatusBarOverridesArchiveRecord *v13;

  v4 = a4;
  v6 = a3;
  -[_SBSystemStatusStatusBarOverridesArchiveRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98___SBSystemStatusStatusBarOverridesArchiveRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E8E9E820;
  v8 = v7;
  v12 = v8;
  v13 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v11);

  v9 = v8;
  return v9;
}

- (STStatusBarData)statusBarData
{
  return self->_statusBarData;
}

- (void)setStatusBarData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)suppressedBackgroundActivityIdentifiers
{
  return self->_suppressedBackgroundActivityIdentifiers;
}

- (void)setSuppressedBackgroundActivityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressedBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_statusBarData, 0);
}

@end
