@implementation VTUISELFLogger

+ (void)logSiriSetupPHSEnrollmentUIStarted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 voiceTriggerType:(int)a6
{
  uint64_t v6;
  objc_class *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v6 = *(_QWORD *)&a6;
  v10 = (objc_class *)MEMORY[0x24BE95A88];
  v11 = a5;
  v12 = a3;
  v19 = objc_alloc_init(v10);
  v13 = objc_msgSend(MEMORY[0x24BE95CA8], "convertLanguageCodeToSchemaLocale:", v11);

  objc_msgSend(a1, "SISchemaLocaleToSISchemaISOLocale:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocale:", v14);
  objc_msgSend(v19, "setEnrollmentMode:", objc_msgSend(a1, "getSiriSetupUIEnrollmentMode:", a4));
  objc_msgSend(v19, "setVoiceTriggerType:", v6);
  v15 = objc_alloc_init(MEMORY[0x24BE95A70]);
  v16 = objc_alloc_init(MEMORY[0x24BE95A78]);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v12);

  objc_msgSend(v16, "setSiriSetupId:", v17);
  objc_msgSend(v15, "setEventMetadata:", v16);
  objc_msgSend(v15, "setEnrollmentUIStarted:", v19);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "emitMessage:", v15);

}

+ (void)logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 trainingOutcome:(int)a6 pageNumber:(int)a7 isRetry:(unsigned __int8)a8 audioHintNeeded:(unsigned __int8)a9 audioHintSpoken:(unsigned __int8)a10
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v10 = a8;
  v11 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a6;
  v16 = (objc_class *)MEMORY[0x24BE95A90];
  v17 = a5;
  v18 = a3;
  v25 = objc_alloc_init(v16);
  v19 = objc_msgSend(MEMORY[0x24BE95CA8], "convertLanguageCodeToSchemaLocale:", v17);

  objc_msgSend(a1, "SISchemaLocaleToSISchemaISOLocale:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLocale:", v20);
  objc_msgSend(v25, "setEnrollmentMode:", objc_msgSend(a1, "getSiriSetupUIEnrollmentMode:", a4));
  objc_msgSend(v25, "setTrainingOutcome:", v12);
  objc_msgSend(v25, "setPageNumber:", v11);
  objc_msgSend(v25, "setIsRetry:", v10 != 0);
  objc_msgSend(v25, "setWasAudioHintNeeded:", a9 != 0);
  objc_msgSend(v25, "setWasAudioHintSpokenSuccessfully:", a10 != 0);
  v21 = objc_alloc_init(MEMORY[0x24BE95A70]);
  v22 = objc_alloc_init(MEMORY[0x24BE95A78]);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v18);

  objc_msgSend(v22, "setSiriSetupId:", v23);
  objc_msgSend(v21, "setEventMetadata:", v22);
  objc_msgSend(v21, "setEnrollmentUIUtteranceTrainingAttempted:", v25);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "emitMessage:", v21);

}

+ (void)logSiriSetupPHSEnrollmentUICompleted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 enrollmentSessionOutcome:(int)a6 pageNumber:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  objc_class *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v12 = (objc_class *)MEMORY[0x24BE95A80];
  v13 = a5;
  v14 = a3;
  v21 = objc_alloc_init(v12);
  v15 = objc_msgSend(MEMORY[0x24BE95CA8], "convertLanguageCodeToSchemaLocale:", v13);

  objc_msgSend(a1, "SISchemaLocaleToSISchemaISOLocale:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLocale:", v16);
  objc_msgSend(v21, "setEnrollmentMode:", objc_msgSend(a1, "getSiriSetupUIEnrollmentMode:", a4));
  objc_msgSend(v21, "setEnrollmentOutcome:", v8);
  objc_msgSend(v21, "setPageNumber:", v7);
  v17 = objc_alloc_init(MEMORY[0x24BE95A70]);
  v18 = objc_alloc_init(MEMORY[0x24BE95A78]);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v14);

  objc_msgSend(v18, "setSiriSetupId:", v19);
  objc_msgSend(v17, "setEventMetadata:", v18);
  objc_msgSend(v17, "setEnrollmentUICompleted:", v21);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "emitMessage:", v17);

}

+ (id)SISchemaLocaleToSISchemaISOLocale:(int)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_alloc_init(MEMORY[0x24BE95B18]);
  v5 = v4;
  if (a3 <= 0x3E)
  {
    v6 = dword_229F4FAD0[a3];
    v7 = dword_229F4FBCC[a3];
    objc_msgSend(v4, "setCountryCode:", v6);
    objc_msgSend(v5, "setLanguageCode:", v7);
  }
  return v5;
}

+ (int)getSiriSetupUIEnrollmentMode:(int64_t)a3
{
  if ((unint64_t)a3 < 7)
    return a3 + 1;
  else
    return 0;
}

@end
