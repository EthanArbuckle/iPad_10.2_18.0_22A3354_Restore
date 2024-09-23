@implementation SBSAElementViewInteractionResultMutator

- (SBSAElementViewInteractionResultMutator)initWithElementViewInteractionResult:(id)a3
{
  id v5;
  SBSAElementViewInteractionResultMutator *v6;
  SBSAElementViewInteractionResultMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementViewInteractionResultMutator;
  v6 = -[SBSAElementViewInteractionResultMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_interactionResult, a3);

  return v7;
}

- (NSString)clientIdentifier
{
  return -[SBSAElementViewInteractionResult clientIdentifier](self->_interactionResult, "clientIdentifier");
}

- (void)setClientIdentifier:(id)a3
{
  -[SBSAElementViewInteractionResult _setClientIdentifier:](self->_interactionResult, "_setClientIdentifier:", a3);
}

- (NSString)elementIdentifier
{
  return -[SBSAElementViewInteractionResult elementIdentifier](self->_interactionResult, "elementIdentifier");
}

- (void)setElementIdentifier:(id)a3
{
  -[SBSAElementViewInteractionResult _setElementIdentifier:](self->_interactionResult, "_setElementIdentifier:", a3);
}

- (unint64_t)interactionSource
{
  return -[SBSAElementViewInteractionResult interactionSource](self->_interactionResult, "interactionSource");
}

- (void)setInteractionSource:(unint64_t)a3
{
  -[SBSAElementViewInteractionResult _setInteractionSource:](self->_interactionResult, "_setInteractionSource:", a3);
}

- (int64_t)viewInteractionResult
{
  return -[SBSAElementViewInteractionResult viewInteractionResult](self->_interactionResult, "viewInteractionResult");
}

- (void)setViewInteractionResult:(int64_t)a3
{
  -[SBSAElementViewInteractionResult _setViewInteractionResult:](self->_interactionResult, "_setViewInteractionResult:", a3);
}

- (SBSAElementViewInteractionResult)interactionResult
{
  return self->_interactionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionResult, 0);
}

@end
