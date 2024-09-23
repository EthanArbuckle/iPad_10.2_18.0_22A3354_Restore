@implementation PedestrianARMuteSpeechOverrideTask

- (PedestrianARMuteSpeechOverrideTask)initWithNavigationService:(id)a3
{
  id v5;
  PedestrianARMuteSpeechOverrideTask *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v5 = a3;
  if (!v5)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PedestrianARMuteSpeechOverrideTask initWithNavigationService:]";
      v20 = 2080;
      v21 = "PedestrianARMuteSpeechOverrideTask.m";
      v22 = 1024;
      v23 = 38;
      v24 = 2080;
      v25 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PedestrianARMuteSpeechOverrideTask;
  v6 = -[PedestrianARMuteSpeechOverrideTask init](&v17, "init");
  if (v6)
  {
    v7 = sub_100650960();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v19 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_navigationService, a3);
    v6->_previousVoiceGuidanceLevel = -1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "pedestrianARViewControllerDidAppearNotification:", CFSTR("PedestrianARViewControllerDidAppearNotification"), 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, "pedestrianARViewControllerDidDisappearNotification:", CFSTR("PedestrianARViewControllerDidDisappearNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARMuteSpeechOverrideTask *v7;

  v3 = sub_100650960();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARMuteSpeechOverrideTask;
  -[PedestrianARMuteSpeechOverrideTask dealloc](&v5, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)pedestrianARViewControllerDidAppearNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  PedestrianARMuteSpeechOverrideTask *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMuteSpeechOverrideTask navigationSession](self, "navigationSession", a3));
  v5 = objc_msgSend(v4, "guidanceType");

  v6 = sub_100650960();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5 == (id)2)
  {
    if (v8)
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring AR did appear notification during route preview", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Setting voice guidance level override to \"None\".", (uint8_t *)&v10, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMuteSpeechOverrideTask navigationService](self, "navigationService"));
    self->_previousVoiceGuidanceLevel = (unint64_t)objc_msgSend(v9, "voiceGuidanceLevel");

    v7 = objc_claimAutoreleasedReturnValue(-[PedestrianARMuteSpeechOverrideTask navigationService](self, "navigationService"));
    -[NSObject setVoiceGuidanceLevelOverride:](v7, "setVoiceGuidanceLevelOverride:", 0);
  }

}

- (void)pedestrianARViewControllerDidDisappearNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  PedestrianARMuteSpeechOverrideTask *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMuteSpeechOverrideTask navigationSession](self, "navigationSession", a3));
  v5 = objc_msgSend(v4, "guidanceType");

  v6 = sub_100650960();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5 == (id)2)
  {
    if (v8)
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring AR did disappear notification during route preview", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    if (v8)
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Restoring previous voice guidance level.", (uint8_t *)&v10, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARMuteSpeechOverrideTask navigationService](self, "navigationService"));
    objc_msgSend(v9, "setVoiceGuidanceLevelOverride:", self->_previousVoiceGuidanceLevel);

    self->_previousVoiceGuidanceLevel = -1;
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a5;
  v6 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;
  -[PedestrianARMuteSpeechOverrideTask setNavigationSession:](self, "setNavigationSession:", v8);

}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (void)setNavigationSession:(id)a3
{
  objc_storeStrong((id *)&self->_navigationSession, a3);
}

- (BOOL)previousMuteSpeechOverride
{
  return self->_previousMuteSpeechOverride;
}

- (void)setPreviousMuteSpeechOverride:(BOOL)a3
{
  self->_previousMuteSpeechOverride = a3;
}

- (unint64_t)previousVoiceGuidanceLevel
{
  return self->_previousVoiceGuidanceLevel;
}

- (void)setPreviousVoiceGuidanceLevel:(unint64_t)a3
{
  self->_previousVoiceGuidanceLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
