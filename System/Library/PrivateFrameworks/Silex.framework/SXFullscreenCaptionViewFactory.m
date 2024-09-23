@implementation SXFullscreenCaptionViewFactory

- (SXFullscreenCaptionViewFactory)initWithTextSourceFactory:(id)a3 actionHandler:(id)a4
{
  id v7;
  id v8;
  SXFullscreenCaptionViewFactory *v9;
  SXFullscreenCaptionViewFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXFullscreenCaptionViewFactory;
  v9 = -[SXFullscreenCaptionViewFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textSourceFactory, a3);
    objc_storeStrong((id *)&v10->_actionHandler, a4);
  }

  return v10;
}

- (id)createCaptionView
{
  SXFullscreenCaptionView *v3;
  void *v4;
  void *v5;
  SXFullscreenCaptionView *v6;

  v3 = [SXFullscreenCaptionView alloc];
  -[SXFullscreenCaptionViewFactory textSourceFactory](self, "textSourceFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionViewFactory actionHandler](self, "actionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXFullscreenCaptionView initWithTextSourceFactory:actionHandler:](v3, "initWithTextSourceFactory:actionHandler:", v4, v5);

  return v6;
}

- (SXTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
}

@end
