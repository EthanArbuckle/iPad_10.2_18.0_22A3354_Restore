@implementation WBSCRDTField

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", a3, a4);
}

- (WBSCRDTField)initWithValueSource:(id)a3 valueProvider:(id)a4 valueUpdater:(id)a5 generation:(id)a6 deviceIdentifier:(id)a7
{
  return -[WBSCRDTField initWithValue:valueSource:valueProvider:valueUpdater:generation:deviceIdentifier:](self, "initWithValue:valueSource:valueProvider:valueUpdater:generation:deviceIdentifier:", 0, a3, a4, a5, a6, a7);
}

- (void)setShouldIncrementGeneration:(BOOL)a3
{
  self->_shouldIncrementGeneration = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithValue:generation:deviceIdentifier:", self->_value, self->_generation, self->_deviceIdentifier);
  *(_BYTE *)(v4 + 48) = self->_shouldIncrementGeneration;
  objc_msgSend(*(id *)(v4 + 40), "setDictionary:", self->_metadata);
  return (id)v4;
}

- (WBSCRDTField)initWithValue:(id)a3 generation:(id)a4 deviceIdentifier:(id)a5
{
  return -[WBSCRDTField initWithValue:valueSource:valueProvider:valueUpdater:generation:deviceIdentifier:](self, "initWithValue:valueSource:valueProvider:valueUpdater:generation:deviceIdentifier:", a3, self, &__block_literal_global_30, &__block_literal_global_2_0, a4, a5);
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:valueSource:valueProvider:valueUpdater:generation:deviceIdentifier:", self->_value, v4, self->_valueProvider, self->_valueUpdater, self->_generation, self->_deviceIdentifier);

  *(_BYTE *)(v5 + 48) = self->_shouldIncrementGeneration;
  objc_msgSend(*(id *)(v5 + 40), "setDictionary:", self->_metadata);
  return (id)v5;
}

- (void)setValue:(id)a3 incrementGenerationIfNeeded:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[WBSCRDTField setValue:](self, "setValue:", a3);
  if (v4)
    -[WBSCRDTField incrementGenerationIfNeeded](self, "incrementGenerationIfNeeded");
}

- (void)setValue:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_valueSource);
  if (WeakRetained)
  {
    -[WBSCRDTField value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = WBSIsEqual();

    if ((v6 & 1) == 0)
      (*((void (**)(void))self->_valueUpdater + 2))();
  }

}

- (NSCopying)value
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained(&self->_valueSource);
  if (WeakRetained)
  {
    (*((void (**)(void))self->_valueProvider + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSCopying *)v4;
}

id __58__WBSCRDTField_initWithValue_generation_deviceIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 8);
}

void __58__WBSCRDTField_initWithValue_generation_deviceIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v4 = a2;
  v5 = objc_msgSend(a3, "copyWithZone:", 0);
  v6 = (id)v4[1];
  v4[1] = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_valueUpdater, 0);
  objc_storeStrong(&self->_valueProvider, 0);
  objc_destroyWeak(&self->_valueSource);
  objc_storeStrong(&self->_value, 0);
}

- (WBSCRDTField)initWithValue:(id)a3 valueSource:(id)a4 valueProvider:(id)a5 valueUpdater:(id)a6 generation:(id)a7 deviceIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  WBSCRDTField *v20;
  WBSCRDTField *v21;
  uint64_t v22;
  id value;
  uint64_t v24;
  id valueProvider;
  uint64_t v26;
  id valueUpdater;
  void *v28;
  void *v29;
  WBSCRDTGeneration *v30;
  WBSCRDTGeneration *generation;
  uint64_t v32;
  NSString *deviceIdentifier;
  NSMutableDictionary *v34;
  NSMutableDictionary *metadata;
  WBSCRDTField *v36;
  objc_super v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v38.receiver = self;
  v38.super_class = (Class)WBSCRDTField;
  v20 = -[WBSCRDTField init](&v38, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak(&v20->_valueSource, v15);
    v22 = objc_msgSend(v14, "copyWithZone:", 0);
    value = v21->_value;
    v21->_value = (id)v22;

    v24 = MEMORY[0x1A8599ED0](v16);
    valueProvider = v21->_valueProvider;
    v21->_valueProvider = (id)v24;

    v26 = MEMORY[0x1A8599ED0](v17);
    valueUpdater = v21->_valueUpdater;
    v21->_valueUpdater = (id)v26;

    v28 = (void *)objc_msgSend(v18, "copy");
    v29 = v28;
    if (v28)
      v30 = v28;
    else
      v30 = objc_alloc_init(WBSCRDTGeneration);
    generation = v21->_generation;
    v21->_generation = v30;

    v32 = objc_msgSend(v19, "copy");
    deviceIdentifier = v21->_deviceIdentifier;
    v21->_deviceIdentifier = (NSString *)v32;

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metadata = v21->_metadata;
    v21->_metadata = v34;

    v21->_shouldIncrementGeneration = 1;
    v36 = v21;
  }

  return v21;
}

- (void)incrementGenerationIfNeeded
{
  WBSCRDTGeneration *generation;
  NSString *deviceIdentifier;
  void *v5;
  WBSCRDTGeneration *v6;
  WBSCRDTGeneration *v7;

  if (self->_shouldIncrementGeneration)
  {
    generation = self->_generation;
    deviceIdentifier = self->_deviceIdentifier;
    v5 = deviceIdentifier;
    if (!deviceIdentifier)
    {
      -[WBSCRDTGeneration deviceIdentifier](self->_generation, "deviceIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WBSCRDTGeneration incrementedGenerationWithDeviceIdentifier:](generation, "incrementedGenerationWithDeviceIdentifier:", v5);
    v6 = (WBSCRDTGeneration *)objc_claimAutoreleasedReturnValue();
    v7 = self->_generation;
    self->_generation = v6;

    if (!deviceIdentifier)
    self->_shouldIncrementGeneration = 0;
  }
}

- (WBSCRDTField)init
{

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  WBSCRDTField *v4;
  WBSCRDTField *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (WBSCRDTField *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBSCRDTField value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSCRDTField value](v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual())
      {
        -[WBSCRDTField generation](self, "generation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSCRDTField generation](v5, "generation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
        {
          -[WBSCRDTField deviceIdentifier](self, "deviceIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSCRDTField deviceIdentifier](v5, "deviceIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = WBSIsEqual();

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[WBSCRDTGeneration hash](self->_generation, "hash");
  return -[NSString hash](self->_deviceIdentifier, "hash") ^ v3;
}

- (int64_t)mergeWithField:(id)a3
{
  WBSCRDTField *v4;
  void *v5;
  void *v6;
  int64_t v7;
  WBSCRDTField *v8;
  void *v9;
  void *v10;

  v4 = (WBSCRDTField *)a3;
  -[WBSCRDTField generation](self, "generation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCRDTField generation](v4, "generation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == -1)
    v8 = v4;
  else
    v8 = self;
  -[WBSCRDTField value](v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCRDTField generation](v8, "generation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCRDTField setValue:](self, "setValue:", v9);
  -[WBSCRDTField setGeneration:](self, "setGeneration:", v10);
  -[WBSCRDTField setValue:](v4, "setValue:", v9);
  -[WBSCRDTField setGeneration:](v4, "setGeneration:", v10);

  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WBSCRDTField value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCRDTField generation](self, "generation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; value: %@; generation: %@; metadata: %@>"),
    v4,
    self,
    v5,
    v6,
    self->_metadata);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WBSCRDTGeneration)generation
{
  return self->_generation;
}

- (void)setGeneration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)shouldIncrementGeneration
{
  return self->_shouldIncrementGeneration;
}

@end
