@implementation CRDictationService

+ (id)sharedInstance
{
  if (qword_1000DB810 != -1)
    dispatch_once(&qword_1000DB810, &stru_1000B52D0);
  return (id)qword_1000DB808;
}

- (CRDictationService)init
{
  CRDictationService *v2;
  void *v3;
  objc_class *v4;
  AFDictationConnection *v5;
  AFDictationConnection *dictationConnection;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)CRDictationService;
  v2 = -[CRDictationService init](&v8, "init");
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)qword_1000DB818;
    v13 = qword_1000DB818;
    if (!qword_1000DB818)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000CA24;
      v9[3] = &unk_1000B5320;
      v9[4] = &v10;
      sub_10000CA24((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (AFDictationConnection *)objc_alloc_init(v4);
    dictationConnection = v2->_dictationConnection;
    v2->_dictationConnection = v5;

    -[AFDictationConnection setDelegate:](v2->_dictationConnection, "setDelegate:", v2);
    v2->_state = -[CRDictationService dictationAvailable](v2, "dictationAvailable") - 1;
  }
  return v2;
}

- (BOOL)dictationEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAREnableDictationInternal"), CFSTR("com.apple.carplay.internal"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (BOOL)dictationEnabledInKeyboardSettings
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v3 = objc_msgSend(v2, "dictationIsEnabled");

  return v3;
}

- (BOOL)dictationAvailable
{
  void *v3;
  unsigned __int8 v4;
  __int128 v6;
  uint64_t v7;

  if (!qword_1000DB820)
  {
    v6 = off_1000B5340;
    v7 = 0;
    qword_1000DB820 = _sl_dlopen(&v6, 0);
  }
  if (!qword_1000DB820
    || !+[AFDictationConnection dictationIsEnabled](AFDictationConnection, "dictationIsEnabled"))
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService dictationConnection](self, "dictationConnection"));
  v4 = objc_msgSend(v3, "dictationIsAvailableForLanguage:", CFSTR("en_US"));

  return v4;
}

- (void)stopRecording
{
  id v3;

  if (-[CRDictationService state](self, "state") >= 1)
  {
    if (-[CRDictationService state](self, "state") < 2)
    {
      -[CRDictationService _transitionToState:](self, "_transitionToState:", 4);
    }
    else
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[CRDictationService dictationConnection](self, "dictationConnection"));
      objc_msgSend(v3, "stopSpeechWithOptions:", 0);

    }
  }
}

- (void)cancelRecording
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v3 = -[CRDictationService state](self, "state");
  if (v3 >= 1)
  {
    v6 = CarDiagnosticsLogging(v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancel dictation request", v9, 2u);
    }

    -[CRDictationService setHandler:](self, "setHandler:", 0);
    if (-[CRDictationService state](self, "state") < 2)
    {
      -[CRDictationService _transitionToState:](self, "_transitionToState:", 4);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService dictationConnection](self, "dictationConnection"));
      objc_msgSend(v8, "stopSpeechWithOptions:", 0);

    }
  }
}

- (void)beginRecordingWithCompletion:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  __int16 v19;
  uint8_t buf[2];

  v4 = a3;
  v5 = -[CRDictationService dictationAvailable](self, "dictationAvailable");
  if (v5)
  {
    v8 = -[CRDictationService state](self, "state");
    if (v8 < 1)
    {
      -[CRDictationService setHandler:](self, "setHandler:", v4);
      -[CRDictationService setResult:](self, "setResult:", 0);
      -[CRDictationService setError:](self, "setError:", 0);
      -[CRDictationService _transitionToState:](self, "_transitionToState:", 1);
      v16 = objc_alloc_init((Class)AFDictationOptions);
      objc_msgSend(v16, "setTranscriptionMode:", 0);
      objc_msgSend(v16, "setKeyboardType:", 13);
      objc_msgSend(v16, "setReturnKeyType:", 10);
      objc_msgSend(v16, "setReleaseAudioSessionOnRecordingCompletion:", 1);
      v17 = objc_alloc_init((Class)AFSpeechRequestOptions);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService dictationConnection](self, "dictationConnection"));
      objc_msgSend(v18, "startDictationWithLanguageCode:options:speechOptions:", CFSTR("en_US"), v16, v17);

      goto LABEL_9;
    }
    v11 = CarDiagnosticsLogging(v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v13 = "Dictation is already in progress.";
      v14 = (uint8_t *)&v19;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }
  else
  {
    v15 = CarDiagnosticsLogging(v5, v6, v7);
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Dictation is not available.";
      v14 = buf;
      goto LABEL_7;
    }
  }

  -[CRDictationService _fireHandler:withState:result:error:](self, "_fireHandler:withState:result:error:", v4, -1, 0, 0);
LABEL_9:

}

- (void)_fireHandler:(id)a3 withState:(int64_t)a4 result:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  int64_t v16;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000BD68;
    v12[3] = &unk_1000B52F8;
    v16 = a4;
    v13 = v10;
    v14 = v11;
    v15 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  }
}

- (void)_transitionToState:(int64_t)a3
{
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  __CFString *v22;

  if (self->_state != a3)
  {
    v5 = -[CRDictationService state](self, "state");
    self->_state = a3;
    v8 = CarDiagnosticsLogging(v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v5 + 1) >= 6)
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), v5));
      else
        v10 = off_1000B5358[v5 + 1];
      v11 = v10;
      if ((unint64_t)(a3 + 1) >= 6)
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), a3));
      else
        v12 = off_1000B5358[a3 + 1];
      *(_DWORD *)buf = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Dictation transitioning from %@ to %@", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService handler](self, "handler"));
    v14 = -[CRDictationService state](self, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService result](self, "result"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService error](self, "error"));
    -[CRDictationService _fireHandler:withState:result:error:](self, "_fireHandler:withState:result:error:", v13, v14, v15, v16);

    if (a3 == 3)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_processingTimeLimitReached", 0, 0, 2.0));
      -[CRDictationService setProcessingTimer:](self, "setProcessingTimer:", v17);

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService processingTimer](self, "processingTimer"));
      objc_msgSend(v18, "invalidate");

      -[CRDictationService setProcessingTimer:](self, "setProcessingTimer:", 0);
      if (a3 == 4)
      {
        -[AFDictationConnection stopSpeechWithOptions:](self->_dictationConnection, "stopSpeechWithOptions:", 0);
        -[CRDictationService reset](self, "reset");
      }
    }
  }
}

- (void)reset
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *processingTimer;
  CARDictationResult *result;
  id handler;
  NSError *error;
  uint8_t v9[16];

  v3 = CarDiagnosticsLogging(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting dictation state.", v9, 2u);
  }

  -[NSTimer invalidate](self->_processingTimer, "invalidate");
  processingTimer = self->_processingTimer;
  self->_processingTimer = 0;

  self->_state = -[CRDictationService dictationAvailable](self, "dictationAvailable") - 1;
  result = self->_result;
  self->_result = 0;

  handler = self->_handler;
  self->_handler = 0;

  error = self->_error;
  self->_error = 0;

}

- (void)_processingTimeLimitReached
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  -[CRDictationService setProcessingTimer:](self, "setProcessingTimer:", 0);
  if ((id)-[CRDictationService state](self, "state") == (id)3)
  {
    v4 = CarDiagnosticsLogging(3, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dictation maximum processing time reached, stopping dictation", v6, 2u);
    }

    -[AFDictationConnection stopSpeechWithOptions:](self->_dictationConnection, "stopSpeechWithOptions:", 0);
    -[CRDictationService _transitionToState:](self, "_transitionToState:", 4);
  }
}

- (void)_finishIfPossible
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  if ((id)-[CRDictationService state](self, "state") == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRDictationService result](self, "result"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transcription"));
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      v8 = CarDiagnosticsLogging(v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will finish processing, have valid result", v10, 2u);
      }

      -[CRDictationService _transitionToState:](self, "_transitionToState:", 4);
    }
  }
}

- (void)_failWithError:(id)a3
{
  -[CRDictationService setError:](self, "setError:", a3);
  -[CRDictationService _transitionToState:](self, "_transitionToState:", 4);
}

- (void)dictationConnectionSpeechRecordingWillBegin:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CarDiagnosticsLogging(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Recording will begin", v6, 2u);
  }

  -[CRDictationService _transitionToState:](self, "_transitionToState:", 2);
}

- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarDiagnosticsLogging(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Recording did begin", v5, 2u);
  }

}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CarDiagnosticsLogging(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Recording did end", v6, 2u);
  }

  -[CRDictationService _transitionToState:](self, "_transitionToState:", 3);
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CarDiagnosticsLogging(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Speech recognition did succeed", v6, 2u);
  }

  -[CRDictationService _transitionToState:](self, "_transitionToState:", 3);
  -[CRDictationService _finishIfPossible](self, "_finishIfPossible");
}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  CARDictationResult *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a4;
  if (-[CRDictationService state](self, "state") >= 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v18 = v6;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          v14 = v11;
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (v14
            && (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "removeSpaceBefore") & 1) == 0
            && (objc_msgSend(v14, "removeSpaceAfter") & 1) == 0)
          {
            objc_msgSend(v7, "appendString:", CFSTR(" "));
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "text"));
          objc_msgSend(v7, "appendString:", v16);

          v11 = v15;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);

      v6 = v18;
    }

    v17 = -[CARDictationResult initWithText:]([CARDictationResult alloc], "initWithText:", v7);
    -[CRDictationService setResult:](self, "setResult:", v17);

    -[CRDictationService _finishIfPossible](self, "_finishIfPossible");
  }

}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CarDiagnosticsLogging(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Speech recording did cancel", v6, 2u);
  }

  -[CRDictationService _transitionToState:](self, "_transitionToState:", 4);
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a4;
  v7 = CarDiagnosticsLogging(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Speech recording failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[CRDictationService _failWithError:](self, "_failWithError:", v5);
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a4;
  v7 = CarDiagnosticsLogging(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Speech recognition failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[CRDictationService _failWithError:](self, "_failWithError:", v5);
}

- (AFDictationConnection)dictationConnection
{
  return self->_dictationConnection;
}

- (void)setDictationConnection:(id)a3
{
  objc_storeStrong((id *)&self->_dictationConnection, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CARDictationResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSTimer)processingTimer
{
  return self->_processingTimer;
}

- (void)setProcessingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_processingTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingTimer, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

@end
