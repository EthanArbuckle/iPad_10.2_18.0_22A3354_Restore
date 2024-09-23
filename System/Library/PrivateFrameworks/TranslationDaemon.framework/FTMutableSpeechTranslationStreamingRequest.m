@implementation FTMutableSpeechTranslationStreamingRequest

- (FTMutableSpeechTranslationStreamingRequest)init
{
  FTMutableSpeechTranslationStreamingRequest *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableSpeechTranslationStreamingRequest;
  v2 = -[FTMutableSpeechTranslationStreamingRequest init](&v6, sel_init);
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

- (int64_t)content_type
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content_type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setContent_type:(int64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (FTStartSpeechTranslationRequest)contentAsFTStartSpeechTranslationRequest
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTStartSpeechTranslationRequest *)v3;
}

- (void)setContentAsFTStartSpeechTranslationRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTLanguageDetected)contentAsFTLanguageDetected
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTLanguageDetected *)v3;
}

- (void)setContentAsFTLanguageDetected:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTAudioPacket)contentAsFTAudioPacket
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAudioPacket *)v3;
}

- (void)setContentAsFTAudioPacket:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTSpeechTranslationAudioPacket)contentAsFTSpeechTranslationAudioPacket
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSpeechTranslationAudioPacket *)v3;
}

- (void)setContentAsFTSpeechTranslationAudioPacket:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTFinishAudio)contentAsFTFinishAudio
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTFinishAudio *)v3;
}

- (void)setContentAsFTFinishAudio:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 5);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTSetEndpointerState)contentAsFTSetEndpointerState
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSetEndpointerState *)v3;
}

- (void)setContentAsFTSetEndpointerState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 6);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTResetServerEndpointer)contentAsFTResetServerEndpointer
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTResetServerEndpointer *)v3;
}

- (void)setContentAsFTResetServerEndpointer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 7);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTStartSpeechTranslationLoggingRequest)contentAsFTStartSpeechTranslationLoggingRequest
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingRequest content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTStartSpeechTranslationLoggingRequest *)v3;
}

- (void)setContentAsFTStartSpeechTranslationLoggingRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", 8);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (void)setContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](self, "setContent_type:", objc_msgSend((id)objc_opt_class(), "content_typeForObject:", v5));
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

+ (Class)content_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)content_typeForMutableObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)content_typeForObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
