@implementation FTMutableSlsLanguageDetectionMessage

- (FTMutableSlsLanguageDetectionMessage)init
{
  FTMutableSlsLanguageDetectionMessage *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableSlsLanguageDetectionMessage;
  v2 = -[FTMutableSlsLanguageDetectionMessage init](&v6, sel_init);
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

- (FTStartLanguageDetectionRequest)session_messageAsFTStartLanguageDetectionRequest
{
  void *v3;

  if (-[FTMutableSlsLanguageDetectionMessage session_message_type](self, "session_message_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTStartLanguageDetectionRequest *)v3;
}

- (void)setSession_messageAsFTStartLanguageDetectionRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSlsLanguageDetectionMessage setSession_message_type:](self, "setSession_message_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  void *v3;

  if (-[FTMutableSlsLanguageDetectionMessage session_message_type](self, "session_message_type") == 2)
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
  -[FTMutableSlsLanguageDetectionMessage setSession_message_type:](self, "setSession_message_type:", 2);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  void *v3;

  if (-[FTMutableSlsLanguageDetectionMessage session_message_type](self, "session_message_type") == 3)
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
  -[FTMutableSlsLanguageDetectionMessage setSession_message_type:](self, "setSession_message_type:", 3);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (FTLanguageDetectionResponse)session_messageAsFTLanguageDetectionResponse
{
  void *v3;

  if (-[FTMutableSlsLanguageDetectionMessage session_message_type](self, "session_message_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FTLanguageDetectionResponse *)v3;
}

- (void)setSession_messageAsFTLanguageDetectionResponse:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSlsLanguageDetectionMessage setSession_message_type:](self, "setSession_message_type:", 4);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

- (void)setSession_message:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FTMutableSlsLanguageDetectionMessage setSession_message_type:](self, "setSession_message_type:", objc_msgSend((id)objc_opt_class(), "session_message_typeForObject:", v5));
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("session_message"));

}

+ (Class)session_message_mutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
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
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 4;
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
