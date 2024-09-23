@implementation TTSAlternativeVoices

+ (BOOL)isVocalizerVoiceIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("com.apple.ttsbundle"), v6, v7)
    && (objc_msgSend_isOldSiriVoiceIdentifier_(a1, v8, (uint64_t)v4, v9, v10) & 1) == 0)
  {
    v14 = objc_msgSend_isSiriVoiceIdentifier_(a1, v11, (uint64_t)v4, v12, v13) ^ 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (BOOL)isOldSiriVoiceIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("com.apple.ttsbundle.siri"), v3, v4);
}

+ (BOOL)isSiriVoiceIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("com.apple.ttsbundle.gryphon"), v3, v4);
}

+ (BOOL)isNeuralSiriVoiceIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("com.apple.ttsbundle.gryphon-neural"), v3, v4);
}

+ (BOOL)isPersonalVoiceIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("com.apple.speech.personalvoice"), v3, v4);
}

+ (BOOL)isNeuralAXSiriVoiceIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("com.apple.ttsbundle.gryphon-neuralAX"), v3, v4);
}

+ (BOOL)isCompactVocalizerVoiceIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  id v19;

  v4 = a3;
  if (objc_msgSend_isVocalizerVoiceIdentifier_(a1, v5, (uint64_t)v4, v6, v7))
  {
    v18 = 0;
    v19 = 0;
    v10 = TTSGetComponentsInNashvilleVoiceIdentifier(v4, (char *)&v19, &v18, v8, v9);
    v11 = v19;
    v12 = v18;
    v16 = v12;
    if (v10)
      LOBYTE(v10) = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("compact"), v14, v15);

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)isCombinedVocalizerVoiceIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  char v12;
  uint64_t v14;
  id v15;

  v4 = a3;
  if (objc_msgSend_isVocalizerVoiceIdentifier_(a1, v5, (uint64_t)v4, v6, v7))
  {
    v14 = 0;
    v15 = 0;
    v10 = TTSGetComponentsInNashvilleVoiceIdentifier(v4, (char *)&v15, &v14, v8, v9);
    v11 = v15;
    if (v14)
      v12 = !v10;
    else
      v12 = 1;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)nameForVoiceIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v4 = a3;
  objc_msgSend_sharedInstance(TTSAXResourceManager, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourceWithVoiceId_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(a1) = objc_msgSend_isSiriVoiceIdentifier_(a1, v14, (uint64_t)v4, v15, v16);
  if ((_DWORD)a1)
  {
    objc_msgSend_localizedName(v13, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
