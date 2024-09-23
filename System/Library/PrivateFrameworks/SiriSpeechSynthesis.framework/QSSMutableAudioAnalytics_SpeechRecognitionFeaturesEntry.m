@implementation QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry

- (QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry)init
{
  QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry;
  v2 = -[QSSMutableAudioAnalytics_SpeechRecognitionFeaturesEntry init](&v6, sel_init);
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

- (NSString)key
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("key"));
}

- (void)setKey:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (float)value
{
  void *v2;
  float v3;
  float v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setValue:(float)a3
{
  id v5;
  double v6;
  id v7;

  v5 = objc_alloc(MEMORY[0x24BDD16E0]);
  *(float *)&v6 = a3;
  v7 = (id)objc_msgSend(v5, "initWithFloat:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
