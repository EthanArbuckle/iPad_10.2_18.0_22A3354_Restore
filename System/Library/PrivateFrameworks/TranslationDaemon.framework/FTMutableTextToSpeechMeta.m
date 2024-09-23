@implementation FTMutableTextToSpeechMeta

- (FTMutableTextToSpeechMeta)init
{
  FTMutableTextToSpeechMeta *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechMeta;
  v2 = -[FTMutableTextToSpeechMeta init](&v6, sel_init);
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

- (FTTextToSpeechVoice)voice
{
  return (FTTextToSpeechVoice *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("voice"));
}

- (void)setVoice:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (FTTextToSpeechResource)resource
{
  return (FTTextToSpeechResource *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("resource"));
}

- (void)setResource:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (FTQSSVersionInfo)server_info
{
  return (FTQSSVersionInfo *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("server_info"));
}

- (void)setServer_info:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
