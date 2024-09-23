@implementation STPlaygroundsStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  _QWORD *v9;

  v5 = a3;
  v6 = objc_msgSend(a4, "isPlaygroundsActive");
  v7 = objc_msgSend(v5, "isPlaygroundsActive");

  if ((_DWORD)v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:]([STPlaygroundsStatusDomainDataDiff alloc], v8);

  return v9;
}

- (_QWORD)initWithPlaygroundsActiveChangedValue:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STPlaygroundsStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (STPlaygroundsStatusDomainDataDiff)init
{
  return (STPlaygroundsStatusDomainDataDiff *)-[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:](self, 0);
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STPlaygroundsStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (void)applyToMutableData:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  id v6;

  v6 = a3;
  if (self)
  {
    v4 = self->_playgroundsActiveChangedValue;
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v6, "setPlaygroundsActive:", -[NSNumber BOOLValue](v4, "BOOLValue"));

    }
  }

}

- (BOOL)isEmpty
{
  NSNumber *playgroundsActiveChangedValue;

  if (self)
    playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
  else
    playgroundsActiveChangedValue = 0;
  return playgroundsActiveChangedValue == 0;
}

- (id)diffByApplyingDiff:(id)a3
{
  id *v4;
  NSNumber *v5;
  NSNumber *playgroundsActiveChangedValue;
  _QWORD *v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v4 || (v5 = (NSNumber *)v4[1]) == 0)
    {
      if (self)
        playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
      else
        playgroundsActiveChangedValue = 0;
      v5 = playgroundsActiveChangedValue;
    }
    v7 = -[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:]([STPlaygroundsStatusDomainDataDiff alloc], v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STPlaygroundsStatusDomainDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (STPlaygroundsStatusDomainDataDiff *)self->_playgroundsActiveChangedValue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__STPlaygroundsStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E91E4AB0;
  v11 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, v10);
  v8 = objc_msgSend(v5, "isEqual");

  return v8;
}

id __45__STPlaygroundsStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  NSNumber *playgroundsActiveChangedValue;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
    playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
  else
    playgroundsActiveChangedValue = 0;
  v6 = (id)objc_msgSend(v3, "appendObject:", playgroundsActiveChangedValue);
  v7 = objc_msgSend(v4, "hash");

  return v7;
}

- (NSString)description
{
  return (NSString *)-[STPlaygroundsStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *playgroundsActiveChangedValue;

  if (self)
    playgroundsActiveChangedValue = self->_playgroundsActiveChangedValue;
  else
    playgroundsActiveChangedValue = 0;
  objc_msgSend(a3, "encodeObject:forKey:", playgroundsActiveChangedValue, CFSTR("playgroundsActiveChangedValue"));
}

- (STPlaygroundsStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STPlaygroundsStatusDomainDataDiff *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playgroundsActiveChangedValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (STPlaygroundsStatusDomainDataDiff *)-[STPlaygroundsStatusDomainDataDiff initWithPlaygroundsActiveChangedValue:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STPlaygroundsStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STPlaygroundsStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STPlaygroundsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __85__STPlaygroundsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STPlaygroundsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __85__STPlaygroundsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;
  _QWORD *v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 40);
  if (v1)
    v1 = (_QWORD *)v1[1];
  v4 = v1;
  v3 = (id)objc_msgSend(v2, "appendBool:withName:", objc_msgSend(v4, "BOOLValue"), CFSTR("playgroundsActiveChanged"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playgroundsActiveChangedValue, 0);
}

@end
