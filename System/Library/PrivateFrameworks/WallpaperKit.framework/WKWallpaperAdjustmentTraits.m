@implementation WKWallpaperAdjustmentTraits

- (WKWallpaperAdjustmentTraits)initWithDictionary:(id)a3
{
  id v4;
  WKWallpaperAdjustmentTraits *v5;
  void *v6;
  void *v7;
  id v8;
  WKWallpaperAdjustmentTraitOffset *v9;
  WKWallpaperAdjustmentTraitOffset *offset;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WKWallpaperAdjustmentTraits;
  v5 = -[WKWallpaperAdjustmentTraits init](&v12, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentTraitOffset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = -[WKWallpaperAdjustmentTraitOffset initWithAttributeDictionary:]([WKWallpaperAdjustmentTraitOffset alloc], "initWithAttributeDictionary:", v8);
    offset = v5->_offset;
    v5->_offset = v9;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WKWallpaperAdjustmentTraits propertyListRepresentation](self, "propertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (id)propertyListRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[WKWallpaperAdjustmentTraits offset](self, "offset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyListRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v3, CFSTR("adjustmentTraitOffset"));
  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

id __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke()
{
  if (WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_token_0, &__block_literal_global_11);
  return (id)WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_object_0;
}

void __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_object_0;
  WKWallpaperAdjustmentTraitOffsetKey_block_invoke_na_once_object_0 = v0;

}

id __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_16);
  objc_msgSend(v0, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __42__WKWallpaperAdjustmentTraits_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "offset");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (id)wk_descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WKWallpaperAdjustmentTraits_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __52__WKWallpaperAdjustmentTraits_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "descriptionBuilderBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (id)description
{
  void *v2;
  void *v3;

  -[WKWallpaperAdjustmentTraits wk_descriptionBuilder](self, "wk_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionBuilderBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__WKWallpaperAdjustmentTraits_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __54__WKWallpaperAdjustmentTraits_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "offset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("offset"));

}

- (WKWallpaperAdjustmentTraitOffset)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
}

@end
