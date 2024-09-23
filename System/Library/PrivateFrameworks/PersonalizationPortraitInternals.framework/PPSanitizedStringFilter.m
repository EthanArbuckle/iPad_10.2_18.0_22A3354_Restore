@implementation PPSanitizedStringFilter

- (PPSanitizedStringFilter)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6;
  PPSanitizedStringFilter *v7;
  uint64_t v8;
  NSString *inputName;
  uint64_t v10;
  NSString *outputName;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PPSanitizedStringFilter;
  v7 = -[PPSanitizedStringFilter init](&v13, sel_init);
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

  }
  return v7;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id *v29;
  void *context;
  id v31;
  id v32;
  void *v33;
  NSString *outputName;
  void *v35;
  void *v36;
  NSString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  context = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v8, "featureValueForName:", self->_inputName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v29 = a5;
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v13);

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789.,"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invertedSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v16);
    if (v14)
      v18 = 1;
    else
      v18 = v17 == 0x7FFFFFFFFFFFFFFFLL;
    v19 = v18;
    v20 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    outputName = self->_outputName;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &outputName, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v25 = (void *)objc_msgSend(v20, "initWithDictionary:error:", v24, &v31);
    v26 = v31;

    v9 = v12;
    a5 = v29;
  }
  else
  {
    v27 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    v37 = self->_outputName;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v25 = (void *)objc_msgSend(v27, "initWithDictionary:error:", v23, &v32);
    v26 = v32;
  }

  objc_autoreleasePoolPop(context);
  if (a5)
    *a5 = objc_retainAutorelease(v26);

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

@end
