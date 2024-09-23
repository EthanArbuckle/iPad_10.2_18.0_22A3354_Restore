@implementation SiriNavStatusUpdater

- (SiriNavStatusUpdater)initWithNavigationService:(id)a3
{
  id v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  int v10;
  unint64_t v11;

  v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_navigationService, a3);
    v6 = -[SiriNavStatusUpdater _currentStateFromService](self, "_currentStateFromService");
    self->_lastSentValue = 4;
    v7 = sub_100431C0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Starting Siri updater with navigation state: %lu", (uint8_t *)&v10, 0xCu);
    }

    -[SiriNavStatusUpdater _updateSiriNavStatusForNewNavigationServiceState:](self, "_updateSiriNavStatusForNewNavigationServiceState:", v6);
    -[MNNavigationService registerObserver:](self->_navigationService, "registerObserver:", self);
  }

  return self;
}

- (unint64_t)_currentStateFromService
{
  return (unint64_t)-[MNNavigationService state](self->_navigationService, "state");
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  -[SiriNavStatusUpdater _updateSiriNavStatusForNewNavigationServiceState:](self, "_updateSiriNavStatusForNewNavigationServiceState:", a5, a4);
}

- (void)_updateSiriNavStatusForNewNavigationServiceState:(unint64_t)a3
{
  unint64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  unint64_t v8;

  if (a3 - 4 >= 3)
    v3 = 0;
  else
    v3 = a3 - 3;
  if (self->_lastSentValue != v3)
  {
    self->_lastSentValue = v3;
    v4 = sub_100431C0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Sending to Siri navigation state: %lu", (uint8_t *)&v7, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    objc_msgSend(v6, "setCurrentNavigationState:", v3);

  }
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
