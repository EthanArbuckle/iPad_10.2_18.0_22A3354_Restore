@implementation SXLegacyPrerollAdFactory

- (SXLegacyPrerollAdFactory)initWithViewport:(id)a3 scrollObserverManager:(id)a4
{
  id v7;
  id v8;
  SXLegacyPrerollAdFactory *v9;
  SXLegacyPrerollAdFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLegacyPrerollAdFactory;
  v9 = -[SXLegacyPrerollAdFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_scrollObserverManager, a4);
  }

  return v10;
}

- (id)createVideoAdProviderForComponentView:(id)a3 videoPlayerViewController:(id)a4 analyticsReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  SXComponentVisiblePercentageProvider *v11;
  void *v12;
  SXComponentVisiblePercentageProvider *v13;
  SXVideoComponentVisibilityMonitor *v14;
  void *v15;
  void *v16;
  SXVideoPlayerAdSlotVisiblePercentageProvider *v17;
  SXVideoPlayerAdSlotVisibilityMonitor *v18;
  SXVideoAdProvider *v19;
  void *v20;
  SXVideoAdProvider *v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [SXComponentVisiblePercentageProvider alloc];
  -[SXLegacyPrerollAdFactory viewport](self, "viewport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SXComponentVisiblePercentageProvider initWithViewport:](v11, "initWithViewport:", v12);

  v14 = -[SXVisibilityMonitor initWithObject:visiblePercentageProvider:]([SXVideoComponentVisibilityMonitor alloc], "initWithObject:visiblePercentageProvider:", v10, v13);
  -[SXVisibilityMonitor updateVisibility](v14, "updateVisibility");
  -[SXLegacyPrerollAdFactory scrollObserverManager](self, "scrollObserverManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addScrollObserver:", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90760]), "initWithViewControllerProvider:", v9);
  v17 = objc_alloc_init(SXVideoPlayerAdSlotVisiblePercentageProvider);
  v18 = -[SXVideoPlayerAdSlotVisibilityMonitor initWithVideoPlayerViewController:videoAdSlotVisiblePercentageProvider:]([SXVideoPlayerAdSlotVisibilityMonitor alloc], "initWithVideoPlayerViewController:videoAdSlotVisiblePercentageProvider:", v9, v17);

  v19 = [SXVideoAdProvider alloc];
  objc_msgSend(v10, "component");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[SXVideoAdProvider initWithViewControllerProvider:videoPlayerVisibilityMonitor:videoVisibilityMonitor:component:](v19, "initWithViewControllerProvider:videoPlayerVisibilityMonitor:videoVisibilityMonitor:component:", v16, v14, v18, v20);
  -[SXVideoAdProvider setAnalyticsReporter:](v21, "setAnalyticsReporter:", v8);

  return v21;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXScrollObserverManager)scrollObserverManager
{
  return self->_scrollObserverManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollObserverManager, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end
