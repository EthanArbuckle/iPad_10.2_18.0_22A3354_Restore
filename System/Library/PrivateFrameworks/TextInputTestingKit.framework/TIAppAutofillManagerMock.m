@implementation TIAppAutofillManagerMock

- (TIAppAutofillManagerMock)init
{
  TIAppAutofillManagerMock *v2;
  TIAppAutofillManagerMock *v3;
  TIKeyboardSecureCandidateRenderer *secureCandidateRenderer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIAppAutofillManagerMock;
  v2 = -[TIAppAutofillManagerMock init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hasOneTimeCode = 0;
    secureCandidateRenderer = v2->_secureCandidateRenderer;
    v2->_secureCandidateRenderer = 0;

  }
  return v3;
}

- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a5;
  dispatch_get_global_queue(33, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v7 = v5;
  TIDispatchAsync();

}

- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)hasOneTimeCode
{
  return self->_hasOneTimeCode;
}

- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer
{
  return self->_secureCandidateRenderer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureCandidateRenderer, 0);
}

uint64_t __104__TIAppAutofillManagerMock_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
