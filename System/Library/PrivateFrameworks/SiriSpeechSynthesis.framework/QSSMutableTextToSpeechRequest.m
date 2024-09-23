@implementation QSSMutableTextToSpeechRequest

- (QSSMutableTextToSpeechRequest)init
{
  QSSMutableTextToSpeechRequest *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechRequest;
  v2 = -[QSSMutableTextToSpeechRequest init](&v6, sel_init);
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

- (QSSTextToSpeechRequestMeta)meta_info
{
  return (QSSTextToSpeechRequestMeta *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
}

- (void)setMeta_info:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTextToSpeechRequestContext)context
{
  return (QSSTextToSpeechRequestContext *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("context"));
}

- (void)setContext:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTextToSpeechRequestExperiment)experiment
{
  return (QSSTextToSpeechRequestExperiment *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("experiment"));
}

- (void)setExperiment:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTTSRequestFeatureFlags)feature_flags
{
  return (QSSTTSRequestFeatureFlags *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("feature_flags"));
}

- (void)setFeature_flags:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTextToSpeechRequestDebug)debug
{
  return (QSSTextToSpeechRequestDebug *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("debug"));
}

- (void)setDebug:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTextToSpeechUserProfile)profile
{
  return (QSSTextToSpeechUserProfile *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("profile"));
}

- (void)setProfile:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTextToSpeechRequestDevConfig)dev_config
{
  return (QSSTextToSpeechRequestDevConfig *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("dev_config"));
}

- (void)setDev_config:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  return (QSSTextToSpeechRequestProsodyTransferConfig *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("prosody_config"));
}

- (void)setProsody_config:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (QSSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  return (QSSTextToSpeechRequestProsodyControlConfig *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("prosody_control_config"));
}

- (void)setProsody_control_config:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
