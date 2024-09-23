@implementation WBSUnifiedBarAnalyticsRecorder

- (void)schedulePeriodicReport
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, self, sel__reportAnalytics, 0, 1, 600.0);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTimer:forMode:", v6, *MEMORY[0x1E0C99748]);

}

- (void)_reportAnalytics
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "unifiedBarAnalyticsProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "shouldReportUnifiedTabBarAnalytics"))
  {
    +[WBSAnalyticsLogger sharedLogger](WBSAnalyticsLogger, "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportUnifiedTabBarStatusWithLayout:numberOfTabsInCurrentTabBar:tabBarIsCurrentlyScrollable:tabsShowOnlyIcons:backgroundColorInTabBarEnabled:", objc_msgSend(v4, "unifiedTabBarLayoutStyle"), objc_msgSend(v4, "numberOfTabsInCurrentTabBar"), objc_msgSend(v4, "tabBarIsCurrentlyScrollable"), objc_msgSend(v4, "tabsShowOnlyIcons"), objc_msgSend(v4, "backgroundColorInTabBarEnabled"));

  }
}

- (WBSUnifiedBarAnalyticsRecorderDelegate)delegate
{
  return (WBSUnifiedBarAnalyticsRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
