@implementation VFXPrefabUpdateOperation

- (int64_t)operation
{
  return self->operation;
}

- (void)setOperation:(int64_t)a3
{
  self->operation = a3;
}

- (VFXNode)source
{
  return self->source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (VFXNode)destination
{
  return self->destination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
