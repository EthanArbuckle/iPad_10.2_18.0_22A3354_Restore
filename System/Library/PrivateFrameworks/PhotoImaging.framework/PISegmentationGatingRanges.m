@implementation PISegmentationGatingRanges

- (PISegmentationGatingRanges)initWithRanges:(id)a3
{
  id v3;
  PISegmentationGatingRanges *v4;
  uint64_t v5;
  NSDictionary *ranges;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PISegmentationGatingRanges;
  v3 = a3;
  v4 = -[PISegmentationGatingRanges init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  ranges = v4->_ranges;
  v4->_ranges = (NSDictionary *)v5;

  return v4;
}

- (id)rangeForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_ranges, "objectForKeyedSubscript:", a3);
}

- (NSArray)scoreKeys
{
  return -[NSDictionary allKeys](self->_ranges, "allKeys");
}

- (void)setScoreKeys:(id)a3
{
  objc_storeStrong((id *)&self->_scoreKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreKeys, 0);
  objc_storeStrong((id *)&self->_ranges, 0);
}

+ (id)loadFromURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  PISegmentationGatingRanges *v8;
  PISegmentationGatingRanges *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __42__PISegmentationGatingRanges_loadFromURL___block_invoke;
    v17 = &unk_1E5018010;
    v18 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v14);
    v8 = [PISegmentationGatingRanges alloc];
    v9 = -[PISegmentationGatingRanges initWithRanges:](v8, "initWithRanges:", v7, v14, v15, v16, v17);

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_83_12748);
    v10 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v12 = v10;
      objc_msgSend(v3, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      v22 = 2114;
      v23 = v5;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Unable to load scoring ranges dictionary from %{public}@, error: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

void __42__PISegmentationGatingRanges_loadFromURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  PISegmentationGatingRange *v42;
  id v43;

  v43 = a2;
  v5 = a3;
  if ((objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0D75858]) & 1) == 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("min"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = &unk_1E5051DE8;
    v9 = v8;

    objc_msgSend(v5, "objectForKey:", CFSTR("max"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = &unk_1E5051DF8;
    v13 = v12;

    objc_msgSend(v5, "objectForKey:", CFSTR("manualMin"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v9;
    v17 = v16;

    objc_msgSend(v5, "objectForKey:", CFSTR("manualMax"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = v13;
    v21 = v20;

    objc_msgSend(v5, "objectForKey:", CFSTR("depthMin"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (void *)v22;
    else
      v24 = &unk_1E5051DE8;
    v25 = v24;

    objc_msgSend(v5, "objectForKey:", CFSTR("depthMax"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = &unk_1E5051DF8;
    v29 = v28;

    objc_msgSend(v9, "doubleValue");
    v31 = v30;
    objc_msgSend(v13, "doubleValue");
    v33 = v32;
    objc_msgSend(v17, "doubleValue");
    v35 = v34;
    objc_msgSend(v21, "doubleValue");
    v37 = v36;
    objc_msgSend(v25, "doubleValue");
    v39 = v38;

    objc_msgSend(v29, "doubleValue");
    v41 = v40;

    v42 = -[PISegmentationGatingRange initWithMin:max:manualMin:manualMax:depthMin:depthMax:]([PISegmentationGatingRange alloc], "initWithMin:max:manualMin:manualMax:depthMin:depthMax:", v31, v33, v35, v37, v39, v41);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v42, v43);

  }
}

@end
