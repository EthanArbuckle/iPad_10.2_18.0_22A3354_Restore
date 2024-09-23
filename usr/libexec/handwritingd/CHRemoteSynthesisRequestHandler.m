@implementation CHRemoteSynthesisRequestHandler

- (CHRemoteSynthesisRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5 recognitionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CHRemoteSynthesisRequestHandler *v14;
  CHRemoteSynthesisRequestHandler *v15;
  double v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CHRemoteSynthesisRequestHandler;
  v14 = -[CHRemoteRequestHandlerBase initWithServerQueue:lowPriorityQueue:highPriorityQueue:](&v18, "initWithServerQueue:lowPriorityQueue:highPriorityQueue:", v10, v11, v12);
  v15 = v14;
  if (v14)
  {
    v14->_activeRequestCount = 0;
    v14->_targetIdleLifetime = 120.0;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v15->_lastActiveTimestamp = v16;
    v15->_lastInventorySynthesisTimestamp = 0.0;
    objc_storeStrong((id *)&v15->_recognitionRequestHandler, a6);
  }

  return v15;
}

- (BOOL)_isValidRemoteSynthesisRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (objc_msgSend(v8, "requestType") == (id)1
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "drawing")), v10, !v10))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("The synthesis request is invalid"), &stru_100025708, 0));

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Cannot refine an empty drawing"), &stru_100025708, 0));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Submit a request with .drawing!=nil or .refinementRequest=NO"), &stru_100025708, 0));

      v30 = objc_msgSend((id)objc_opt_class(self), "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:", v16, v18, v20, -1002);
      v22 = objc_claimAutoreleasedReturnValue(v30);
    }
    else
    {
      if (objc_msgSend(v8, "requestType") && objc_msgSend(v8, "requestType") != (id)2
        || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string")),
            v12 = objc_msgSend(v11, "length"),
            v11,
            v12))
      {
        v13 = 0;
        v14 = 1;
        if (!a5)
          goto LABEL_14;
        goto LABEL_13;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("The synthesis request is invalid"), &stru_100025708, 0));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Cannot generate ink for an empty string"), &stru_100025708, 0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Submit a request with .string != \"\"), &stru_100025708, 0));

      v26 = objc_msgSend((id)objc_opt_class(self), "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:", v16, v18, v20, -1002);
      v22 = objc_claimAutoreleasedReturnValue(v26);
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("The synthesis request is invalid"), &stru_100025708, 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Remote synthesis cannot process an empty request"), &stru_100025708, 0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Submit a new valid synthesis request"), &stru_100025708, 0));

    v21 = objc_msgSend((id)objc_opt_class(self), "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:", v16, v18, v20, -1002);
    v22 = objc_claimAutoreleasedReturnValue(v21);
  }
  v13 = (void *)v22;

  v14 = 0;
  if (a5)
LABEL_13:
    *a5 = objc_retainAutorelease(v13);
LABEL_14:

  return v14;
}

- (void)checkOutTextSynthesizer
{
  id v3;
  NSObject *v4;
  CHTextSynthesizer *v5;
  CHTextSynthesizer *textSynthesizer;
  NSObject *v7;
  id v8;
  CHSynthesisStyleInventory *styleInventory;
  void *v10;
  CHFastPathCharacterPersonalizerInterface *v11;
  CHFastPathCharacterPersonalizerInterface *fastPathCharacterPersonalizer;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  int64_t activeRequestCount;
  int v19;
  int64_t v20;

  ++self->_activeRequestCount;
  -[CHRemoteSynthesisRequestHandler checkOutStyleInventory](self, "checkOutStyleInventory");
  v3 = -[CHRemoteRequestHandlerBase setDirty](self, "setDirty");
  if (!self->_textSynthesizer)
  {
    if (CHHasPersonalizedSynthesisSupport(v3) && !self->_styleInventory)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v4 = (id)qword_10002AE18[0];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Style inventory is nil ", (uint8_t *)&v19, 2u);
      }

    }
    v5 = (CHTextSynthesizer *)objc_msgSend(objc_alloc((Class)CHTextSynthesizer), "initWithStyleInventory:", self->_styleInventory);
    textSynthesizer = self->_textSynthesizer;
    self->_textSynthesizer = v5;

    if (qword_10002AE88 == -1)
    {
      v7 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
LABEL_12:

        +[CHPowerLogging logModelLoaded:](CHPowerLogging, "logModelLoaded:", 3);
        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v7 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_12;
    }
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Loaded synthesizer", (uint8_t *)&v19, 2u);
    goto LABEL_12;
  }
LABEL_13:
  if (self->_fastPathCharacterPersonalizer)
    goto LABEL_23;
  if (!self->_styleInventory)
  {
    if (qword_10002AE88 == -1)
    {
      v13 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
    }
    else
    {
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v13 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
    }
    LOWORD(v19) = 0;
    v14 = "Not possible to create a fast path character builder, inventory is null.";
    v15 = v13;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_21;
  }
  v8 = objc_alloc((Class)CHFastPathCharacterPersonalizerInterface);
  styleInventory = self->_styleInventory;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHTextSynthesizer supportedCharactersForPersonalizedSynthesis](self->_textSynthesizer, "supportedCharactersForPersonalizedSynthesis"));
  v11 = (CHFastPathCharacterPersonalizerInterface *)objc_msgSend(v8, "initWithStyleInventory:characterSet:", styleInventory, v10);
  fastPathCharacterPersonalizer = self->_fastPathCharacterPersonalizer;
  self->_fastPathCharacterPersonalizer = v11;

  if (qword_10002AE88 != -1)
  {
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v13 = (id)qword_10002AE60;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      goto LABEL_22;
    goto LABEL_17;
  }
  v13 = (id)qword_10002AE60;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
LABEL_17:
    LOWORD(v19) = 0;
    v14 = "Fast path character builder created";
    v15 = v13;
    v16 = OS_LOG_TYPE_DEBUG;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v19, 2u);
  }
LABEL_22:

LABEL_23:
  if (qword_10002AE88 != -1)
  {
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v17 = (id)qword_10002AE60;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    goto LABEL_25;
  }
  v17 = (id)qword_10002AE60;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
LABEL_25:
    activeRequestCount = self->_activeRequestCount;
    v19 = 134217984;
    v20 = activeRequestCount;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Currently active synthesis requests: %li", (uint8_t *)&v19, 0xCu);
  }
LABEL_26:

}

- (void)checkInTextSynthesizer
{
  double v3;
  NSObject *v4;
  uint8_t v5[16];

  --self->_activeRequestCount;
  -[CHRemoteSynthesisRequestHandler checkInStyleInventory](self, "checkInStyleInventory");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_lastActiveTimestamp = v3;
  if (self->_activeRequestCount < 0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v4 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Synthesizer is already fully checked in.", v5, 2u);
    }

  }
  -[CHRemoteSynthesisRequestHandler stageEvictionOfTextSynthesizerWithTargetIdleLifetime:](self, "stageEvictionOfTextSynthesizerWithTargetIdleLifetime:", self->_targetIdleLifetime);
}

- (BOOL)hasIdleLifetimeElapsed:(double)a3
{
  return +[CHRemoteRequestHandlerBase _hasIdleLifetimeElapsed:targetIdleLifetime:](CHRemoteRequestHandlerBase, "_hasIdleLifetimeElapsed:targetIdleLifetime:", self->_lastActiveTimestamp, a3);
}

- (void)stageEvictionOfTextSynthesizerWithTargetIdleLifetime:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  double v8;

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v5 = (id)qword_10002AE60;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Staging synthesizer for eviction with idle lifetime=%1.2f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011538;
  v6[3] = &unk_100024BB0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  -[CHRemoteRequestHandlerBase _stageEvictionOfResourceWithTargetLifetime:block:](self, "_stageEvictionOfResourceWithTargetLifetime:block:", v6, a3);
}

- (void)evictTextSynthesizer
{
  NSObject *v3;
  CHTextSynthesizer *textSynthesizer;
  CHFastPathCharacterPersonalizerInterface *fastPathCharacterPersonalizer;
  uint8_t v6[16];

  if (self->_textSynthesizer)
  {
    +[CHPowerLogging logModelUnloaded:](CHPowerLogging, "logModelUnloaded:", 3);
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v3 = (id)qword_10002AE60;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Evicted synthesizer", v6, 2u);
    }

  }
  self->_activeRequestCount = 0;
  textSynthesizer = self->_textSynthesizer;
  self->_textSynthesizer = 0;

  fastPathCharacterPersonalizer = self->_fastPathCharacterPersonalizer;
  self->_fastPathCharacterPersonalizer = 0;

  -[CHRemoteRequestHandlerBase setIdle](self, "setIdle");
}

- (void)checkOutStyleInventory
{
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CHSynthesisStyleInventory *styleInventory;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int64_t activeStyleInventoryRequestCount;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  void *v22;

  if (CHHasPersonalizedSynthesisSupport(self))
  {
    ++self->_activeStyleInventoryRequestCount;
    if (self->_styleInventory)
      goto LABEL_18;
    v3 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase lowPriorityQueue](self, "lowPriorityQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011B5C;
    block[3] = &unk_100024AA0;
    block[4] = self;
    dispatch_sync(v3, block);
    if (+[CHSynthesisStyleInventory isPersonalizedSynthesisModelReady](CHSynthesisStyleInventory, "isPersonalizedSynthesisModelReady"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHSynthesisStyleInventory synthesisModelHash](self->_styleInventory, "synthesisModelHash"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteSynthesisRequestHandler diffusionModelHash](self, "diffusionModelHash"));
      v6 = objc_msgSend(v4, "isEqualToString:", v5);

      if ((v6 & 1) != 0)
      {
LABEL_17:

LABEL_18:
        if (qword_10002AE88 == -1)
        {
          v16 = (id)qword_10002AE60;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
LABEL_21:

            return;
          }
        }
        else
        {
          dispatch_once(&qword_10002AE88, &stru_1000249F0);
          v16 = (id)qword_10002AE60;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            goto LABEL_21;
        }
        activeStyleInventoryRequestCount = self->_activeStyleInventoryRequestCount;
        *(_DWORD *)buf = 134217984;
        v20 = activeStyleInventoryRequestCount;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Currently active style inventory requests: %li", buf, 0xCu);
        goto LABEL_21;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteSynthesisRequestHandler diffusionModelHash](self, "diffusionModelHash"));

      if (!v7)
      {
        v8 = CHOSLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "The diffusion model hash should be non-nil", buf, 2u);
        }

      }
      if (qword_10002AE88 == -1)
      {
        v10 = (id)qword_10002AE60;
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
LABEL_12:

          styleInventory = self->_styleInventory;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteSynthesisRequestHandler diffusionModelHash](self, "diffusionModelHash"));
          -[CHSynthesisStyleInventory updateSynthesisModelHash:](styleInventory, "updateSynthesisModelHash:", v14);

          -[CHRemoteSynthesisRequestHandler _asyncUpdateInventoryStylePredictions](self, "_asyncUpdateInventoryStylePredictions");
          goto LABEL_17;
        }
      }
      else
      {
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v10 = (id)qword_10002AE60;
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          goto LABEL_12;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHSynthesisStyleInventory synthesisModelHash](self->_styleInventory, "synthesisModelHash"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteSynthesisRequestHandler diffusionModelHash](self, "diffusionModelHash"));
      *(_DWORD *)buf = 138412546;
      v20 = (int64_t)v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Diffusion model hash has changed (old: %@, new: %@). The inventory samples embedding need to be recomputed.", buf, 0x16u);

      goto LABEL_12;
    }
    if (qword_10002AE88 == -1)
    {
      v15 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v15 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Diffusion model is not ready. The model hash could not be validated", buf, 2u);
    goto LABEL_16;
  }
}

- (void)checkInStyleInventory
{
  double v3;
  NSObject *v4;
  uint8_t v5[16];

  if (CHHasPersonalizedSynthesisSupport(self))
  {
    -[CHRemoteSynthesisRequestHandler throttledSaveStyleInventoryIfNeeded](self, "throttledSaveStyleInventoryIfNeeded");
    --self->_activeStyleInventoryRequestCount;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_lastActiveStyleInventoryTimestamp = v3;
    if (self->_activeStyleInventoryRequestCount < 0)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v4 = (id)qword_10002AE18[0];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Style inventory is already fully checked in.", v5, 2u);
      }

    }
    -[CHRemoteSynthesisRequestHandler stageEvictionOfStyleInventoryWithTargetIdleLifetime:](self, "stageEvictionOfStyleInventoryWithTargetIdleLifetime:", self->_targetIdleLifetime);
  }
}

- (BOOL)hasStyleInventoryIdleLifetimeElapsed:(double)a3
{
  return +[CHRemoteRequestHandlerBase _hasIdleLifetimeElapsed:targetIdleLifetime:](CHRemoteRequestHandlerBase, "_hasIdleLifetimeElapsed:targetIdleLifetime:", self->_lastActiveStyleInventoryTimestamp, a3);
}

- (void)stageEvictionOfStyleInventoryWithTargetIdleLifetime:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  double v8;

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v5 = (id)qword_10002AE60;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Staging style inventory for eviction with idle lifetime=%1.2f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011E4C;
  v6[3] = &unk_100024BB0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  -[CHRemoteRequestHandlerBase _stageEvictionOfResourceWithTargetLifetime:block:](self, "_stageEvictionOfResourceWithTargetLifetime:block:", v6, a3);
}

- (void)throttledSaveStyleInventoryIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase lowPriorityQueue](self, "lowPriorityQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012078;
  block[3] = &unk_100024AA0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)saveStyleInventoryIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase lowPriorityQueue](self, "lowPriorityQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000121DC;
  block[3] = &unk_100024AA0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)_queueForRequest:(id)a3 outIsSynchronizedSynthesisQueue:(BOOL *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  dispatch_queue_global_t global_queue;
  void *v10;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
  v8 = objc_msgSend(v7, "isFastPath");

  if (!v8)
  {
    v12 = objc_msgSend(v6, "priority");
    if ((unint64_t)v12 >= 2)
    {
      if (v12 != (id)2)
      {
        if (qword_10002AE88 != -1)
          dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v14 = (id)qword_10002AE38;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid synthesis request priority specified", v15, 2u);
        }

        v10 = 0;
        if (a4)
          goto LABEL_3;
        goto LABEL_4;
      }
      v13 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase lowPriorityQueue](self, "lowPriorityQueue"));
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase highPriorityQueue](self, "highPriorityQueue"));
    }
    v10 = (void *)v13;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  global_queue = dispatch_get_global_queue(2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  if (a4)
LABEL_3:
    *a4 = v8 ^ 1;
LABEL_4:

  return v10;
}

- (BOOL)_isReadyForCharacterInventorySynthesis
{
  unsigned int v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;

  v2 = -[CHSynthesisStyleInventory hasAllDigits](self->_styleInventory, "hasAllDigits");
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v3 = (id)qword_10002AE60;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (v2)
      v4 = CFSTR("YES");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: fast Path synthesis found sufficient digit coverage from the inventory to trigger the character inventory preparation : %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (void)_updateStylePredictionsSingleBatch:(int64_t)a3
{
  CHRemoteSynthesisRequestHandler *v4;
  NSObject *v5;
  CHRemoteSynthesisRequestHandler *v6;
  NSObject *v7;
  CHRemoteSynthesisRequestHandler *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  CHTextSynthesizer *textSynthesizer;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  int64_t v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int64_t v36;

  if (self->_styleInventory)
  {
    if (self->_textSynthesizer)
      goto LABEL_14;
    goto LABEL_9;
  }
  v4 = self;
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v5 = (id)qword_10002AE18[0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Style inventory has not been checked out", buf, 2u);
  }

  self = v4;
  if (!v4->_textSynthesizer)
  {
LABEL_9:
    v6 = self;
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v7 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Text synthesizer has not been checked out", buf, 2u);
    }

    self = v6;
  }
LABEL_14:
  v8 = self;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHSynthesisStyleInventory samplesWithoutStylePrediction](self->_styleInventory, "samplesWithoutStylePrediction"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000129B8;
  v29[3] = &unk_100024BD8;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a3));
  v30 = v9;
  v31 = a3;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v29);
  if ((unint64_t)objc_msgSend(v9, "count") > a3)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v10 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218240;
      v34 = v11;
      v35 = 2048;
      v36 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Batch samples size (%lu) is larger than the batch size (%lu)", buf, 0x16u);
    }

  }
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v12 = (id)qword_10002AE60;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Computing style prediction for %lu samples", buf, 0xCu);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v9;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v18 = objc_autoreleasePoolPush();
        textSynthesizer = v8->_textSynthesizer;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "transcription"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "drawing"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHTextSynthesizer stylePredictionResultForTranscription:drawing:shouldCancel:](textSynthesizer, "stylePredictionResultForTranscription:drawing:shouldCancel:", v20, v21, 0));

        if (v22)
          objc_msgSend(v17, "updateStyleEmbedding:", v22);

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v14);
  }

  -[CHSynthesisStyleInventory updateStylePredictionsWithSamples:](v8->_styleInventory, "updateStylePredictionsWithSamples:", obj);
}

- (void)_asyncUpdateInventoryStylePredictions
{
  NSObject *v3;
  _QWORD block[5];

  if (+[CHSynthesisStyleInventory isPersonalizedSynthesisModelReady](CHSynthesisStyleInventory, "isPersonalizedSynthesisModelReady"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012AA8;
    block[3] = &unk_100024AA0;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (BOOL)_shouldFreezeCharacterInventory
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (!os_variant_has_internal_diagnostics("com.apple.corehandwriting"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryForKey:", CFSTR("com.apple.corehandwriting")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("kCHFreezeCharacterInventory")));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)_handleCharacterInventoryRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD *v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  uint8_t *v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD block[5];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[CHRemoteSynthesisRequestHandler _shouldFreezeCharacterInventory](self, "_shouldFreezeCharacterInventory"))
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v12 = (id)qword_10002AE60;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: start _handleCharacterInventoryRequest", buf, 2u);
    }

    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v13 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013180;
    block[3] = &unk_100024C00;
    block[4] = self;
    v28 = v8;
    v29 = &v35;
    v30 = &v31;
    dispatch_sync(v13, block);

    if (!*((_BYTE *)v36 + 24))
      goto LABEL_16;
    if (qword_10002AE88 == -1)
    {
      v14 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        *(_QWORD *)buf = 0;
        v22 = buf;
        v23 = 0x3032000000;
        v24 = sub_10001367C;
        v25 = sub_10001368C;
        v26 = 0;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100013694;
        v18[3] = &unk_100024C28;
        v18[4] = self;
        v20 = buf;
        v19 = v10;
        v15 = objc_retainBlock(v18);
        -[CHFastPathCharacterPersonalizerInterface runPersonalizationWithBlock:resynthesizeAll:](self->_fastPathCharacterPersonalizer, "runPersonalizationWithBlock:resynthesizeAll:", v15, *((unsigned __int8 *)v32 + 24));
        v16 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100013A78;
        v17[3] = &unk_100024AA0;
        v17[4] = self;
        dispatch_async(v16, v17);

        _Block_object_dispose(buf, 8);
LABEL_16:
        (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);

        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v35, 8);
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v14 = (id)qword_10002AE60;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: starting shouldStartSynthesis block", buf, 2u);
    goto LABEL_15;
  }
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v11 = (id)qword_10002AE60;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: character inventory is frozen. Ignoring _handleCharacterInventoryRequest", buf, 2u);
  }

LABEL_17:
}

- (id)_createDebugViewOfInventory
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD v14[8];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  if (os_variant_has_internal_diagnostics("com.apple.corehandwriting"))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_10001367C;
    v29 = sub_10001368C;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_10001367C;
    v23 = sub_10001368C;
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0xBFF0000000000000;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100013D4C;
    v14[3] = &unk_100024C50;
    v14[4] = v18;
    v14[5] = v16;
    v14[6] = v17;
    v14[7] = &v25;
    v3 = objc_retainBlock(v14);
    v4 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013F34;
    block[3] = &unk_100024CA0;
    block[4] = self;
    v5 = v3;
    v10 = v5;
    v11 = v18;
    v12 = v15;
    v13 = &v19;
    dispatch_sync(v4, block);

    if (v26[5])
    {
      v6 = objc_alloc((Class)CHSynthesisResult);
      v7 = objc_msgSend(v6, "initWithContent:drawing:", v20[5], v26[5]);
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)checkSegmentsAndDrawingConsistencyForSynthesisResult:(id)a3 bundleIdentifier:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  CHRemoteSynthesisRequestHandler *v25;
  id v26;
  id v27;
  Block_layout *v28;
  id v29;
  uint8_t *v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "segmentStrokeIndexes"));
  v12 = objc_msgSend(v11, "count");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "segmentContents"));
  v14 = objc_msgSend(v13, "count");

  if (v12 != v14)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v15 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Number of segment stroke indexes not equal to segment contents length", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v32 = buf;
  v33 = 0x3032000000;
  v34 = sub_10001367C;
  v35 = sub_10001368C;
  v36 = objc_alloc_init((Class)NSMutableArray);
  global_queue = dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014814;
  block[3] = &unk_100024D30;
  v24 = v8;
  v25 = self;
  v29 = v10;
  v30 = buf;
  v27 = (id)os_transaction_create("com.apple.handwritingd.ongoingSynthesisCheck", v18);
  v28 = &stru_100024CE0;
  v26 = v9;
  v19 = v27;
  v20 = v10;
  v21 = v9;
  v22 = v8;
  dispatch_async(v17, block);

  _Block_object_dispose(buf, 8);
}

- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(id, void *, _QWORD);
  uint8_t *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "options"));
  v12 = objc_msgSend(v11, "synthesizeCharacterInventoryBehavior");

  if (v12)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v13 = (id)qword_10002AE60;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Remote synthesis request will go through fast path synthesis", buf, 2u);
    }

    -[CHRemoteSynthesisRequestHandler _handleCharacterInventoryRequest:withReply:bundleIdentifier:](self, "_handleCharacterInventoryRequest:withReply:bundleIdentifier:", v8, v9, v10);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "options"));
    v15 = objc_msgSend(v14, "styleInventoryQuery");

    if (v15)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v16 = (id)qword_10002AE60;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request triggered creation of style inventory debug view", buf, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHRemoteSynthesisRequestHandler _createDebugViewOfInventory](self, "_createDebugViewOfInventory"));
      v9[2](v9, v17, 0);

    }
    else
    {
      *(_QWORD *)buf = 0;
      v28 = buf;
      v29 = 0x3032000000;
      v30 = sub_10001367C;
      v31 = sub_10001368C;
      v32 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = sub_10001367C;
      v25[4] = sub_10001368C;
      v26 = 0;
      v18 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001525C;
      v19[3] = &unk_100024D80;
      v19[4] = self;
      v20 = v8;
      v21 = v10;
      v22 = v9;
      v23 = buf;
      v24 = v25;
      dispatch_sync(v18, v19);

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(buf, 8);

    }
  }

}

- (void)handleInventoryRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015FEC;
  block[3] = &unk_100024DA8;
  block[4] = self;
  v10 = v7;
  v13 = v10;
  v11 = v8;
  v14 = v11;
  dispatch_async(v9, block);

  -[CHRemoteSynthesisRequestHandler _asyncUpdateInventoryStylePredictions](self, "_asyncUpdateInventoryStylePredictions");
}

- (void)handleInventoryStatusRequestWithReply:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016538;
  v8[3] = &unk_100024980;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (id)diffusionModelHash
{
  return +[CHTextSynthesizer diffusionModelHash](CHTextSynthesizer, "diffusionModelHash");
}

- (void)optimizeResourceUsage
{
  -[CHRemoteSynthesisRequestHandler stageEvictionOfTextSynthesizerWithTargetIdleLifetime:](self, "stageEvictionOfTextSynthesizerWithTargetIdleLifetime:", 5.0);
  -[CHRemoteSynthesisRequestHandler stageEvictionOfStyleInventoryWithTargetIdleLifetime:](self, "stageEvictionOfStyleInventoryWithTargetIdleLifetime:", 5.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionRequestHandler, 0);
  objc_storeStrong((id *)&self->_styleInventory, 0);
  objc_storeStrong((id *)&self->_fastPathCharacterPersonalizer, 0);
  objc_storeStrong((id *)&self->_textSynthesizer, 0);
}

@end
