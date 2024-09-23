@implementation FTMutableTTSPrompts

- (FTMutableTTSPrompts)init
{
  FTMutableTTSPrompts *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTMutableTTSPrompts;
  v2 = -[FTMutableTTSPrompts init](&v6, sel_init);
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

- (NSData)prompts_v2
{
  return (NSData *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("prompts_v2"));
}

- (void)setPrompts_v2:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");

}

- (void)prompts_v2:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void (**v7)(id, uint64_t, uint64_t);

  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  -[FTMutableTTSPrompts prompts_v2](self, "prompts_v2");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");
  -[FTMutableTTSPrompts prompts_v2](self, "prompts_v2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v5, objc_msgSend(v6, "length"));

}

@end
