@implementation CFXAnimationBinding

- (void)dealloc
{
  id valueTransformer;
  objc_super v4;

  valueTransformer = self->_valueTransformer;
  if (valueTransformer)
    _Block_release(valueTransformer);
  v4.receiver = self;
  v4.super_class = (Class)CFXAnimationBinding;
  -[CFXAnimationBinding dealloc](&v4, sel_dealloc);
}

@end
