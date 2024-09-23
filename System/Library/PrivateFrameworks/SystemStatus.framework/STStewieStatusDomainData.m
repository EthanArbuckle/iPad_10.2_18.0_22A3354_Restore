@implementation STStewieStatusDomainData

- (STStewieStatusDomainData)init
{
  return (STStewieStatusDomainData *)-[STStewieStatusDomainData initWithData:](self, 0);
}

- (id)initWithData:(id)result
{
  void *v2;
  id v3;
  char v4;
  char v5;
  objc_super v6;

  if (result)
  {
    v2 = result;
    v3 = a2;
    v4 = objc_msgSend(v3, "isStewieActive");
    v5 = objc_msgSend(v3, "isStewieConnected");

    v6.receiver = v2;
    v6.super_class = (Class)STStewieStatusDomainData;
    result = objc_msgSendSuper2(&v6, sel_init);
    if (result)
    {
      *((_BYTE *)result + 8) = v4;
      *((_BYTE *)result + 9) = v5;
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
  uint64_t v10;
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
  v6 = -[STStewieStatusDomainData isStewieActive](self, "isStewieActive");
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __36__STStewieStatusDomainData_isEqual___block_invoke;
  v19[3] = &unk_1E91E4B28;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v19);
  v10 = -[STStewieStatusDomainData isStewieConnected](self, "isStewieConnected");
  v14 = v7;
  v15 = 3221225472;
  v16 = __36__STStewieStatusDomainData_isEqual___block_invoke_2;
  v17 = &unk_1E91E4B28;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, &v14);
  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v10;
}

uint64_t __36__STStewieStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isStewieActive");
}

uint64_t __36__STStewieStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isStewieConnected");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STStewieStatusDomainData isStewieActive](self, "isStewieActive"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[STStewieStatusDomainData isStewieConnected](self, "isStewieConnected"));
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)-[STStewieStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STStewieStatusDomainData initWithData:](+[STMutableStewieStatusDomainData allocWithZone:](STMutableStewieStatusDomainData, "allocWithZone:", a3), self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStewieStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStewieStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStewieStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __76__STStewieStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStewieStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __76__STStewieStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isStewieActive"), CFSTR("stewieActive"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isStewieConnected"), CFSTR("stewieConnected"));
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STStewieStatusDomainDataDiff diffFromData:toData:](STStewieStatusDomainDataDiff, "diffFromData:toData:", v4, self);
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
      v5 = (void *)-[STStewieStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STStewieStatusDomainData mutableCopy](self, "mutableCopy");
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
  objc_msgSend(v4, "encodeBool:forKey:", -[STStewieStatusDomainData isStewieActive](self, "isStewieActive"), CFSTR("stewieActive"));
  objc_msgSend(v4, "encodeBool:forKey:", -[STStewieStatusDomainData isStewieConnected](self, "isStewieConnected"), CFSTR("stewieConnected"));

}

- (STStewieStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  char v5;
  char v6;
  STStewieStatusDomainData *result;
  objc_super v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stewieActive"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stewieConnected"));

  if (!self)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)STStewieStatusDomainData;
  result = -[STStewieStatusDomainData init](&v8, sel_init);
  if (result)
  {
    result->_stewieActive = v5;
    result->_stewieConnected = v6;
  }
  return result;
}

- (BOOL)isStewieActive
{
  return self->_stewieActive;
}

- (BOOL)isStewieConnected
{
  return self->_stewieConnected;
}

@end
