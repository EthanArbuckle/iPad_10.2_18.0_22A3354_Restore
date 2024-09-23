@implementation SBSceneRenderingEnvironmentParticipant

- (SBSceneRenderingEnvironmentParticipant)initWithRenderingEnvironmentIdentifier:(id)a3 assertion:(id)a4
{
  id v6;
  id v7;
  SBSceneRenderingEnvironmentParticipant *v8;
  SBSceneRenderingEnvironmentParticipant *v9;
  uint64_t v10;
  NSString *renderingEnvironmentIdentifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSceneRenderingEnvironmentParticipant;
  v8 = -[SBSceneRenderingEnvironmentParticipant init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assertion, a4);
    v10 = objc_msgSend(v6, "copy");
    renderingEnvironmentIdentifier = v9->_renderingEnvironmentIdentifier;
    v9->_renderingEnvironmentIdentifier = (NSString *)v10;

  }
  return v9;
}

- (void)invalidate
{
  BSInvalidatable *assertion;

  -[BSInvalidatable invalidate](self->_assertion, "invalidate");
  assertion = self->_assertion;
  self->_assertion = 0;

}

- (NSString)renderingEnvironmentIdentifier
{
  return self->_renderingEnvironmentIdentifier;
}

- (BSInvalidatable)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_renderingEnvironmentIdentifier, 0);
}

@end
