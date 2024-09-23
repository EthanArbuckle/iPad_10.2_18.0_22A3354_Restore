@implementation OCXDelayedMediaContext

- (OCXDelayedMediaContext)initWithTargetLocation:(id)a3 package:(id)a4
{
  id v7;
  id v8;
  OCXDelayedMediaContext *v9;
  OCXDelayedMediaContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCXDelayedMediaContext;
  v9 = -[OCXDelayedMediaContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mTargetLocation, a3);
    objc_storeStrong((id *)&v10->mPackage, a4);
  }

  return v10;
}

- (BOOL)loadDelayedNode:(id)a3
{
  return 0;
}

- (BOOL)saveDelayedMedia:(id)a3 toFile:(id)a4
{
  return 0;
}

- (id)dataRep
{
  return 0;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OCXDelayedMediaContext;
  -[OCXDelayedMediaContext description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetLocation, 0);
  objc_storeStrong((id *)&self->mPackage, 0);
}

@end
