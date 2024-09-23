@implementation PGTitleGeneratorTypeMatching

- (PGTitleGeneratorTypeMatching)initWithType:(int64_t)a3 eventEvaluationBlock:(id)a4
{
  id v6;
  PGTitleGeneratorTypeMatching *v7;
  PGTitleGeneratorTypeMatching *v8;
  uint64_t v9;
  id eventEvaluationBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGTitleGeneratorTypeMatching;
  v7 = -[PGTitleGeneratorTypeMatching init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    eventEvaluationBlock = v8->_eventEvaluationBlock;
    v8->_eventEvaluationBlock = (id)v9;

  }
  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (id)eventEvaluationBlock
{
  return self->_eventEvaluationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventEvaluationBlock, 0);
}

+ (id)typeMatchingWithType:(int64_t)a3 eventEvaluationBlock:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:eventEvaluationBlock:", a3, v6);

  return v7;
}

@end
