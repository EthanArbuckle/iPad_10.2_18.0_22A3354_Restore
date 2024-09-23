@implementation PHAPrivateFederatedLearningModelValidator

- (PHAPrivateFederatedLearningModelValidator)initWithEspressoModelURL:(id)a3 espressoModelShapeURL:(id)a4
{
  id v7;
  id v8;
  PHAPrivateFederatedLearningModelValidator *v9;
  PHAPrivateFederatedLearningModelValidator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAPrivateFederatedLearningModelValidator;
  v9 = -[PHAPrivateFederatedLearningModelValidator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_espressoModelURL, a3);
    objc_storeStrong((id *)&v10->_espressoModelShapeURL, a4);
  }

  return v10;
}

- (BOOL)isValidWithFingerprintVersionName:(id)a3 modelInputName:(id)a4 modelOutputName:(id)a5 labelName:(id)a6 labelPolicyName:(id)a7 lossName:(id)a8 layersToTrain:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  int64_t v46;
  const __CFString *v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id obj;
  id obja;
  id objb;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = -[PHAPrivateFederatedLearningModelValidator _featureVectorSizeForFingerprintVersionName:error:](self, "_featureVectorSizeForFingerprintVersionName:error:", a3, a10);
  if (v22)
  {
    v23 = v22;
    v76 = v18;
    -[PHAPrivateFederatedLearningModelValidator espressoModelURL](self, "espressoModelURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningModelValidator _dictionaryForJSONFileURL:error:](self, "_dictionaryForJSONFileURL:error:", v24, a10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v48 = 0;
      v18 = v76;
LABEL_60:

      goto LABEL_61;
    }
    v74 = v21;
    v26 = v20;
    v27 = v17;
    v28 = v19;
    -[PHAPrivateFederatedLearningModelValidator espressoModelShapeURL](self, "espressoModelShapeURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningModelValidator _dictionaryForJSONFileURL:error:](self, "_dictionaryForJSONFileURL:error:", v29, a10);
    v30 = objc_claimAutoreleasedReturnValue();

    v75 = (void *)v30;
    if (!v30)
    {
      v48 = 0;
      v18 = v76;
      v19 = v28;
      v17 = v27;
      v20 = v26;
      v21 = v74;
LABEL_59:

      goto LABEL_60;
    }
    -[PHAPrivateFederatedLearningModelValidator _layerConfigForModelInputName:modelConfig:error:](self, "_layerConfigForModelInputName:modelConfig:error:", v16, v25, a10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v76;
    if (!v31)
    {
      v48 = 0;
      v19 = v28;
      v17 = v27;
      v20 = v26;
      v21 = v74;
LABEL_58:

      goto LABEL_59;
    }
    v73 = v31;
    -[PHAPrivateFederatedLearningModelValidator _sizeForLayerName:modelShape:error:](self, "_sizeForLayerName:modelShape:error:", v16, v30, a10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = v32;
      if (objc_msgSend(v32, "integerValue") == v23)
      {
        v68 = v33;
        -[PHAPrivateFederatedLearningModelValidator _layerConfigForModelOutputName:modelConfig:error:](self, "_layerConfigForModelOutputName:modelConfig:error:", v27, v25, a10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v69 = v28;
        if (!v34)
        {
          v48 = 0;
          v17 = v27;
          v20 = v26;
          v21 = v74;
LABEL_56:

          v32 = v68;
          v19 = v69;
          goto LABEL_57;
        }
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("attributes"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("is_output"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "integerValue") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output layer is not set as an output of the model (%@)"), v37);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a10, 11, v51, 0);

          v48 = 0;
          v18 = v76;
          v17 = v27;
          v20 = v26;
          v21 = v74;
LABEL_55:

          goto LABEL_56;
        }
        v17 = v27;
        -[PHAPrivateFederatedLearningModelValidator _sizeForLayerName:modelShape:error:](self, "_sizeForLayerName:modelShape:error:", v27, v75, a10);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          v48 = 0;
          v18 = v76;
          v20 = v26;
          v21 = v74;
LABEL_54:

          goto LABEL_55;
        }
        v64 = v38;
        v20 = v26;
        v39 = objc_msgSend(v26, "isEqualToString:", CFSTR("mse"));
        v21 = v74;
        if ((v39 & 1) != 0 || (objc_msgSend(v20, "isEqualToString:", CFSTR("cross_entropy")) & 1) != 0)
        {
LABEL_12:
          v61 = v37;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          obj = v74;
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
          if (v40)
          {
            v41 = v40;
            v70 = *(id *)v78;
            v62 = v35;
            while (2)
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(id *)v78 != v70)
                  objc_enumerationMutation(obj);
                -[PHAPrivateFederatedLearningModelValidator _layerConfigForLayerName:modelConfig:error:](self, "_layerConfigForLayerName:modelConfig:error:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i), v25, a10);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v43)
                {

                  v48 = 0;
                  v18 = v76;
                  v37 = v61;
                  v35 = v62;
                  goto LABEL_53;
                }
              }
              v35 = v62;
              v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
              if (v41)
                continue;
              break;
            }
          }

          v18 = v76;
          -[PHAPrivateFederatedLearningModelValidator _layerConfigForLabelName:modelConfig:error:](self, "_layerConfigForLabelName:modelConfig:error:", v76, v25, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v44)
          {
            v48 = 1;
            v37 = v61;
LABEL_52:

            goto LABEL_53;
          }
          v71 = v44;
          -[PHAPrivateFederatedLearningModelValidator _sizeForLayerName:modelShape:error:](self, "_sizeForLayerName:modelShape:error:", v76, v75, a10);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            obja = v45;
            v46 = +[PHAPrivateFederatedLearningRecipeOptions labelPolicyForLabelPolicyName:](PHAPrivateFederatedLearningRecipeOptions, "labelPolicyForLabelPolicyName:", v69);
            if (v46 == 1)
            {
              v37 = v61;
              if (objc_msgSend(obja, "integerValue") != 2)
              {
                v47 = CFSTR("One-hot label policy requires label size to be 2 (%@)");
                goto LABEL_50;
              }
            }
            else
            {
              v37 = v61;
              if (!v46 && objc_msgSend(obja, "integerValue") != 1)
              {
                v47 = CFSTR("Indexed label policy requires label size to be 1 (%@)");
LABEL_50:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v47, obja);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a10, 14, v59, 0);

                v45 = obja;
                v48 = 0;
                v18 = v76;
                goto LABEL_51;
              }
            }
            v48 = 1;
            v45 = obja;
          }
          else
          {
            v48 = 0;
            v37 = v61;
          }
LABEL_51:

          v44 = v71;
          goto LABEL_52;
        }
        -[PHAPrivateFederatedLearningModelValidator _layerConfigForModelOutputName:modelConfig:error:](self, "_layerConfigForModelOutputName:modelConfig:error:", v20, v25, a10);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
        {
          objb = v52;
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("attributes"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("is_output"));
          v72 = (id)objc_claimAutoreleasedReturnValue();

          v54 = v72;
          if (objc_msgSend(v72, "integerValue") == 1)
          {
            v63 = v35;
            -[PHAPrivateFederatedLearningModelValidator _sizeForLayerName:modelShape:error:](self, "_sizeForLayerName:modelShape:error:", v20, v75, a10);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v55;
            if (v55)
            {
              if (objc_msgSend(v55, "integerValue") == 1)
              {

                v35 = v63;
                goto LABEL_12;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loss size (%@) is different than 1"), v56);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a10, 12, v58, 0);

              v54 = v72;
            }

            v48 = 0;
            v18 = v76;
            v35 = v63;
LABEL_53:
            v38 = v64;
            goto LABEL_54;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loss layer is not set as an output of the model (%@)"), v72);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a10, 13, v57, 0);

        }
        v48 = 0;
        v18 = v76;
        goto LABEL_53;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input size (%@) does not match feature vector size (%lu)"), v33, v23);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a10, 10, v49, 0);

      v18 = v76;
      v48 = 0;
      v50 = v28;
      v17 = v27;
      v20 = v26;
      v21 = v74;
      v32 = v33;
      v19 = v50;
    }
    else
    {
      v48 = 0;
      v19 = v28;
      v17 = v27;
      v20 = v26;
      v21 = v74;
    }
LABEL_57:

    v31 = v73;
    goto LABEL_58;
  }
  v48 = 0;
LABEL_61:

  return v48;
}

- (int64_t)_featureVectorSizeForFingerprintVersionName:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;
  PHAPrivateFederatedLearningModelValidator *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  id v20;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0D75F68], "fingerprintVersionForName:", v6);
  if (-[PHAPrivateFederatedLearningModelValidator _isFingerprintVersionSupported:](self, "_isFingerprintVersionSupported:", v7))
  {
    v8 = (void *)MEMORY[0x1E0D75F68];
    v9 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    v20 = 0;
    objc_msgSend(v8, "featureExtractorForFingerprintVersion:withGraph:withTransformers:error:", v7, v9, 0, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;

    if (v10)
    {
      objc_msgSend(v10, "featureNames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Feature vector has size 0 for fingerprint version %lu"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self;
      v16 = a4;
      v17 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error getting feature extractor for fingerprint version %lu"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self;
      v16 = a4;
      v17 = 1;
    }
    -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](v15, "_generateError:errorCode:errorMessage:underlyingError:", v16, v17, v14, v11);

    v13 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fingerprint version %@ is not supported by PFL. If you really want to use it, please disable validation."), v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a4, 15, v18, 0);

  v13 = 0;
LABEL_9:

  return v13;
}

- (id)_dictionaryForJSONFileURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error parsing file %@"), v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a4, 5, v12, v9);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error reading file %@"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a4, 4, v11, 0);

      v8 = 0;
    }

  }
  else
  {
    -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a4, 3, CFSTR("JSON file url is nil."), 0);
    v8 = 0;
  }

  return v8;
}

- (id)_layerConfigForModelInputName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  return -[PHAPrivateFederatedLearningModelValidator _layerConfigForName:modelConfig:attributeName:useEquality:error:](self, "_layerConfigForName:modelConfig:attributeName:useEquality:error:", a3, a4, CFSTR("bottom"), 1, a5);
}

- (id)_layerConfigForModelOutputName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  return -[PHAPrivateFederatedLearningModelValidator _layerConfigForName:modelConfig:attributeName:useEquality:error:](self, "_layerConfigForName:modelConfig:attributeName:useEquality:error:", a3, a4, CFSTR("top"), 1, a5);
}

- (id)_layerConfigForLabelName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  return -[PHAPrivateFederatedLearningModelValidator _layerConfigForName:modelConfig:attributeName:useEquality:error:](self, "_layerConfigForName:modelConfig:attributeName:useEquality:error:", a3, a4, CFSTR("bottom"), 0, a5);
}

- (id)_layerConfigForLayerName:(id)a3 modelConfig:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  -[PHAPrivateFederatedLearningModelValidator _layerConfigForName:modelConfig:attributeName:useEquality:error:](self, "_layerConfigForName:modelConfig:attributeName:useEquality:error:", v8, v9, CFSTR("name"), 1, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("\\/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningModelValidator _layerConfigForName:modelConfig:attributeName:useEquality:error:](self, "_layerConfigForName:modelConfig:attributeName:useEquality:error:", v11, v9, CFSTR("name"), 1, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_layerConfigForName:(id)a3 modelConfig:(id)a4 attributeName:(id)a5 useEquality:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  void *v26;
  id v27;
  PHAPrivateFederatedLearningModelValidator *v29;
  id *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v8 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("layers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v29 = self;
    v30 = a7;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = v14;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v21, "objectForKeyedSubscript:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v8)
            v24 = objc_msgSend(v22, "isEqualToString:", v12);
          else
            v24 = objc_msgSend(v22, "containsString:", v12);
          v25 = v24;

          if ((v25 & 1) != 0)
          {
            v27 = v21;

            goto LABEL_15;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v18)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find a layer with attribute '%@' == '%@'"), v13, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](v29, "_generateError:errorCode:errorMessage:underlyingError:", v30, 7, v26, 0);

    v27 = 0;
LABEL_15:
    v15 = v31;
  }
  else
  {
    -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a7, 6, CFSTR("Model config does not have layers key"), 0);
    v27 = 0;
  }

  return v27;
}

- (id)_sizeForLayerName:(id)a3 modelShape:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("layer_shapes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shape not found for layer name '%@'"), v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a5, 8, v11, 0);
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("k"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "integerValue") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Layer size not found or invalid (%@) for layer name '%@'"), v11, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPrivateFederatedLearningModelValidator _generateError:errorCode:errorMessage:underlyingError:](self, "_generateError:errorCode:errorMessage:underlyingError:", a5, 9, v13, 0);

    goto LABEL_6;
  }
  v11 = v11;
  v12 = v11;
LABEL_7:

  return v12;
}

- (BOOL)_isFingerprintVersionSupported:(int64_t)a3
{
  BOOL result;

  if ((unint64_t)(a3 - 201) <= 0x1B && ((1 << (a3 + 55)) & 0xF003F79) != 0)
    return 0;
  if ((unint64_t)a3 <= 0x19 && ((1 << a3) & 0x200F6F3) != 0)
    return 0;
  result = 1;
  if ((unint64_t)(a3 - 101) <= 0x18 && ((1 << (a3 - 101)) & 0x1003F29) != 0)
    return 0;
  return result;
}

- (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;

  v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v11 = a5;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHAPrivateFederatedLearningModelValidator"), a4, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (NSURL)espressoModelURL
{
  return self->_espressoModelURL;
}

- (NSURL)espressoModelShapeURL
{
  return self->_espressoModelShapeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoModelShapeURL, 0);
  objc_storeStrong((id *)&self->_espressoModelURL, 0);
}

@end
