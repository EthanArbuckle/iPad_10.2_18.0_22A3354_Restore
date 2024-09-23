@implementation BSUICoverAnimatingSource

+ (id)renderReferenceMatchingQuery:(id)a3 inFeedViewController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "renderReferencesMatchingQuery:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  return v6;
}

- (BSUICoverAnimatingSource)initWithFeedViewController:(id)a3 query:(id)a4 audioBookControlQuery:(id)a5
{
  id v9;
  id v10;
  id v11;
  BSUICoverAnimatingSource *v12;
  BSUICoverAnimatingSource *v13;
  uint64_t v14;
  TUIRenderReferenceOverride *overrideForHiding;
  uint64_t v16;
  TUIRenderReferenceOverride *overrideForHidingAudioControl;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BSUICoverAnimatingSource;
  v12 = -[BSUICoverAnimatingSource init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_feedViewController, a3);
    objc_storeStrong((id *)&v13->_query, a4);
    v14 = objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceOverride overrideWithQuery:alpha:](TUIRenderReferenceOverride, "overrideWithQuery:alpha:", v10, 0.0));
    overrideForHiding = v13->_overrideForHiding;
    v13->_overrideForHiding = (TUIRenderReferenceOverride *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceOverride overrideWithQuery:alpha:](TUIRenderReferenceOverride, "overrideWithQuery:alpha:", v11, 0.0));
    overrideForHidingAudioControl = v13->_overrideForHidingAudioControl;
    v13->_overrideForHidingAudioControl = (TUIRenderReferenceOverride *)v16;

  }
  return v13;
}

- (void)coverAnimationSourceInvalidateFrame
{
  -[BSUICoverAnimatingSource setTransformForSourceFrame:](self, "setTransformForSourceFrame:", 0);
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

- (id)renderReferenceTransform
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderReferencesMatchingQuery:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGRect)coverAnimationSourceFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  CGFloat x;
  double v15;
  CGFloat y;
  double v17;
  CGFloat width;
  double v19;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource transformForSourceFrame](self, "transformForSourceFrame"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource renderReferenceTransform](self, "renderReferenceTransform"));
    -[BSUICoverAnimatingSource setTransformForSourceFrame:](self, "setTransformForSourceFrame:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource transformForSourceFrame](self, "transformForSourceFrame"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "center");
    v8 = v7;
    v10 = v9;
    v11 = objc_msgSend(v6, "size");
    x = CGRectMakeWithCenterAndSize(v11, v8, v10, v12, v13);
    y = v15;
    width = v17;
    height = v19;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)coverAnimationSourceReferenceView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return v3;
}

- (id)coverAnimationSourceImage
{
  return 0;
}

- (id)coverAnimationSourceView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource renderReferenceTransform](self, "renderReferenceTransform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "renderModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descendentViewWithIdentifier:", v6));

  return v7;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 0;
}

- (void)coverAnimationSourcePrepare
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource overrideForHiding](self, "overrideForHiding"));
  objc_msgSend(v3, "addRenderOverride:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource overrideForHidingAudioControl](self, "overrideForHidingAudioControl"));
  objc_msgSend(v6, "addRenderOverride:", v5);

}

- (void)coverAnimationSourceFinalize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource overrideForHiding](self, "overrideForHiding"));
  objc_msgSend(v3, "removeRenderOverride:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource overrideForHidingAudioControl](self, "overrideForHidingAudioControl"));
  objc_msgSend(v5, "removeRenderOverride:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BSUICoverAnimatingSource feedViewController](self, "feedViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v7, "layoutIfNeeded");

}

- (TUIRenderReferenceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (TUIFeedViewController)feedViewController
{
  return self->_feedViewController;
}

- (void)setFeedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewController, a3);
}

- (TUIRenderReferenceTransform)transformForSourceFrame
{
  return self->_transformForSourceFrame;
}

- (void)setTransformForSourceFrame:(id)a3
{
  objc_storeStrong((id *)&self->_transformForSourceFrame, a3);
}

- (TUIRenderReferenceOverride)overrideForHiding
{
  return self->_overrideForHiding;
}

- (void)setOverrideForHiding:(id)a3
{
  objc_storeStrong((id *)&self->_overrideForHiding, a3);
}

- (TUIRenderReferenceOverride)overrideForHidingAudioControl
{
  return self->_overrideForHidingAudioControl;
}

- (void)setOverrideForHidingAudioControl:(id)a3
{
  objc_storeStrong((id *)&self->_overrideForHidingAudioControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideForHidingAudioControl, 0);
  objc_storeStrong((id *)&self->_overrideForHiding, 0);
  objc_storeStrong((id *)&self->_transformForSourceFrame, 0);
  objc_storeStrong((id *)&self->_feedViewController, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
