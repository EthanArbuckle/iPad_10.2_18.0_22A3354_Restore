@implementation FTMutableRecognitionStreamingResponse

- (FTMutableRecognitionStreamingResponse)init
{
  FTMutableRecognitionStreamingResponse *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableRecognitionStreamingResponse;
  v2 = -[FTMutableRecognitionStreamingResponse init](&v6, sel_init);
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

- (FTFinalSpeechRecognitionResponse)contentAsFTFinalSpeechRecognitionResponse
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTFinalSpeechRecognitionResponse *)v3;
}

- (void)setContentAsFTFinalSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTMultiUserFinalSpeechRecognitionResponse)contentAsFTMultiUserFinalSpeechRecognitionResponse
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTMultiUserFinalSpeechRecognitionResponse *)v3;
}

- (void)setContentAsFTMultiUserFinalSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTPartialSpeechRecognitionResponse)contentAsFTPartialSpeechRecognitionResponse
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTPartialSpeechRecognitionResponse *)v3;
}

- (void)setContentAsFTPartialSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTUpdatedAcousticProfile)contentAsFTUpdatedAcousticProfile
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTUpdatedAcousticProfile *)v3;
}

- (void)setContentAsFTUpdatedAcousticProfile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTEndPointLikelihood)contentAsFTEndPointLikelihood
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTEndPointLikelihood *)v3;
}

- (void)setContentAsFTEndPointLikelihood:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 5);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTEndPointCandidate)contentAsFTEndPointCandidate
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTEndPointCandidate *)v3;
}

- (void)setContentAsFTEndPointCandidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 6);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTRecognitionProgress)contentAsFTRecognitionProgress
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 7)
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
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 7);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTCheckForSpeechResponse)contentAsFTCheckForSpeechResponse
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTCheckForSpeechResponse *)v3;
}

- (void)setContentAsFTCheckForSpeechResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 8);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTRecognitionCandidate)contentAsFTRecognitionCandidate
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 9)
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
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 9);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTMultiUserRecognitionCandidate)contentAsFTMultiUserRecognitionCandidate
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTMultiUserRecognitionCandidate *)v3;
}

- (void)setContentAsFTMultiUserRecognitionCandidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 10);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTRequestStatsResponse)contentAsFTRequestStatsResponse
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 11)
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
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 11);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTServerEndpointFeatures)contentAsFTServerEndpointFeatures
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 12)
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
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 12);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTClientSetupInfo)contentAsFTClientSetupInfo
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 13)
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
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 13);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (FTAudioLimitExceeded)contentAsFTAudioLimitExceeded
{
  void *v3;

  if (-[FTMutableRecognitionStreamingResponse content_type](self, "content_type") == 14)
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
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", 14);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (void)setContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableRecognitionStreamingResponse setContent_type:](self, "setContent_type:", objc_msgSend((id)objc_opt_class(), "content_typeForObject:", v5));
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

+ (Class)content_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD)
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 14;
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
