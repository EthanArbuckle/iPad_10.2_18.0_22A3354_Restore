@implementation SXWebContentComponentInteractionHandler

- (SXWebContentComponentInteractionHandler)initWithInteraction:(id)a3
{
  id v5;
  SXWebContentComponentInteractionHandler *v6;
  SXWebContentComponentInteractionHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebContentComponentInteractionHandler;
  v6 = -[SXWebContentComponentInteractionHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_interaction, a3);

  return v7;
}

- (void)handleInteractionType:(unint64_t)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  id v5;

  -[SXWebContentComponentInteractionHandler interaction](self, "interaction", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "perform");

}

- (SWInteraction)interaction
{
  return self->_interaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
