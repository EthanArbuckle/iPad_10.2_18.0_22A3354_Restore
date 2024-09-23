@implementation PPSpotlightScoringFeatureVector

- (PPSpotlightScoringFeatureVector)init
{
  PPSpotlightScoringFeatureVector *v2;
  uint64_t v3;
  NSMutableSet *features;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSpotlightScoringFeatureVector;
  v2 = -[PPSpotlightScoringFeatureVector init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    features = v2->_features;
    v2->_features = (NSMutableSet *)v3;

  }
  return v2;
}

- (id)encodeAsData
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = -[NSMutableSet count](self->_features, "count");
  if (v4 >= 0xC8)
    v5 = 200;
  else
    v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4 * v5);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_features;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v17 = 0;
        v17 = objc_msgSend(v12, "unsignedIntValue");
        objc_msgSend(v6, "appendBytes:length:", &v17, 4);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if ((objc_msgSend(v6, "length") & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "length");
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSpotlightScoringFeatureVector.m"), 38, CFSTR("Invalid NSData size of %tu in %@"), v15, v16);

  }
  return v6;
}

- (void)addQidString:(id)a3
{
  uint64_t v4;
  NSMutableSet *features;
  id v6;

  v4 = qidStringToNumeric(a3);
  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](features, "addObject:", v6);

}

- (BOOL)containsQidString:(id)a3
{
  uint64_t v4;
  NSMutableSet *features;
  void *v6;

  v4 = qidStringToNumeric(a3);
  features = self->_features;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(features) = -[NSMutableSet containsObject:](features, "containsObject:", v6);

  return (char)features;
}

- (id)qidStrings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSMutableSet allObjects](self->_features, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_4302);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

id __45__PPSpotlightScoringFeatureVector_qidStrings__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_msgSend(v3, "unsignedIntValue");

  return (id)objc_msgSend(v4, "initWithFormat:", CFSTR("Q%u"), v5);
}

+ (id)decodeFeatureVectorFromData:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  double v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    pp_universal_search_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v13;
      _os_log_debug_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_DEBUG, "%@: attempt to decode empty feature vector", buf, 0xCu);
      goto LABEL_13;
    }
LABEL_14:

    v21 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v8, "doubleValue");
  if (v9 == 1.0)
  {
    pp_universal_search_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      *(_DWORD *)buf = 138412546;
      v37 = v32;
      v38 = 2048;
      v39 = v33;
      _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "%@: decoding feature vector of deprecated version: %f", buf, 0x16u);

    }
    v11 = objc_msgSend(v7, "length");
    if (__ROR8__(0xAAAAAAAAAAAAAAABLL * objc_msgSend(v7, "length"), 1) >= 0x2AAAAAAAAAAAAAABuLL)
    {
      pp_default_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "length");
        *(_DWORD *)buf = 138412546;
        v37 = v13;
        v38 = 2048;
        v39 = v14;
        _os_log_fault_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_FAULT, "%@: Invalid V1 NSData size of %tu", buf, 0x16u);
LABEL_13:

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v21 = (_QWORD *)objc_opt_new();
    if (v11 >= 6)
    {
      v23 = 0;
      v24 = 6 * (v11 / 6uLL);
      do
      {
        *(_DWORD *)buf = 0;
        objc_msgSend(v7, "getBytes:range:", buf, v23, 4);
        v25 = (void *)v21[1];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)buf);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

        v23 += 6;
      }
      while (v24 != v23);
    }
  }
  else
  {
    objc_msgSend(v8, "doubleValue");
    v16 = v15;
    +[PPSpotlightScoringFeatureVector featureVectorVersion](PPSpotlightScoringFeatureVector, "featureVectorVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    if (v16 != v19)
    {
      pp_universal_search_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        *(_DWORD *)buf = 138412546;
        v37 = v13;
        v38 = 2048;
        v39 = v20;
        _os_log_error_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_ERROR, "%@: attempt to decode feature vector of unsupported version: %f", buf, 0x16u);
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    v27 = objc_msgSend(v7, "length");
    if ((objc_msgSend(v7, "length") & 3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPSpotlightScoringFeatureVector.m"), 81, CFSTR("%@: Invalid NSData size of %tu"), v35, objc_msgSend(v7, "length"));

    }
    v21 = (_QWORD *)objc_opt_new();
    if (v27 >> 2)
    {
      v28 = 0;
      v29 = 4 * (v27 >> 2);
      do
      {
        *(_DWORD *)buf = 0;
        objc_msgSend(v7, "getBytes:range:", buf, v28, 4);
        v30 = (void *)v21[1];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)buf);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v31);

        v28 += 4;
      }
      while (v29 != v28);
    }
  }
LABEL_15:

  return v21;
}

+ (id)featureVectorVersion
{
  return &unk_1E2284590;
}

@end
