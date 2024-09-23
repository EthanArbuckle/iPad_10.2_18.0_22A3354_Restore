@implementation STFocusStatusDomainData

- (STFocusStatusDomainData)init
{
  return (STFocusStatusDomainData *)-[STFocusStatusDomainData initWithData:]((id *)&self->super.isa, 0);
}

- (id)initWithData:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "modeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modeSymbol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = -[STFocusStatusDomainData initWithModeIdentifier:modeName:modeSymbol:](v2, v4, v5, v6);
  }
  return v2;
}

- (id)initWithModeIdentifier:(void *)a3 modeName:(void *)a4 modeSymbol:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)STFocusStatusDomainData;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
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
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFocusStatusDomainData modeIdentifier](self, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __35__STFocusStatusDomainData_isEqual___block_invoke;
  v21[3] = &unk_1E91E4B00;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v21);

  -[STFocusStatusDomainData modeName](self, "modeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __35__STFocusStatusDomainData_isEqual___block_invoke_2;
  v19[3] = &unk_1E91E4B00;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v19);

  -[STFocusStatusDomainData modeSymbol](self, "modeSymbol");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __35__STFocusStatusDomainData_isEqual___block_invoke_3;
  v17[3] = &unk_1E91E4B00;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", v13, v17);

  LOBYTE(v13) = objc_msgSend(v5, "isEqual");
  return (char)v13;
}

uint64_t __35__STFocusStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modeIdentifier");
}

uint64_t __35__STFocusStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modeName");
}

uint64_t __35__STFocusStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "modeSymbol");
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
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFocusStatusDomainData modeIdentifier](self, "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STFocusStatusDomainData modeName](self, "modeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[STFocusStatusDomainData modeSymbol](self, "modeSymbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendString:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

- (NSString)description
{
  return (NSString *)-[STFocusStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STFocusStatusDomainData initWithData:]((id *)+[STMutableFocusStatusDomainData allocWithZone:](STMutableFocusStatusDomainData, "allocWithZone:", a3), self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STFocusStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STFocusStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STFocusStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __75__STFocusStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STFocusStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __75__STFocusStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "modeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("modeIdentifier"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "modeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("modeName"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "modeSymbol");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("modeSymbol"));

}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STFocusStatusDomainDataDiff diffFromData:toData:](STFocusStatusDomainDataDiff, "diffFromData:toData:", v4, self);
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
      v5 = (void *)-[STFocusStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STFocusStatusDomainData mutableCopy](self, "mutableCopy");
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
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[STFocusStatusDomainData modeIdentifier](self, "modeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("modeIdentifier"));

  -[STFocusStatusDomainData modeName](self, "modeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modeName"));

  -[STFocusStatusDomainData modeSymbol](self, "modeSymbol");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("modeSymbol"));

}

- (STFocusStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STFocusStatusDomainData *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeSymbol"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (STFocusStatusDomainData *)-[STFocusStatusDomainData initWithModeIdentifier:modeName:modeSymbol:]((id *)&self->super.isa, v5, v6, v7);
  return v8;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSString)modeName
{
  return self->_modeName;
}

- (NSString)modeSymbol
{
  return self->_modeSymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSymbol, 0);
  objc_storeStrong((id *)&self->_modeName, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end
