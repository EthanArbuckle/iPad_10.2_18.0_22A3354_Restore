@implementation SVDCapability

- (id)key
{
  void *v2;
  void *v3;

  -[SVDCapability _swiftBacking](self, "_swiftBacking");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)matchesCapabilityDescriptions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  char v25;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v8 = 0x1EF7D1000uLL;
    do
    {
      v9 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc((Class)(v8 + 3256));
        v14 = v13;
        if (v12)
        {
          v15 = (void *)objc_msgSend(v13, "initWithKey:valueSet:", v11, v12);
        }
        else
        {
          objc_msgSend(v10, "valueRangeLowerBound");
          v16 = v7;
          v17 = v4;
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v21 = v20;
          objc_msgSend(v10, "valueRangeUpperBound");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v15 = (void *)objc_msgSend(v14, "initWithKey:lowerbound:upperbound:", v11, v21, v23);

          v8 = v18;
          v4 = v17;
          v7 = v16;
          v6 = v28;
        }
        objc_msgSend(v4, "addObject:", v15);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

  -[SVDCapability _swiftBacking](self, "_swiftBacking");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "conformsToProtocol:", &unk_1EF7D76D8))
    v25 = objc_msgSend(v24, "matchesWithDescriptions:", v4);
  else
    v25 = 0;

  return v25;
}

- (id)_swiftBacking
{
  return 0;
}

- (SVDCapability)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SVDCapability;
  return -[SVDCapability init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
