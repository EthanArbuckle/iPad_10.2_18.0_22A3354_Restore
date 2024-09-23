@implementation PUIStyleColorVariationStore

+ (unint64_t)version
{
  return 3;
}

+ (void)performMigrationsIfNeededForStorage:(id)a3 version:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  void *v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    v6 = objc_msgSend((id)objc_opt_class(), "version");
    v5 = v7;
    if (a4 <= 2 && v6 > a4)
    {
      objc_msgSend(v7, "removeAllObjects");
      v5 = v7;
    }
  }

}

+ (id)posterColorForColor:(id)a3 withAppliedVariation:(double)a4
{
  id v5;
  PUIStyleColor *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v5 = a3;
  v6 = -[PUIStyleColor initWithColor:preferredStyle:]([PUIStyleColor alloc], "initWithColor:preferredStyle:", v5, 0);

  v7 = a4 * -0.25;
  -[PUIStyleColor hslValues](v6, "hslValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "luminance");
  v10 = v9;

  v11 = fmax(v10 + v7, 0.0);
  if (v11 > 1.0)
    v11 = 1.0;
  v12 = -[PUIStyleColor copyWithLuminance:](v6, "copyWithLuminance:", v11);

  return v12;
}

- (PUIStyleColorVariationStore)initWithVariationStorage:(id)a3 version:(unint64_t)a4
{
  id v6;
  PUIStyleColorVariationStore *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *variationStorage;
  NSMutableDictionary *v10;
  uint64_t v11;
  NSMutableDictionary *persistentVariationStorage;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUIStyleColorVariationStore;
  v7 = -[PUIStyleColorVariationStore init](&v14, sel_init);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend((id)objc_opt_class(), "performMigrationsIfNeededForStorage:version:", v8, a4);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    variationStorage = v7->_variationStorage;
    v7->_variationStorage = v8;
    v10 = v8;

    v11 = -[NSMutableDictionary mutableCopy](v10, "mutableCopy");
    persistentVariationStorage = v7->_persistentVariationStorage;
    v7->_persistentVariationStorage = (NSMutableDictionary *)v11;

  }
  return v7;
}

- (PUIStyleColorVariationStore)init
{
  return -[PUIStyleColorVariationStore initWithVariationStorage:version:](self, "initWithVariationStorage:version:", 0, objc_msgSend((id)objc_opt_class(), "version"));
}

- (id)baseColorForVariedColor:(id)a3 forContextIdentifier:(id)a4 variation:(double *)a5 forDataLayerPicker:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  PUIStyleColorVariationStore *v19;
  uint64_t *v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;

  v10 = a3;
  v11 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_variationStorage, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v29 = 0;
    v30 = (double *)&v29;
    v31 = 0x2020000000;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    v28 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __105__PUIStyleColorVariationStore_baseColorForVariedColor_forContextIdentifier_variation_forDataLayerPicker___block_invoke;
    v17[3] = &unk_25154CC70;
    v22 = a6;
    v18 = v10;
    v19 = self;
    v20 = &v23;
    v21 = &v29;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
    v13 = v24;
    v14 = (void *)v24[5];
    if (a5 && v14)
    {
      *a5 = v30[3];
      v14 = (void *)v13[5];
    }
    v15 = v14;

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __105__PUIStyleColorVariationStore_baseColorForVariedColor_forContextIdentifier_variation_forDataLayerPicker___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  PUIStyleColor *v16;

  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  v9 = v8;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PUIStyleColor initWithColor:]([PUIStyleColor alloc], "initWithColor:", v10);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "posterColorForColor:withAppliedVariation:", *(_QWORD *)(a1 + 32), -v8);
    v16 = (PUIStyleColor *)objc_claimAutoreleasedReturnValue();
  }
  -[PUIStyleColor identifier](v16, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    -[PUIStyleColor color](v16, "color");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9;
    *a4 = 1;
  }

}

- (id)variationForPickerColor:(id)a3 forContextIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "baseColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_variationStorage, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v7, "colorValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setVariation:(double)a3 forPickerColor:(id)a4 forContextIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(a4, "baseColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_variationStorage, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  objc_msgSend(v9, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v14);

  v16 = (void *)objc_msgSend(v13, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_variationStorage, "setObject:forKeyedSubscript:", v16, v8);

  v19 = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_persistentVariationStorage, "setObject:forKeyedSubscript:", v18, v8);

}

- (id)persistedVariationForContextIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_persistentVariationStorage, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    objc_msgSend(v4, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  return (id)-[NSMutableDictionary copy](self->_persistentVariationStorage, "copy");
}

- (void)resetAllValues
{
  -[NSMutableDictionary removeAllObjects](self->_variationStorage, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_persistentVariationStorage, "removeAllObjects");
}

- (NSMutableDictionary)variationStorage
{
  return self->_variationStorage;
}

- (void)setVariationStorage:(id)a3
{
  objc_storeStrong((id *)&self->_variationStorage, a3);
}

- (NSMutableDictionary)persistentVariationStorage
{
  return self->_persistentVariationStorage;
}

- (void)setPersistentVariationStorage:(id)a3
{
  objc_storeStrong((id *)&self->_persistentVariationStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentVariationStorage, 0);
  objc_storeStrong((id *)&self->_variationStorage, 0);
}

@end
