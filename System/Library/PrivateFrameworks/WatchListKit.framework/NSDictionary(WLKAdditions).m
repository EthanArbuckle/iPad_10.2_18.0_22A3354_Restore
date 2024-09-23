@implementation NSDictionary(WLKAdditions)

- (uint64_t)wlk_BOOLForKey:()WLKAdditions defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "wlk_numberForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)wlk_numberForKey:()WLKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wlk_stringForKey:()WLKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_lookupValueForKey:()WLKAdditions expectedClass:
{
  void *v1;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)wlk_arrayForKey:()WLKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wlk_dictionaryForKey:()WLKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wlk_urlForKey:()WLKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wlk_caseInsensitiveValueForKey:()WLKAdditions
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NSDictionary_WLKAdditions__wlk_caseInsensitiveValueForKey___block_invoke;
  v8[3] = &unk_1E68A9F30;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (WLKArtworkVariantListing)wlk_artworkVariantListingForKey:()WLKAdditions
{
  void *v1;
  WLKArtworkVariantListing *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = -[WLKArtworkVariantListing initWithArtworkDictionary:]([WLKArtworkVariantListing alloc], "initWithArtworkDictionary:", v1);
  else
    v2 = 0;

  return v2;
}

- (id)wlk_dateForKey:()WLKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wlk_dateFromMillisecondsSince1970ForKey:()WLKAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "wlk_dateWithMillisecondsSince1970:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wlk_dataForKey:()WLKAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_lookupValueForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wlk_dictionaryDifference:()WLKAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__NSDictionary_WLKAdditions__wlk_dictionaryDifference___block_invoke;
  v18[3] = &unk_1E68A9E28;
  v7 = v4;
  v19 = v7;
  v8 = v5;
  v20 = v8;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v18);
  v12 = v6;
  v13 = 3221225472;
  v14 = __55__NSDictionary_WLKAdditions__wlk_dictionaryDifference___block_invoke_2;
  v15 = &unk_1E68A9E28;
  v16 = a1;
  v9 = v8;
  v17 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v12);
  if (objc_msgSend(v9, "count", v12, v13, v14, v15, v16))
    v10 = (void *)objc_msgSend(v9, "copy");
  else
    v10 = 0;

  return v10;
}

- (id)wlk_dictionaryByReplacingOccurrencesOfKey:()WLKAdditions with:
{
  return _WLKDeepReplacement(a1, a3, a4);
}

@end
