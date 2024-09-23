@implementation QSSMutableBatchRecoverStreamingRequest

- (QSSMutableBatchRecoverStreamingRequest)init
{
  QSSMutableBatchRecoverStreamingRequest *v2;
  uint64_t v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBatchRecoverStreamingRequest;
  v2 = -[QSSMutableBatchRecoverStreamingRequest init](&v6, sel_init);
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

- (QSSStartBatchRecoverRequest)contentAsQSSStartBatchRecoverRequest
{
  void *v3;

  if (-[QSSMutableBatchRecoverStreamingRequest content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (QSSStartBatchRecoverRequest *)v3;
}

- (void)setContentAsQSSStartBatchRecoverRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[QSSMutableBatchRecoverStreamingRequest setContent_type:](self, "setContent_type:", 1);
  v4 = (void *)objc_msgSend(v5, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:", v4, CFSTR("content"));

}

@end
