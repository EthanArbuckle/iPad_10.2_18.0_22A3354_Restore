@implementation TIMobileAssetMatch

- (TIMobileAssetMatch)initWithTypes:(id)a3 inputModeLevels:(id)a4 regions:(id)a5
{
  id v8;
  id v9;
  TIMobileAssetMatch *v10;
  uint64_t v11;
  NSArray *types;
  uint64_t v13;
  NSArray *inputModeLevels;
  NSArray *v15;
  NSArray *regions;
  void *v17;
  int i;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  TIMobileAssetMatch *v52;
  id v53;
  id v54;
  id v55;
  id obj;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v55 = a5;
  v75.receiver = self;
  v75.super_class = (Class)TIMobileAssetMatch;
  v10 = -[TIMobileAssetMatch init](&v75, sel_init);
  if (!v10)
    goto LABEL_48;
  v54 = v8;
  v11 = objc_msgSend(v8, "copy");
  types = v10->_types;
  v10->_types = (NSArray *)v11;

  v53 = v9;
  v13 = objc_msgSend(v9, "copy");
  inputModeLevels = v10->_inputModeLevels;
  v10->_inputModeLevels = (NSArray *)v13;

  v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  regions = v10->_regions;
  v52 = v10;
  v10->_regions = v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v19 = v55;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v72;
LABEL_5:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v72 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v23);
        if ((unint64_t)objc_msgSend(v17, "count") > 1)
          break;
        v25 = objc_msgSend(v17, "count");
        if (v25 == objc_msgSend(v19, "count"))
          break;
        if (i == 1)
        {
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ContactLabel"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "length");

          if (v30)
            goto LABEL_19;
        }
        else
        {
          if (i)
            goto LABEL_19;
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ContactLabel"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = v26;
            if (!objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("Home")))
            {

LABEL_19:
              if ((objc_msgSend(v17, "containsObject:", v24) & 1) == 0)
                objc_msgSend(v17, "addObject:", v24);
              goto LABEL_21;
            }
            v28 = objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("Work"));

            if (!v28)
              goto LABEL_19;
          }
        }
LABEL_21:
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          if (v21)
            goto LABEL_5;
          break;
        }
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v17;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  if (v31)
  {
    v32 = v31;
    v57 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v68 != v57)
          objc_enumerationMutation(obj);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "mutableCopy");
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        +[TIMobileAssetMatch knownAssetRegionAttributes](TIMobileAssetMatch, "knownAssetRegionAttributes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v64;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v64 != v38)
                objc_enumerationMutation(v35);
              v40 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k);
              objc_msgSend(v34, "objectForKeyedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v41)
                objc_msgSend(v34, "setObject:forKeyedSubscript:", &stru_1EA1081D0, v40);
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
          }
          while (v37);
        }

        objc_msgSend(v58, "addObject:", v34);
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    }
    while (v32);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v42 = v58;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
  v10 = v52;
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v60 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
        objc_msgSend(v47, "keysOfEntriesPassingTest:", &__block_literal_global_33_3743);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "allObjects");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "dictionaryWithValuesForKeys:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSArray addObject:](v52->_regions, "addObject:", v50);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
    }
    while (v44);
  }

  v9 = v53;
  v8 = v54;
LABEL_48:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *types;
  NSArray *inputModeLevels;
  NSArray *regions;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    types = self->_types;
    if ((types == (NSArray *)v5[1] || -[NSArray isEqual:](types, "isEqual:"))
      && ((inputModeLevels = self->_inputModeLevels, inputModeLevels == (NSArray *)v5[2])
       || -[NSArray isEqual:](inputModeLevels, "isEqual:")))
    {
      regions = self->_regions;
      if (regions == (NSArray *)v5[3])
        v9 = 1;
      else
        v9 = -[NSArray isEqual:](regions, "isEqual:");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = 257 * -[NSArray hash](self->_types, "hash");
  v4 = 257 * (-[NSArray hash](self->_inputModeLevels, "hash") + v3);
  return v4 + -[NSArray hash](self->_regions, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMobileAssetMatch types](self, "types");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMobileAssetMatch inputModeLevels](self, "inputModeLevels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMobileAssetMatch regions](self, "regions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: types=%@, inputModeLevels=%@, regions=%@>"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)types
{
  return self->_types;
}

- (NSArray)inputModeLevels
{
  return self->_inputModeLevels;
}

- (NSArray)regions
{
  return self->_regions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_inputModeLevels, 0);
  objc_storeStrong((id *)&self->_types, 0);
}

uint64_t __60__TIMobileAssetMatch_initWithTypes_inputModeLevels_regions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  +[TIMobileAssetMatch knownAssetRegionAttributes](TIMobileAssetMatch, "knownAssetRegionAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  return v4;
}

+ (id)knownAssetRegionAttributes
{
  if (knownAssetRegionAttributes_onceToken != -1)
    dispatch_once(&knownAssetRegionAttributes_onceToken, &__block_literal_global_3752);
  return (id)knownAssetRegionAttributes_assetRegionAttributes;
}

+ (id)mobileAssetMatchWithTypes:(id)a3 inputModeLevels:(id)a4 regions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTypes:inputModeLevels:regions:", v10, v9, v8);

  return v11;
}

void __48__TIMobileAssetMatch_knownAssetRegionAttributes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("City");
  v3[1] = CFSTR("Province");
  v3[2] = CFSTR("Country");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)knownAssetRegionAttributes_assetRegionAttributes;
  knownAssetRegionAttributes_assetRegionAttributes = v1;

}

@end
