@implementation PKPassTileDescriptor

+ (id)createWithPassDictionary:(id)a3 privateDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __objc2_class **v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  PKPassTileDescriptor *v32;
  id v33;
  __objc2_class **v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "PKArrayForKey:", CFSTR("tilesV2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "PKArrayForKey:", CFSTR("tiles"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = off_1E2A9F000;
  v51 = +[PKPassTileMetadata _createDictionaryMapForDictionaries:](PKPassTileMetadata, "_createDictionaryMapForDictionaries:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "PKArrayForKey:", CFSTR("tilesV2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v43 = v10;
    v44 = v6;
    v45 = v5;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v60;
      v47 = v14;
      v48 = v12;
      v46 = *(_QWORD *)v60;
      do
      {
        v18 = 0;
        v49 = v16;
        do
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v14);
          v53 = v18;
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v18);
          objc_msgSend(v19, "PKStringForKey:", CFSTR("context"), v43, v44, v45);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = PKPassTileContextFromString(v20);

          if (v21)
          {
            objc_msgSend(v19, "PKArrayForKey:", CFSTR("groups"));
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v58 = v51;
            v57 = objc_opt_self();
            v52 = v22;
            if (objc_msgSend(v22, "count"))
            {
              v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              v23 = v22;
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
              v25 = v58;
              if (v24)
              {
                v26 = v24;
                v27 = *(_QWORD *)v65;
                v55 = *(_QWORD *)v65;
                v56 = v23;
                do
                {
                  for (i = 0; i != v26; ++i)
                  {
                    if (*(_QWORD *)v65 != v27)
                      objc_enumerationMutation(v23);
                    v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                    v63 = 0;
                    v30 = (void *)-[__objc2_class _createWithDictionary:privateDictionaryMap:privateDictionary:context:](v11[52], "_createWithDictionary:privateDictionaryMap:privateDictionary:context:", v29, v25, &v63, v21);
                    v31 = v30;
                    if (v30 && objc_msgSend(v30, "isGroupType"))
                    {
                      v32 = [PKPassTileDescriptor alloc];
                      v33 = -[PKPassTileDescriptor _initWithMetadata:dictionary:privateDictionary:](v32, v31, v29, v63);
                      if (v33)
                      {
                        v34 = v11;
                        objc_msgSend(v29, "PKArrayForKey:", CFSTR("tiles"));
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = (void *)+[PKPassTileDescriptor _createConcreteTilesForDictionaries:privateDictionaryMap:context:](v57, v35, v25, v21);
                        objc_msgSend(v33, "setChildDescriptors:", v36);

                        objc_msgSend(v33, "childDescriptors");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        v38 = objc_msgSend(v37, "count");

                        if (v38)
                          objc_msgSend(v54, "addObject:", v33);

                        v11 = v34;
                        v25 = v58;
                        v27 = v55;
                        v23 = v56;
                      }

                    }
                  }
                  v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
                }
                while (v26);
              }

              if (objc_msgSend(v54, "count"))
                v39 = (void *)objc_msgSend(v54, "copy");
              else
                v39 = 0;
              v14 = v47;
              v12 = v48;
              v17 = v46;
              v16 = v49;

            }
            else
            {
              v39 = 0;
            }

            objc_msgSend(v12, "pk_safelyAddObjectsFromArray:", v39);
          }
          v18 = v53 + 1;
        }
        while (v53 + 1 != v16);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v16);
    }

    v6 = v44;
    v5 = v45;
    v10 = v43;
  }
  else
  {
    objc_msgSend(v5, "PKArrayForKey:", CFSTR("tiles"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "count"))
    {
      v41 = 0;
      goto LABEL_38;
    }
    v40 = (void *)+[PKPassTileDescriptor _createConcreteTilesForDictionaries:privateDictionaryMap:context:]((uint64_t)a1, v14, v51, 1);
    objc_msgSend(v12, "pk_safelyAddObjectsFromArray:", v40);

  }
  v41 = v12;
LABEL_38:

  return v41;
}

+ (uint64_t)_createConcreteTilesForDictionaries:(void *)a3 privateDictionaryMap:(uint64_t)a4 context:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  PKPassTileDescriptor *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_opt_self();
  if (objc_msgSend(v6, "count"))
  {
    v24 = v6;
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v26 = 0;
          v15 = +[PKPassTileMetadata _createWithDictionary:privateDictionaryMap:privateDictionary:context:](PKPassTileMetadata, "_createWithDictionary:privateDictionaryMap:privateDictionary:context:", v14, v7, &v26, a4);
          v16 = v15;
          if (v15)
          {
            if (v11 == 2)
            {
              if ((objc_msgSend(v15, "isSelectable") & 1) != 0)
                goto LABEL_25;
              v11 = 2;
            }
            else if (v11 == 1)
            {
              if ((objc_msgSend(v15, "isSelectable") & 1) == 0)
              {
LABEL_25:
                PKLogFacilityTypeGetObject(0);
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v16, "identifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v32 = v22;
                  _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "PKPassTileDescriptor: invalid configuration of tiles found by tile %@ - rejecting all tiles.", buf, 0xCu);

                }
                v20 = 0;
                v6 = v24;
                v19 = v25;
                goto LABEL_30;
              }
              v11 = 1;
            }
            else if (objc_msgSend(v15, "isSelectable"))
            {
              v11 = 1;
            }
            else
            {
              v11 = 2;
            }
            v17 = [PKPassTileDescriptor alloc];
            v18 = -[PKPassTileDescriptor _initWithMetadata:dictionary:privateDictionary:](v17, v16, v14, v26);
            if (v18)
              objc_msgSend(v25, "addObject:", v18);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v10)
          continue;
        break;
      }
    }

    v19 = v25;
    if (objc_msgSend(v25, "count"))
      v20 = objc_msgSend(v25, "copy");
    else
      v20 = 0;
    v6 = v24;
LABEL_30:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_initWithMetadata:(void *)a3 dictionary:(void *)a4 privateDictionary:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(void *, void *);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  uint64_t v33;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_msgSend(a1, "_init");
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)(v11 + 16), a2);
      v13 = objc_msgSend(*(id *)(v12 + 16), "type");
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke;
      v31 = &unk_1E2ADBE20;
      v33 = v13;
      v15 = v14;
      v32 = v15;
      v16 = (void (**)(void *, void *))_Block_copy(&v28);
      if (v10)
      {
        objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("states"), v28, v29, v30, v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, v17);

      }
      objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("states"), v28, v29, v30, v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v18);

      v19 = objc_msgSend(v15, "copy");
      v20 = *(void **)(v12 + 24);
      *(_QWORD *)(v12 + 24) = v19;

      objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("defaultConfiguration"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "PKStringForKey:", CFSTR("state"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v22;

      objc_msgSend(v21, "PKNumberForKey:", CFSTR("enabled"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        v26 = objc_msgSend(v24, "BOOLValue");
      else
        v26 = 1;
      *(_BYTE *)(v12 + 8) = v26;

    }
    a1 = (id)v12;
  }

  return a1;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassTileDescriptor;
  return -[PKPassTileDescriptor init](&v3, sel_init);
}

- (PKPassTileDescriptor)init
{

  return 0;
}

void __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke_2;
    v4[3] = &unk_1E2ADBDF8;
    v3 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);

  }
}

void __71__PKPassTileDescriptor__initWithMetadata_dictionary_privateDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = +[PKPassTileState _createForDictionary:withTileType:](PKPassTileState, "_createForDictionary:withTileType:", v5, *(_QWORD *)(a1 + 40));
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (id)createTileForState:(id)a3 childTiles:(id)a4 withBundle:(id)a5 privateBundle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSString *v15;
  NSString *defaultStateIdentifier;
  NSString *v17;
  void *v18;
  void *v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "isSupported")
    && (v14 = objc_msgSend(v10, "isEnabled"), v14 != 2)
    && (v14 || self->_defaultEnabled))
  {
    objc_msgSend(v10, "stateIdentifier");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultStateIdentifier = v15;
    if (!v15)
      defaultStateIdentifier = self->_defaultStateIdentifier;
    v17 = defaultStateIdentifier;

    objc_msgSend(v10, "stateOverride");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 && v17)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_states, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)objc_msgSend(v18, "createResolvedStateWithBundle:privateBundle:", v12, v13);

    if (v19)
      v20 = -[PKPassTile _initWithMetadata:childTiles:stateIdentifier:state:inProgress:]([PKPassTile alloc], "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", self->_metadata, v11, v17, v19, objc_msgSend(v10, "isInProgress"));
    else
      v20 = 0;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (PKPassTileMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSDictionary)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)childDescriptors
{
  return self->_childDescriptors;
}

- (void)setChildDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)defaultStateIdentifier
{
  return self->_defaultStateIdentifier;
}

- (void)setDefaultStateIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isDefaultEnabled
{
  return self->_defaultEnabled;
}

- (void)setDefaultEnabled:(BOOL)a3
{
  self->_defaultEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultStateIdentifier, 0);
  objc_storeStrong((id *)&self->_childDescriptors, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
