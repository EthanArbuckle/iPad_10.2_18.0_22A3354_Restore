@implementation SBTraitsOrientationStageComponent

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (int64_t)preferencesType
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentOrder, 0);
}

- (SBTraitsOrientationStageComponent)initWithComponentOrder:(id)a3
{
  id v4;
  SBTraitsOrientationStageComponent *v5;
  uint64_t v6;
  NSNumber *componentOrder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsOrientationStageComponent;
  v5 = -[SBTraitsOrientationStageComponent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    componentOrder = v5->_componentOrder;
    v5->_componentOrder = (NSNumber *)v6;

  }
  return v5;
}

- (SBTraitsOrientationStageComponent)init
{
  return -[SBTraitsOrientationStageComponent initWithComponentOrder:](self, "initWithComponentOrder:", &unk_1E91D1D60);
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
  v8.super_class = (Class)SBTraitsOrientationStageComponent;
  -[SBTraitsOrientationStageComponent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSNumber stringValue](self->_componentOrder, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" order: %@"), v6);

  return (NSString *)v5;
}

@end
