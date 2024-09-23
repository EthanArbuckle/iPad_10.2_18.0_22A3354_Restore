@implementation OPTTSMutableTextToSpeechFeature

- (OPTTSMutableTextToSpeechFeature)init
{
  OPTTSMutableTextToSpeechFeature *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechFeature;
  v2 = -[OPTTSMutableTextToSpeechFeature init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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

- (NSArray)normalized_text
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("normalized_text"));
}

- (void)setNormalized_text:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)phoneme_sequence
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("phoneme_sequence"));
}

- (void)setPhoneme_sequence:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)prompts
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("prompts"));
}

- (void)setPrompts:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)replacement
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("replacement"));
}

- (void)setReplacement:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)neural_phoneme_sequence
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("neural_phoneme_sequence"));
}

- (void)setNeural_phoneme_sequence:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
