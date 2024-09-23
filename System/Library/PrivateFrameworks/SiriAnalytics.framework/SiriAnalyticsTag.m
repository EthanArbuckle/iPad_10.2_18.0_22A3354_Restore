@implementation SiriAnalyticsTag

- (SiriAnalyticsTag)init
{

  return 0;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  uint64_t v7;
  SiriAnalyticsTag *v8;
  SiriAnalyticsTagShim *v9;
  SiriAnalyticsTagShim *shim;
  objc_super v12;

  v7 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriAnalyticsTag;
  v8 = -[SiriAnalyticsTag init](&v12, sel_init);
  if (v8)
  {
    v9 = -[SiriAnalyticsTagShim initWithConditionType:start:end:]([SiriAnalyticsTagShim alloc], "initWithConditionType:start:end:", v7, a4, a5);
    shim = v8->_shim;
    v8->_shim = v9;

  }
  return v8;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 start:(unint64_t)a4
{
  uint64_t v5;
  SiriAnalyticsTag *v6;
  SiriAnalyticsTagShim *v7;
  SiriAnalyticsTagShim *shim;
  objc_super v10;

  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriAnalyticsTag;
  v6 = -[SiriAnalyticsTag init](&v10, sel_init);
  if (v6)
  {
    v7 = -[SiriAnalyticsTagShim initWithConditionType:start:]([SiriAnalyticsTagShim alloc], "initWithConditionType:start:", v5, a4);
    shim = v6->_shim;
    v6->_shim = v7;

  }
  return v6;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 end:(unint64_t)a4
{
  uint64_t v5;
  SiriAnalyticsTag *v6;
  SiriAnalyticsTagShim *v7;
  SiriAnalyticsTagShim *shim;
  objc_super v10;

  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriAnalyticsTag;
  v6 = -[SiriAnalyticsTag init](&v10, sel_init);
  if (v6)
  {
    v7 = -[SiriAnalyticsTagShim initWithConditionType:end:]([SiriAnalyticsTagShim alloc], "initWithConditionType:end:", v5, a4);
    shim = v6->_shim;
    v6->_shim = v7;

  }
  return v6;
}

- (SiriAnalyticsTag)initWithConditionTypeAffectingEntireClock:(int)a3
{
  uint64_t v3;
  SiriAnalyticsTag *v4;
  SiriAnalyticsTagShim *v5;
  SiriAnalyticsTagShim *shim;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriAnalyticsTag;
  v4 = -[SiriAnalyticsTag init](&v8, sel_init);
  if (v4)
  {
    v5 = -[SiriAnalyticsTagShim initWithConditionTypeAffectingEntireClock:]([SiriAnalyticsTagShim alloc], "initWithConditionTypeAffectingEntireClock:", v3);
    shim = v4->_shim;
    v4->_shim = v5;

  }
  return v4;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 componentId:(id)a4 componentName:(int)a5 joined:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  SiriAnalyticsTag *v11;
  SiriAnalyticsTagShim *v12;
  SiriAnalyticsTagShim *shim;
  objc_super v15;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsTag;
  v11 = -[SiriAnalyticsTag init](&v15, sel_init);
  if (v11)
  {
    v12 = -[SiriAnalyticsTagShim initWithConditionType:componentId:componentName:joined:]([SiriAnalyticsTagShim alloc], "initWithConditionType:componentId:componentName:joined:", v8, v10, v7, v6);
    shim = v11->_shim;
    v11->_shim = v12;

  }
  return v11;
}

- (SiriAnalyticsTag)initWithConditionType:(int)a3 requestId:(id)a4 joined:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  SiriAnalyticsTag *v9;
  SiriAnalyticsTagShim *v10;
  SiriAnalyticsTagShim *shim;
  objc_super v13;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriAnalyticsTag;
  v9 = -[SiriAnalyticsTag init](&v13, sel_init);
  if (v9)
  {
    v10 = -[SiriAnalyticsTagShim initWithConditionType:requestId:joined:]([SiriAnalyticsTagShim alloc], "initWithConditionType:requestId:joined:", v6, v8, v5);
    shim = v9->_shim;
    v9->_shim = v10;

  }
  return v9;
}

- (id)shim
{
  return self->_shim;
}

- (void)encodeWithCoder:(id)a3
{
  -[SiriAnalyticsTagShim encodeWithCoder:](self->_shim, "encodeWithCoder:", a3);
}

- (SiriAnalyticsTag)initWithCoder:(id)a3
{
  id v4;
  SiriAnalyticsTag *v5;
  SiriAnalyticsTagShim *v6;
  SiriAnalyticsTagShim *shim;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriAnalyticsTag;
  v5 = -[SiriAnalyticsTag init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SiriAnalyticsTagShim initWithCoder:]([SiriAnalyticsTagShim alloc], "initWithCoder:", v4);
    shim = v5->_shim;
    v5->_shim = v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
