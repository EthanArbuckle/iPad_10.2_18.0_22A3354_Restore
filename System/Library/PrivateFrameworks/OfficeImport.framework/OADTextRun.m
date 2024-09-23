@implementation OADTextRun

- (OADTextRun)init
{
  OADTextRun *v2;
  OADCharacterProperties *v3;
  OADCharacterProperties *mProperties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADTextRun;
  v2 = -[OADTextRun init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADCharacterProperties);
    mProperties = v2->mProperties;
    v2->mProperties = v3;

  }
  return v2;
}

- (id)properties
{
  return self->mProperties;
}

- (void)removeUnnecessaryOverrides
{
  -[OADCharacterProperties removeUnnecessaryOverrides](self->mProperties, "removeUnnecessaryOverrides");
}

- (BOOL)isEmpty
{
  return 1;
}

- (unint64_t)characterCount
{
  return 0;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->mProperties, a3);
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTextRun;
  -[OADTextRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
