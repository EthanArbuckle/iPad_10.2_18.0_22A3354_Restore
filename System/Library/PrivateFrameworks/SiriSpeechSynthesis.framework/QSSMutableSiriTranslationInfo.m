@implementation QSSMutableSiriTranslationInfo

- (QSSMutableSiriTranslationInfo)init
{
  QSSMutableSiriTranslationInfo *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSiriTranslationInfo;
  v2 = -[QSSMutableSiriTranslationInfo init](&v6, sel_init);
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

- (QSSRecognitionSausage)raw_sausage
{
  return (QSSRecognitionSausage *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("raw_sausage"));
}

- (void)setRaw_sausage:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)raw_nbest_choices
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
}

- (void)setRaw_nbest_choices:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)post_itn_tokens
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("post_itn_tokens"));
}

- (void)setPost_itn_tokens:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSString)post_itn_recognition
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("post_itn_recognition"));
}

- (void)setPost_itn_recognition:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)itn_alignments
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("itn_alignments"));
}

- (void)setItn_alignments:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (NSArray)translation_phrase
{
  return (NSArray *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("translation_phrase"));
}

- (void)setTranslation_phrase:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

@end
