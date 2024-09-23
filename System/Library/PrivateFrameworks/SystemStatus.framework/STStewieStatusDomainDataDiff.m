@implementation STStewieStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "isStewieActive");
  if ((_DWORD)v7 == objc_msgSend(v5, "isStewieActive"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v6, "isStewieConnected");
  if ((_DWORD)v9 == objc_msgSend(v5, "isStewieConnected"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = -[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:]([STStewieStatusDomainDataDiff alloc], v8, v10);

  return v11;
}

- (_QWORD)initWithStewieActiveChangedValue:(void *)a3 stewieConnectedChangedValue:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STStewieStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (STStewieStatusDomainDataDiff)init
{
  return (STStewieStatusDomainDataDiff *)-[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:](self, 0, 0);
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STStewieStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (void)applyToMutableData:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  NSNumber *v7;
  id v8;

  v8 = a3;
  if (self)
  {
    v4 = self->_stewieActiveChangedValue;
    v5 = v4;
    if (v4)
      objc_msgSend(v8, "setStewieActive:", -[NSNumber BOOLValue](v4, "BOOLValue"));
    v6 = self->_stewieConnectedChangedValue;
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v8, "setStewieConnected:", -[NSNumber BOOLValue](v6, "BOOLValue"));

    }
  }
  else
  {
    v5 = 0;
  }

}

- (BOOL)isEmpty
{
  NSNumber *v3;
  BOOL v4;
  NSNumber *stewieConnectedChangedValue;

  if (!self)
  {
    stewieConnectedChangedValue = 0;
    goto LABEL_5;
  }
  v3 = self->_stewieActiveChangedValue;
  if (!v3)
  {
    stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
LABEL_5:
    v3 = 0;
    v4 = stewieConnectedChangedValue == 0;
    goto LABEL_6;
  }
  v4 = 0;
LABEL_6:

  return v4;
}

- (id)diffByApplyingDiff:(id)a3
{
  id *v4;
  NSNumber *v5;
  NSNumber *stewieActiveChangedValue;
  NSNumber *v7;
  NSNumber *stewieConnectedChangedValue;
  _QWORD *v9;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((!v4 || (v5 = (NSNumber *)v4[1]) == 0)
      && (!self ? (stewieActiveChangedValue = 0) : (stewieActiveChangedValue = self->_stewieActiveChangedValue),
          v5 = stewieActiveChangedValue,
          !v4)
      || (v7 = (NSNumber *)v4[2]) == 0)
    {
      if (self)
        stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
      else
        stewieConnectedChangedValue = 0;
      v7 = stewieConnectedChangedValue;
    }
    v9 = -[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:]([STStewieStatusDomainDataDiff alloc], v5, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STStewieStatusDomainDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSNumber *stewieActiveChangedValue;
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
    stewieActiveChangedValue = self->_stewieActiveChangedValue;
  else
    stewieActiveChangedValue = 0;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__STStewieStatusDomainDataDiff_isEqual___block_invoke;
  v19[3] = &unk_1E91E4AB0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", stewieActiveChangedValue, v19);
  if (self)
    self = (STStewieStatusDomainDataDiff *)self->_stewieConnectedChangedValue;
  v14 = v7;
  v15 = 3221225472;
  v16 = __40__STStewieStatusDomainDataDiff_isEqual___block_invoke_2;
  v17 = &unk_1E91E4AB0;
  v18 = v8;
  v10 = v8;
  v11 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, &v14);
  v12 = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v12;
}

id __40__STStewieStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __40__STStewieStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
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
  NSNumber *stewieConnectedChangedValue;
  id v7;
  unint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_stewieActiveChangedValue);
    stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
  }
  else
  {
    v10 = (id)objc_msgSend(v3, "appendObject:", 0);
    stewieConnectedChangedValue = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", stewieConnectedChangedValue);
  v8 = objc_msgSend(v4, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[STStewieStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *stewieConnectedChangedValue;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_stewieActiveChangedValue, CFSTR("stewieActiveChangedValue"));
    stewieConnectedChangedValue = self->_stewieConnectedChangedValue;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("stewieActiveChangedValue"));
    stewieConnectedChangedValue = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", stewieConnectedChangedValue, CFSTR("stewieConnectedChangedValue"));

}

- (STStewieStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STStewieStatusDomainDataDiff *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stewieActiveChangedValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stewieConnectedChangedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (STStewieStatusDomainDataDiff *)-[STStewieStatusDomainDataDiff initWithStewieActiveChangedValue:stewieConnectedChangedValue:](self, v5, v6);
  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStewieStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStewieStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStewieStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __80__STStewieStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStewieStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __80__STStewieStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD *v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v2)
    v2 = (_QWORD *)v2[1];
  v4 = v2;
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v4, "BOOLValue"), CFSTR("stewieActiveChanged"));

  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD **)(a1 + 40);
  if (v6)
    v6 = (_QWORD *)v6[2];
  v9 = v6;
  v8 = (id)objc_msgSend(v7, "appendBool:withName:", objc_msgSend(v9, "BOOLValue"), CFSTR("stewieConnectedChanged"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieConnectedChangedValue, 0);
  objc_storeStrong((id *)&self->_stewieActiveChangedValue, 0);
}

@end
