@implementation PPRegexModel

- (PPRegexModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v7;
  PPRegexModel *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSRegularExpression *regex;
  uint64_t v13;
  NSString *inputName;
  uint64_t v15;
  NSString *outputName;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PPRegexModel;
  v8 = -[PPRegexModel init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB38E8]);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("regex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithPattern:options:error:", v10, 1, a5);
    regex = v8->_regex;
    v8->_regex = (NSRegularExpression *)v11;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("inputName"));
    v13 = objc_claimAutoreleasedReturnValue();
    inputName = v8->_inputName;
    v8->_inputName = (NSString *)v13;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("outputName"));
    v15 = objc_claimAutoreleasedReturnValue();
    outputName = v8->_outputName;
    v8->_outputName = (NSString *)v15;

  }
  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSRegularExpression *regex;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  PPRegexModel *v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  void *v37;
  NSString *outputName;
  void *v39;
  void *v40;
  NSString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v32 = mach_absolute_time();
  objc_msgSend(v8, "featureValueForName:", self->_inputName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    regex = self->_regex;
    v13 = objc_msgSend(v11, "length");
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__PPRegexModel_predictionFromFeatures_options_error___block_invoke;
    v26[3] = &unk_1E7E1F840;
    v29 = &v33;
    v30 = v31;
    v27 = v11;
    v28 = self;
    -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](regex, "enumerateMatchesInString:options:range:usingBlock:", v27, 1, 0, v13, v26);
    v14 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    outputName = self->_outputName;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v34 + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &outputName, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v14, "initWithDictionary:error:", v18, a5);

    v20 = v27;
  }
  else
  {
    *((_BYTE *)v34 + 24) = 1;
    v21 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    v41 = self->_outputName;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v34 + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v21, "initWithDictionary:error:", v24, a5);

  }
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

void __53__PPRegexModel_predictionFromFeatures_options_error___block_invoke(_QWORD *a1, void *a2, char a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = a1[4];
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "Blocked (pattern): \"%@\", (uint8_t *)&v13, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
LABEL_5:
    *a4 = 1;
    goto LABEL_11;
  }
  if ((a3 & 1) != 0 && (mach_absolute_time() - *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24)) >> 5 >= 0xC35)
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v11 = *(_QWORD *)(a1[5] + 8);
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: aborting blocking regex \"%@\" due to long-running match against \"%@\".", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_5;
  }
LABEL_11:

}

@end
