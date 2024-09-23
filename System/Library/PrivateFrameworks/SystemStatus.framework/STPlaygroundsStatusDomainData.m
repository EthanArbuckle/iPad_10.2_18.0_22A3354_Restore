@implementation STPlaygroundsStatusDomainData

- (STPlaygroundsStatusDomainData)init
{
  STPlaygroundsStatusDomainData *v2;
  char v3;
  objc_super v4;

  if (self)
  {
    v2 = self;
    v3 = objc_msgSend(0, "isPlaygroundsActive");
    v4.receiver = v2;
    v4.super_class = (Class)STPlaygroundsStatusDomainData;
    self = -[STPlaygroundsStatusDomainData init](&v4, sel_init);
    if (self)
      self->_playgroundsActive = v3;
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STPlaygroundsStatusDomainData isPlaygroundsActive](self, "isPlaygroundsActive");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__STPlaygroundsStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E91E4B28;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v10);
  LOBYTE(v6) = objc_msgSend(v5, "isEqual");

  return v6;
}

uint64_t __41__STPlaygroundsStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPlaygroundsActive");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STPlaygroundsStatusDomainData isPlaygroundsActive](self, "isPlaygroundsActive"));
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)description
{
  return (NSString *)-[STPlaygroundsStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result;
  id v5;
  BOOL v6;
  objc_super v7;

  result = +[STMutablePlaygroundsStatusDomainData allocWithZone:](STMutablePlaygroundsStatusDomainData, "allocWithZone:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[STPlaygroundsStatusDomainData isPlaygroundsActive](self, "isPlaygroundsActive");
    v7.receiver = v5;
    v7.super_class = (Class)STPlaygroundsStatusDomainData;
    result = -[STPlaygroundsStatusDomainData init](&v7, sel_init);
    if (result)
      *((_BYTE *)result + 8) = v6;
  }
  return result;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STPlaygroundsStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STPlaygroundsStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STPlaygroundsStatusDomainData *v11;

  v4 = a3;
  -[STPlaygroundsStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__STPlaygroundsStatusDomainData_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E91E4AD8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __71__STPlaygroundsStatusDomainData_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPlaygroundsActive"), CFSTR("playgroundsActive"));
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STPlaygroundsStatusDomainDataDiff diffFromData:toData:](STPlaygroundsStatusDomainDataDiff, "diffFromData:toData:", v4, self);
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
      v5 = (void *)-[STPlaygroundsStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STPlaygroundsStatusDomainData mutableCopy](self, "mutableCopy");
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
  objc_msgSend(v4, "encodeBool:forKey:", -[STPlaygroundsStatusDomainData isPlaygroundsActive](self, "isPlaygroundsActive"), CFSTR("playgroundsActive"));

}

- (STPlaygroundsStatusDomainData)initWithCoder:(id)a3
{
  char v4;
  BOOL v5;
  STPlaygroundsStatusDomainData *result;
  objc_super v7;

  v4 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("playgroundsActive"));
  if (!self)
    return 0;
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)STPlaygroundsStatusDomainData;
  result = -[STPlaygroundsStatusDomainData init](&v7, sel_init);
  if (result)
    result->_playgroundsActive = v5;
  return result;
}

- (BOOL)isPlaygroundsActive
{
  return self->_playgroundsActive;
}

@end
