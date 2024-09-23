@implementation QSSMutableRecognitionPhraseTokensAlternatives

- (QSSMutableRecognitionPhraseTokensAlternatives)init
{
  QSSMutableRecognitionPhraseTokensAlternatives *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRecognitionPhraseTokensAlternatives;
  v2 = -[QSSMutableRecognitionPhraseTokensAlternatives init](&v6, sel_init);
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

- (NSArray)tok_phrases
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("tok_phrases"));
}

- (void)setTok_phrases:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (BOOL)has_unsuggested_alternatives
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("has_unsuggested_alternatives"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHas_unsuggested_alternatives:(BOOL)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
