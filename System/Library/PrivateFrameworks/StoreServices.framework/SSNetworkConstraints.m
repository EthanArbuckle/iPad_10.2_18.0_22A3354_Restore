@implementation SSNetworkConstraints

- (SSNetworkConstraints)init
{
  SSNetworkConstraints *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSNetworkConstraints;
  v2 = -[SSNetworkConstraints init](&v4, sel_init);
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSNetworkConstraints", 0);
    -[SSNetworkConstraints _setSizeLimit:forNetworkType:](v2, "_setSizeLimit:forNetworkType:", -1, 0);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSNetworkConstraints;
  -[SSNetworkConstraints dealloc](&v4, sel_dealloc);
}

- (void)disableCellularNetworkTypes
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSNetworkConstraints_disableCellularNetworkTypes__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __51__SSNetworkConstraints_disableCellularNetworkTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_sizeLimitForNetworkType:", 1000);
  objc_msgSend(*(id *)(a1 + 32), "_disableAllNetworkTypes");
  return objc_msgSend(*(id *)(a1 + 32), "_setSizeLimit:forNetworkType:", v2, 1000);
}

- (BOOL)hasSizeLimitForNetworkType:(int64_t)a3
{
  NSObject *dispatchQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSNetworkConstraints_hasSizeLimitForNetworkType___block_invoke;
  block[3] = &unk_1E47B8E68;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__SSNetworkConstraints_hasSizeLimitForNetworkType___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", v2) != 0;

}

- (BOOL)isAnyNetworkTypeEnabled
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSNetworkConstraints_isAnyNetworkTypeEnabled__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSNetworkConstraints_isAnyNetworkTypeEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (!result)
      return result;
    v4 = result;
    v5 = *(_QWORD *)v8;
LABEL_4:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v8 != v5)
        objc_enumerationMutation(v3);
      result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6)), "longLongValue");
      if ((result & 0x8000000000000000) == 0)
        break;
      if (v4 == ++v6)
      {
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
        if (result)
          goto LABEL_4;
        return result;
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)setAllNetworkTypesDisabled
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SSNetworkConstraints_setAllNetworkTypesDisabled__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __50__SSNetworkConstraints_setAllNetworkTypesDisabled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableAllNetworkTypes");
}

- (void)setSizeLimit:(int64_t)a3 forNetworkType:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SSNetworkConstraints_setSizeLimit_forNetworkType___block_invoke;
  block[3] = &unk_1E47BBA48;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __52__SSNetworkConstraints_setSizeLimit_forNetworkType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSizeLimit:forNetworkType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (int64_t)sizeLimitForNetworkType:(int64_t)a3
{
  NSObject *dispatchQueue;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSNetworkConstraints_sizeLimitForNetworkType___block_invoke;
  block[3] = &unk_1E47B8E68;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__SSNetworkConstraints_sizeLimitForNetworkType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_sizeLimitForNetworkType:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)description
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSNetworkConstraints_description__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __35__SSNetworkConstraints_description__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  objc_super v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: %@"), SSGetStringForNetworkType(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "integerValue")), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)));
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  if (objc_msgSend(v2, "count"))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11.receiver = *(id *)(a1 + 32);
    v11.super_class = (Class)SSNetworkConstraints;
    v10 = (id)objc_msgSend(v9, "initWithFormat:", CFSTR("%@: %@"), objc_msgSendSuper2(&v11, sel_description), objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", ")));
  }
  else
  {
    v12.receiver = *(id *)(a1 + 32);
    v12.super_class = (Class)SSNetworkConstraints;
    v10 = objc_msgSendSuper2(&v12, sel_description);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v10;

}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  NSObject *dispatchQueue;
  char v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = (void *)objc_msgSend(a3, "_copySizeLimits");
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SSNetworkConstraints_isEqual___block_invoke;
    block[3] = &unk_1E47BA7E8;
    block[5] = v6;
    block[6] = &v11;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);

  }
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __32__SSNetworkConstraints_isEqual___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 16);
  if (v3 == v2)
    result = 1;
  else
    result = objc_msgSend(v3, "isEqualToDictionary:");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

+ (id)networkConstraintsForDownloadKind:(id)a3 fromBag:(id)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(a1, "_newModernNetworkConstraintsWithArray:", objc_msgSend(a4, "arrayForKey:error:", CFSTR("mobile-network-constraints"), 0));
  v6 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", a3);

  return v6;
}

+ (id)newNetworkConstraintsByDownloadKindFromURLBag:(id)a3
{
  uint64_t v5;
  uint64_t v7;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("mobile-network-constraints"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(a1, "_newModernNetworkConstraintsWithArray:", v5);
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("mobile-connection-type-allows"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(a1, "_newLegacyNetworkConstraintsWithDictionary:", v7);
  else
    return 0;
}

- (void)setSizeLimitsWithStoreConstraintDictionary:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__SSNetworkConstraints_setSizeLimitsWithStoreConstraintDictionary___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __67__SSNetworkConstraints_setSizeLimitsWithStoreConstraintDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 40), "_setSizeLimit:forNetworkType:", objc_msgSend(v8, "longLongValue"), SSGetNetworkTypeForString(v7));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

+ (void)_addNetworkConstraintsToDictionary:(id)a3 forNetworkType:(int64_t)a4 legacyDictionary:(id)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  SSNetworkConstraints *v13;
  SSNetworkConstraints *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  uint64_t v51;

  v8 = 0;
  v51 = *MEMORY[0x1E0C80C00];
  v15 = CFSTR("book");
  v16 = CFSTR("p2-music-store-available");
  v17 = CFSTR("music-download-size-limit-in-bytes");
  v18 = CFSTR("coached-audio");
  v19 = CFSTR("p2-music-store-available");
  v20 = CFSTR("music-download-size-limit-in-bytes");
  v21 = CFSTR("ebook");
  v22 = CFSTR("eBook-store-available");
  v23 = CFSTR("eBook-download-size-limit-in-bytes");
  v24 = CFSTR("feature-movie");
  v25 = CFSTR("p2-music-store-available");
  v26 = CFSTR("video-download-size-limit-in-bytes");
  v27 = CFSTR("song");
  v28 = CFSTR("p2-music-store-available");
  v29 = CFSTR("music-download-size-limit-in-bytes");
  v30 = CFSTR("music-video");
  v31 = CFSTR("p2-music-store-available");
  v32 = CFSTR("music-download-size-limit-in-bytes");
  v33 = CFSTR("podcast");
  v34 = CFSTR("p2-podcasts-enabled");
  v35 = CFSTR("podcast-download-size-limit-in-bytes");
  v36 = CFSTR("ringtone");
  v39 = CFSTR("software");
  v40 = CFSTR("p2-software-store-available");
  v37 = CFSTR("p2-music-store-available");
  v38 = CFSTR("music-download-size-limit-in-bytes");
  v41 = CFSTR("software-download-size-limit-in-bytes");
  v42 = CFSTR("tv-episode");
  v43 = CFSTR("p2-music-store-available");
  v44 = CFSTR("video-download-size-limit-in-bytes");
  v45 = CFSTR("tone");
  v46 = CFSTR("p2-music-store-available");
  v47 = CFSTR("music-download-size-limit-in-bytes");
  v48 = CFSTR("videoPodcast");
  v49 = CFSTR("p2-podcasts-enabled");
  v50 = CFSTR("podcast-download-size-limit-in-bytes");
  do
  {
    v9 = (void *)objc_msgSend(a5, "objectForKey:", *(const __CFString **)((char *)&v15 + v8 + 8), v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
                   v31,
                   v32,
                   v33,
                   v34,
                   v35,
                   v36,
                   v37,
                   v38,
                   v39,
                   v40,
                   v41,
                   v42,
                   v43,
                   v44,
                   v45,
                   v46,
                   v47,
                   v48,
                   v49,
                   v50,
                   v51);
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
    {
      v10 = (void *)objc_msgSend(a5, "objectForKey:", *(const __CFString **)((char *)&v17 + v8));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = objc_msgSend(v10, "longLongValue");
      else
        v11 = 0;
    }
    else
    {
      v11 = -1;
    }
    v12 = *(uint64_t *)((char *)&v15 + v8);
    v13 = (SSNetworkConstraints *)objc_msgSend(a3, "objectForKey:", v12);
    if (!v13)
    {
      v13 = objc_alloc_init(SSNetworkConstraints);
      objc_msgSend(a3, "setObject:forKey:", v13, v12);
      v14 = v13;
    }
    -[SSNetworkConstraints setSizeLimit:forNetworkType:](v13, "setSizeLimit:forNetworkType:", v11, a4);
    v8 += 24;
  }
  while (v8 != 288);
}

+ (id)_newLegacyNetworkConstraintsWithDictionary:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_addNetworkConstraintsToDictionary:forNetworkType:legacyDictionary:", v5, 1, objc_msgSend(a3, "objectForKey:", CFSTR("2G")));
  objc_msgSend(a1, "_addNetworkConstraintsToDictionary:forNetworkType:legacyDictionary:", v5, 2, objc_msgSend(a3, "objectForKey:", CFSTR("3G")));
  objc_msgSend(a1, "_addNetworkConstraintsToDictionary:forNetworkType:legacyDictionary:", v5, 1000, objc_msgSend(a3, "objectForKey:", CFSTR("WiFi")));
  return v5;
}

+ (id)_newModernNetworkConstraintsWithArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  SSNetworkConstraints *v15;
  SSNetworkConstraints *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v23 = a3;
    do
    {
      v8 = 0;
      v22 = sel_BOOLValue;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("kinds"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v10, "count"))
            {
              v11 = objc_msgSend(v9, "objectForKey:", CFSTR("enabled"));
              if (!v11
                || (v12 = (void *)v11, (objc_opt_respondsToSelector() & 1) != 0)
                && (objc_msgSend(v12, "BOOLValue") & 1) != 0)
              {
                v13 = objc_msgSend(v9, "objectForKey:", CFSTR("size-limits"), v22);
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                v15 = objc_alloc_init(SSNetworkConstraints);
                v16 = v15;
                if ((isKindOfClass & 1) != 0)
                  -[SSNetworkConstraints setSizeLimitsWithStoreConstraintDictionary:](v15, "setSizeLimitsWithStoreConstraintDictionary:", v13);
              }
              else
              {
                v16 = objc_alloc_init(SSNetworkConstraints);
                -[SSNetworkConstraints setAllNetworkTypesDisabled](v16, "setAllNetworkTypesDisabled");
              }
              v26 = 0u;
              v27 = 0u;
              v24 = 0u;
              v25 = 0u;
              v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16, v22);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v25;
                do
                {
                  v20 = 0;
                  do
                  {
                    if (*(_QWORD *)v25 != v19)
                      objc_enumerationMutation(v10);
                    objc_msgSend(v4, "setObject:forKey:", v16, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20++));
                  }
                  while (v18 != v20);
                  v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                }
                while (v18);
              }

              a3 = v23;
            }
          }
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)_copySizeLimits
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSNetworkConstraints__copySizeLimits__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSNetworkConstraints__copySizeLimits__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_disableAllNetworkTypes
{
  void *v3;
  _QWORD v4[6];

  if (!self->_sizeLimits)
    self->_sizeLimits = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSNetworkConstraints__disableAllNetworkTypes__block_invoke;
  v4[3] = &unk_1E47BBA70;
  v4[4] = self;
  v4[5] = v3;
  SSNetworkTypeApplyBlock((uint64_t)v4);

}

void __47__SSNetworkConstraints__disableAllNetworkTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 40), v3);

}

- (void)_setSizeLimit:(int64_t)a3 forNetworkType:(int64_t)a4
{
  void *v6;
  NSMutableDictionary *sizeLimits;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), a4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a3);
  sizeLimits = self->_sizeLimits;
  if (!sizeLimits)
  {
    sizeLimits = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_sizeLimits = sizeLimits;
  }
  -[NSMutableDictionary setObject:forKey:](sizeLimits, "setObject:forKey:", v6, v8);

}

- (int64_t)_sizeLimitForNetworkType:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), a3);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_sizeLimits, "objectForKey:", v5);
  if (v6)
  {
LABEL_2:
    v7 = objc_msgSend(v6, "longLongValue");
  }
  else
  {
    if (SSNetworkTypeIsCellularType(v3))
    {
      while (v3 >= 2)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), --v3);
        v6 = (void *)-[NSMutableDictionary objectForKey:](self->_sizeLimits, "objectForKey:", v8);

        if (v6)
          goto LABEL_2;
      }
    }
    v7 = 0;
  }

  return v7;
}

- (SSNetworkConstraints)initWithCoder:(id)a3
{
  SSNetworkConstraints *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = -[SSNetworkConstraints init](self, "init");
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0), CFSTR("0"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        v5->_sizeLimits = (NSMutableDictionary *)objc_msgSend(v12, "mutableCopy");
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SSNetworkConstraints_encodeWithCoder___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __40__SSNetworkConstraints_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("0"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSObject *dispatchQueue;
  _QWORD block[7];

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSNetworkConstraints_copyWithZone___block_invoke;
  block[3] = &unk_1E47BBA98;
  block[4] = v5;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  return v5;
}

uint64_t __37__SSNetworkConstraints_copyWithZone___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[5] + 16), "copyWithZone:", a1[6]);
  *(_QWORD *)(a1[4] + 16) = result;
  return result;
}

- (SSNetworkConstraints)initWithXPCEncoding:(id)a3
{
  SSNetworkConstraints *v5;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v5 = -[SSNetworkConstraints init](self, "init");
    if (!v5)
      return v5;
    objc_opt_class();
    self = (SSNetworkConstraints *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");

    v5->_sizeLimits = (NSMutableDictionary *)-[SSNetworkConstraints mutableCopy](self, "mutableCopy");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  _QWORD v6[6];

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SSNetworkConstraints_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __39__SSNetworkConstraints_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "0", *(__CFString **)(*(_QWORD *)(a1 + 40) + 16));
}

@end
