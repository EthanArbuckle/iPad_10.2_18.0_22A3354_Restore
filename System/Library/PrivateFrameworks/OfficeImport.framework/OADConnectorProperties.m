@implementation OADConnectorProperties

- (OADConnectorProperties)init
{
  OADConnectorProperties *v2;
  OADConnection *v3;
  void *v4;
  OADConnection *v5;
  OADConnection *mFrom;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADConnectorProperties;
  v2 = -[OADProperties init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADConnection);
    v4 = *(void **)&v2->super.mIsTextBox;
    *(_QWORD *)&v2->super.mIsTextBox = v3;

    v5 = objc_alloc_init(OADConnection);
    mFrom = v2->mFrom;
    v2->mFrom = v5;

  }
  return v2;
}

+ (id)defaultProperties
{
  if (+[OADConnectorProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADConnectorProperties defaultProperties]::once, &__block_literal_global_54);
  return (id)+[OADConnectorProperties defaultProperties]::defaultProperties;
}

- (OADConnectorProperties)initWithDefaults
{
  OADConnectorProperties *v2;
  OADConnection *v3;
  void *v4;
  OADConnection *v5;
  OADConnection *mFrom;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADConnectorProperties;
  v2 = -[OADGraphicProperties initWithDefaults](&v8, sel_initWithDefaults);
  if (v2)
  {
    v3 = objc_alloc_init(OADConnection);
    v4 = *(void **)&v2->super.mIsTextBox;
    *(_QWORD *)&v2->super.mIsTextBox = v3;

    v5 = objc_alloc_init(OADConnection);
    mFrom = v2->mFrom;
    v2->mFrom = v5;

  }
  return v2;
}

- (id)from
{
  return *(id *)&self->super.mIsTextBox;
}

- (id)to
{
  return self->mFrom;
}

void __43__OADConnectorProperties_defaultProperties__block_invoke()
{
  OADConnectorProperties *v0;
  void *v1;

  v0 = -[OADConnectorProperties initWithDefaults]([OADConnectorProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADConnectorProperties defaultProperties]::defaultProperties;
  +[OADConnectorProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADConnectorProperties;
  -[OADGraphicProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFrom, 0);
  objc_storeStrong((id *)&self->super.mIsTextBox, 0);
}

@end
