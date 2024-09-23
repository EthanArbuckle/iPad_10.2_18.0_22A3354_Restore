@implementation UIVisualEffectVibrantLayerConfig

void __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  +[UIColor whiteColor](UIColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setTintColor:", v2);

  objc_msgSend(a1[5], "filterAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_2;
  v17 = &unk_1E16B1DF0;
  v18 = a1[6];
  v19 = a1[7];
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v14);

  objc_msgSend(a1[5], "vibrantColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(objc_retainAutorelease(v5), "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)

  objc_msgSend(a1[5], "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(objc_retainAutorelease(v8), "CGColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  v10 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.%@"), a1[7], CFSTR("inputColor0"), v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKeyPath:", v6, v11);

  v12 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.%@"), a1[7], CFSTR("inputColor1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKeyPath:", v9, v13);

}

void __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("filters.%@.%@"), v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v7, v8);

}

void __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  +[UIColor whiteColor](UIColor, "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v2);

  +[UIColor clearColor](UIColor, "clearColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "CGColor");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 48), "filterAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_4;
  v14[3] = &unk_1E16B5210;
  v14[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setValue:forKey:", v13, CFSTR("inputColor0"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setValue:forKey:", v13, CFSTR("inputColor1"));
  objc_msgSend(*(id *)(a1 + 56), "filters");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(v11, "arrayByAddingObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "setFilters:", v12);
}

uint64_t __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setValue:forKey:", a3, a2);
}

void __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_2;
  v2[3] = &unk_1E16B1B50;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);

}

void __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "filters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v12)
          objc_msgSend(v4, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFilters:", v4);
}

uint64_t __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
