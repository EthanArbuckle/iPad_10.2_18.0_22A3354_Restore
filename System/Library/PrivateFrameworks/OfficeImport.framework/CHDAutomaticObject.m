@implementation CHDAutomaticObject

+ (id)automaticEffects
{
  if (+[CHDAutomaticObject automaticEffects]::once != -1)
    dispatch_once(&+[CHDAutomaticObject automaticEffects]::once, &__block_literal_global_5_2);
  return (id)+[CHDAutomaticObject automaticEffects]::automaticEffects;
}

- (CHDAutomaticObject)initWithName:(id)a3
{
  id v5;
  CHDAutomaticObject *v6;
  CHDAutomaticObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHDAutomaticObject;
  v6 = -[CHDAutomaticObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mName, a3);

  return v7;
}

+ (id)automaticStroke
{
  if (+[CHDAutomaticObject automaticStroke]::once != -1)
    dispatch_once(&+[CHDAutomaticObject automaticStroke]::once, &__block_literal_global_2_0);
  return (id)+[CHDAutomaticObject automaticStroke]::automaticStroke;
}

+ (id)automaticFill
{
  if (+[CHDAutomaticObject automaticFill]::once != -1)
    dispatch_once(&+[CHDAutomaticObject automaticFill]::once, &__block_literal_global_69);
  return (id)+[CHDAutomaticObject automaticFill]::automaticFill;
}

void __35__CHDAutomaticObject_automaticFill__block_invoke()
{
  CHDAutomaticObject *v0;
  void *v1;

  v0 = -[CHDAutomaticObject initWithName:]([CHDAutomaticObject alloc], "initWithName:", CFSTR("autoFill"));
  v1 = (void *)+[CHDAutomaticObject automaticFill]::automaticFill;
  +[CHDAutomaticObject automaticFill]::automaticFill = (uint64_t)v0;

}

void __37__CHDAutomaticObject_automaticStroke__block_invoke()
{
  CHDAutomaticObject *v0;
  void *v1;

  v0 = -[CHDAutomaticObject initWithName:]([CHDAutomaticObject alloc], "initWithName:", CFSTR("autoStroke"));
  v1 = (void *)+[CHDAutomaticObject automaticStroke]::automaticStroke;
  +[CHDAutomaticObject automaticStroke]::automaticStroke = (uint64_t)v0;

}

void __38__CHDAutomaticObject_automaticEffects__block_invoke()
{
  CHDAutomaticObject *v0;
  void *v1;

  v0 = -[CHDAutomaticObject initWithName:]([CHDAutomaticObject alloc], "initWithName:", CFSTR("autoEffects"));
  v1 = (void *)+[CHDAutomaticObject automaticEffects]::automaticEffects;
  +[CHDAutomaticObject automaticEffects]::automaticEffects = (uint64_t)v0;

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDAutomaticObject;
  -[CHDAutomaticObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
