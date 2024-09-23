@implementation THModelFlowPageInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class(THFlowPageLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THFlowPageRep, a2);
}

- (BOOL)hasBodyFlow
{
  return self->mHasBodyFlow;
}

- (void)setHasBodyFlow:(BOOL)a3
{
  self->mHasBodyFlow = a3;
}

@end
