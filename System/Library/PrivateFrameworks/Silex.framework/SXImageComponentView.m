@implementation SXImageComponentView

- (SXImageComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 mediaSharingPolicyProvider:(id)a10
{
  id v17;
  SXImageComponentView *v18;
  SXImageComponentView *v19;
  id v21;
  objc_super v22;

  v21 = a9;
  v17 = a10;
  v22.receiver = self;
  v22.super_class = (Class)SXImageComponentView;
  v18 = -[SXMediaComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:](&v22, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_, a3, a4, a5, a6, a7, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageViewFactory, a9);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a10);
  }

  return v19;
}

- (void)loadComponent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXImageView *v9;
  SXImageView *imageView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SXDragManager *v16;
  void *v17;
  SXDragManager *v18;
  SXDragManager *dragManager;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SXImageComponentView;
  -[SXComponentView loadComponent:](&v20, sel_loadComponent_, a3);
  if (!self->_imageView)
  {
    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageResourceForIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXImageComponentView imageViewFactory](self, "imageViewFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageViewForResource:", v7);
    v9 = (SXImageView *)objc_claimAutoreleasedReturnValue();
    imageView = self->_imageView;
    self->_imageView = v9;

    -[SXImageView setDelegate:](self->_imageView, "setDelegate:", self);
    -[SXComponentView contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageComponentView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[SXComponentView component](self, "component");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setIsAccessibilityElement:](self->_imageView, "setIsAccessibilityElement:", objc_msgSend(v13, "shouldBeExposedToAssistiveTechnology"));

    -[SXComponentView component](self, "component");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "captionWithLocalizedRoleForSpeaking");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setAccessibilityLabel:](self->_imageView, "setAccessibilityLabel:", v15);

    v16 = [SXDragManager alloc];
    -[SXImageComponentView mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SXDragManager initWithSharingPolicy:dataSource:](v16, "initWithSharingPolicy:dataSource:", objc_msgSend(v17, "mediaSharingPolicy"), self);
    dragManager = self->_dragManager;
    self->_dragManager = v18;

    -[SXDragManager updateAccessibilityDragSourceDescriptorsForDraggableElement:](self->_dragManager, "updateAccessibilityDragSourceDescriptorsForDraggableElement:", self->_imageView);
  }
}

- (void)layoutImageView
{
  id v3;

  -[SXImageComponentView imageView](self, "imageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SXImageComponentView imageFrame](self, "imageFrame");
  objc_msgSend(v3, "setFrame:");

}

- (CGRect)imageFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  double Width;
  double v9;
  CGFloat height;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double MaxX;
  double v29;
  double MinX;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGSize v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v44;

  -[SXComponentView contentFrame](self, "contentFrame");
  x = v3;
  y = v5;
  Width = v7;
  height = v9;
  -[SXComponentView componentLayout](self, "componentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maximumContentWidth");
  v13 = v12;

  if (v13)
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = Width;
    v36.size.height = height;
    Width = CGRectGetWidth(v36);
    -[SXComponentView unitConverter](self, "unitConverter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView componentLayout](self, "componentLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "maximumContentWidth");
    objc_msgSend(v14, "convertValueToPoints:", v16, v17);
    v19 = v18;

    if (Width >= v19)
      Width = v19;
  }
  -[SXImageComponentView imageResource](self, "imageResource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dimensions");
  if (v21 > 0.0)
  {
    -[SXImageComponentView imageResource](self, "imageResource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dimensions");
    v24 = v23;

    if (v24 <= 0.0)
      goto LABEL_8;
    -[SXImageComponentView imageResource](self, "imageResource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dimensions");
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = Width;
    v44.size.height = height;
    v37 = AVMakeRectWithAspectRatioInsideRect(v35, v44);
    x = v37.origin.x;
    y = v37.origin.y;
    Width = v37.size.width;
    height = v37.size.height;
  }

LABEL_8:
  -[SXComponentView componentLayout](self, "componentLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "horizontalContentAlignment"))
  {

LABEL_13:
    -[SXComponentView contentFrame](self, "contentFrame");
    MinX = CGRectGetMinX(v40);
    -[SXComponentView contentFrame](self, "contentFrame");
    v31 = CGRectGetWidth(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = Width;
    v42.size.height = height;
    v29 = MinX + (v31 - CGRectGetWidth(v42)) * 0.5;
    goto LABEL_15;
  }
  -[SXComponentView componentLayout](self, "componentLayout");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "horizontalContentAlignment");

  if (v27 == 1)
  {
    v29 = 0.0;
    goto LABEL_15;
  }
  if (v27 != 3)
    goto LABEL_13;
  -[SXComponentView contentFrame](self, "contentFrame");
  MaxX = CGRectGetMaxX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = Width;
  v39.size.height = height;
  v29 = MaxX - CGRectGetWidth(v39);
LABEL_15:
  v32 = y;
  v33 = Width;
  v34 = height;
  return CGRectIntegral(*(CGRect *)&v29);
}

- (void)presentComponentWithChanges:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXImageComponentView;
  -[SXComponentView presentComponentWithChanges:](&v8, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXImageComponentView layoutImageView](self, "layoutImageView");
  -[SXImageComponentView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageComponentView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setPreferredImageSize:", v6, v7);

}

- (void)renderContents
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXImageComponentView;
  -[SXComponentView renderContents](&v4, sel_renderContents);
  -[SXImageComponentView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addInterestInImageQuality:forObject:", 0, self);

}

- (void)discardContents
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXImageComponentView;
  -[SXComponentView discardContents](&v7, sel_discardContents);
  -[SXImageComponentView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectHasQualityInterest:quality:", self, 0);

  if (v4)
  {
    -[SXImageComponentView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "giveUpInterestForObject:", self);

  }
  -[SXImageComponentView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SXImageComponentView;
  -[SXMediaComponentView visibilityStateDidChangeFromState:](&v15, sel_visibilityStateDidChangeFromState_);
  if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
  {
    -[SXImageComponentView animatedImageController](self, "animatedImageController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SXImageComponentView animatedImageController](self, "animatedImageController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXAnimatedImageController registerForViewportChanges]((uint64_t)v6);

    }
    -[SXComponentView component](self, "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userControllable");

    if ((v8 & 1) == 0)
    {
      -[SXImageComponentView imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resume");
LABEL_12:

    }
  }
  else
  {
    v10 = -[SXComponentView visibilityState](self, "visibilityState");
    if (a3 == 1 && v10 == 2)
    {
      -[SXImageComponentView animatedImageController](self, "animatedImageController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SXImageComponentView animatedImageController](self, "animatedImageController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXAnimatedImageController unregisterForViewportChanges]((uint64_t)v12);

      }
      -[SXComponentView component](self, "component");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userControllable");

      if ((v14 & 1) == 0)
      {
        -[SXImageComponentView imageView](self, "imageView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pause");
        goto LABEL_12;
      }
    }
  }
}

- (CGRect)transitionContentFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXImageComponentView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  SXAnimatedImageController *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userControllable");

  if (v6)
  {
    -[SXImageComponentView animatedImageController](self, "animatedImageController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = [SXAnimatedImageController alloc];
      -[SXComponentView viewport](self, "viewport");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXImageComponentView imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SXAnimatedImageController initWithImageComponentView:viewport:imageView:]((id *)&v8->super.isa, self, v9, v10);

      -[SXImageComponentView setAnimatedImageController:](self, "setAnimatedImageController:", v11);
      objc_msgSend(v14, "setAutoPlayEnabled:", 0);
      if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
      {
        -[SXImageComponentView animatedImageController](self, "animatedImageController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXAnimatedImageController registerForViewportChanges]((uint64_t)v12);

      }
    }
  }
  else if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
  {
    objc_msgSend(v14, "setAutoPlayEnabled:", 1);
    objc_msgSend(v14, "resume");
  }
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1);
  -[SXImageComponentView imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrubbingEnabled:", 1);

}

- (void)imageView:(id)a3 didLoadImage:(id)a4
{
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4);
}

- (id)contentViewForBehavior:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXImageComponentView;
  -[SXComponentView contentViewForBehavior:](&v11, sel_contentViewForBehavior_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXComponentView componentLayout](self, "componentLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maximumContentWidth");
    v9 = v8;

    if (v9)
    {
      v6 = 0;
      goto LABEL_6;
    }
LABEL_2:
    -[SXImageComponentView imageView](self, "imageView");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    v5 = (void *)v6;
  }

  return v5;
}

- (id)imageResource
{
  void *v2;
  void *v3;

  -[SXImageComponentView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGSize v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageComponentView imageResource](self, "imageResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dimensions");
  NSStringFromCGSize(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@>: %@"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)analyticsMediaType
{
  return 4;
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[SXImageComponentView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectHasQualityInterest:quality:", self, 0);

  if (v4)
  {
    -[SXImageComponentView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "giveUpInterestForObject:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)SXImageComponentView;
  -[SXComponentView dealloc](&v6, sel_dealloc);
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (SXAnimatedImageController)animatedImageController
{
  return self->_animatedImageController;
}

- (void)setAnimatedImageController:(id)a3
{
  objc_storeStrong((id *)&self->_animatedImageController, a3);
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_animatedImageController, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end
