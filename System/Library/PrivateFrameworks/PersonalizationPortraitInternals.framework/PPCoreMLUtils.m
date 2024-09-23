@implementation PPCoreMLUtils

+ (id)flattenFeatureProviderArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  SEL v58;
  uint64_t v60;
  void *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  _BYTE v83[128];
  _BYTE v84[128];
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v58 = a2;
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_new();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v76;
      v60 = *(_QWORD *)v76;
      v61 = v7;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v76 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v11);
          objc_msgSend(v4, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "featureValueForName:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "type");

          switch(v15)
          {
            case 1:
              v74[0] = MEMORY[0x1E0C809B0];
              v74[1] = 3221225472;
              v74[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke;
              v74[3] = &unk_1E7E1F818;
              v74[4] = v12;
              objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v74);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)MEMORY[0x1E0C9E918];
              +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)a1, v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "featureValueWithMultiArray:", v18);
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case 2:
              v22 = objc_alloc(MEMORY[0x1E0C9E970]);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v23;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)objc_msgSend(v22, "initWithShape:dataType:error:", v24, 65568, 0);

              if (objc_msgSend(v4, "count"))
              {
                v26 = 0;
                do
                {
                  v27 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v4, "objectAtIndexedSubscript:", v26);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "featureValueForName:", v12);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "doubleValue");
                  objc_msgSend(v27, "numberWithDouble:");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setObject:atIndexedSubscript:", v30, v26);

                  ++v26;
                }
                while (v26 < objc_msgSend(v4, "count"));
              }
              v7 = v61;
              if (!v25)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", v58, a1, CFSTR("PPCoreMLUtils.m"), 85, CFSTR("PPCoreMLUtils: was unable to allocate feature array"));

              }
              objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v25);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v31, v12);

              goto LABEL_38;
            case 3:
              v73[0] = MEMORY[0x1E0C809B0];
              v73[1] = 3221225472;
              v73[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_2;
              v73[3] = &unk_1E7E1F818;
              v73[4] = v12;
              objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v73);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)MEMORY[0x1E0C9E918];
              objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithStringArray:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "featureValueWithSequence:", v18);
              v19 = objc_claimAutoreleasedReturnValue();
LABEL_10:
              v21 = (void *)v19;
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, v12);

              break;
            case 7:
              objc_msgSend(v4, "firstObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "featureValueForName:", v12);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "sequenceValue");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "int64Values");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "count");

              if (v36)
              {
                v72[0] = MEMORY[0x1E0C809B0];
                v72[1] = 3221225472;
                v72[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_3;
                v72[3] = &unk_1E7E1F818;
                v72[4] = v12;
                objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v72);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = (void *)objc_opt_new();
                v68 = 0u;
                v69 = 0u;
                v70 = 0u;
                v71 = 0u;
                v39 = v37;
                v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                if (v40)
                {
                  v41 = v40;
                  v42 = *(_QWORD *)v69;
                  do
                  {
                    for (i = 0; i != v41; ++i)
                    {
                      if (*(_QWORD *)v69 != v42)
                        objc_enumerationMutation(v39);
                      objc_msgSend(v38, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
                    }
                    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                  }
                  while (v41);
                }

                v44 = (void *)MEMORY[0x1E0C9E918];
                +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v38);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "featureValueWithMultiArray:", v45);
                v46 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v67[0] = MEMORY[0x1E0C809B0];
                v67[1] = 3221225472;
                v67[2] = __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_4;
                v67[3] = &unk_1E7E1F818;
                v67[4] = v12;
                objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v67);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = (void *)objc_opt_new();
                v63 = 0u;
                v64 = 0u;
                v65 = 0u;
                v66 = 0u;
                v39 = v48;
                v49 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
                if (v49)
                {
                  v50 = v49;
                  v51 = *(_QWORD *)v64;
                  do
                  {
                    for (j = 0; j != v50; ++j)
                    {
                      if (*(_QWORD *)v64 != v51)
                        objc_enumerationMutation(v39);
                      objc_msgSend(v38, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
                    }
                    v50 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
                  }
                  while (v50);
                }

                v53 = (void *)MEMORY[0x1E0C9E918];
                objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithStringArray:", v38);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "featureValueWithSequence:", v45);
                v46 = objc_claimAutoreleasedReturnValue();
              }
              v54 = (void *)v46;
              v7 = v61;
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v46, v12);

LABEL_38:
              v10 = v60;
              break;
            default:
              pp_default_log_handle();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 134218242;
                v80 = v15;
                v81 = 2112;
                v82 = v12;
                _os_log_fault_impl(&dword_1C392E000, v47, OS_LOG_TYPE_FAULT, "PPCoreMLUtilities: Tried to flatten a feature of type %ld, which is not supported. Feature: %@", buf, 0x16u);
              }

              break;
          }
          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
      }
      while (v9);
    }

    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v7, 0);
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

+ (id)flattenMultiArray:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    if (objc_msgSend(v3, "count"))
    {
      v5 = 0;
      do
      {
        v6 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "floatValue");
        objc_msgSend(v6, "numberWithFloat:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

        ++v5;
      }
      while (v5 < objc_msgSend(v3, "count"));
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)multiArrayForArray:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = (void *)objc_msgSend(v4, "initWithShape:dataType:error:", v6, 65600, &v14);
  v8 = v14;

  if (v7)
  {
    if (objc_msgSend(v3, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v10, v9);

        ++v9;
      }
      while (objc_msgSend(v3, "count") > v9);
    }
    v11 = v7;
  }
  else
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPCoreMLUtils: Unable to load array to MLMultiArray: %@", buf, 0xCu);
    }

  }
  return v7;
}

+ (id)multiArrayFeatureValueForNumber:(id)a3
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
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  objc_msgSend(a1, "multiArrayForArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)scoringContextWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD6630](a1, a2);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPCoreMLUtils multiArrayForArray:](PPCoreMLUtils, "multiArrayForArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  v10 = (void *)MEMORY[0x1C3BD6630]();
  v11 = (void *)objc_opt_new();
  objc_autoreleasePoolPop(v10);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("scoringDate"));

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v11, a3);

  return v13;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "featureValueForName:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "int64Value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_multiArrayForNumberArray:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v4 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithShape:dataType:error:", v6, 65568, 0);

  if (objc_msgSend(v2, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v9, v8);

      ++v8;
    }
    while (v8 < objc_msgSend(v2, "count"));
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__multiArrayForNumberArray_, v3, CFSTR("PPCoreMLUtils.m"), 53, CFSTR("PPCoreMLUtils: Unable to construct multiarray"));

  }
  return v7;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "featureValueForName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "featureValueForName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sequenceValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "int64Values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__PPCoreMLUtils_flattenFeatureProviderArray___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "featureValueForName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sequenceValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
