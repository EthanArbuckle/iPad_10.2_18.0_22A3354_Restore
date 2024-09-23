@implementation TUIViewRegistry

- (TUIViewRegistry)init
{
  uint64_t v2;
  TUIViewRegistry *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)TUIViewRegistry;
  v3 = -[TUIViewRegistry init](&v29, "init");
  if (v3)
  {
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIBarChartView, v2), CFSTR("TUIReuseIdentifierBarChartView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIContainerView, v4), CFSTR("TUIReuseIdentifierContainerView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIControlView, v5), CFSTR("TUIReuseIdentifierControlView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIEmbeddedCollectionView, v6), CFSTR("TUIReuseIdentifierEmbeddedCollectionView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIImpressionOverlayView, v7), CFSTR("TUIReuseIdentifierImpressionOverlayView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUILayerContainerView, v8), CFSTR("TUIIdentifierLayerContainerView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUINowPlayingView, v9), CFSTR("TUIReuseIdentifierNowPlayingView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIProgressView, v10), CFSTR("TUIReuseIdentifierProgressView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIRatingsView, v11), CFSTR("TUIReuseIdentifierRatingsView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUISearchBarView, v12), CFSTR("TUIReuseIdentifierSearchBarView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUISegmentedControlView, v13), CFSTR("TUIReuseIdentifierSegmentedControlView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUISpinnerView, v14), CFSTR("TUIReuseIdentifierSpinnerView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIStyledView, v15), CFSTR("TUIReuseIdentifierStyledView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIStatsIndicatorView, v16), CFSTR("TUIReuseIdentifierStatsIndicatorView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUITextFieldView, v17), CFSTR("TUIReuseIdentifierTextFieldView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUITextView, v18), CFSTR("TUIReuseIdentifierTextView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIToggleView, v19), CFSTR("TUIReuseIdentifierToggleView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUITrackTimeRemainingView, v20), CFSTR("TUIReuseIdentifierTrackTimeRemainingView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIVideoView, v21), CFSTR("TUIReuseIdentifierVideoView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIHoverVisibleView, v22), CFSTR("TUIReuseIdentifierHoverVisibleView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIPageControlView, v23), CFSTR("TUIReuseIdentifierPageControlView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIFocusContainerView, v24), CFSTR("TUIReuseIdentifierFocusContainerView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIHostingView, v25), CFSTR("TUIReuseIdentifierHostingView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIHostingAnchorView, v26), CFSTR("TUIReuseIdentifierHostingAnchorView"));
    -[TUIViewRegistry registerClass:forSubviewWithReuseIdentifier:](v3, "registerClass:forSubviewWithReuseIdentifier:", objc_opt_class(TUIOverlayFadeView, v27), CFSTR("TUIReuseIdentifierOverlayFadeView"));
  }
  return v3;
}

- (void)registerClass:(Class)a3 forSubviewWithReuseIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *subviewClassDict;
  id v10;

  v6 = a4;
  v7 = v6;
  v10 = v6;
  if (!self->_subviewClassDict)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    subviewClassDict = self->_subviewClassDict;
    self->_subviewClassDict = v8;

    v7 = v10;
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subviewClassDict, "setObject:forKeyedSubscript:", a3, v10);
    v7 = v10;
  }
LABEL_4:

}

- (id)newSubviewWithReuseIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subviewClassDict, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      v5 = objc_msgSend(objc_alloc((Class)v5), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      objc_msgSend(v5, "setReuseIdentifier:", v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)registerHostedViewFactory:(id)a3 forType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *hostedViewFactoryTypes;
  NSMutableSet *v11;
  NSMutableDictionary *v12;
  NSMutableSet *v13;
  NSSet *v14;
  NSSet *hostedViewFactoryTypesWithGeometryReuseSupport;
  NSMutableDictionary *v16;
  NSMutableDictionary *hostedViewFactoryDict;
  id v18;
  _QWORD v19[4];
  NSMutableSet *v20;

  v18 = a3;
  v6 = a4;
  v7 = v6;
  if (!self->_hostedViewFactoryDict)
  {
    v16 = objc_opt_new(NSMutableDictionary);
    hostedViewFactoryDict = self->_hostedViewFactoryDict;
    self->_hostedViewFactoryDict = v16;

    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostedViewFactoryDict, "setObject:forKeyedSubscript:", v18, v7, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_hostedViewFactoryDict, "allKeys"));
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    hostedViewFactoryTypes = self->_hostedViewFactoryTypes;
    self->_hostedViewFactoryTypes = v9;

    v11 = objc_opt_new(NSMutableSet);
    v12 = self->_hostedViewFactoryDict;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4DBD0;
    v19[3] = &unk_23ECC8;
    v20 = v11;
    v13 = v11;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v19);
    v14 = (NSSet *)-[NSMutableSet copy](v13, "copy");
    hostedViewFactoryTypesWithGeometryReuseSupport = self->_hostedViewFactoryTypesWithGeometryReuseSupport;
    self->_hostedViewFactoryTypesWithGeometryReuseSupport = v14;

  }
LABEL_4:

}

- (BOOL)useHostedViewFactoryForType:(id)a3
{
  if (a3)
    return -[NSSet containsObject:](self->_hostedViewFactoryTypes, "containsObject:");
  else
    return 0;
}

- (id)hostedViewFactoryForType:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_hostedViewFactoryDict, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (id)hostedViewFactoryTypesWithGeometryReuse
{
  return self->_hostedViewFactoryTypesWithGeometryReuseSupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedViewFactoryTypesWithGeometryReuseSupport, 0);
  objc_storeStrong((id *)&self->_hostedViewFactoryTypes, 0);
  objc_storeStrong((id *)&self->_hostedViewFactoryDict, 0);
  objc_storeStrong((id *)&self->_subviewClassDict, 0);
}

@end
