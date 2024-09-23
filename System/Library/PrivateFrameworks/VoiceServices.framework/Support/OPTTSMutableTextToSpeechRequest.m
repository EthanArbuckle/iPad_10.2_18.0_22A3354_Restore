@implementation OPTTSMutableTextToSpeechRequest

- (OPTTSMutableTextToSpeechRequest)init
{
  OPTTSMutableTextToSpeechRequest *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechRequest;
  v2 = -[OPTTSMutableTextToSpeechRequest init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary copy](self->super._storage, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSString)speech_id
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("speech_id"));
}

- (void)setSpeech_id:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSString)session_id
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_id"));
}

- (void)setSession_id:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSString)language
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSString)gender
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("gender"));
}

- (void)setGender:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSString)text
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (int64_t)audio_type
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("audio_type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setAudio_type:(int64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (BOOL)enable_word_timing_info
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("enable_word_timing_info"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setEnable_word_timing_info:(BOOL)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSString)voice_name
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("voice_name"));
}

- (void)setVoice_name:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)context_info
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("context_info"));
}

- (void)setContext_info:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (int64_t)preferred_voice_type
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("preferred_voice_type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setPreferred_voice_type:(int64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (OPTTSTextToSpeechRequestMeta)meta_info
{
  return (OPTTSTextToSpeechRequestMeta *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
}

- (void)setMeta_info:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (OPTTSTextToSpeechRequestContext)context
{
  return (OPTTSTextToSpeechRequestContext *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("context"));
}

- (void)setContext:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (OPTTSTextToSpeechRequestExperiment)experiment
{
  return (OPTTSTextToSpeechRequestExperiment *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("experiment"));
}

- (void)setExperiment:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (OPTTSTTSRequestFeatureFlags)feature_flags
{
  return (OPTTSTTSRequestFeatureFlags *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("feature_flags"));
}

- (void)setFeature_flags:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

+ (id)genderStringFromGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return &stru_24DD8EF88;
  else
    return *(&off_24DD8EDD0 + a3 - 1);
}

+ (id)requestFromVSRequest:(id)a3
{
  id v4;
  OPTTSMutableTextToSpeechRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  OPTTSMutableTextToSpeechRequestMeta *v26;
  void *v27;

  v4 = a3;
  v5 = objc_alloc_init(OPTTSMutableTextToSpeechRequest);
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableTextToSpeechRequest setLanguage:](v5, "setLanguage:", v7);

  objc_msgSend(a1, "genderStringFromGender:", objc_msgSend(v4, "gender"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableTextToSpeechRequest setGender:](v5, "setGender:", v8);

  objc_msgSend(v4, "utterance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volume");
  if (v10 != *MEMORY[0x24BEC0E68])
  {
    objc_msgSend(v4, "volume");
    if (v11 != 0.0)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "volume");
      objc_msgSend(v12, "stringWithFormat:", CFSTR("\x1B\\vol=%d\\%@"), (int)(v13 * 100.0), v9);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
  }
  objc_msgSend(v4, "rate");
  if (v15 != *MEMORY[0x24BEC0E60])
  {
    objc_msgSend(v4, "rate");
    if (v16 != 0.0)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "rate");
      objc_msgSend(v17, "stringWithFormat:", CFSTR("\x1B\\rate=%d\\%@"), (int)(v18 * 100.0), v9);
      v19 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v19;
    }
  }
  objc_msgSend(v4, "pitch");
  if (v20 != *MEMORY[0x24BEC0E58])
  {
    objc_msgSend(v4, "pitch");
    if (v21 != 0.0)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "pitch");
      objc_msgSend(v22, "stringWithFormat:", CFSTR("\x1B\\pitch=%d\\%@"), (int)(v23 * 100.0), v9);
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
    }
  }
  -[OPTTSMutableTextToSpeechRequest setText:](v5, "setText:", v9);
  -[OPTTSMutableTextToSpeechRequest setAudio_type:](v5, "setAudio_type:", 1);
  -[OPTTSMutableTextToSpeechRequest setEnable_word_timing_info:](v5, "setEnable_word_timing_info:", 1);
  objc_msgSend(v4, "voiceName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableTextToSpeechRequest setVoice_name:](v5, "setVoice_name:", v25);

  v26 = objc_alloc_init(OPTTSMutableTextToSpeechRequestMeta);
  objc_msgSend(v4, "clientBundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableTextToSpeechRequestMeta setApp_id:](v26, "setApp_id:", v27);

  -[OPTTSMutableTextToSpeechRequestMeta setChannel_type:](v26, "setChannel_type:", 2);
  -[OPTTSMutableTextToSpeechRequest setMeta_info:](v5, "setMeta_info:", v26);

  return v5;
}

@end
