@implementation SBTraitsZOrderStageComponent

- (SBTraitsZOrderStageComponent)initWithComponentOrder:(id)a3
{
  id v4;
  SBTraitsZOrderStageComponent *v5;
  uint64_t v6;
  NSNumber *componentOrder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsZOrderStageComponent;
  v5 = -[SBTraitsZOrderStageComponent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    componentOrder = v5->_componentOrder;
    v5->_componentOrder = (NSNumber *)v6;

  }
  return v5;
}

- (SBTraitsZOrderStageComponent)init
{
  return -[SBTraitsZOrderStageComponent initWithComponentOrder:](self, "initWithComponentOrder:", &unk_1E91D0848);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsZOrderStageComponent;
  -[SBTraitsZOrderStageComponent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSNumber stringValue](self->_componentOrder, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" order: %@"), v6);

  return (NSString *)v5;
}

- (int64_t)preferencesType
{
  return 0;
}

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentOrder, 0);
}

@end
