@implementation _UIDropInteractionWeakWrapper

- (_UIDropInteractionWeakWrapper)initWithDropInteraction:(id)a3
{
  id v4;
  _UIDropInteractionWeakWrapper *v5;
  _UIDropInteractionWeakWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDropInteractionWeakWrapper;
  v5 = -[_UIDropInteractionWeakWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dropInteraction, v4);

  return v6;
}

- (UIDropInteraction)dropInteraction
{
  return (UIDropInteraction *)objc_loadWeakRetained((id *)&self->_dropInteraction);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dropInteraction);
}

@end
