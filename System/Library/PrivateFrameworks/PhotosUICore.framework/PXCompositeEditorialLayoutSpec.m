@implementation PXCompositeEditorialLayoutSpec

- (PXCompositeEditorialLayoutSpec)init
{
  PXCompositeEditorialLayoutSpec *result;
  PXCompositeEditorialLayoutSpec *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCompositeEditorialLayoutSpec;
  result = -[PXCompositeEditorialLayoutSpec init](&v6, sel_init);
  if (result)
  {
    v4 = result;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PXCompositeEditorialLayoutSpec.m"), 36, CFSTR("%s is not available as initializer"), "-[PXCompositeEditorialLayoutSpec init]");

    abort();
  }
  return result;
}

- (id)_init
{
  PXCompositeEditorialLayoutSpec *v2;
  PXCompositeEditorialLayoutSpec *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCompositeEditorialLayoutSpec;
  v2 = -[PXCompositeEditorialLayoutSpec init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXCompositeEditorialLayoutSpec prepareBuiltinSpec](v2, "prepareBuiltinSpec");
  return v3;
}

- (void)prepareBuiltinSpec
{
  void *v2;
  NSArray *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSArray *templates;
  NSArray *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0x7FFFFFFFLL;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0x7FFFFFFFLL;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("PXCompositeEditorialLayoutTemplate"), CFSTR("json"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v24);
  v38 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (v21)
  {
    v3 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("templates"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke;
    v33[3] = &unk_1E513F0A8;
    v6 = v4;
    v34 = v6;
    v35 = &v47;
    v36 = &v43;
    v37 = &v39;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v33);
    v19 = v5;
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("preferredTemplates"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v51, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke_2;
          v26[3] = &unk_1E513F0D0;
          v14 = v6;
          v27 = v14;
          v15 = v12;
          v28 = v15;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);

          objc_msgSend(v14, "objectForKeyedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v15, v16);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v51, 16);
      }
      while (v8);
    }

    objc_msgSend(v6, "allValues");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  templates = self->_templates;
  self->_templates = v3;
  v18 = v3;

  self->_minNumberOfColumns = v48[3];
  self->_minNumberOfRects = v44[3];
  self->_maxNumberOfRects = v40[3];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

}

- (id)preferredNextTemplatesForTemplate:(id)a3
{
  return -[NSMapTable objectForKey:](self->_preferredNextTemplatesByCurrentTemplate, "objectForKey:", a3);
}

- (NSArray)templates
{
  return self->_templates;
}

- (int64_t)minNumberOfRects
{
  return self->_minNumberOfRects;
}

- (int64_t)maxNumberOfRects
{
  return self->_maxNumberOfRects;
}

- (int64_t)minNumberOfColumns
{
  return self->_minNumberOfColumns;
}

- (NSMapTable)preferredNextTemplatesByCurrentTemplate
{
  return self->_preferredNextTemplatesByCurrentTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredNextTemplatesByCurrentTemplate, 0);
  objc_storeStrong((id *)&self->_templates, 0);
}

void __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PXCompositeEditorialLayoutTemplate *v14;

  v3 = a2;
  v14 = -[PXCompositeEditorialLayoutTemplate initWithDescriptorDictionary:]([PXCompositeEditorialLayoutTemplate alloc], "initWithDescriptorDictionary:", v3);

  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXCompositeEditorialLayoutTemplate identifier](v14, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v5);

  v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v7 = -[PXCompositeEditorialLayoutTemplate numberOfColumns](v14, "numberOfColumns");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
  v9 = -[PXCompositeEditorialLayoutTemplate numberOfRects](v14, "numberOfRects");
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(_QWORD *)(v10 + 24);
  if (v11 >= v9)
    v11 = v9;
  *(_QWORD *)(v10 + 24) = v11;
  v12 = *(_QWORD *)(a1[7] + 8);
  v13 = *(_QWORD *)(v12 + 24);
  if (v13 <= v9)
    v13 = v9;
  *(_QWORD *)(v12 + 24) = v13;

}

void __52__PXCompositeEditorialLayoutSpec_prepareBuiltinSpec__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

+ (PXCompositeEditorialLayoutSpec)defaultSpec
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PXCompositeEditorialLayoutSpec_defaultSpec__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSpec_onceToken != -1)
    dispatch_once(&defaultSpec_onceToken, block);
  return (PXCompositeEditorialLayoutSpec *)(id)defaultSpec_defaultSpec;
}

void __45__PXCompositeEditorialLayoutSpec_defaultSpec__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)defaultSpec_defaultSpec;
  defaultSpec_defaultSpec = v1;

}

@end
