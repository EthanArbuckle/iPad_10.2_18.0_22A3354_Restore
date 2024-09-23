@implementation NSValueTransformer(MTLPredefinedTransformerAdditions)

+ (id)mtl_URLValueTransformer
{
  if (mtl_URLValueTransformer_onceToken != -1)
    dispatch_once(&mtl_URLValueTransformer_onceToken, &__block_literal_global_53161);
  return (id)mtl_URLValueTransformer_URLValueTransformer;
}

+ (id)mtl_UUIDValueTransformer
{
  if (mtl_UUIDValueTransformer_onceToken != -1)
    dispatch_once(&mtl_UUIDValueTransformer_onceToken, &__block_literal_global_21);
  return (id)mtl_UUIDValueTransformer_UUIDValueTransformer;
}

+ (id)mtl_BOOLeanValueTransformer
{
  if (mtl_BOOLeanValueTransformer_onceToken != -1)
    dispatch_once(&mtl_BOOLeanValueTransformer_onceToken, &__block_literal_global_34_53144);
  return (id)mtl_BOOLeanValueTransformer_BOOLeanValueTransformer;
}

+ (id)mtl_arrayMappingTransformerWithTransformer:()MTLPredefinedTransformerAdditions
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLPredefinedTransformerAdditions.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transformer != nil"));

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke;
  aBlock[3] = &unk_1E7AF7688;
  v7 = v5;
  v16 = v7;
  v8 = _Block_copy(aBlock);
  if (objc_msgSend((id)objc_opt_class(), "allowsReverseTransformation")
    && (v13[0] = v6,
        v13[1] = 3221225472,
        v13[2] = __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke_2,
        v13[3] = &unk_1E7AF7688,
        v14 = v7,
        v9 = _Block_copy(v13),
        v14,
        v9))
  {
    +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MTLValueTransformer transformerUsingForwardBlock:](MTLValueTransformer, "transformerUsingForwardBlock:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)mtl_validatingTransformerForClass:()MTLPredefinedTransformerAdditions
{
  void *v7;
  _QWORD v8[5];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLPredefinedTransformerAdditions.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelClass != nil"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_validatingTransformerForClass___block_invoke;
  v8[3] = &__block_descriptor_40_e16__32__0_8_B16__24lu32l8;
  v8[4] = a3;
  +[MTLValueTransformer transformerUsingForwardBlock:](MTLValueTransformer, "transformerUsingForwardBlock:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mtl_valueMappingTransformerWithDictionary:()MTLPredefinedTransformerAdditions defaultValue:reverseDefaultValue:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLPredefinedTransformerAdditions.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary != nil"));

  }
  v12 = objc_msgSend(v9, "count");
  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v12 != v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLPredefinedTransformerAdditions.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary.count == [[NSSet setWithArray:dictionary.allValues] count]"));

  }
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke;
  v28[3] = &unk_1E7AF6800;
  v29 = v9;
  v30 = v10;
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_2;
  v25[3] = &unk_1E7AF6850;
  v26 = v29;
  v27 = v11;
  v18 = v11;
  v19 = v29;
  v20 = v10;
  +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", v28, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (uint64_t)mtl_valueMappingTransformerWithDictionary:()MTLPredefinedTransformerAdditions
{
  return objc_msgSend(a1, "mtl_valueMappingTransformerWithDictionary:defaultValue:reverseDefaultValue:", a3, 0, 0);
}

+ (id)mtl_dateTransformerWithDateFormat:()MTLPredefinedTransformerAdditions calendar:locale:timeZone:defaultDate:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v21;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLPredefinedTransformerAdditions.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateFormat.length"));

  }
  v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v18, "setDateFormat:", v17);

  objc_msgSend(v18, "setCalendar:", v16);
  objc_msgSend(v18, "setLocale:", v15);

  objc_msgSend(v18, "setTimeZone:", v14);
  objc_msgSend(v18, "setDefaultDate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_transformerWithFormatter:forObjectClass:", v18, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (uint64_t)mtl_dateTransformerWithDateFormat:()MTLPredefinedTransformerAdditions locale:
{
  return objc_msgSend(a1, "mtl_dateTransformerWithDateFormat:calendar:locale:timeZone:defaultDate:", a3, 0, a4, 0, 0);
}

+ (id)mtl_numberTransformerWithNumberStyle:()MTLPredefinedTransformerAdditions locale:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CB37F0];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setNumberStyle:", a3);
  objc_msgSend(v8, "setLocale:", v7);

  objc_msgSend(a1, "mtl_transformerWithFormatter:forObjectClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mtl_transformerWithFormatter:()MTLPredefinedTransformerAdditions forObjectClass:
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLPredefinedTransformerAdditions.m"), 360, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formatter != nil"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLPredefinedTransformerAdditions.m"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectClass != nil"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke;
  v17[3] = &unk_1E7AF6878;
  v19 = a4;
  v18 = v7;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke_2;
  v14[3] = &unk_1E7AF68A0;
  v15 = v18;
  v16 = a4;
  v9 = v18;
  +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", v17, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)mtl_JSONDictionaryTransformerWithModelClass:()MTLPredefinedTransformerAdditions
{
  return +[MTLJSONAdapter dictionaryTransformerWithModelClass:](MTLJSONAdapter, "dictionaryTransformerWithModelClass:");
}

+ (id)mtl_JSONArrayTransformerWithModelClass:()MTLPredefinedTransformerAdditions
{
  return +[MTLJSONAdapter arrayTransformerWithModelClass:](MTLJSONAdapter, "arrayTransformerWithModelClass:");
}

@end
