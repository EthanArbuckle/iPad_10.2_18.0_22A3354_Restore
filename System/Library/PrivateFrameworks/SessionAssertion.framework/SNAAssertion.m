@implementation SNAAssertion

- (SNAAssertion)init
{

  return 0;
}

- (SNAAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidationHandler:(id)a5
{
  return -[SNAAssertion initWithExplanation:target:invalidateOnSessionRequest:invalidationHandler:](self, "initWithExplanation:target:invalidateOnSessionRequest:invalidationHandler:", a3, a4, 0, a5);
}

- (SNAAssertion)initWithExplanation:(id)a3 target:(id)a4 invalidateOnSessionRequest:(BOOL)a5 invalidationHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  SNAAssertion *v13;
  _TtC16SessionAssertion23SessionRequestAssertion *v14;
  SNAAssertion *v15;
  uint64_t v16;
  _TtC16SessionAssertion23SessionRequestAssertion *sessionAssertion;
  _QWORD v19[4];
  SNAAssertion *v20;
  id v21;
  objc_super v22;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SNAAssertion;
  v13 = -[SNAAssertion init](&v22, sel_init);
  if (v13)
  {
    v14 = [_TtC16SessionAssertion23SessionRequestAssertion alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __90__SNAAssertion_initWithExplanation_target_invalidateOnSessionRequest_invalidationHandler___block_invoke;
    v19[3] = &unk_1E6771FC0;
    v21 = v12;
    v15 = v13;
    v20 = v15;
    v16 = -[SessionRequestAssertion initWithExplanation:target:invalidateOnSessionRequest:invalidationHandler:](v14, "initWithExplanation:target:invalidateOnSessionRequest:invalidationHandler:", v10, v11, v7, v19);
    sessionAssertion = v15->_sessionAssertion;
    v15->_sessionAssertion = (_TtC16SessionAssertion23SessionRequestAssertion *)v16;

  }
  return v13;
}

uint64_t __90__SNAAssertion_initWithExplanation_target_invalidateOnSessionRequest_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (unint64_t)invalidationReason
{
  return -[SessionRequestAssertion snaInvalidationReason](self->_sessionAssertion, "snaInvalidationReason");
}

- (unint64_t)state
{
  return -[SessionRequestAssertion snaState](self->_sessionAssertion, "snaState");
}

- (SNAAssertionTarget)target
{
  return -[SessionRequestAssertion snaTarget](self->_sessionAssertion, "snaTarget");
}

- (NSString)explanation
{
  return -[SessionRequestAssertion explanation](self->_sessionAssertion, "explanation");
}

- (NSArray)sessionIdentifiers
{
  return -[SessionRequestAssertion sessionIdentifiers](self->_sessionAssertion, "sessionIdentifiers");
}

- (void)invalidate
{
  -[SessionRequestAssertion invalidate](self->_sessionAssertion, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_sessionAssertion, 0);
}

@end
