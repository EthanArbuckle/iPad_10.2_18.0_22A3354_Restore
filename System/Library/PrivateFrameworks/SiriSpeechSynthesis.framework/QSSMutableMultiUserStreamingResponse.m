@implementation QSSMutableMultiUserStreamingResponse

- (QSSMutableMultiUserStreamingResponse)init
{
  QSSMutableMultiUserStreamingResponse *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QSSMutableMultiUserStreamingResponse;
  v2 = -[QSSMutableMultiUserStreamingResponse init](&v6, sel_init);
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

- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSFinalSpeechRecognitionResponse *)v3;
}

- (void)setContentAsQSSFinalSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSPartialSpeechRecognitionResponse *)v3;
}

- (void)setContentAsQSSPartialSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSRecognitionProgress)contentAsQSSRecognitionProgress
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSRecognitionProgress *)v3;
}

- (void)setContentAsQSSRecognitionProgress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSRecognitionCandidate *)v3;
}

- (void)setContentAsQSSRecognitionCandidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSRequestStatsResponse *)v3;
}

- (void)setContentAsQSSRequestStatsResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 5);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSServerEndpointFeatures *)v3;
}

- (void)setContentAsQSSServerEndpointFeatures:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 6);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSClientSetupInfo)contentAsQSSClientSetupInfo
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSClientSetupInfo *)v3;
}

- (void)setContentAsQSSClientSetupInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 7);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSAudioLimitExceeded *)v3;
}

- (void)setContentAsQSSAudioLimitExceeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 8);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingResponse content_type](self, "content_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSFinalBlazarResponse *)v3;
}

- (void)setContentAsQSSFinalBlazarResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingResponse setContent_type:](self, "setContent_type:", 9);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

@end
