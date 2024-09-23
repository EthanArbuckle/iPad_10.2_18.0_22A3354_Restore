@implementation SBAssistantPresentationObservationToken

- (SBAssistantPresentationObservationToken)initWithAssistantController:(id)a3 scene:(id)a4
{
  id v7;
  SBAssistantPresentationObservationToken *v8;
  SBAssistantPresentationObservationToken *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAssistantPresentationObservationToken;
  v8 = -[SBPresentationObservationToken initWithScene:](&v11, sel_initWithScene_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assistantController, a3);
    -[SBAssistantController addObserver:](v9->_assistantController, "addObserver:", v9);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBAssistantController removeObserver:](self->_assistantController, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBAssistantPresentationObservationToken;
  -[SBAssistantPresentationObservationToken dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  _BOOL4 v3;
  void *v4;
  int64_t v5;

  v3 = -[SBAssistantController isVisible](self->_assistantController, "isVisible");
  -[SBPresentationObservationToken windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = -[SBAssistantController isVisibleInWindowScene:](self->_assistantController, "isVisibleInWindowScene:", v4);
  if (v3)
    v5 = 3;
  else
    v5 = 0;

  return v5;
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBPresentationObservationToken windowScene](self, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (!v7 || v7 == v5)
  {
    -[SBPresentationObservationToken willPresent](self, "willPresent");
    v6 = v7;
  }

}

- (void)assistantDidAppear:(id)a3 windowScene:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBPresentationObservationToken windowScene](self, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (!v7 || v7 == v5)
  {
    -[SBPresentationObservationToken didPresent](self, "didPresent");
    v6 = v7;
  }

}

- (void)assistantWillDisappear:(id)a3 windowScene:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBPresentationObservationToken windowScene](self, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (!v7 || v7 == v5)
  {
    -[SBPresentationObservationToken willDismiss](self, "willDismiss");
    v6 = v7;
  }

}

- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBPresentationObservationToken windowScene](self, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (!v7 || v7 == v5)
  {
    -[SBPresentationObservationToken didDismiss](self, "didDismiss");
    v6 = v7;
  }

}

- (SBAssistantController)assistantController
{
  return self->_assistantController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantController, 0);
}

@end
