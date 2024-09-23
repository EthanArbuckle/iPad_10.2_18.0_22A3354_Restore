@implementation PPNamedEntityFilter

- (PPNamedEntityFilter)initWithModel:(id)a3
{
  id v5;
  PPNamedEntityFilter *v6;
  PPNamedEntityFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPNamedEntityFilter;
  v6 = -[PPNamedEntityFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (PPNamedEntityFilter)init
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  PPNamedEntityFilter *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "mlModelForModelName:namespaceName:error:", CFSTR("PPModel_NE_Filtering.mlmodelc"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"), &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;

  if (!v4)
    goto LABEL_3;
  objc_msgSend(v4, "modelDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputDescriptionsByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("computed_filterScore"));

  if (v9)
  {
LABEL_3:
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_fault_impl(&dword_1C392E000, v10, OS_LOG_TYPE_FAULT, "PPNamedEntityFilter: unable to initialize correct model from Trial: %@", buf, 0xCu);
    }

  }
  v11 = -[PPNamedEntityFilter initWithModel:](self, "initWithModel:", v4);

  return v11;
}

- (id)filterScoredNamedEntities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_13842);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPNamedEntityFilter _filterNamedEntities:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 >= objc_msgSend(v4, "count"))
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(v4, "objectsAtIndexes:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)filterNamedEntityRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPNamedEntityFilter _filterNamedEntities:]((uint64_t)self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 >= objc_msgSend(v4, "count"))
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(v4, "objectsAtIndexes:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (BOOL)isAcceptableRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v4, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  -[PPNamedEntityFilter _filterNamedEntities:]((uint64_t)self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "count") == 1;

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

- (id)_filterNamedEntities:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
    v5 = v4;
    if (*(_QWORD *)(a1 + 8))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__PPNamedEntityFilter__filterNamedEntities___block_invoke;
      v10[3] = &unk_1E7E1A878;
      v10[4] = a1;
      v6 = v4;
      v11 = v6;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
      v7 = v11;
      v8 = v6;

    }
    else
    {
      pp_default_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C392E000, v8, OS_LOG_TYPE_FAULT, "PPNamedEntityFilter: no model available to perform filtering.", buf, 2u);
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __44__PPNamedEntityFilter__filterNamedEntities___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int IsWellFormed;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  uint8_t v41[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsWellFormed = PPStringIsWellFormed();

  if (IsWellFormed)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v34 = 0;
    objc_msgSend(v8, "predictionFromFeatures:error:", v5, &v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34;
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = v9;
      v13 = v12;
      if (v11)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v12, "featureNames");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v36;
          v31 = v10;
          v32 = v9;
          v29 = a3;
          v30 = a1;
          while (2)
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v17);
              v19 = (void *)MEMORY[0x1C3BD6630]();
              v20 = v13;
              objc_msgSend(v13, "featureValueForName:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "multiArrayValue");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v18, "isEqualToString:", CFSTR("computed_filterScore")))
              {
                pp_default_log_handle();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1C392E000, v28, OS_LOG_TYPE_FAULT, "PPNamedEntityFilter: encountered a stale model for filtering.", buf, 2u);
                }
LABEL_26:
                v10 = v31;
                v9 = v32;
                a3 = v29;

                objc_autoreleasePoolPop(v19);
                goto LABEL_27;
              }
              if (objc_msgSend(v18, "hasPrefix:", CFSTR("computed_")) && objc_msgSend(v22, "count") >= 1)
              {
                v23 = 0;
                while (1)
                {
                  objc_msgSend(v22, "objectAtIndexedSubscript:", v23, v29);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "doubleValue");
                  v26 = v25;

                  if (v26 > 0.00999999978)
                    break;
                  if (++v23 >= objc_msgSend(v22, "count"))
                    goto LABEL_15;
                }
                pp_entities_log_handle();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v40 = v18;
                  _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPNamedEntityFilter: filtering based on output of feature %@", buf, 0xCu);
                }
                goto LABEL_26;
              }
LABEL_15:

              objc_autoreleasePoolPop(v19);
              ++v17;
              v13 = v20;
            }
            while (v17 != v15);
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
            v10 = v31;
            v9 = v32;
            if (v15)
              continue;
            break;
          }
        }

      }
      else
      {
        v30 = a1;

LABEL_27:
        objc_msgSend(*(id *)(v30 + 40), "removeIndex:", a3, v29);
      }
    }
    else
    {
      pp_entities_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v41 = 138412290;
        v42 = v10;
        _os_log_error_impl(&dword_1C392E000, v27, OS_LOG_TYPE_ERROR, "PPNamedEntityFilter: encountered error in filtering %@", v41, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a3);
  }

}

uint64_t __48__PPNamedEntityFilter_filterNamedEntityRecords___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "entity");
}

uint64_t __49__PPNamedEntityFilter_filterScoredNamedEntities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "item");
}

@end
