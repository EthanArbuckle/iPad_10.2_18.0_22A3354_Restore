@implementation SNLPLanguageVariantClassifier

+ (id)classifierWithPathURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void **v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  SNLPITFMModelInfo *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v50;
  id v51;
  void *__p[2];
  char v53;
  char v54;
  _QWORD v55[3];
  _QWORD v56[5];

  v56[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v54);

  if (v54)
    v10 = v9;
  else
    v10 = 0;
  if (v10 != 1)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("An error occured when attempting to read the LVC model bundle at: %@"), &stru_1E7BED9E0, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Check that the path contains a valid model bundle: %@"), &stru_1E7BED9E0, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0CB35C8];
      v55[0] = *MEMORY[0x1E0CB2D50];
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", v48, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v33;
      v55[1] = *MEMORY[0x1E0CB2D68];
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", v48, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v36;
      v55[2] = *MEMORY[0x1E0CB2D80];
      v37 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", v46, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v56[2] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("SNLPLanguageVariantClassifierErrorDomain"), 1, v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = 0;
    goto LABEL_30;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  std::string::basic_string[abi:ne180100]<0>(__p, "config.json");
  if (v53 >= 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  objc_msgSend(v11, "stringWithUTF8String:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v13);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53 < 0)
    operator delete(__p[0]);
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("LVC/LVC.mlmodelc"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("LVC/spans_pad.txt"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("LVC/context_pad.txt"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("LVC/targets.txt"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  std::string::basic_string[abi:ne180100]<0>(__p, "version.yaml");
  if (v53 >= 0)
    v16 = __p;
  else
    v16 = (void **)__p[0];
  objc_msgSend(v15, "stringWithUTF8String:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53 < 0)
    operator delete(__p[0]);
  v51 = 0;
  +[SNLPITFMModelBundle bundleWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:errorDomain:error:](SNLPITFMModelBundle, "bundleWithEspressoModelURL:configURL:contextVocabularyURL:spanVocabularyURL:targetVocabularyURL:versionURL:errorDomain:error:", v44, v47, v45, v43, v14, v18, CFSTR("SNLPLanguageVariantClassifierErrorDomain"), &v51);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v51;
  v21 = v20;
  if (v19)
  {
    v22 = -[SNLPITFMModelInfo initWithType:loggingComponent:errorDomain:]([SNLPITFMModelInfo alloc], "initWithType:loggingComponent:errorDomain:", 3, 5, CFSTR("SNLPLanguageVariantClassifierErrorDomain"));
    v23 = objc_alloc((Class)a1);
    v50.receiver = a1;
    v50.super_class = (Class)&OBJC_METACLASS___SNLPLanguageVariantClassifier;
    objc_msgSendSuper2(&v50, sel__initializationBlock);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v25 = (id)objc_msgSend(v23, "initWithModelBundle:modelInfo:initializationBlock:error:", v19, v22, v24, &v49);
    v26 = v49;

    if (v25)
    {
      v27 = 0;
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(v26);
      v27 = 1;
    }

  }
  else
  {
    v25 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v20);
    v27 = 1;
  }

  if (!v27)
  {
LABEL_30:
    v25 = v25;
    v41 = v25;
    goto LABEL_31;
  }
  v41 = 0;
LABEL_31:

  return v41;
}

@end
