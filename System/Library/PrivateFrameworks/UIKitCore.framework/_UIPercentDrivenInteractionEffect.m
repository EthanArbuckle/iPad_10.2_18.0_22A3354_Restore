@implementation _UIPercentDrivenInteractionEffect

- (_UIPercentDrivenInteractionEffect)initWithProgressBlock:(id)a3
{
  id v4;
  _UIPercentDrivenInteractionEffect *v5;
  _UIPercentDrivenInteractionEffect *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPercentDrivenInteractionEffect;
  v5 = -[_UIPercentDrivenInteractionEffect init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIPercentDrivenInteractionEffect setProgressBlock:](v5, "setProgressBlock:", v4);

  return v6;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v5;
  void (**v6)(id, id);

  v5 = a4;
  -[_UIPercentDrivenInteractionEffect progressBlock](self, "progressBlock");
  v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
}

@end
