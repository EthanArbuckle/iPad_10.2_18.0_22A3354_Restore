@implementation QSSMutableMultiUserStreamingRequest

- (QSSMutableMultiUserStreamingRequest)init
{
  QSSMutableMultiUserStreamingRequest *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QSSMutableMultiUserStreamingRequest;
  v2 = -[QSSMutableMultiUserStreamingRequest init](&v6, sel_init);
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

- (QSSMultiUserStartSpeechRequest)contentAsQSSMultiUserStartSpeechRequest
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSMultiUserStartSpeechRequest *)v3;
}

- (void)setContentAsQSSMultiUserStartSpeechRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSUpdateAudioInfo)contentAsQSSUpdateAudioInfo
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSUpdateAudioInfo *)v3;
}

- (void)setContentAsQSSUpdateAudioInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSSetRequestOrigin)contentAsQSSSetRequestOrigin
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSSetRequestOrigin *)v3;
}

- (void)setContentAsQSSSetRequestOrigin:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSSetSpeechContext)contentAsQSSSetSpeechContext
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSSetSpeechContext *)v3;
}

- (void)setContentAsQSSSetSpeechContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSSetSpeechProfile)contentAsQSSSetSpeechProfile
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSSetSpeechProfile *)v3;
}

- (void)setContentAsQSSSetSpeechProfile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 5);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSSetEndpointerState)contentAsQSSSetEndpointerState
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSSetEndpointerState *)v3;
}

- (void)setContentAsQSSSetEndpointerState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 6);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSAudioPacket)contentAsQSSAudioPacket
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSAudioPacket *)v3;
}

- (void)setContentAsQSSAudioPacket:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 7);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSFinishAudio)contentAsQSSFinishAudio
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSFinishAudio *)v3;
}

- (void)setContentAsQSSFinishAudio:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 8);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSResetServerEndpointer)contentAsQSSResetServerEndpointer
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSResetServerEndpointer *)v3;
}

- (void)setContentAsQSSResetServerEndpointer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 9);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

- (QSSSetAlternateRecognitionSausage)contentAsQSSSetAlternateRecognitionSausage
{
  void *v3;

  if (-[QSSMutableMultiUserStreamingRequest content_type](self, "content_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSSetAlternateRecognitionSausage *)v3;
}

- (void)setContentAsQSSSetAlternateRecognitionSausage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableMultiUserStreamingRequest setContent_type:](self, "setContent_type:", 10);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

@end
