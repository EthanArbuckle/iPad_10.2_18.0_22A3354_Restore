@implementation BSUISheetTransitioningArtworkSource

+ (BOOL)isValidSourceWithFeedViewController:(id)a3 query:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "renderReferencesMatchingQuery:", a4));
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BSUISheetTransitioningArtworkSource)initWithFeedViewController:(id)a3 query:(id)a4 isCover:(BOOL)a5
{
  id v9;
  id v10;
  BSUISheetTransitioningArtworkSource *v11;
  BSUISheetTransitioningArtworkSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGSize size;
  uint64_t v29;
  UIView *referenceView;
  void *v31;
  void *v32;
  TUIImageResource *v33;
  uint64_t v34;
  TUIImageResource *imageResource;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  UIImage *image;
  uint64_t v41;
  TUIRenderReferenceOverride *overrideForHiding;
  objc_super v44;

  v9 = a3;
  v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)BSUISheetTransitioningArtworkSource;
  v11 = -[BSUISheetTransitioningArtworkSource init](&v44, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_feedViewController, a3);
    objc_storeStrong((id *)&v12->_query, a4);
    v12->_isCover = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderReferencesMatchingQuery:", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    if (v15
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v15)),
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject")),
          v16,
          v17))
    {
      objc_msgSend(v17, "center");
      v19 = v18;
      v21 = v20;
      v22 = objc_msgSend(v17, "size");
      v12->_frame.origin.x = CGRectMakeWithCenterAndSize(v22, v19, v21, v23, v24);
      v12->_frame.origin.y = v25;
      v12->_frame.size.width = v26;
      v12->_frame.size.height = v27;

    }
    else
    {
      size = CGRectZero.size;
      v12->_frame.origin = CGRectZero.origin;
      v12->_frame.size = size;
    }
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    referenceView = v12->_referenceView;
    v12->_referenceView = (UIView *)v29;

    objc_storeStrong((id *)&v12->_identifier, v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageResourcesMatchingQuery:", v10));
    v32 = v31;
    if (v15)
    {
      v33 = (TUIImageResource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v15));
      v34 = objc_claimAutoreleasedReturnValue(-[TUIImageResource anyObject](v33, "anyObject"));
      imageResource = v12->_imageResource;
      v12->_imageResource = (TUIImageResource *)v34;

    }
    else
    {
      v33 = v12->_imageResource;
      v12->_imageResource = 0;
    }

    -[TUIImageResource addObserver:](v12->_imageResource, "addObserver:", v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResource imageContentWithOptions:](v12->_imageResource, "imageContentWithOptions:", 1));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "image"));
    v38 = objc_msgSend(v37, "newImage");
    objc_msgSend(v36, "insets");
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageWithAlignmentRectInsets:"));
    image = v12->_image;
    v12->_image = (UIImage *)v39;

    if (objc_msgSend(v13, "count"))
    {
      v41 = objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceOverride overrideWithQuery:alpha:](TUIRenderReferenceOverride, "overrideWithQuery:alpha:", v10, 0.0));
      overrideForHiding = v12->_overrideForHiding;
      v12->_overrideForHiding = (TUIRenderReferenceOverride *)v41;

    }
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIImageResource removeObserver:](self->_imageResource, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)BSUISheetTransitioningArtworkSource;
  -[BSUISheetTransitioningArtworkSource dealloc](&v3, "dealloc");
}

- (id)hide
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISheetTransitioningArtworkSource overrideForHiding](self, "overrideForHiding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISheetTransitioningArtworkSource feedViewController](self, "feedViewController"));
  objc_msgSend(v4, "addRenderOverride:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISheetTransitioningArtworkSource feedViewController](self, "feedViewController"));
  objc_initWeak(&location, v5);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_F9B8;
  v9[3] = &unk_2E4170;
  objc_copyWeak(&v11, &location);
  v10 = v3;
  v6 = v3;
  v7 = objc_retainBlock(v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

- (void)replaceReferenceView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a3;
  -[BSUISheetTransitioningArtworkSource frame](self, "frame");
  if (!CGRectIsEmpty(v14))
  {
    -[BSUISheetTransitioningArtworkSource frame](self, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISheetTransitioningArtworkSource referenceView](self, "referenceView"));
    objc_msgSend(v13, "convertRect:fromView:", v12, v5, v7, v9, v11);
    -[BSUISheetTransitioningArtworkSource setFrame:](self, "setFrame:");

    -[BSUISheetTransitioningArtworkSource setReferenceView:](self, "setReferenceView:", v13);
  }

}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_FB20;
  v4[3] = &unk_2E40C8;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (id)imageChangeObserverBlock
{
  return self->_imageChangeObserverBlock;
}

- (void)setImageChangeObserverBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUIFeedViewController)feedViewController
{
  return self->_feedViewController;
}

- (void)setFeedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewController, a3);
}

- (TUIRenderReferenceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (TUIRenderReferenceIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
}

- (BOOL)isCover
{
  return self->_isCover;
}

- (void)setIsCover:(BOOL)a3
{
  self->_isCover = a3;
}

- (TUIImageResource)imageResource
{
  return self->_imageResource;
}

- (void)setImageResource:(id)a3
{
  objc_storeStrong((id *)&self->_imageResource, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (TUIRenderReferenceOverride)overrideForHiding
{
  return self->_overrideForHiding;
}

- (void)setOverrideForHiding:(id)a3
{
  objc_storeStrong((id *)&self->_overrideForHiding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideForHiding, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_feedViewController, 0);
  objc_storeStrong(&self->_imageChangeObserverBlock, 0);
}

@end
