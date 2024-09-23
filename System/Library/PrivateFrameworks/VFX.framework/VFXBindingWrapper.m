@implementation VFXBindingWrapper

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_setBinding_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)VFXBindingWrapper;
  -[VFXBindingWrapper dealloc](&v4, sel_dealloc);
}

- (_TtP3VFX10VFXBinding_)binding
{
  return self->binding;
}

- (void)setBinding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)index
{
  return self->index;
}

- (void)setIndex:(int64_t)a3
{
  self->index = a3;
}

- (signed)type
{
  return self->type;
}

- (void)setType:(signed __int16)a3
{
  self->type = a3;
}

@end
