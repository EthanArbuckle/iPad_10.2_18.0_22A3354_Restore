@implementation FTMutableSpeechTranslationStreamingResponse

- (FTMutableSpeechTranslationStreamingResponse)init
{
  FTMutableSpeechTranslationStreamingResponse *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableSpeechTranslationStreamingResponse;
  v2 = -[FTMutableSpeechTranslationStreamingResponse init](&v6, sel_init);
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

- (FTSpeechTranslationPartialRecognitionResponse)contentAsFTSpeechTranslationPartialRecognitionResponse
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSpeechTranslationPartialRecognitionResponse *)v3;
}

- (void)setContentAsFTSpeechTranslationPartialRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTSpeechTranslationFinalRecognitionResponse)contentAsFTSpeechTranslationFinalRecognitionResponse
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSpeechTranslationFinalRecognitionResponse *)v3;
}

- (void)setContentAsFTSpeechTranslationFinalRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTAudioLimitExceeded)contentAsFTAudioLimitExceeded
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAudioLimitExceeded *)v3;
}

- (void)setContentAsFTAudioLimitExceeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTSpeechTranslationMtResponse)contentAsFTSpeechTranslationMtResponse
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSpeechTranslationMtResponse *)v3;
}

- (void)setContentAsFTSpeechTranslationMtResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTSpeechTranslationTextToSpeechResponse)contentAsFTSpeechTranslationTextToSpeechResponse
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSpeechTranslationTextToSpeechResponse *)v3;
}

- (void)setContentAsFTSpeechTranslationTextToSpeechResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 5);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTFinalBlazarResponse)contentAsFTFinalBlazarResponse
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTFinalBlazarResponse *)v3;
}

- (void)setContentAsFTFinalBlazarResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 6);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTRecognitionProgress)contentAsFTRecognitionProgress
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTRecognitionProgress *)v3;
}

- (void)setContentAsFTRecognitionProgress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 7);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTRecognitionCandidate)contentAsFTRecognitionCandidate
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTRecognitionCandidate *)v3;
}

- (void)setContentAsFTRecognitionCandidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 8);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTRequestStatsResponse)contentAsFTRequestStatsResponse
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTRequestStatsResponse *)v3;
}

- (void)setContentAsFTRequestStatsResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 9);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTServerEndpointFeatures)contentAsFTServerEndpointFeatures
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTServerEndpointFeatures *)v3;
}

- (void)setContentAsFTServerEndpointFeatures:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 10);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTClientSetupInfo)contentAsFTClientSetupInfo
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTClientSetupInfo *)v3;
}

- (void)setContentAsFTClientSetupInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 11);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTSpeechTranslationServerEndpointFeatures)contentAsFTSpeechTranslationServerEndpointFeatures
{
  void *v3;

  if (-[FTMutableSpeechTranslationStreamingResponse content_type](self, "content_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSpeechTranslationServerEndpointFeatures *)v3;
}

- (void)setContentAsFTSpeechTranslationServerEndpointFeatures:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", 12);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (void)setContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSpeechTranslationStreamingResponse setContent_type:](self, "setContent_type:", objc_msgSend((id)objc_opt_class(), "content_typeForObject:", v5));
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

+ (Class)content_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB)
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 12;
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
