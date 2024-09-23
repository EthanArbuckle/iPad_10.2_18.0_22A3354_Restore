@implementation SXMediaComponentView

- (SXMediaComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SXMediaComponentView *v20;
  SXMediaComponentView *v21;
  char v22;
  uint64_t v23;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v37.receiver = self;
  v37.super_class = (Class)SXMediaComponentView;
  v20 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v37, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, v14, v15, v16, v17);
  v21 = v20;
  if (v20)
  {
    v25 = v18;
    objc_storeStrong((id *)&v20->_analyticsReporting, a7);
    objc_initWeak(&location, v21);
    v22 = objc_opt_respondsToSelector();
    v23 = MEMORY[0x24BDAC760];
    if ((v22 & 1) != 0)
    {
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke;
      v34[3] = &unk_24D6873B8;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v19, "performOnApplicationWindowDidBecomeBackground:", v34);
      objc_destroyWeak(&v35);
    }
    v32[0] = v23;
    v32[1] = 3221225472;
    v32[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_2;
    v32[3] = &unk_24D6873B8;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v19, "performOnApplicationDidEnterBackground:", v32);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v30[0] = v23;
      v30[1] = 3221225472;
      v30[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_3;
      v30[3] = &unk_24D6873B8;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v19, "performOnApplicationWindowDidBecomeForeground:", v30);
      objc_destroyWeak(&v31);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v28[0] = v23;
      v28[1] = 3221225472;
      v28[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_4;
      v28[3] = &unk_24D6873B8;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v19, "performOnApplicationWillEnterForeground:", v28);
      objc_destroyWeak(&v29);
    }
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_5;
    v26[3] = &unk_24D6873B8;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v19, "performOnApplicationDidBecomeActive:", v26);
    v21->_minimumVisibleY = 1.79769313e308;
    v21->_maximumVisibleY = 2.22507386e-308;
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    v18 = v25;
  }

  return v21;
}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "submitEvents");

}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "submitEvents");

}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createMediaExposureEventIfNeeded");

}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createMediaExposureEventIfNeeded");

}

void __145__SXMediaComponentView_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createMediaExposureEventIfNeeded");

}

- (void)createMediaExposureEventIfNeeded
{
  void *v3;
  BOOL v4;
  id v5;

  -[SXMediaComponentView mediaExposureEvent](self, "mediaExposureEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[SXComponentView visibilityState](self, "visibilityState") == 1;
    v3 = 0;
    if (v4)
    {
      if (!-[SXMediaComponentView isDisplayingMedia](self, "isDisplayingMedia"))
        return;
      -[SXMediaComponentView mediaEventForClass:](self, "mediaEventForClass:", objc_opt_class());
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[SXMediaComponentView setMediaExposureEvent:](self, "setMediaExposureEvent:", v5);
      v3 = v5;
    }
  }

}

- (void)finishMediaExposureEventIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double MinX;
  double v10;
  double v11;
  double Width;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGRect v22;
  CGRect v23;

  -[SXMediaComponentView mediaExposureEvent](self, "mediaExposureEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXMediaComponentView mediaExposureEvent](self, "mediaExposureEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;

    if (v7 >= 0.0)
      v8 = v7;
    else
      v8 = -v7;
    -[SXComponentView contentFrame](self, "contentFrame");
    MinX = CGRectGetMinX(v22);
    -[SXMediaComponentView minimumVisibleY](self, "minimumVisibleY");
    v11 = v10;
    -[SXComponentView contentFrame](self, "contentFrame");
    Width = CGRectGetWidth(v23);
    -[SXMediaComponentView maximumVisibleY](self, "maximumVisibleY");
    v14 = v13;
    -[SXMediaComponentView minimumVisibleY](self, "minimumVisibleY");
    v16 = -[SXMediaComponentView shouldSubmitMediaExposureEventForExposedBounds:](self, "shouldSubmitMediaExposureEventForExposedBounds:", MinX, v11, Width, v14 - v15);
    if (v8 >= 1.0 && v16)
    {
      -[SXMediaComponentView mediaExposureEvent](self, "mediaExposureEvent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXMediaComponentView willSubmitMediaExposureEvent:](self, "willSubmitMediaExposureEvent:", v18);

      -[SXMediaComponentView mediaExposureEvent](self, "mediaExposureEvent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "determineEndDate");

      -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXMediaComponentView mediaExposureEvent](self, "mediaExposureEvent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reportEvent:", v21);

      -[SXMediaComponentView setMediaExposureEvent:](self, "setMediaExposureEvent:", 0);
    }
  }
}

- (unint64_t)analyticsGalleryType
{
  return 0;
}

- (unint64_t)analyticsMediaType
{
  return 0;
}

- (unint64_t)analyticsVideoType
{
  return 0;
}

- (id)mediaEventForClass:(Class)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(a3);
  objc_msgSend(v4, "setMediaType:", -[SXMediaComponentView analyticsMediaType](self, "analyticsMediaType"));
  objc_msgSend(v4, "setGalleryType:", -[SXMediaComponentView analyticsGalleryType](self, "analyticsGalleryType"));
  objc_msgSend(v4, "setVideoType:", -[SXMediaComponentView analyticsVideoType](self, "analyticsVideoType"));
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaId:", v6);

  -[SXComponentView component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetaData:", v9);

  return v4;
}

- (BOOL)shouldSubmitMediaExposureEventForExposedBounds:(CGRect)a3
{
  double Height;
  CGRect v6;

  Height = CGRectGetHeight(a3);
  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  return Height >= CGRectGetHeight(v6) * 0.5;
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXMediaComponentView;
  -[SXComponentView visibilityStateDidChangeFromState:](&v8, sel_visibilityStateDidChangeFromState_);
  if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
  {
    -[SXMediaComponentView createMediaExposureEventIfNeeded](self, "createMediaExposureEventIfNeeded");
    -[SXComponentView viewport](self, "viewport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addViewportChangeListener:forOptions:", self, 2);

    -[SXMediaComponentView calculateVisibleBounds](self, "calculateVisibleBounds");
  }
  else
  {
    v6 = -[SXComponentView visibilityState](self, "visibilityState");
    if (a3 == 1 && v6 == 2)
    {
      -[SXMediaComponentView submitEvents](self, "submitEvents");
      -[SXComponentView viewport](self, "viewport");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeViewportChangeListener:forOptions:", self, 2);

    }
  }
}

- (void)setVisibleBounds:(CGRect)a3
{
  self->_visibleBounds = a3;
  -[SXMediaComponentView visibleBoundsChanged](self, "visibleBoundsChanged");
}

- (void)calculateVisibleBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double MinY;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[SXComponentView absoluteFrame](self, "absoluteFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXComponentView viewport](self, "viewport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dynamicBounds");
  v33.origin.x = v12;
  v33.origin.y = v13;
  v33.size.width = v14;
  v33.size.height = v15;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v27 = CGRectIntersection(v26, v33);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;

  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (CGRectIsNull(v28))
  {
    v20 = *MEMORY[0x24BDBF090];
    v21 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v23 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    -[SXComponentView viewport](self, "viewport");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dynamicBounds");
    MinY = CGRectGetMinY(v29);
    -[SXComponentView absoluteFrame](self, "absoluteFrame");
    v21 = MinY - CGRectGetMinY(v30);

    v20 = 0.0;
    if (v21 < 0.0)
      v21 = 0.0;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v23 = CGRectGetWidth(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v22 = CGRectGetHeight(v32);
  }
  -[SXMediaComponentView setVisibleBounds:](self, "setVisibleBounds:", v20, v21, v23, v22);
}

- (void)visibleBoundsChanged
{
  double MaxY;
  double v4;
  double v5;
  double MinY;
  double v7;
  double v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  -[SXMediaComponentView visibleBounds](self, "visibleBounds");
  if (CGRectEqualToRect(v9, *MEMORY[0x24BDBF090]))
  {
    -[SXMediaComponentView setMinimumVisibleY:](self, "setMinimumVisibleY:", 1.79769313e308);
    MaxY = 2.22507386e-308;
  }
  else
  {
    -[SXMediaComponentView minimumVisibleY](self, "minimumVisibleY");
    v5 = v4;
    -[SXMediaComponentView visibleBounds](self, "visibleBounds");
    MinY = CGRectGetMinY(v10);
    if (v5 < MinY)
      MinY = v5;
    -[SXMediaComponentView setMinimumVisibleY:](self, "setMinimumVisibleY:", MinY);
    -[SXMediaComponentView maximumVisibleY](self, "maximumVisibleY");
    v8 = v7;
    -[SXMediaComponentView visibleBounds](self, "visibleBounds");
    MaxY = CGRectGetMaxY(v11);
    if (v8 >= MaxY)
      MaxY = v8;
  }
  -[SXMediaComponentView setMaximumVisibleY:](self, "setMaximumVisibleY:", MaxY);
}

- (void)setIsDisplayingMedia:(BOOL)a3
{
  if (self->_isDisplayingMedia != a3)
  {
    self->_isDisplayingMedia = a3;
    -[SXMediaComponentView createMediaExposureEventIfNeeded](self, "createMediaExposureEventIfNeeded");
  }
}

- (SXAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (BOOL)isDisplayingMedia
{
  return self->_isDisplayingMedia;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SXMediaExposureEvent)mediaExposureEvent
{
  return self->_mediaExposureEvent;
}

- (void)setMediaExposureEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mediaExposureEvent, a3);
}

- (double)minimumVisibleY
{
  return self->_minimumVisibleY;
}

- (void)setMinimumVisibleY:(double)a3
{
  self->_minimumVisibleY = a3;
}

- (double)maximumVisibleY
{
  return self->_maximumVisibleY;
}

- (void)setMaximumVisibleY:(double)a3
{
  self->_maximumVisibleY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaExposureEvent, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
}

@end
