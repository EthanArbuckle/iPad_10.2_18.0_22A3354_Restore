@implementation SNLPITFMModelBundle

- (id)_initWithEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 targetVocabularyURL:(id)a7 versionURL:(id)a8
{
  id v15;
  id v16;
  id v17;
  SNLPITFMModelBundle *v18;
  id *p_isa;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SNLPITFMModelBundle;
  v18 = -[SNLPITFMModelBundle init](&v24, sel_init);
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_espressoModelURL, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a8);
  }

  return p_isa;
}

- (NSURL)espressoModelURL
{
  return self->_espressoModelURL;
}

- (NSURL)configURL
{
  return self->_configURL;
}

- (NSURL)contextVocabularyURL
{
  return self->_contextVocabularyURL;
}

- (NSURL)spanVocabularyURL
{
  return self->_spanVocabularyURL;
}

- (NSURL)targetVocabularyURL
{
  return self->_targetVocabularyURL;
}

- (NSURL)versionURL
{
  return self->_versionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionURL, 0);
  objc_storeStrong((id *)&self->_targetVocabularyURL, 0);
  objc_storeStrong((id *)&self->_spanVocabularyURL, 0);
  objc_storeStrong((id *)&self->_contextVocabularyURL, 0);
  objc_storeStrong((id *)&self->_configURL, 0);
  objc_storeStrong((id *)&self->_espressoModelURL, 0);
}

+ (SNLPITFMModelBundle)bundleWithEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 targetVocabularyURL:(id)a7 versionURL:(id)a8 errorDomain:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  objc_msgSend((id)objc_opt_class(), "_existErrorForEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:errorDomain:", v15, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = 0;
    if (a10)
      *a10 = objc_retainAutorelease(v22);
  }
  else
  {
    v23 = -[SNLPITFMModelBundle _initWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:]([SNLPITFMModelBundle alloc], "_initWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:", v15, v16, v17, v18, v19, v20);
  }

  return (SNLPITFMModelBundle *)v23;
}

+ (id)_existErrorForEspressoModelURL:(id)a3 configURL:(id)a4 contextVocabularyURL:(id)a5 spanVocabularyURL:(id)a6 targetVocabularyURL:(id)a7 versionURL:(id)a8 errorDomain:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  id v34;
  char v35;

  v14 = a3;
  v15 = a4;
  v34 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v14, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v21, &v35);

  if ((_DWORD)a5 && v35
    || (objc_msgSend((id)objc_opt_class(), "_errorForMissingResourceURL:errorDomain:", v14, v19),
        (v22 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v15, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v20, "isReadableFileAtPath:", v23);

    if ((v24 & 1) != 0
      || (objc_msgSend((id)objc_opt_class(), "_errorForMissingResourceURL:errorDomain:", v15, v19),
          (v22 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v16, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v20, "isReadableFileAtPath:", v25);

      if ((v26 & 1) != 0
        || (objc_msgSend((id)objc_opt_class(), "_errorForMissingResourceURL:errorDomain:", v16, v19),
            (v22 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(v34, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v20, "isReadableFileAtPath:", v27);

        if ((v28 & 1) != 0)
        {
          v22 = 0;
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_errorForMissingResourceURL:errorDomain:", v34, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v17)
        {
          if (v22)
            goto LABEL_15;
          objc_msgSend(v17, "path");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v20, "isReadableFileAtPath:", v29);

          if ((v30 & 1) == 0)
          {
            objc_msgSend((id)objc_opt_class(), "_errorForMissingResourceURL:errorDomain:", v17, v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
            if (v22)
              goto LABEL_21;
          }
        }
        else if (v22)
        {
          goto LABEL_21;
        }
        objc_msgSend(v18, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v20, "isReadableFileAtPath:", v31);

        if ((v32 & 1) != 0)
        {
          v22 = 0;
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_errorForMissingResourceURL:errorDomain:", v18, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
LABEL_21:

  return v22;
}

+ (id)_errorForMissingResourceURL:(id)a3 errorDomain:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Missing resource: %@"), &stru_1E7BED9E0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Check that resource is available: %@"), &stru_1E7BED9E0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = *MEMORY[0x1E0CB2D50];
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v24[1] = *MEMORY[0x1E0CB2D68];
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  v24[2] = *MEMORY[0x1E0CB2D80];
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringWithFormat:", v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v6, 2, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
