@implementation REAppUsagePredictor

+ (id)supportedFeatures
{
  REFeatureSet *v2;
  void *v3;
  void *v4;
  REFeatureSet *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = [REFeatureSet alloc];
  +[REFeature appUsageFeature](REFeature, "appUsageFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v4);

  return v5;
}

+ (double)updateInterval
{
  return 3600.0;
}

- (void)update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  -[REPredictor beginFetchingData](self, "beginFetchingData");
  +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryForTopNApplications:withLikelihoodGreaterThan:withTemporalResolution:", 20, 300, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  +[RESingleton sharedInstance](REDuetKnowledgeStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPredictor queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__REAppUsagePredictor_update__block_invoke;
  v7[3] = &unk_24CF8B498;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v5, "executeQuery:responseQueue:completion:", v4, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __29__REAppUsagePredictor_update__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v5;
  char v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = v7;
    objc_msgSend(WeakRetained, "finishFetchingData");
    if (v5)
    {
      v6 = objc_msgSend(WeakRetained[9], "isEqual:", v5);
      objc_storeStrong(WeakRetained + 9, a2);
      if ((v6 & 1) == 0)
        objc_msgSend(WeakRetained, "updateObservers");
    }
    objc_msgSend(*(id *)(a1 + 32), "_scheduleTimelineProgressionTimerAfter:", 0);

  }
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v8 = a6;
  objc_msgSend(a4, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "attributeForKey:", CFSTR("RETrainingContextDateKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_7:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v10)
    goto LABEL_7;
LABEL_8:
  -[RETimeline valueForDate:](self->_timeline, "valueForDate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "doubleValue");
  else
    v14 = 0.0;
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v11;
}

- (RETimeline)timeline
{
  return self->_timeline;
}

- (id)_nextTimelineTransitionDateAfter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[RETimeline transitionDates](self->_timeline, "transitionDates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__REAppUsagePredictor__nextTimelineTransitionDateAfter___block_invoke;
  v9[3] = &unk_24CF8B4C0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__REAppUsagePredictor__nextTimelineTransitionDateAfter___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_scheduleTimelineProgressionTimerAfter:(id)a3
{
  id v4;
  REUpNextTimer *timelineProgressionTimer;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  REUpNextTimer *v10;
  REUpNextTimer *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[REUpNextTimer invalidate](self->_timelineProgressionTimer, "invalidate");
  timelineProgressionTimer = self->_timelineProgressionTimer;
  self->_timelineProgressionTimer = 0;

  -[REAppUsagePredictor _nextTimelineTransitionDateAfter:](self, "_nextTimelineTransitionDateAfter:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_initWeak(&location, self);
      -[REPredictor queue](self, "queue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __62__REAppUsagePredictor__scheduleTimelineProgressionTimerAfter___block_invoke;
      v12[3] = &unk_24CF8B4E8;
      objc_copyWeak(&v14, &location);
      v13 = v6;
      +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v13, v9, v12);
      v10 = (REUpNextTimer *)objc_claimAutoreleasedReturnValue();

      v11 = self->_timelineProgressionTimer;
      self->_timelineProgressionTimer = v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

}

void __62__REAppUsagePredictor__scheduleTimelineProgressionTimerAfter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "updateObservers");
    objc_msgSend(v3, "_scheduleTimelineProgressionTimerAfter:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_timelineProgressionTimer, 0);
}

@end
