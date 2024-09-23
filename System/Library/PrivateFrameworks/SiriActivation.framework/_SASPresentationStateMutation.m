@implementation _SASPresentationStateMutation

- (_SASPresentationStateMutation)init
{
  return -[_SASPresentationStateMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SASPresentationStateMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SASPresentationStateMutation *v6;
  _SASPresentationStateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SASPresentationStateMutation;
  v6 = -[_SASPresentationStateMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setPresentationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentationIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)generate
{
  SASPresentationState *baseModel;
  SASPresentationState *v4;
  SASPresentationState *v5;
  NSString *v6;
  NSString *v7;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SASPresentationState initWithPresentationIdentifier:]([SASPresentationState alloc], "initWithPresentationIdentifier:", self->_presentationIdentifier);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SASPresentationState *)-[SASPresentationState copy](baseModel, "copy");
LABEL_5:
    v5 = v4;
    return v5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_presentationIdentifier;
  }
  else
  {
    -[SASPresentationState presentationIdentifier](baseModel, "presentationIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v5 = -[SASPresentationState initWithPresentationIdentifier:]([SASPresentationState alloc], "initWithPresentationIdentifier:", v6);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationIdentifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
