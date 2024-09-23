@implementation SecureVoiceTriggerSpeakerRecognitionDecoder

- (SecureVoiceTriggerSpeakerRecognitionDecoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SecureVoiceTriggerSpeakerRecognitionDecoder;
  return -[SecureVoiceTriggerSpeakerRecognitionDecoder init](&v3, sel_init);
}

- (id)decodeSecureVoiceTriggerSpeakerRecognitionConfigForAsset:(id)a3
{
  id v4;
  void *v5;
  double v6;
  int v7;
  int v8;
  double v9;
  int v10;
  int v11;
  double v12;
  int v13;
  int v14;
  double v15;
  int v16;
  int v17;
  double v18;
  int v19;
  int v20;
  double v21;
  int v22;
  int v23;
  double v24;
  int v25;
  int v26;
  double v27;
  int v28;
  int v29;
  double v30;
  float v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  SecureSpeakerRecognitionConfigBridge *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  NSObject *v49;
  id v50;
  SecureSpeakerRecognitionConfigBridge *v51;
  unsigned int v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _decodePhraseConfig:](self, "_decodePhraseConfig:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[SecureVoiceTriggerSpeakerRecognitionDecoder _getIntValue:forKey:withDefaultValue:](self, "_getIntValue:forKey:withDefaultValue:", v4, CFSTR("numPruningRetentionUtt"), 7);
    LODWORD(v6) = -8388609;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("pruningExplicitSATThreshold"), v6);
    v8 = v7;
    LODWORD(v9) = -8388609;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("pruningExplicitPSRThreshold"), v9);
    v11 = v10;
    LODWORD(v12) = -8388609;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("pruningSATThreshold"), v12);
    v14 = v13;
    LODWORD(v15) = -8388609;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("pruningPSRThreshold"), v15);
    v17 = v16;
    LODWORD(v18) = 1058642330;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("combinationWeight"), v18);
    v20 = v19;
    LODWORD(v21) = 0;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("satThreshold"), v21);
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("implicitProfileThreshold"));
    v23 = v22;
    LODWORD(v24) = 1041865114;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("implicitProfileDeltaThreshold"), v24);
    v26 = v25;
    LODWORD(v27) = -8388609;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("implicitVTThreshold"), v27);
    v29 = v28;
    LODWORD(v30) = 1109393408;
    -[SecureVoiceTriggerSpeakerRecognitionDecoder _getFloatValue:forKey:withDefaultValue:](self, "_getFloatValue:forKey:withDefaultValue:", v4, CFSTR("maxEnrollmentUtterances"), v30);
    v32 = v31;
    v33 = -[SecureVoiceTriggerSpeakerRecognitionDecoder _getBooleanValue:forKey:withDefaultValue:](self, "_getBooleanValue:forKey:withDefaultValue:", v4, CFSTR("implicit_training_enabled"), 1);
    v34 = -[SecureVoiceTriggerSpeakerRecognitionDecoder _getIntValue:forKey:withDefaultValue:](self, "_getIntValue:forKey:withDefaultValue:", v4, CFSTR("multiUserHighScoreThreshold"), 55);
    v35 = -[SecureVoiceTriggerSpeakerRecognitionDecoder _getIntValue:forKey:withDefaultValue:](self, "_getIntValue:forKey:withDefaultValue:", v4, CFSTR("multiUserLowScoreThreshold"), 45);
    v36 = -[SecureVoiceTriggerSpeakerRecognitionDecoder _getIntValue:forKey:withDefaultValue:](self, "_getIntValue:forKey:withDefaultValue:", v4, CFSTR("multiUserConfidentScoreThreshold"), 90);
    v37 = -[SecureVoiceTriggerSpeakerRecognitionDecoder _getIntValue:forKey:withDefaultValue:](self, "_getIntValue:forKey:withDefaultValue:", v4, CFSTR("multiUserDeltaScoreThreshold"), 15);
    v38 = -[SecureVoiceTriggerSpeakerRecognitionDecoder _getBooleanValue:forKey:withDefaultValue:](self, "_getBooleanValue:forKey:withDefaultValue:", v4, CFSTR("useTDTIEnrollment"), 1);

    v39 = objc_alloc_init(SecureSpeakerRecognitionConfigBridge);
    -[SecureSpeakerRecognitionConfigBridge setPhraseConfigs:](v39, "setPhraseConfigs:", v5);
    -[SecureSpeakerRecognitionConfigBridge setNumPruningRetentionUtt:](v39, "setNumPruningRetentionUtt:", v53);
    LODWORD(v40) = v8;
    -[SecureSpeakerRecognitionConfigBridge setPruningExplicitSATThreshold:](v39, "setPruningExplicitSATThreshold:", v40);
    LODWORD(v41) = v11;
    -[SecureSpeakerRecognitionConfigBridge setPruningExplicitPSRThreshold:](v39, "setPruningExplicitPSRThreshold:", v41);
    LODWORD(v42) = v14;
    -[SecureSpeakerRecognitionConfigBridge setPruningSATThreshold:](v39, "setPruningSATThreshold:", v42);
    LODWORD(v43) = v17;
    -[SecureSpeakerRecognitionConfigBridge setPruningPSRThreshold:](v39, "setPruningPSRThreshold:", v43);
    LODWORD(v44) = v20;
    -[SecureSpeakerRecognitionConfigBridge setCombinationWeight:](v39, "setCombinationWeight:", v44);
    LODWORD(v45) = v23;
    -[SecureSpeakerRecognitionConfigBridge setImplicitProfileThreshold:](v39, "setImplicitProfileThreshold:", v45);
    LODWORD(v46) = v26;
    -[SecureSpeakerRecognitionConfigBridge setImplicitProfileDeltaThreshold:](v39, "setImplicitProfileDeltaThreshold:", v46);
    LODWORD(v47) = v29;
    -[SecureSpeakerRecognitionConfigBridge setImplicitVTThreshold:](v39, "setImplicitVTThreshold:", v47);
    -[SecureSpeakerRecognitionConfigBridge setMaxEnrollmentUtterances:](v39, "setMaxEnrollmentUtterances:", v32);
    -[SecureSpeakerRecognitionConfigBridge setImplicitTrainingEnabled:](v39, "setImplicitTrainingEnabled:", v33);
    -[SecureSpeakerRecognitionConfigBridge setMultiUserHighScoreThreshold:](v39, "setMultiUserHighScoreThreshold:", v34);
    -[SecureSpeakerRecognitionConfigBridge setMultiUserLowScoreThreshold:](v39, "setMultiUserLowScoreThreshold:", v35);
    -[SecureSpeakerRecognitionConfigBridge setMultiUserConfidentScoreThreshold:](v39, "setMultiUserConfidentScoreThreshold:", v36);
    -[SecureSpeakerRecognitionConfigBridge setMultiUserDeltaScoreThreshold:](v39, "setMultiUserDeltaScoreThreshold:", v37);
    -[SecureSpeakerRecognitionConfigBridge setUseTDTIEnrollment:](v39, "setUseTDTIEnrollment:", v38);
    v48 = (void *)CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      -[SecureSpeakerRecognitionConfigBridge description](v39, "description");
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v55 = "-[SecureVoiceTriggerSpeakerRecognitionDecoder decodeSecureVoiceTriggerSpeakerRecognitionConfigForAsset:]";
      v56 = 2080;
      v57 = objc_msgSend(v50, "cStringUsingEncoding:", 4);
      _os_log_impl(&dword_2117D4000, v49, OS_LOG_TYPE_DEFAULT, "%s SecureSpeakerRecognitionConfig string %s", buf, 0x16u);

    }
    v51 = v39;

  }
  else
  {
    v51 = 0;
  }
  return v51;
}

- (id)_decodePhraseConfig:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  int v12;
  SecureSpeakerRecognitionPhraseConfigBridge *v13;
  double v14;
  SecureSpeakerRecognitionPhraseConfigBridge *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDictionaryArray:category:", CFSTR("phrase"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "count"))
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __67__SecureVoiceTriggerSpeakerRecognitionDecoder__decodePhraseConfig___block_invoke;
    v19[3] = &unk_24CC85970;
    v20 = v4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
    v7 = v20;
  }
  else
  {
    objc_msgSend(v3, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getString:category:defaultValue:", CFSTR("phrase"), v8, CFSTR("HS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v3, "getFloat:category:defaultValue:", CFSTR("satThreshold"), v9, v10);
    v12 = v11;

    if (v7)
    {
      v13 = [SecureSpeakerRecognitionPhraseConfigBridge alloc];
      LODWORD(v14) = v12;
      v15 = -[SecureSpeakerRecognitionPhraseConfigBridge initWithName:satThreshold:](v13, "initWithName:satThreshold:", v7, v14);
      if (v15)
        objc_msgSend(v4, "addObject:", v15);

    }
  }

  if (objc_msgSend(v4, "count"))
    v16 = v4;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (BOOL)_getBooleanValue:(id)a3 forKey:(id)a4 withDefaultValue:(BOOL)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "getBool:category:defaultValue:", v7, v9, v5);

  return v5;
}

- (float)_getFloatValue:(id)a3 forKey:(id)a4 withDefaultValue:(float)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  float v11;
  float v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a5;
  objc_msgSend(v8, "getFloat:category:defaultValue:", v7, v9, v10);
  v12 = v11;

  return v12;
}

- (unsigned)_getIntValue:(id)a3 forKey:(id)a4 withDefaultValue:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v8, "getUnsignedLongLongValue:category:defaultValue:", v7, v9, a5);

  return a5;
}

void __67__SecureVoiceTriggerSpeakerRecognitionDecoder__decodePhraseConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SecureSpeakerRecognitionPhraseConfigBridge *v5;
  SecureSpeakerRecognitionPhraseConfigBridge *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("satThreshold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = [SecureSpeakerRecognitionPhraseConfigBridge alloc];
        objc_msgSend(v4, "floatValue");
        v6 = -[SecureSpeakerRecognitionPhraseConfigBridge initWithName:satThreshold:](v5, "initWithName:satThreshold:", v7);
        if (v6)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

      }
    }
  }

}

@end
