@implementation SXFullscreenCanvasControllerFactory

- (SXFullscreenCanvasControllerFactory)initWithCaptionViewFactory:(id)a3 presentationAttributesProvider:(id)a4 mediaSharingPolicyProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXFullscreenCanvasControllerFactory *v12;
  SXFullscreenCanvasControllerFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXFullscreenCanvasControllerFactory;
  v12 = -[SXFullscreenCanvasControllerFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_captionViewFactory, a3);
    objc_storeStrong((id *)&v13->_presentationAttributesProvider, a4);
    objc_storeStrong((id *)&v13->_mediaSharingPolicyProvider, a5);
  }

  return v13;
}

- (id)fullscreenCanvasControllerForShowable:(id)a3
{
  id v4;
  SXFullscreenCanvasController *v5;
  void *v6;
  void *v7;
  SXFullscreenCanvasController *v8;

  v4 = a3;
  v5 = [SXFullscreenCanvasController alloc];
  -[SXFullscreenCanvasControllerFactory captionViewFactory](self, "captionViewFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasControllerFactory mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SXFullscreenCanvasController initWithShowable:captionViewFactory:sharingPolicy:](v5, "initWithShowable:captionViewFactory:sharingPolicy:", v4, v6, objc_msgSend(v7, "mediaSharingPolicy"));

  return v8;
}

- (SXFullscreenCaptionViewFactory)captionViewFactory
{
  return self->_captionViewFactory;
}

- (SXPresentationAttributesProvider)presentationAttributesProvider
{
  return self->_presentationAttributesProvider;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_presentationAttributesProvider, 0);
  objc_storeStrong((id *)&self->_captionViewFactory, 0);
}

@end
