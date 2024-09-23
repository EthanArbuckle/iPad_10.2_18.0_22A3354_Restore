@implementation SXVideoAdProvider

- (SXVideoAdProvider)initWithViewControllerProvider:(id)a3 videoPlayerVisibilityMonitor:(id)a4 videoVisibilityMonitor:(id)a5 component:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXVideoAdProvider *v15;
  SXVideoAdProvider *v16;
  SXVideoAdStateManager *v17;
  SXVideoAdStateManager *stateManager;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SXVideoAdProvider;
  v15 = -[SXVideoAdProvider init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fullscreenViewControllerProvider, a3);
    v17 = objc_alloc_init(SXVideoAdStateManager);
    stateManager = v16->_stateManager;
    v16->_stateManager = v17;

    objc_storeStrong((id *)&v16->_videoPlayerVisibilityMonitor, a4);
    objc_storeStrong((id *)&v16->_videoVisibilityMonitor, a5);
    objc_storeStrong((id *)&v16->_component, a6);
  }

  return v16;
}

- (id)loadWithCompletionBlock:(id)a3
{
  id v3;

  v3 = (id)(*((uint64_t (**)(id, _QWORD))a3 + 2))(a3, 0);
  return 0;
}

- (void)playbackStarted
{
  id v2;

  -[SXVideoAdProvider stateManager](self, "stateManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)playbackPaused
{
  id v2;

  -[SXVideoAdProvider stateManager](self, "stateManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)playbackResumed
{
  id v2;

  -[SXVideoAdProvider stateManager](self, "stateManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)playbackFinished
{
  id v2;

  -[SXVideoAdProvider stateManager](self, "stateManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finish");

}

- (void)playbackFailedWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXVideoAdProvider stateManager](self, "stateManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "failWithError:", v4);

}

- (void)skipped
{
  id v2;

  -[SXVideoAdProvider stateManager](self, "stateManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "skip");

}

- (unint64_t)skipThreshold
{
  return 0;
}

- (double)threshold
{
  return (double)-[SXVideoAdProvider skipThreshold](self, "skipThreshold");
}

- (BOOL)hasAction
{
  return 0;
}

- (void)presentAction
{
  void *v3;
  id v4;

  -[SXVideoAdProvider stateManager](self, "stateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  -[SXVideoAdProvider stateManager](self, "stateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "learnMore");

}

- (UIView)metricsView
{
  return 0;
}

- (UIButton)privacyMarker
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE90740]);
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_presentPrivacyStatement, 64);
  return (UIButton *)v3;
}

- (double)prerollReadyToPlayTimeout
{
  return 0.0;
}

- (double)impressionThreshold
{
  return 2.0;
}

- (void)adVisibilityStateChanged
{
  void *v3;
  id v4;

  -[SXVideoAdProvider videoPlayerVisibilityMonitor](self, "videoPlayerVisibilityMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "appeared"))
  {
    -[SXVideoAdProvider videoVisibilityMonitor](self, "videoVisibilityMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appeared");

  }
}

- (SXAnalyticsReporting)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsReporter, a3);
}

- (SVVideoMetadata)metadata
{
  return (SVVideoMetadata *)objc_loadWeakRetained((id *)&self->_metadata);
}

- (void)setMetadata:(id)a3
{
  objc_storeWeak((id *)&self->_metadata, a3);
}

- (SVVideoAdViewControllerProviding)fullscreenViewControllerProvider
{
  return self->_fullscreenViewControllerProvider;
}

- (SXVideoAdStateManager)stateManager
{
  return self->_stateManager;
}

- (SXVisibilityMonitoring)videoVisibilityMonitor
{
  return self->_videoVisibilityMonitor;
}

- (SXVisibilityMonitoring)videoPlayerVisibilityMonitor
{
  return self->_videoPlayerVisibilityMonitor;
}

- (SXVideoComponent)component
{
  return self->_component;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_videoPlayerVisibilityMonitor, 0);
  objc_storeStrong((id *)&self->_videoVisibilityMonitor, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_fullscreenViewControllerProvider, 0);
  objc_destroyWeak((id *)&self->_metadata);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
}

@end
