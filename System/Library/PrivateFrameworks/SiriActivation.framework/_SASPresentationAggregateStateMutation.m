@implementation _SASPresentationAggregateStateMutation

- (_SASPresentationAggregateStateMutation)init
{
  return -[_SASPresentationAggregateStateMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SASPresentationAggregateStateMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SASPresentationAggregateStateMutation *v6;
  _SASPresentationAggregateStateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SASPresentationAggregateStateMutation;
  v6 = -[_SASPresentationAggregateStateMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setCanAcceptNewActivations:(BOOL)a3
{
  self->_canAcceptNewActivations = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setDidNewActivationAcceptanceChange:(BOOL)a3
{
  self->_didNewActivationAcceptanceChange = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setRequestState:(int64_t)a3
{
  self->_requestState = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  SASPresentationAggregateState *baseModel;
  char mutationFlags;
  SASPresentationAggregateState *v5;
  SASPresentationAggregateState *v6;
  _BOOL8 canAcceptNewActivations;
  _BOOL8 didNewActivationAcceptanceChange;
  int64_t requestState;
  uint64_t v10;
  _BOOL8 v11;
  int64_t v12;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [SASPresentationAggregateState alloc];
    canAcceptNewActivations = self->_canAcceptNewActivations;
    didNewActivationAcceptanceChange = self->_didNewActivationAcceptanceChange;
    requestState = self->_requestState;
LABEL_13:
    v5 = -[SASPresentationAggregateState initWithCanAcceptNewActivations:didNewActivationAcceptanceChange:requestState:](v6, "initWithCanAcceptNewActivations:didNewActivationAcceptanceChange:requestState:", canAcceptNewActivations, didNewActivationAcceptanceChange, requestState);
    return v5;
  }
  mutationFlags = (char)self->_mutationFlags;
  if ((mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v10 = self->_canAcceptNewActivations;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        v11 = self->_didNewActivationAcceptanceChange;
        if ((mutationFlags & 8) != 0)
        {
LABEL_8:
          v12 = self->_requestState;
LABEL_12:
          v6 = [SASPresentationAggregateState alloc];
          canAcceptNewActivations = v10;
          didNewActivationAcceptanceChange = v11;
          requestState = v12;
          goto LABEL_13;
        }
LABEL_11:
        v12 = -[SASPresentationAggregateState requestState](self->_baseModel, "requestState");
        goto LABEL_12;
      }
    }
    else
    {
      v10 = -[SASPresentationAggregateState canAcceptNewActivations](baseModel, "canAcceptNewActivations");
      mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 4) != 0)
        goto LABEL_7;
    }
    v11 = -[SASPresentationAggregateState didNewActivationAcceptanceChange](self->_baseModel, "didNewActivationAcceptanceChange");
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
  v5 = (SASPresentationAggregateState *)-[SASPresentationAggregateState copy](baseModel, "copy");
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
