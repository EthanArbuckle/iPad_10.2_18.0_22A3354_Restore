@implementation STWifiStatusDomainData

- (id)initWithData:(id)result
{
  void *v2;
  id v3;
  char v4;
  uint64_t v5;
  char v6;
  objc_super v7;

  if (result)
  {
    v2 = result;
    v3 = a2;
    v4 = objc_msgSend(v3, "isWifiActive");
    v5 = objc_msgSend(v3, "signalStrengthBars");
    v6 = objc_msgSend(v3, "isAssociatedToIOSHotspot");

    v7.receiver = v2;
    v7.super_class = (Class)STWifiStatusDomainData;
    result = objc_msgSendSuper2(&v7, sel_init);
    if (result)
    {
      *((_BYTE *)result + 8) = v4;
      *((_QWORD *)result + 2) = v5;
      *((_BYTE *)result + 24) = v6;
    }
  }
  return result;
}

- (BOOL)isWifiActive
{
  return self->_wifiActive;
}

- (unint64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (BOOL)isAssociatedToIOSHotspot
{
  return self->_associatedToIOSHotspot;
}

uint64_t __34__STWifiStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isAssociatedToIOSHotspot");
}

uint64_t __34__STWifiStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalStrengthBars");
}

uint64_t __34__STWifiStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isWifiActive");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STWifiStatusDomainData initWithData:](+[STMutableWifiStatusDomainData allocWithZone:](STMutableWifiStatusDomainData, "allocWithZone:", a3), self);
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
  uint64_t v13;
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
  v6 = -[STWifiStatusDomainData isWifiActive](self, "isWifiActive");
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__STWifiStatusDomainData_isEqual___block_invoke;
  v21[3] = &unk_1E91E4B28;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v21);
  v10 = -[STWifiStatusDomainData signalStrengthBars](self, "signalStrengthBars");
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __34__STWifiStatusDomainData_isEqual___block_invoke_2;
  v19[3] = &unk_1E91E5108;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v10, v19);
  v13 = -[STWifiStatusDomainData isAssociatedToIOSHotspot](self, "isAssociatedToIOSHotspot");
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __34__STWifiStatusDomainData_isEqual___block_invoke_3;
  v17[3] = &unk_1E91E4B28;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v17);
  LOBYTE(v13) = objc_msgSend(v5, "isEqual");

  return v13;
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STWifiStatusDomainDataDiff diffFromData:toData:](STWifiStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (STWifiStatusDomainData)init
{
  return (STWifiStatusDomainData *)-[STWifiStatusDomainData initWithData:](self, 0);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STWifiStatusDomainData isWifiActive](self, "isWifiActive"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STWifiStatusDomainData signalStrengthBars](self, "signalStrengthBars"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[STWifiStatusDomainData isAssociatedToIOSHotspot](self, "isAssociatedToIOSHotspot"));
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (NSString)description
{
  return (NSString *)-[STWifiStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STWifiStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STWifiStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STWifiStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __74__STWifiStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STWifiStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __74__STWifiStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isWifiActive"), CFSTR("wifiActive"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), CFSTR("signalStrengthBars"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isAssociatedToIOSHotspot"), CFSTR("associatedToIOSHotspot"));
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
      v5 = (void *)-[STWifiStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STWifiStatusDomainData mutableCopy](self, "mutableCopy");
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
  objc_msgSend(v4, "encodeBool:forKey:", -[STWifiStatusDomainData isWifiActive](self, "isWifiActive"), CFSTR("wifiActive"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[STWifiStatusDomainData signalStrengthBars](self, "signalStrengthBars"), CFSTR("signalStrengthBars"));
  objc_msgSend(v4, "encodeBool:forKey:", -[STWifiStatusDomainData isAssociatedToIOSHotspot](self, "isAssociatedToIOSHotspot"), CFSTR("associatedToIOSHotspot"));

}

- (STWifiStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  char v5;
  unint64_t v6;
  char v7;
  STWifiStatusDomainData *result;
  objc_super v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wifiActive"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("signalStrengthBars"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("associatedToIOSHotspot"));

  if (!self)
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)STWifiStatusDomainData;
  result = -[STWifiStatusDomainData init](&v9, sel_init);
  if (result)
  {
    result->_wifiActive = v5;
    result->_signalStrengthBars = v6;
    result->_associatedToIOSHotspot = v7;
  }
  return result;
}

@end
