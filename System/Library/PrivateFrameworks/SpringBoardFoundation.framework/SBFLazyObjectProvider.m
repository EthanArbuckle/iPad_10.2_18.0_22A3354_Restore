@implementation SBFLazyObjectProvider

- (SBFLazyObjectProvider)initWithGenerator:(id)a3
{
  id v4;
  SBFLazyObjectProvider *v5;
  uint64_t v6;
  id generator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFLazyObjectProvider;
  v5 = -[SBFLazyObjectProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    generator = v5->_generator;
    v5->_generator = (id)v6;

  }
  return v5;
}

- (id)object
{
  void (**object)(id, SEL);
  void *v4;
  id v5;

  object = (void (**)(id, SEL))self->_object;
  if (!object)
  {
    object = (void (**)(id, SEL))self->_generator;
    if (object)
    {
      object[2](object, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = self->_object;
      self->_object = v4;

      object = (void (**)(id, SEL))self->_object;
    }
  }
  return object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (id)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generator, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
