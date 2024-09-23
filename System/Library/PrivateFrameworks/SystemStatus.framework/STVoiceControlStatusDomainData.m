@implementation STVoiceControlStatusDomainData

- (STVoiceControlStatusDomainData)init
{
  return (STVoiceControlStatusDomainData *)-[STVoiceControlStatusDomainData initWithData:](self, 0);
}

- (id)initWithData:(id)result
{
  void *v2;
  id v3;
  char v4;
  uint64_t v5;
  objc_super v6;

  if (result)
  {
    v2 = result;
    v3 = a2;
    v4 = objc_msgSend(v3, "isVoiceControlActive");
    v5 = objc_msgSend(v3, "listeningState");

    v6.receiver = v2;
    v6.super_class = (Class)STVoiceControlStatusDomainData;
    result = objc_msgSendSuper2(&v6, sel_init);
    if (result)
    {
      *((_BYTE *)result + 8) = v4;
      *((_QWORD *)result + 2) = v5;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
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
  v6 = -[STVoiceControlStatusDomainData isVoiceControlActive](self, "isVoiceControlActive");
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __42__STVoiceControlStatusDomainData_isEqual___block_invoke;
  v19[3] = &unk_1E91E4B28;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v19);
  v10 = -[STVoiceControlStatusDomainData listeningState](self, "listeningState");
  v14 = v7;
  v15 = 3221225472;
  v16 = __42__STVoiceControlStatusDomainData_isEqual___block_invoke_2;
  v17 = &unk_1E91E5108;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v10, &v14);
  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v10;
}

uint64_t __42__STVoiceControlStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isVoiceControlActive");
}

uint64_t __42__STVoiceControlStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "listeningState");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STVoiceControlStatusDomainData isVoiceControlActive](self, "isVoiceControlActive"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STVoiceControlStatusDomainData listeningState](self, "listeningState"));
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)-[STVoiceControlStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STVoiceControlStatusDomainData initWithData:](+[STMutableVoiceControlStatusDomainData allocWithZone:](STMutableVoiceControlStatusDomainData, "allocWithZone:", a3), self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STVoiceControlStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STVoiceControlStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STVoiceControlStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __82__STVoiceControlStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STVoiceControlStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

uint64_t __82__STVoiceControlStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isVoiceControlActive"), CFSTR("voiceControlActive"));
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "listeningState");
  if (v4 > 2)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E91E5C08[v4];
  return objc_msgSend(v3, "appendString:withName:", v5, CFSTR("listeningState"));
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STVoiceControlStatusDomainDataDiff diffFromData:toData:](STVoiceControlStatusDomainDataDiff, "diffFromData:toData:", v4, self);
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
      v5 = (void *)-[STVoiceControlStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STVoiceControlStatusDomainData mutableCopy](self, "mutableCopy");
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

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STVoiceControlStatusDomainData isVoiceControlActive](self, "isVoiceControlActive"), CFSTR("voiceControlActive"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[STVoiceControlStatusDomainData listeningState](self, "listeningState"), CFSTR("listeningState"));

}

- (STVoiceControlStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  char v5;
  unint64_t v6;
  STVoiceControlStatusDomainData *result;
  objc_super v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("voiceControlActive"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("listeningState"));

  if (!self)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)STVoiceControlStatusDomainData;
  result = -[STVoiceControlStatusDomainData init](&v8, sel_init);
  if (result)
  {
    result->_voiceControlActive = v5;
    result->_listeningState = v6;
  }
  return result;
}

- (BOOL)isVoiceControlActive
{
  return self->_voiceControlActive;
}

- (unint64_t)listeningState
{
  return self->_listeningState;
}

@end
