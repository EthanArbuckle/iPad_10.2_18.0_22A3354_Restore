@implementation SBInCallTransientOverlayPresentationContext

- (SBInCallTransientOverlayPresentationContext)initWithRequestBuilder:(id)a3
{
  id v4;
  SBInCallTransientOverlayPresentationContext *v5;
  uint64_t v6;
  id requestBuilder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallTransientOverlayPresentationContext;
  v5 = -[SBInCallTransientOverlayPresentationContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestBuilder = v5->_requestBuilder;
    v5->_requestBuilder = (id)v6;

  }
  return v5;
}

- (id)requestBuilder
{
  return self->_requestBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestBuilder, 0);
}

@end
