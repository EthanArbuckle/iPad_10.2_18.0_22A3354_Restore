@implementation SXVideoAnalyticsRouter

- (SXVideoAnalyticsRouter)initWithInitiatedPlaybackLocation:(unint64_t)a3 analyticsReporter:(id)a4
{
  id v6;
  SXVideoAnalyticsRouter *v7;
  uint64_t v8;
  NSMutableDictionary *reporters;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SXVideoAnalyticsRouter;
  v7 = -[SXVideoAnalyticsRouter init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    reporters = v7->_reporters;
    v7->_reporters = (NSMutableDictionary *)v8;

    v7->_currentPlaybackLocation = a3;
    v7->_initiatedPlaybackLocation = a3;
    -[SXVideoAnalyticsRouter setAnalyticsReporter:forPlaybackLocation:](v7, "setAnalyticsReporter:forPlaybackLocation:", v6, a3);
  }

  return v7;
}

- (void)setAnalyticsReporter:(id)a3 forPlaybackLocation:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v6 = a3;
    -[SXVideoAnalyticsRouter reporters](self, "reporters");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v7);

  }
}

- (id)reporterForPlaybackLocation:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SXVideoAnalyticsRouter reporters](self, "reporters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reportEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXVideoAnalyticsRouter analyticsReporterForEvent:](self, "analyticsReporterForEvent:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportEvent:", v4);

}

- (id)analyticsReporterForEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[SXVideoAnalyticsRouter reporterForPlaybackLocation:](self, "reporterForPlaybackLocation:", -[SXVideoAnalyticsRouter currentPlaybackLocation](self, "currentPlaybackLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXVideoAnalyticsRouter currentPlaybackLocation](self, "currentPlaybackLocation");
  if (v6 != -[SXVideoAnalyticsRouter initiatedPlaybackLocation](self, "initiatedPlaybackLocation")
    && !-[SXVideoAnalyticsRouter hasReroutedInitiatedPlaybackEvent](self, "hasReroutedInitiatedPlaybackEvent"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "userAction") == 4)
    {
      -[SXVideoAnalyticsRouter reporterForPlaybackLocation:](self, "reporterForPlaybackLocation:", -[SXVideoAnalyticsRouter initiatedPlaybackLocation](self, "initiatedPlaybackLocation"));
      v7 = objc_claimAutoreleasedReturnValue();

      -[SXVideoAnalyticsRouter setHasReroutedInitiatedPlaybackEvent:](self, "setHasReroutedInitiatedPlaybackEvent:", 1);
      v5 = (void *)v7;
    }
  }

  return v5;
}

- (unint64_t)currentPlaybackLocation
{
  return self->_currentPlaybackLocation;
}

- (void)setCurrentPlaybackLocation:(unint64_t)a3
{
  self->_currentPlaybackLocation = a3;
}

- (unint64_t)initiatedPlaybackLocation
{
  return self->_initiatedPlaybackLocation;
}

- (NSMutableDictionary)reporters
{
  return self->_reporters;
}

- (BOOL)hasReroutedInitiatedPlaybackEvent
{
  return self->_hasReroutedInitiatedPlaybackEvent;
}

- (void)setHasReroutedInitiatedPlaybackEvent:(BOOL)a3
{
  self->_hasReroutedInitiatedPlaybackEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporters, 0);
}

@end
