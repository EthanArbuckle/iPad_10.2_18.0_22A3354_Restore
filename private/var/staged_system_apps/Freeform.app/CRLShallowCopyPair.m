@implementation CRLShallowCopyPair

- (id)copyWithZone:(_NSZone *)a3
{
  CRLShallowCopyPair *v4;
  void *v5;
  void *v6;
  CRLShallowCopyPair *v7;

  v4 = +[CRLShallowCopyPair allocWithZone:](CRLShallowCopyPair, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
  v7 = -[CRLPair initWithFirst:second:](v4, "initWithFirst:second:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLMutableShallowCopyPair *v4;
  void *v5;
  void *v6;
  CRLMutableShallowCopyPair *v7;

  v4 = +[CRLMutableShallowCopyPair allocWithZone:](CRLMutableShallowCopyPair, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair first](self, "first"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPair second](self, "second"));
  v7 = -[CRLPair initWithFirst:second:](v4, "initWithFirst:second:", v5, v6);

  return v7;
}

@end
