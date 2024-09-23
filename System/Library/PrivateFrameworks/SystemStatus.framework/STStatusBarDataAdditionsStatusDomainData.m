@implementation STStatusBarDataAdditionsStatusDomainData

- (STStatusBarDataAdditionsStatusDomainData)init
{
  STDictionaryData *v3;
  STStatusBarDataAdditionsStatusDomainData *v4;

  v3 = objc_alloc_init(STDictionaryData);
  v4 = -[STStatusBarDataAdditionsStatusDomainData initWithEntryDictionaryData:](self, "initWithEntryDictionaryData:", v3);

  return v4;
}

- (id)initWithData:(void *)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "entryDictionaryData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v2, "initWithEntryDictionaryData:", v3);

  }
  return v2;
}

- (STStatusBarDataAdditionsStatusDomainData)initWithEntryDictionaryData:(id)a3
{
  void *v4;
  STStatusBarDataAdditionsStatusDomainData *v5;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = (STStatusBarDataAdditionsStatusDomainData *)-[STStatusBarDataAdditionsStatusDomainData _initWithEntryDictionaryData:]((id *)&self->super.isa, v4);

  return v5;
}

- (id)_initWithEntryDictionaryData:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STStatusBarDataAdditionsStatusDomainData;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__STStatusBarDataAdditionsStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E91E4AB0;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

  LOBYTE(v6) = objc_msgSend(v5, "isEqual");
  return (char)v6;
}

uint64_t __52__STStatusBarDataAdditionsStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "entryDictionaryData");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (NSString)description
{
  return (NSString *)-[STStatusBarDataAdditionsStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (STStatusBarDataStringEntry)personNameEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("personNameEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataStringEntry *)v3;
}

- (STStatusBarDataBluetoothEntry)bluetoothEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("bluetoothEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataBluetoothEntry *)v3;
}

- (STStatusBarDataThermalEntry)thermalEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("thermalEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataThermalEntry *)v3;
}

- (STStatusBarDataActivityEntry)activityEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("activityEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataActivityEntry *)v3;
}

- (STStatusBarDataTetheringEntry)tetheringEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tetheringEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataTetheringEntry *)v3;
}

- (STStatusBarDataLockEntry)lockEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lockEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataLockEntry *)v3;
}

- (STStatusBarDataQuietModeEntry)focusModeEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("focusModeEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataQuietModeEntry *)v3;
}

- (STStatusBarDataBoolEntry)ringerSilenceEntry
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ringerSilenceEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STStatusBarDataBoolEntry *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STStatusBarDataAdditionsStatusDomainData initWithData:](+[STMutableStatusBarDataAdditionsStatusDomainData allocWithZone:](STMutableStatusBarDataAdditionsStatusDomainData, "allocWithZone:", a3), self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusBarDataAdditionsStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarDataAdditionsStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __92__STStatusBarDataAdditionsStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    v3 = v7;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusBarDataAdditionsStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __92__STStatusBarDataAdditionsStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "entryDictionaryData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", v3, 0, 1);

}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STStatusBarDataAdditionsStatusDomainDataDiff diffFromData:toData:](STStatusBarDataAdditionsStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEmpty"))
    {
      v5 = (void *)-[STStatusBarDataAdditionsStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STStatusBarDataAdditionsStatusDomainData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](self, "entryDictionaryData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entryDictionaryData"));

}

- (id)_expectedClassForKey:(id)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    if (_MergedGlobals_8 != -1)
      dispatch_once(&_MergedGlobals_8, &__block_literal_global_9);
    v4 = (void *)objc_msgSend((id)qword_1ED0CB420, "objectForKeyedSubscript:", v3);
    if (!v4)
      v4 = (void *)objc_opt_class();
    a1 = v4;
  }

  return a1;
}

void __65__STStatusBarDataAdditionsStatusDomainData__expectedClassForKey___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("activityEntry");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("bluetoothEntry");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("focusModeEntry");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("lockEntry");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("personNameEntry");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("tetheringEntry");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("thermalEntry");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("ringerSilenceEntry");
  v3[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0CB420;
  qword_1ED0CB420 = v0;

}

- (STStatusBarDataAdditionsStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STStatusBarDataAdditionsStatusDomainData *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  STStatusBarDataAdditionsStatusDomainData *v9;
  _QWORD v11[4];
  STStatusBarDataAdditionsStatusDomainData *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryDictionaryData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke;
  v11[3] = &unk_1E91E5598;
  v6 = self;
  v12 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E6508](v11);
  ((void (**)(_QWORD, void *))v7)[2](v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v6 = -[STStatusBarDataAdditionsStatusDomainData initWithEntryDictionaryData:](v6, "initWithEntryDictionaryData:", v8);
    v9 = v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke_2;
  v6[3] = &unk_1E91E5570;
  v7 = *(id *)(a1 + 32);
  v8 = &v9;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (*((_BYTE *)v10 + 24))
    v4 = 0;
  else
    v4 = v3;

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a3;
  v7 = -[STStatusBarDataAdditionsStatusDomainData _expectedClassForKey:](*(id *)(a1 + 32), a2);
  if (!a2 || (objc_msgSend(v7, "isEqual:", objc_opt_class()) & 1) != 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (STDictionaryData)entryDictionaryData
{
  return self->_entryDictionaryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryDictionaryData, 0);
}

@end
