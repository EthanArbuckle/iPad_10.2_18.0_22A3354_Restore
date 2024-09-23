@implementation STVoiceControlStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v8 = objc_msgSend(v6, "isVoiceControlActive");
  if (v8 != objc_msgSend(v5, "isVoiceControlActive"))
    objc_msgSend(v7, "setFlag:forSetting:", BSSettingFlagForBool(), 0);
  v9 = objc_msgSend(v6, "listeningState");
  if (objc_msgSend(v5, "listeningState") != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v10, 1);

  }
  v11 = -[STVoiceControlStatusDomainDataDiff initWithChanges:]([STVoiceControlStatusDomainDataDiff alloc], v7);

  return v11;
}

- (_QWORD)initWithChanges:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STVoiceControlStatusDomainDataDiff;
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

- (STVoiceControlStatusDomainDataDiff)init
{
  id v3;
  STVoiceControlStatusDomainDataDiff *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = (STVoiceControlStatusDomainDataDiff *)-[STVoiceControlStatusDomainDataDiff initWithChanges:](self, v3);

  return v4;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STVoiceControlStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (void)applyToMutableData:(id)a3
{
  id v4;
  BSSettings *changes;
  uint64_t v6;
  id v7;
  BSSettings *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke;
  v12[3] = &unk_1E91E4D50;
  v7 = v4;
  v13 = v7;
  v8 = changes;
  -[BSSettings enumerateFlagsWithBlock:](v8, "enumerateFlagsWithBlock:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke_2;
  v10[3] = &unk_1E91E4A88;
  v11 = v7;
  v9 = v7;
  -[BSSettings enumerateObjectsWithBlock:](v8, "enumerateObjectsWithBlock:", v10);

}

uint64_t __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setVoiceControlActive:", BSSettingFlagIsYes());
  return result;
}

uint64_t __57__STVoiceControlStatusDomainDataDiff_applyToMutableData___block_invoke_2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "setListeningState:", objc_msgSend(a3, "unsignedIntegerValue"));
  return result;
}

- (BOOL)isEmpty
{
  if (self)
    self = (STVoiceControlStatusDomainDataDiff *)self->_changes;
  return -[STVoiceControlStatusDomainDataDiff isEmpty](self, "isEmpty");
}

- (id)diffByApplyingDiff:(id)a3
{
  _QWORD *v4;
  BSSettings *changes;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      changes = self->_changes;
    else
      changes = 0;
    v6 = (void *)-[BSSettings mutableCopy](changes, "mutableCopy");
    v7 = v6;
    if (v4)
      v8 = v4[1];
    else
      v8 = 0;
    objc_msgSend(v6, "applySettings:", v8);
    v9 = -[STVoiceControlStatusDomainDataDiff initWithChanges:]([STVoiceControlStatusDomainDataDiff alloc], v7);

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
  if (-[STVoiceControlStatusDomainDataDiff isEmpty](self, "isEmpty"))
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
    self = (STVoiceControlStatusDomainDataDiff *)self->_changes;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__STVoiceControlStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E91E4AB0;
  v11 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, v10);
  v8 = objc_msgSend(v5, "isEqual");

  return v8;
}

id __46__STVoiceControlStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
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
  BSSettings *changes;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v6 = (id)objc_msgSend(v3, "appendObject:", changes);
  v7 = objc_msgSend(v4, "hash");

  return v7;
}

- (NSString)description
{
  return (NSString *)-[STVoiceControlStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BSSettings *changes;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  objc_msgSend(a3, "encodeObject:forKey:", changes, CFSTR("changes"));
}

- (STVoiceControlStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STVoiceControlStatusDomainDataDiff *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (STVoiceControlStatusDomainDataDiff *)-[STVoiceControlStatusDomainDataDiff initWithChanges:](self, v5);
  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STVoiceControlStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STVoiceControlStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STVoiceControlStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(a1, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

    v7 = a1[1];
    v8 = (id)objc_msgSend(v6, "appendFlag:withName:skipIfNotSet:", objc_msgSend(v7, "flagForSetting:", 0), CFSTR("voiceControlActive"), 1);
    objc_msgSend(v7, "objectForSetting:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      STVoiceControlStatusDomainListeningStateDescription(objc_msgSend(v9, "unsignedIntegerValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:withName:", v10, CFSTR("listeningState"));

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STVoiceControlStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:]((id *)&self->super.isa, a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
