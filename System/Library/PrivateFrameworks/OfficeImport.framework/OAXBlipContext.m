@implementation OAXBlipContext

- (BOOL)loadDelayedNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OCPPackage partForLocation:](self->super.mPackage, "partForLocation:", self->super.mTargetLocation);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v5 != 0;
    if (v5)
    {
      objc_msgSend(v5, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setData:", v8);

      -[OCPPackage resetPartForLocation:](self->super.mPackage, "resetPartForLocation:", self->super.mTargetLocation);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OAXBlipContext;
  -[OCXDelayedMediaContext description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
