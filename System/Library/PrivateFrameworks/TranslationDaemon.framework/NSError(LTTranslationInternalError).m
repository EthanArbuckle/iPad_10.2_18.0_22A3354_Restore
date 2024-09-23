@implementation NSError(LTTranslationInternalError)

+ (id)lt_bundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__NSError_LTTranslationInternalError__lt_bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lt_bundle_onceToken != -1)
    dispatch_once(&lt_bundle_onceToken, block);
  return (id)lt_bundle_bundle;
}

+ (id)lt_internalErrorWithCode:()LTTranslationInternalError description:userInfo:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationInternalErrorDomain"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)lt_incompatibleForcedRoutes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "lt_bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INVALID_ONLINE_OFFLINE_REQUEST_ERROR_DESCRIPTION"), &stru_251A15610, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 0, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lt_lidModelLoadError
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "lt_bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LID_MODEL_LOAD_ERROR_DESCRIPTION"), &stru_251A15610, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 4, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lt_offlineTTSErrorWithError:()LTTranslationInternalError
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "lt_bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OFFLINE_TTS_FAILURE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD1398];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 7, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)lt_internalTTSCreationError
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "lt_bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TTS_PLAYER_FAILURE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 9, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lt_unsupporedLocalePairError:()LTTranslationInternalError
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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

  v4 = a3;
  objc_msgSend(v4, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ltLocaleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "targetLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_ltLocaleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForLocaleIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForLocaleIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_LOCALE_PAIR_ERROR_DESCRIPTION_FORMATTED_STRING"), &stru_251A15610, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 11, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)lt_translationNotWorking
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "lt_bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TRANSLATION_NOT_WORKING"), &stru_251A15610, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 11, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
