@implementation SXComponentInteraction

- (SXComponentInteraction)initWithComponentView:(id)a3 handler:(id)a4 types:(unint64_t)a5
{
  id v8;
  id v9;
  SXComponentInteraction *v10;
  SXComponentInteraction *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SXComponentInteraction;
  v10 = -[SXComponentInteraction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_componentView, v8);
    objc_storeStrong((id *)&v11->_handler, a4);
    v11->_types = a5;
  }

  return v11;
}

- (BOOL)handlesType:(unint64_t)a3
{
  return (a3 & ~-[SXComponentInteraction types](self, "types")) == 0;
}

- (SXComponentView)componentView
{
  return (SXComponentView *)objc_loadWeakRetained((id *)&self->_componentView);
}

- (SXComponentInteractionHandler)handler
{
  return self->_handler;
}

- (unint64_t)types
{
  return self->_types;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_destroyWeak((id *)&self->_componentView);
}

@end
