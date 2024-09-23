@implementation PDSetBehavior

- (PDSetBehavior)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSetBehavior;
  return -[PDAnimateBehavior init](&v3, sel_init);
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->mValue, a3);
}

- (id)value
{
  return self->mValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mValue, 0);
}

@end
