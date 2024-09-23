@implementation FTMutableAsrRecognitionMessage

- (FTMutableAsrRecognitionMessage)init
{
  FTMutableAsrRecognitionMessage *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableAsrRecognitionMessage;
  v2 = -[FTMutableAsrRecognitionMessage init](&v6, sel_init);
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

- (int64_t)session_message_type
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message_type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setSession_message_type:(int64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (FTStartSpeechRequest)session_messageAsFTStartSpeechRequest
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTStartSpeechRequest *)v3;
}

- (void)setSession_messageAsFTStartSpeechRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTUpdateAudioInfo *)v3;
}

- (void)setSession_messageAsFTUpdateAudioInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSetRequestOrigin *)v3;
}

- (void)setSession_messageAsFTSetRequestOrigin:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTSetSpeechContext)session_messageAsFTSetSpeechContext
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSetSpeechContext *)v3;
}

- (void)setSession_messageAsFTSetSpeechContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSetSpeechProfile *)v3;
}

- (void)setSession_messageAsFTSetSpeechProfile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 5);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTSetEndpointerState)session_messageAsFTSetEndpointerState
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSetEndpointerState *)v3;
}

- (void)setSession_messageAsFTSetEndpointerState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 6);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAudioPacket *)v3;
}

- (void)setSession_messageAsFTAudioPacket:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 7);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTFinishAudio *)v3;
}

- (void)setSession_messageAsFTFinishAudio:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 8);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTResetServerEndpointer *)v3;
}

- (void)setSession_messageAsFTResetServerEndpointer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 9);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTCheckForSpeechRequest)session_messageAsFTCheckForSpeechRequest
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTCheckForSpeechRequest *)v3;
}

- (void)setSession_messageAsFTCheckForSpeechRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 10);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTSetAlternateRecognitionSausage)session_messageAsFTSetAlternateRecognitionSausage
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTSetAlternateRecognitionSausage *)v3;
}

- (void)setSession_messageAsFTSetAlternateRecognitionSausage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 11);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTFinalSpeechRecognitionResponse *)v3;
}

- (void)setSession_messageAsFTFinalSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 12);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTMultiUserFinalSpeechRecognitionResponse)session_messageAsFTMultiUserFinalSpeechRecognitionResponse
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTMultiUserFinalSpeechRecognitionResponse *)v3;
}

- (void)setSession_messageAsFTMultiUserFinalSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 13);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTPartialSpeechRecognitionResponse *)v3;
}

- (void)setSession_messageAsFTPartialSpeechRecognitionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 14);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTUpdatedAcousticProfile)session_messageAsFTUpdatedAcousticProfile
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTUpdatedAcousticProfile *)v3;
}

- (void)setSession_messageAsFTUpdatedAcousticProfile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 15);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTEndPointLikelihood)session_messageAsFTEndPointLikelihood
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTEndPointLikelihood *)v3;
}

- (void)setSession_messageAsFTEndPointLikelihood:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 16);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTEndPointCandidate)session_messageAsFTEndPointCandidate
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTEndPointCandidate *)v3;
}

- (void)setSession_messageAsFTEndPointCandidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 17);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTRecognitionProgress)session_messageAsFTRecognitionProgress
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 18)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTRecognitionProgress *)v3;
}

- (void)setSession_messageAsFTRecognitionProgress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 18);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTCheckForSpeechResponse)session_messageAsFTCheckForSpeechResponse
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 19)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTCheckForSpeechResponse *)v3;
}

- (void)setSession_messageAsFTCheckForSpeechResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 19);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 20)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTRecognitionCandidate *)v3;
}

- (void)setSession_messageAsFTRecognitionCandidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 20);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTMultiUserRecognitionCandidate)session_messageAsFTMultiUserRecognitionCandidate
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 21)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTMultiUserRecognitionCandidate *)v3;
}

- (void)setSession_messageAsFTMultiUserRecognitionCandidate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 21);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 22)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTRequestStatsResponse *)v3;
}

- (void)setSession_messageAsFTRequestStatsResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 22);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 23)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTServerEndpointFeatures *)v3;
}

- (void)setSession_messageAsFTServerEndpointFeatures:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 23);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTClientSetupInfo)session_messageAsFTClientSetupInfo
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 24)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTClientSetupInfo *)v3;
}

- (void)setSession_messageAsFTClientSetupInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 24);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  void *v3;

  if (-[FTMutableAsrRecognitionMessage session_message_type](self, "session_message_type") == 25)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTAudioLimitExceeded *)v3;
}

- (void)setSession_messageAsFTAudioLimitExceeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", 25);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (void)setSession_message:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableAsrRecognitionMessage setSession_message_type:](self, "setSession_message_type:", objc_msgSend((id)objc_opt_class(), "session_message_typeForObject:", v5));
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

+ (Class)session_message_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x18)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)session_message_typeForMutableObject:(id)a3
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 24;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 25;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)session_message_typeForObject:(id)a3
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
         || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 25;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 25;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
