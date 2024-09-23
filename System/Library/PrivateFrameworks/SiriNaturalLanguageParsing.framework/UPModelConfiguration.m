@implementation UPModelConfiguration

- (id)_initWithBioLabelsVocabPath:(id)a3 configPath:(id)a4 grammarPath:(id)a5 intentVocabPath:(id)a6 spanVocabPath:(id)a7 parserEspressoModelPath:(id)a8 calibrationEspressoModelPath:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  UPModelConfiguration *v22;
  uint64_t v23;
  NSString *bioLabelsVocabPath;
  uint64_t v25;
  NSString *configPath;
  uint64_t v27;
  NSString *grammarPath;
  uint64_t v29;
  NSString *intentVocabPath;
  uint64_t v31;
  NSString *spanVocabPath;
  uint64_t v33;
  NSString *parserEspressoModelPath;
  uint64_t v35;
  NSString *calibrationEspressoModelPath;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)UPModelConfiguration;
  v22 = -[UPModelConfiguration init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    bioLabelsVocabPath = v22->_bioLabelsVocabPath;
    v22->_bioLabelsVocabPath = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    configPath = v22->_configPath;
    v22->_configPath = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    grammarPath = v22->_grammarPath;
    v22->_grammarPath = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    intentVocabPath = v22->_intentVocabPath;
    v22->_intentVocabPath = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    spanVocabPath = v22->_spanVocabPath;
    v22->_spanVocabPath = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    parserEspressoModelPath = v22->_parserEspressoModelPath;
    v22->_parserEspressoModelPath = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    calibrationEspressoModelPath = v22->_calibrationEspressoModelPath;
    v22->_calibrationEspressoModelPath = (NSString *)v35;

    objc_storeStrong((id *)&v22->_espressoModelPath, v22->_parserEspressoModelPath);
  }

  return v22;
}

- (NSString)bioLabelsVocabPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)configPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)grammarPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)intentVocabPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)spanVocabPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)parserEspressoModelPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)calibrationEspressoModelPath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)espressoModelPath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoModelPath, 0);
  objc_storeStrong((id *)&self->_calibrationEspressoModelPath, 0);
  objc_storeStrong((id *)&self->_parserEspressoModelPath, 0);
  objc_storeStrong((id *)&self->_spanVocabPath, 0);
  objc_storeStrong((id *)&self->_intentVocabPath, 0);
  objc_storeStrong((id *)&self->_grammarPath, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_bioLabelsVocabPath, 0);
}

+ (id)_configurationWithBioLabelsVocabPath:(id)a3 configPath:(id)a4 grammarPath:(id)a5 intentVocabPath:(id)a6 spanVocabPath:(id)a7 parserEspressoModelPath:(id)a8 calibrationEspressoModelPath:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  id v29;
  id v30;
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v29 = v15;
  v31[0] = v15;
  v31[1] = v16;
  v22 = v16;
  v31[2] = v17;
  v31[3] = v18;
  v31[4] = v19;
  v31[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UPUtilities checkFileExistence:error:](UPUtilities, "checkFileExistence:error:", v23, a10)
    && (!v21
     || (v30 = v21,
         objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1),
         v24 = (void *)objc_claimAutoreleasedReturnValue(),
         v25 = +[UPUtilities checkFileExistence:error:](UPUtilities, "checkFileExistence:error:", v24, a10), v24, v25)))
  {
    v26 = v29;
    v27 = -[UPModelConfiguration _initWithBioLabelsVocabPath:configPath:grammarPath:intentVocabPath:spanVocabPath:parserEspressoModelPath:calibrationEspressoModelPath:]([UPModelConfiguration alloc], "_initWithBioLabelsVocabPath:configPath:grammarPath:intentVocabPath:spanVocabPath:parserEspressoModelPath:calibrationEspressoModelPath:", v29, v22, v17, v18, v19, v20, v21);
  }
  else
  {
    v27 = 0;
    v26 = v29;
  }

  return v27;
}

+ (id)configurationFromDirectoryUrl:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("calibration_model.mlmodelc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = +[UPUtilities checkFileExistence:error:](UPUtilities, "checkFileExistence:error:", v7, 0);

  v8 = 0;
  if ((_DWORD)v5)
    v8 = v6;
  objc_msgSend(v4, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("info.plist"));
  v27 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[UPUtilities checkFileExistence:error:](UPUtilities, "checkFileExistence:error:", v11, 0);

  if (v12)
    v13 = CFSTR("info.plist");
  else
    v13 = CFSTR("model_info.plist");
  objc_msgSend(v4, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByAppendingPathComponent:", CFSTR("bio_labels.vocab.txt"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingPathComponent:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("grammar.json"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("intent.vocab.txt"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("span.vocab.txt"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("model.mlmodelc"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_configurationWithBioLabelsVocabPath:configPath:grammarPath:intentVocabPath:spanVocabPath:parserEspressoModelPath:calibrationEspressoModelPath:error:", v14, v15, v16, v17, v19, v21, v8, a4);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end
