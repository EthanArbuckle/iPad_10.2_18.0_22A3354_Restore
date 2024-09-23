@implementation STLocationStatusDomainDataDiff

- (BOOL)isEmpty
{
  BSSettings *changes;
  BSSettings *v4;
  STListDataDiff *locationAttributionListDataDiff;
  BOOL v6;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v4 = changes;
  if (-[BSSettings isEmpty](v4, "isEmpty"))
  {
    if (self)
      locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
    else
      locationAttributionListDataDiff = 0;
    v6 = -[STListDataDiff isEmpty](locationAttributionListDataDiff, "isEmpty");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)applyToMutableData:(id)a3
{
  id v4;
  BSSettings *changes;
  BSSettings *v6;
  STListDataDiff *locationAttributionListDataDiff;
  STListDataDiff *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__STLocationStatusDomainDataDiff_applyToMutableData___block_invoke;
  v11[3] = &unk_1E91E4A88;
  v12 = v4;
  v10 = v4;
  v6 = changes;
  -[BSSettings enumerateObjectsWithBlock:](v6, "enumerateObjectsWithBlock:", v11);
  if (self)
    locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
  else
    locationAttributionListDataDiff = 0;
  v8 = locationAttributionListDataDiff;
  objc_msgSend(v10, "locationAttributionListData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STListDataDiff applyToMutableListData:](v8, "applyToMutableListData:", v9);

}

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  STLocationStatusDomainDataDiff *v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v8 = objc_msgSend(v6, "activeDisplayModes");
  if (objc_msgSend(v5, "activeDisplayModes") != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v9, 0);

  }
  objc_msgSend(v5, "locationAttributionListData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationAttributionListData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[STLocationStatusDomainDataDiff initWithChanges:locationAttributionListDataDiff:]([STLocationStatusDomainDataDiff alloc], "initWithChanges:locationAttributionListDataDiff:", v7, v12);
  return v13;
}

- (STLocationStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  STLocationStatusDomainDataDiff *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationAttributionListDataDiff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[STLocationStatusDomainDataDiff initWithChanges:locationAttributionListDataDiff:](self, "initWithChanges:locationAttributionListDataDiff:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  _QWORD *v5;
  BSSettings *changes;
  BSSettings *v7;
  void *v8;
  void *v9;
  id v10;
  STListDataDiff *locationAttributionListDataDiff;
  uint64_t v12;
  STListDataDiff *v13;
  void *v14;
  STLocationStatusDomainDataDiff *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v7 = changes;
  v8 = (void *)-[BSSettings mutableCopy](v7, "mutableCopy");
  if (v5)
    v9 = (void *)v5[1];
  else
    v9 = 0;
  v10 = v9;
  objc_msgSend(v8, "applySettings:", v10);
  if (!self)
  {
    locationAttributionListDataDiff = 0;
    if (v5)
      goto LABEL_8;
LABEL_15:
    v12 = 0;
    goto LABEL_9;
  }
  locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
  if (!v5)
    goto LABEL_15;
LABEL_8:
  v12 = v5[2];
LABEL_9:
  v13 = locationAttributionListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v13, "diffByApplyingDiff:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[STLocationStatusDomainDataDiff initWithChanges:locationAttributionListDataDiff:]([STLocationStatusDomainDataDiff alloc], "initWithChanges:locationAttributionListDataDiff:", v8, v14);
LABEL_11:

  return v15;
}

- (STLocationStatusDomainDataDiff)initWithChanges:(id)a3 locationAttributionListDataDiff:(id)a4
{
  id v6;
  id v7;
  STLocationStatusDomainDataDiff *v8;
  uint64_t v9;
  BSSettings *changes;
  uint64_t v11;
  STListDataDiff *locationAttributionListDataDiff;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLocationStatusDomainDataDiff;
  v8 = -[STLocationStatusDomainDataDiff init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    changes = v8->_changes;
    v8->_changes = (BSSettings *)v9;

    v11 = objc_msgSend(v7, "copy");
    locationAttributionListDataDiff = v8->_locationAttributionListDataDiff;
    v8->_locationAttributionListDataDiff = (STListDataDiff *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAttributionListDataDiff, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

uint64_t __53__STLocationStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setActiveDisplayModes:", objc_msgSend(a3, "unsignedIntegerValue"));
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  STListDataDiff *locationAttributionListDataDiff;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_changes, CFSTR("changes"));
    locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("changes"));
    locationAttributionListDataDiff = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", locationAttributionListDataDiff, CFSTR("locationAttributionListDataDiff"));

}

- (STLocationStatusDomainDataDiff)init
{
  id v3;
  STListDataDiff *v4;
  STLocationStatusDomainDataDiff *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = objc_alloc_init(STListDataDiff);
  v5 = -[STLocationStatusDomainDataDiff initWithChanges:locationAttributionListDataDiff:](self, "initWithChanges:locationAttributionListDataDiff:", v3, v4);

  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STLocationStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STLocationStatusDomainDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BSSettings *changes;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __42__STLocationStatusDomainDataDiff_isEqual___block_invoke;
  v19[3] = &unk_1E91E4AB0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", changes, v19);
  if (self)
    self = (STLocationStatusDomainDataDiff *)self->_locationAttributionListDataDiff;
  v14 = v7;
  v15 = 3221225472;
  v16 = __42__STLocationStatusDomainDataDiff_isEqual___block_invoke_2;
  v17 = &unk_1E91E4AB0;
  v18 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, &v14);
  v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v12;
}

id __42__STLocationStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __42__STLocationStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 16);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  STListDataDiff *locationAttributionListDataDiff;
  id v7;
  unint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_changes);
    locationAttributionListDataDiff = self->_locationAttributionListDataDiff;
  }
  else
  {
    v10 = (id)objc_msgSend(v3, "appendObject:", 0);
    locationAttributionListDataDiff = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", locationAttributionListDataDiff);
  v8 = objc_msgSend(v4, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[STLocationStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STLocationStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STLocationStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STLocationStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  id *v18;

  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend(a1, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDebugDescription:", a3);
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  objc_msgSend(v6, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __82__STLocationStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v16 = &unk_1E91E4AD8;
  v8 = v6;
  v17 = v8;
  v18 = a1;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, &v13);

  objc_msgSend(a1[1], "objectForSetting:", 0, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    STLocationStatusDomainLocationAttributionDisplayModeMaskDescription(objc_msgSend(0, "unsignedIntegerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:withName:", v10, CFSTR("activeDisplayModes"));

  }
  v11 = v8;

  return v11;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STLocationStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 0);
}

id __82__STLocationStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0, 1);
}

@end
