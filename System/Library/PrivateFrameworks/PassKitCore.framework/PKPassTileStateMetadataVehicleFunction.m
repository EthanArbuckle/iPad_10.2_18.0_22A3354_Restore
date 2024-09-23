@implementation PKPassTileStateMetadataVehicleFunction

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSDictionary *v12;
  NSDictionary *vehicleFunctionStates;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  v5 = -[PKPassTileStateMetadata _setUpWithDictionary:](&v23, sel__setUpWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("vehicleFunctionStates"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __63__PKPassTileStateMetadataVehicleFunction__setUpWithDictionary___block_invoke;
      v18 = &unk_1E2ADCBC0;
      v20 = v8;
      v21 = v9;
      v22 = v10;
      v11 = v7;
      v19 = v11;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v15);
      if (objc_msgSend(v11, "count", v15, v16, v17, v18))
      {
        v12 = (NSDictionary *)objc_msgSend(v11, "copy");
        vehicleFunctionStates = self->_vehicleFunctionStates;
        self->_vehicleFunctionStates = v12;
      }
      else
      {
        vehicleFunctionStates = self->_vehicleFunctionStates;
        self->_vehicleFunctionStates = (NSDictionary *)MEMORY[0x1E0C9AA70];
      }

    }
  }

  return v5;
}

void __63__PKPassTileStateMetadataVehicleFunction__setUpWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_16;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }

    v15 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v5);
    if (objc_msgSend(v12, "scanHexInt:", &v15) && objc_msgSend(v12, "isAtEnd"))
    {
      v13 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v14);

    }
  }
LABEL_16:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateMetadataVehicleFunction)initWithCoder:(id)a3
{
  id v4;
  PKPassTileStateMetadataVehicleFunction *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *vehicleFunctionStates;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  v5 = -[PKPassTileStateMetadata initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("vehicleFunctions"));
    v10 = objc_claimAutoreleasedReturnValue();
    vehicleFunctionStates = v5->_vehicleFunctionStates;
    v5->_vehicleFunctionStates = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  v4 = a3;
  -[PKPassTileStateMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleFunctionStates, CFSTR("vehicleFunctionStates"), v5.receiver, v5.super_class);

}

- (BOOL)isEqualToUnresolvedMetadata:(id)a3
{
  _QWORD *v4;
  NSDictionary *v5;
  NSDictionary *vehicleFunctionStates;
  BOOL v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileStateMetadataVehicleFunction;
  if (-[PKPassTileStateMetadata isEqualToUnresolvedMetadata:](&v10, sel_isEqualToUnresolvedMetadata_, v4))
  {
    v5 = (NSDictionary *)v4[2];
    vehicleFunctionStates = self->_vehicleFunctionStates;
    if (v5)
      v7 = vehicleFunctionStates == 0;
    else
      v7 = 1;
    if (v7)
      v8 = v5 == vehicleFunctionStates;
    else
      v8 = -[NSDictionary isEqual:](v5, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDictionary)vehicleFunctionStates
{
  return self->_vehicleFunctionStates;
}

- (void)setVehicleFunctionStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleFunctionStates, 0);
}

@end
