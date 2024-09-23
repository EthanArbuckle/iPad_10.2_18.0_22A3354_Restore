@implementation PDTransitionOptions

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDTransitionOptions;
  -[PDTransitionOptions description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSoundFile, 0);
}

@end
