@implementation SNAProminentPresentationAssertion

- (SNAProminentPresentationAssertion)init
{

  return 0;
}

- (SNAProminentPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 invalidationHandler:(id)a5
{
  return -[SNAProminentPresentationAssertion initWithExplanation:sessionIdentifier:duration:invalidationHandler:](self, "initWithExplanation:sessionIdentifier:duration:invalidationHandler:", a3, a4, a5, 0.0);
}

- (SNAProminentPresentationAssertion)initWithExplanation:(id)a3 sessionIdentifier:(id)a4 duration:(double)a5 invalidationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  SNAProminentPresentationAssertion *v13;
  _TtC16SessionAssertion30ProminentPresentationAssertion *v14;
  SNAProminentPresentationAssertion *v15;
  uint64_t v16;
  _TtC16SessionAssertion30ProminentPresentationAssertion *assertion;
  _QWORD v19[4];
  SNAProminentPresentationAssertion *v20;
  id v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SNAProminentPresentationAssertion;
  v13 = -[SNAProminentPresentationAssertion init](&v22, sel_init);
  if (v13)
  {
    v14 = [_TtC16SessionAssertion30ProminentPresentationAssertion alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __104__SNAProminentPresentationAssertion_initWithExplanation_sessionIdentifier_duration_invalidationHandler___block_invoke;
    v19[3] = &unk_1E6771F70;
    v21 = v12;
    v15 = v13;
    v20 = v15;
    v16 = -[ProminentPresentationAssertion initWithExplanation:activityIdentifier:duration:invalidationHandler:](v14, "initWithExplanation:activityIdentifier:duration:invalidationHandler:", v10, v11, v19, a5);
    assertion = v15->_assertion;
    v15->_assertion = (_TtC16SessionAssertion30ProminentPresentationAssertion *)v16;

  }
  return v13;
}

uint64_t __104__SNAProminentPresentationAssertion_initWithExplanation_sessionIdentifier_duration_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (unint64_t)invalidationReason
{
  return -[ProminentPresentationAssertion snaInvalidationReason](self->_assertion, "snaInvalidationReason");
}

- (unint64_t)state
{
  return -[ProminentPresentationAssertion snaState](self->_assertion, "snaState");
}

- (NSString)sessionIdentifier
{
  return -[ProminentPresentationAssertion activityIdentifier](self->_assertion, "activityIdentifier");
}

- (NSString)explanation
{
  return -[ProminentPresentationAssertion explanation](self->_assertion, "explanation");
}

- (void)invalidate
{
  -[ProminentPresentationAssertion invalidate](self->_assertion, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
