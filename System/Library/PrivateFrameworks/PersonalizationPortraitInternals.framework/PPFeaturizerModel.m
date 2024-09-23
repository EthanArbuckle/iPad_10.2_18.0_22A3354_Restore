@implementation PPFeaturizerModel

- (PPFeaturizerModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6;
  PPFeaturizerModel *v7;
  uint64_t v8;
  NSString *inputName;
  uint64_t v10;
  NSString *outputName;
  uint64_t v12;
  NSString *operation;
  void *v14;
  uint64_t v15;
  NSArray *param;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PPFeaturizerModel;
  v7 = -[PPFeaturizerModel init](&v18, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputName"));
    v8 = objc_claimAutoreleasedReturnValue();
    inputName = v7->_inputName;
    v7->_inputName = (NSString *)v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputName"));
    v10 = objc_claimAutoreleasedReturnValue();
    outputName = v7->_outputName;
    v7->_outputName = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("operation"));
    v12 = objc_claimAutoreleasedReturnValue();
    operation = v7->_operation;
    v7->_operation = (NSString *)v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("customParam"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("|"));
    v15 = objc_claimAutoreleasedReturnValue();
    param = v7->_param;
    v7->_param = (NSArray *)v15;

  }
  return v7;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
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
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  _QWORD v57[5];
  NSString *outputName;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("seq-count")))
  {
    if (-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("arr-count")))
    {
      v19 = (void *)MEMORY[0x1E0C9E918];
      objc_msgSend(v8, "featureValueForName:", self->_inputName);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "multiArrayValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
LABEL_8:
      objc_msgSend(v19, "featureValueWithInt64:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v18 = (void *)v22;
LABEL_13:

      goto LABEL_14;
    }
    if (-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("dict-count")))
    {
      v23 = (void *)MEMORY[0x1E0C9E918];
      objc_msgSend(v8, "featureValueForName:", self->_inputName);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dictionaryValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "featureValueWithInt64:", objc_msgSend(v24, "count"));
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v18 = (void *)v25;

      goto LABEL_13;
    }
    if (-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("string-length")))
    {
      objc_msgSend(v8, "featureValueForName:", self->_inputName);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "type") == 3)
      {
        v19 = (void *)MEMORY[0x1E0C9E918];
        objc_msgSend(v11, "stringValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");
        goto LABEL_8;
      }
      if (objc_msgSend(v11, "type") == 7)
      {
        objc_msgSend(v11, "sequenceValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringValues");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_pas_mappedArrayWithTransform:", &__block_literal_global_23085);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (void *)MEMORY[0x1E0C9E918];
        objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithInt64Array:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "featureValueWithSequence:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
LABEL_28:
      v18 = 0;
      goto LABEL_14;
    }
    if (-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("dictionary-values")))
    {
      objc_msgSend(v8, "featureValueForName:", self->_inputName);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dictionaryValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        +[PPCoreMLUtils multiArrayForArray:](PPCoreMLUtils, "multiArrayForArray:", v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v18 = 0;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v20);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      goto LABEL_28;
    }
    if (-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("number-to-array")))
    {
      v34 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v8, "featureValueForName:", self->_inputName);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "type");
      v37 = (void *)MEMORY[0x1E0CB37E8];
      if (v36 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v35, "int64Value"));
      }
      else
      {
        objc_msgSend(v35, "doubleValue");
        objc_msgSend(v37, "numberWithDouble:");
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPCoreMLUtils multiArrayFeatureValueForNumber:](PPCoreMLUtils, "multiArrayFeatureValueForNumber:", v44);
      v45 = objc_claimAutoreleasedReturnValue();
LABEL_39:
      v18 = (void *)v45;

      goto LABEL_44;
    }
    if (-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("count-in-seq")))
    {
      v34 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v8, "featureValueForName:", self->_inputName);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sequenceValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v35, "type") == 1)
      {
        -[NSArray firstObject](self->_param, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "integerValue");

        objc_msgSend(v35, "int64Values");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_2;
        v57[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
        v57[4] = v40;
        objc_msgSend(v41, "_pas_filteredArrayWithTest:", v57);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "count");

      }
      else
      {
        objc_msgSend(v35, "stringValues");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_3;
        v56[3] = &unk_1E7E1F8C8;
        v56[4] = self;
        objc_msgSend(v49, "_pas_filteredArrayWithTest:", v56);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v50, "count");

      }
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithInt64:", v43);
      v51 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("count-unique")))
      {
        v34 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v8, "featureValueForName:", self->_inputName);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "multiArrayValue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = (void *)objc_opt_new();
        if (objc_msgSend(v35, "count") >= 1)
        {
          v47 = 0;
          do
          {
            objc_msgSend(v35, "objectAtIndexedSubscript:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v48);

            ++v47;
          }
          while (v47 < objc_msgSend(v35, "count"));
        }
        objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithInt64:", objc_msgSend(v44, "count"));
        v45 = objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      if (!-[NSString isEqualToString:](self->_operation, "isEqualToString:", CFSTR("seq-to-array")))
        goto LABEL_45;
      v34 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v8, "featureValueForName:", self->_inputName);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "sequenceValue");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "int64Values");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPCoreMLUtils multiArrayForArray:](PPCoreMLUtils, "multiArrayForArray:", v55);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v18 = 0;
LABEL_44:

        objc_autoreleasePoolPop(v34);
        if (v18)
          goto LABEL_15;
LABEL_45:
        v28 = 0;
        goto LABEL_46;
      }
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v35);
      v51 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v51;
    goto LABEL_44;
  }
  objc_msgSend(v8, "featureValueForName:", self->_inputName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sequenceValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C9E918];
  objc_msgSend(v11, "int64Values");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  objc_msgSend(v11, "stringValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v14 <= v16)
    v17 = v16;
  else
    v17 = v14;
  objc_msgSend(v12, "featureValueWithInt64:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  if (!v18)
    goto LABEL_45;
LABEL_15:
  v26 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  outputName = self->_outputName;
  v59[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &outputName, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithDictionary:error:", v27, a5);

LABEL_46:
  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_param, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

BOOL __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == (int)objc_msgSend(a2, "intValue");
}

uint64_t __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", a2);
}

uint64_t __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "length"));
}

@end
