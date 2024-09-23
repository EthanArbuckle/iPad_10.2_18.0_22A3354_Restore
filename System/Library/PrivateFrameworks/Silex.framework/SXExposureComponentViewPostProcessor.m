@implementation SXExposureComponentViewPostProcessor

- (SXExposureComponentViewPostProcessor)initWithExposureMonitor:(id)a3 analyticsReportingProvider:(id)a4
{
  id v7;
  id v8;
  SXExposureComponentViewPostProcessor *v9;
  SXExposureComponentViewPostProcessor *v10;
  uint64_t v11;
  NSMapTable *exposedEvents;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXExposureComponentViewPostProcessor;
  v9 = -[SXExposureComponentViewPostProcessor init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_monitor, a3);
    objc_storeStrong((id *)&v10->_analyticsReporterProvider, a4);
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    exposedEvents = v10->_exposedEvents;
    v10->_exposedEvents = (NSMapTable *)v11;

  }
  return v10;
}

- (void)processComponent:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "analytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[SXExposureComponentViewPostProcessor exposedEvents](self, "exposedEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v7);

    -[SXExposureComponentViewPostProcessor monitor](self, "monitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopTrackingExposureOfComponentView:", v7);

    objc_initWeak(&location, self);
    -[SXExposureComponentViewPostProcessor monitor](self, "monitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __62__SXExposureComponentViewPostProcessor_processComponent_view___block_invoke;
    v14[3] = &unk_24D686C70;
    objc_copyWeak(&v17, &location);
    v15 = v6;
    v16 = v7;
    objc_msgSend(v13, "onExposureOf:then:", v16, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __62__SXExposureComponentViewPostProcessor_processComponent_view___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  SXComponentExposureEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      v10 = WeakRetained;
      objc_msgSend(WeakRetained, "exposedEvents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 40));
      v5 = (SXComponentExposureEvent *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
LABEL_8:

        WeakRetained = v10;
        goto LABEL_9;
      }
      -[SXAnalyticsEvent determineEndDate](v5, "determineEndDate");
      objc_msgSend(v10, "analyticsReporterProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "analyticsReporting");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reportEvent:", v5);

      objc_msgSend(v10, "exposedEvents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
LABEL_7:

      goto LABEL_8;
    }
    if (a2 == 1)
    {
      v10 = WeakRetained;
      v5 = -[SXComponentExposureEvent initWithComponent:]([SXComponentExposureEvent alloc], "initWithComponent:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v10, "exposedEvents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (SXComponentExposureMonitor)monitor
{
  return self->_monitor;
}

- (SXAnalyticsReportingProvider)analyticsReporterProvider
{
  return self->_analyticsReporterProvider;
}

- (NSMapTable)exposedEvents
{
  return self->_exposedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedEvents, 0);
  objc_storeStrong((id *)&self->_analyticsReporterProvider, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
