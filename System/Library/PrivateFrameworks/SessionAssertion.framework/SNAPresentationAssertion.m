@implementation SNAPresentationAssertion

- (SNAPresentationAssertion)init
{

  return 0;
}

- (SNAPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 presentationState:(unint64_t)a5 invalidationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  SNAPresentationAssertion *v13;
  _TtC16SessionAssertion21PresentationAssertion *v14;
  SNAPresentationAssertion *v15;
  uint64_t v16;
  _TtC16SessionAssertion21PresentationAssertion *assertion;
  _QWORD v19[4];
  SNAPresentationAssertion *v20;
  id v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SNAPresentationAssertion;
  v13 = -[SNAPresentationAssertion init](&v22, sel_init);
  if (v13)
  {
    v14 = [_TtC16SessionAssertion21PresentationAssertion alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __104__SNAPresentationAssertion_initWithExplanation_sessionIdentifier_presentationState_invalidationHandler___block_invoke;
    v19[3] = &unk_1E6771F98;
    v21 = v12;
    v15 = v13;
    v20 = v15;
    v16 = -[PresentationAssertion initWithExplanation:activityIdentifier:presentationState:invalidationHandler:](v14, "initWithExplanation:activityIdentifier:presentationState:invalidationHandler:", v10, v11, a5, v19);
    assertion = v15->_assertion;
    v15->_assertion = (_TtC16SessionAssertion21PresentationAssertion *)v16;

  }
  return v13;
}

uint64_t __104__SNAPresentationAssertion_initWithExplanation_sessionIdentifier_presentationState_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (unint64_t)invalidationReason
{
  return -[PresentationAssertion snaInvalidationReason](self->_assertion, "snaInvalidationReason");
}

- (unint64_t)state
{
  return -[PresentationAssertion snaState](self->_assertion, "snaState");
}

- (NSString)sessionIdentifier
{
  return -[PresentationAssertion activityIdentifier](self->_assertion, "activityIdentifier");
}

- (NSString)explanation
{
  return -[PresentationAssertion explanation](self->_assertion, "explanation");
}

- (void)invalidate
{
  -[PresentationAssertion invalidate](self->_assertion, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
