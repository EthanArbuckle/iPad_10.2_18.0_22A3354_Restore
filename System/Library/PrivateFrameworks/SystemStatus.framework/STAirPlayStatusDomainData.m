@implementation STAirPlayStatusDomainData

- (STAirPlayStatusDomainData)init
{
  return (STAirPlayStatusDomainData *)-[STAirPlayStatusDomainData initWithData:]((id *)&self->super.isa, 0);
}

- (id)initWithData:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = (void *)objc_msgSend(v3, "airPlayState");
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = -[STAirPlayStatusDomainData initWithAirPlayState:bundleIdentifier:](v2, v4, v5);
  }
  return v2;
}

- (id)initWithAirPlayState:(void *)a3 bundleIdentifier:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)STAirPlayStatusDomainData;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STAirPlayStatusDomainData airPlayState](self, "airPlayState");
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__STAirPlayStatusDomainData_isEqual___block_invoke;
  v19[3] = &unk_1E91E5108;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v19);
  -[STAirPlayStatusDomainData bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = 3221225472;
  v16 = __37__STAirPlayStatusDomainData_isEqual___block_invoke_2;
  v17 = &unk_1E91E4B00;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, &v14);

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

uint64_t __37__STAirPlayStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "airPlayState");
}

uint64_t __37__STAirPlayStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STAirPlayStatusDomainData airPlayState](self, "airPlayState"));
  -[STAirPlayStatusDomainData bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendString:", v5);

  v7 = objc_msgSend(v3, "hash");
  return v7;
}

- (NSString)description
{
  return (NSString *)-[STAirPlayStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STAirPlayStatusDomainData initWithData:]((id *)+[STMutableAirPlayStatusDomainData allocWithZone:](STMutableAirPlayStatusDomainData, "allocWithZone:", a3), self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STAirPlayStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STAirPlayStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STAirPlayStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __77__STAirPlayStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STAirPlayStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __77__STAirPlayStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "airPlayState");
  if (v3 > 2)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E91E5A68[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("airPlayState"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("bundleIdentifier"));

}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STAirPlayStatusDomainDataDiff diffFromData:toData:](STAirPlayStatusDomainDataDiff, "diffFromData:toData:", v4, self);
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
      v5 = (void *)-[STAirPlayStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STAirPlayStatusDomainData mutableCopy](self, "mutableCopy");
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[STAirPlayStatusDomainData airPlayState](self, "airPlayState"), CFSTR("airPlayState"));
  -[STAirPlayStatusDomainData bundleIdentifier](self, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

}

- (STAirPlayStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STAirPlayStatusDomainData *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("airPlayState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (STAirPlayStatusDomainData *)-[STAirPlayStatusDomainData initWithAirPlayState:bundleIdentifier:]((id *)&self->super.isa, v5, v6);
  return v7;
}

- (unint64_t)airPlayState
{
  return self->_airPlayState;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
