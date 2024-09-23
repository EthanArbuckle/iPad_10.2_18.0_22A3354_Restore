@implementation WGWidgetStatsController

- (WGWidgetStatsController)initWithDiscoveryController:(id)a3
{
  id v5;
  WGWidgetStatsController *v6;
  WGWidgetStatsController *v7;
  void *v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetStatsController.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("discoveryController"));

  }
  v11.receiver = self;
  v11.super_class = (Class)WGWidgetStatsController;
  v6 = -[WGWidgetStatsController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_discoveryController, v5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__favoriteWidgetIdentifiersDidUpdate_, CFSTR("WGWidgetFavoritesDidChange"), v5);

    -[WGWidgetStatsController _setupLaunchStats](v7, "_setupLaunchStats");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[WGWidgetStatsController _teardownLaunchStats](self, "_teardownLaunchStats");
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetStatsController;
  -[WGWidgetStatsController dealloc](&v3, sel_dealloc);
}

- (void)setBootstrapFavoriteWidgets:(BOOL)a3
{
  if (self->_bootstrapFavoriteWidgets != a3)
  {
    self->_bootstrapFavoriteWidgets = a3;
    -[WGWidgetStatsController _updateFavoriteWidgetIdentifiers](self, "_updateFavoriteWidgetIdentifiers");
  }
}

- (void)notePreWarmHasStarted:(id)a3 withTriggerType:(int)a4 withSequence:(unint64_t)a5
{
  -[NCLaunchStats preWarmHasStarted:withResult:withTriggerType:withSequence:](self->_launchStats, "preWarmHasStarted:withResult:withTriggerType:withSequence:", a3, 0, *(_QWORD *)&a4, a5);
}

- (void)notePreWarmHasEnded:(id)a3 withResult:(int64_t)a4 withTriggerType:(int)a5 withSequence:(unint64_t)a6
{
  -[NCLaunchStats preWarmHasEnded:withResult:withTriggerType:withSequence:](self->_launchStats, "preWarmHasEnded:withResult:withTriggerType:withSequence:", a3, a4, *(_QWORD *)&a5, a6);
}

- (void)requestRefreshForWidget:(id)a3 afterDate:(id)a4
{
  -[NCLaunchStats requestRefreshForWidget:afterDate:](self->_launchStats, "requestRefreshForWidget:afterDate:", a3, a4);
}

- (void)_teardownLaunchStats
{
  NCLaunchStats *launchStats;

  -[NCLaunchStats setNCLaunchRecommendationHandlerWithCompletion:](self->_launchStats, "setNCLaunchRecommendationHandlerWithCompletion:", 0);
  -[NCLaunchStats setBootstrapWidgetIDs:](self->_launchStats, "setBootstrapWidgetIDs:", 0);
  launchStats = self->_launchStats;
  self->_launchStats = 0;

}

- (void)_setupLaunchStats
{
  NCLaunchStats *v3;
  NCLaunchStats *launchStats;
  NCLaunchStats *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id from;
  id location;

  objc_initWeak(&location, self);
  if (!self->_launchStats)
  {
    v3 = (NCLaunchStats *)objc_alloc_init(MEMORY[0x24BE6B208]);
    launchStats = self->_launchStats;
    self->_launchStats = v3;

    objc_initWeak(&from, self->_launchStats);
    -[WGWidgetStatsController _updateFavoriteWidgetIdentifiers](self, "_updateFavoriteWidgetIdentifiers");
    v5 = self->_launchStats;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__WGWidgetStatsController__setupLaunchStats__block_invoke;
    v6[3] = &unk_24D732200;
    objc_copyWeak(&v7, &location);
    objc_copyWeak(&v8, &from);
    -[NCLaunchStats setNCLaunchRecommendationHandlerWithCompletion:](v5, "setNCLaunchRecommendationHandlerWithCompletion:", v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
  }
  objc_destroyWeak(&location);
}

void __44__WGWidgetStatsController__setupLaunchStats__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id v8;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "launchStats:incomingRecommendationForBundleIDs:completion:", v8, v7, v6);

}

- (void)launchStats:(id)a3 incomingRecommendationForBundleIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a4;
  v8 = a5;
  -[WGWidgetStatsController discoveryController](self, "discoveryController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke;
  block[3] = &unk_24D732250;
  v14 = v9;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke_2;
  v3[3] = &unk_24D732228;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "handleWidgetLaunchRecommendation:completion:", v2, v3);

}

uint64_t __85__WGWidgetStatsController_launchStats_incomingRecommendationForBundleIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)registerWidgetForPredictionEvents:(id)a3
{
  -[NCLaunchStats startEvent:](self->_launchStats, "startEvent:", a3);
}

- (void)unregisterWidgetForPredictionEvents:(id)a3
{
  -[NCLaunchStats endEvent:](self->_launchStats, "endEvent:", a3);
}

- (void)_updateFavoriteWidgetIdentifiers
{
  void *v3;
  NCLaunchStats *launchStats;
  void *v5;
  NCLaunchStats *v6;
  id v7;

  if (self->_bootstrapFavoriteWidgets)
  {
    -[WGWidgetStatsController discoveryController](self, "discoveryController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "favoriteWidgetIdentifiers");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    launchStats = self->_launchStats;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCLaunchStats setBootstrapWidgetIDs:](launchStats, "setBootstrapWidgetIDs:", v5);

  }
  else
  {
    v6 = self->_launchStats;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NCLaunchStats setBootstrapWidgetIDs:](v6, "setBootstrapWidgetIDs:");
  }

}

- (WGWidgetDiscoveryController)discoveryController
{
  return (WGWidgetDiscoveryController *)objc_loadWeakRetained((id *)&self->_discoveryController);
}

- (BOOL)bootstrapFavoriteWidgets
{
  return self->_bootstrapFavoriteWidgets;
}

- (NCLaunchStats)launchStats
{
  return self->_launchStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchStats, 0);
  objc_destroyWeak((id *)&self->_discoveryController);
}

@end
