@implementation UIAnimatablePropertyBase

- (void).cxx_destruct
{
  objc_storeStrong(&self->___swiftTransformer, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

- (_UIViewAnimatablePropertyTransformer)transformer
{
  return self->_transformer;
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

- (id)__swiftTransformer
{
  return self->___swiftTransformer;
}

- (void)set__swiftTransformer:(id)a3
{
  objc_storeStrong(&self->___swiftTransformer, a3);
}

@end
