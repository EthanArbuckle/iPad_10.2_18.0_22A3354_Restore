@implementation BKKeyboardHIDEventProcessor

- (void)bufferingDidAddNewBuffers:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_downModifierKeys;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_keyDownToEventSequence, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), (_QWORD)v11));
        objc_msgSend(v10, "repostFirstEventToBufferedTargets:", v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)bufferDidEndDraining:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *keyDownToEventSequence;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keyDownToEventSequence = self->_keyDownToEventSequence;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100052480;
  v8[3] = &unk_1000EAF58;
  v9 = v4;
  v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyDownToEventSequence, "enumerateKeysAndObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_lock);

}

- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3
{
  id v4;
  BKKeyboardHIDEventProcessor *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKKeyboardHIDEventProcessor;
  v5 = -[BKKeyboardHIDEventProcessor init](&v12, "init");
  if (v5)
  {
    v6 = objc_alloc((Class)BKHIDDomainServiceServer);
    v7 = BKSKeyboardBSServiceName;
    v8 = BKLogKeyboard();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v6, "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:", v5, v5, &OBJC_PROTOCOL___BKSKeyboardServiceClientToServerIPC, &OBJC_PROTOCOL___BKSKeyboardServiceServerToClientIPC, v7, 0, v9, 0);

    -[BKKeyboardHIDEventProcessor _commonInitWithContext:server:](v5, "_commonInitWithContext:server:", v4, v10);
  }

  return v5;
}

- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3 server:(id)a4
{
  id v6;
  id v7;
  BKKeyboardHIDEventProcessor *v8;
  BKKeyboardHIDEventProcessor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKKeyboardHIDEventProcessor;
  v8 = -[BKKeyboardHIDEventProcessor init](&v11, "init");
  v9 = v8;
  if (v8)
    -[BKKeyboardHIDEventProcessor _commonInitWithContext:server:](v8, "_commonInitWithContext:server:", v6, v7);

  return v9;
}

- (void)_commonInitWithContext:(id)a3 server:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *productIdentifierWithCapsLockActiveToGeneration;
  NSMutableDictionary *v10;
  NSMutableDictionary *allKeyboardsBySenderID;
  NSMutableArray *v12;
  NSMutableArray *usableKeyboards;
  NSMutableArray *v14;
  NSMutableArray *eventRecognizers;
  BKHIDEventDispatcher *v16;
  BKHIDEventDispatcher *eventDispatcher;
  BKHIDSystemInterfacing *v18;
  BKHIDSystemInterfacing *eventSystemInterface;
  BKHIDEventProcessorRegistering *v20;
  BKHIDEventProcessorRegistering *eventProcessorRegistry;
  BKDisplayController *v22;
  BKDisplayController *displayController;
  BSInvalidatable *v24;
  BSInvalidatable *displayBlankingObservationAssertion;
  NSString *keyboardLayout;
  id v27;
  void *v28;
  id v29;
  void *v30;
  BKIOHIDServiceMatcher *v31;
  BKIOHIDServiceMatcher *keyboardServiceMatcher;
  NSMutableDictionary *v33;
  NSMutableDictionary *keyDownToEventSequence;
  NSMutableDictionary *v35;
  NSMutableDictionary *senderIDToKeysDown;
  NSMutableSet *v37;
  NSMutableSet *senderIDsWithModifiersOnly;
  NSMutableSet *v39;
  NSMutableSet *downModifierKeys;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  BKKeyboardHIDEventProcessor *v53;
  _QWORD v54[2];
  __int128 buf;

  v6 = a3;
  v7 = a4;
  self->_lock._os_unfair_lock_opaque = 0;
  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
  self->_productIdentifierWithCapsLockActiveToGeneration = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  self->_allKeyboardsBySenderID = v10;

  v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  usableKeyboards = self->_usableKeyboards;
  self->_usableKeyboards = v12;

  v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  eventRecognizers = self->_eventRecognizers;
  self->_eventRecognizers = v14;

  v16 = (BKHIDEventDispatcher *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventDispatcher"));
  eventDispatcher = self->_eventDispatcher;
  self->_eventDispatcher = v16;

  v18 = (BKHIDSystemInterfacing *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "systemInterface"));
  eventSystemInterface = self->_eventSystemInterface;
  self->_eventSystemInterface = v18;

  v20 = (BKHIDEventProcessorRegistering *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eventProcessorRegistry"));
  eventProcessorRegistry = self->_eventProcessorRegistry;
  self->_eventProcessorRegistry = v20;

  v22 = (BKDisplayController *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance"));
  displayController = self->_displayController;
  self->_displayController = v22;

  v24 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue(-[BKDisplayController addDisplayBlankingObserver:](self->_displayController, "addDisplayBlankingObserver:", self));
  displayBlankingObservationAssertion = self->_displayBlankingObservationAssertion;
  self->_displayBlankingObservationAssertion = v24;

  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = (NSString *)CFSTR("US");

  v27 = &_dispatch_main_q;
  v54[0] = CFSTR("DeviceUsagePage");
  v54[1] = CFSTR("DeviceUsage");
  *(_QWORD *)&buf = &off_1000F73C0;
  *((_QWORD *)&buf + 1) = &off_1000F73D8;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &buf, v54, 2));
  v29 = objc_alloc((Class)BKIOHIDServiceMatcher);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceMatcherDataProvider"));
  v31 = (BKIOHIDServiceMatcher *)objc_msgSend(v29, "initWithMatchingDictionary:dataProvider:", v28, v30);
  keyboardServiceMatcher = self->_keyboardServiceMatcher;
  self->_keyboardServiceMatcher = v31;

  -[BKIOHIDServiceMatcher startObserving:queue:](self->_keyboardServiceMatcher, "startObserving:queue:", self, &_dispatch_main_q);
  v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  keyDownToEventSequence = self->_keyDownToEventSequence;
  self->_keyDownToEventSequence = v33;

  v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  senderIDToKeysDown = self->_senderIDToKeysDown;
  self->_senderIDToKeysDown = v35;

  v37 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  senderIDsWithModifiersOnly = self->_senderIDsWithModifiersOnly;
  self->_senderIDsWithModifiersOnly = v37;

  v39 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  downModifierKeys = self->_downModifierKeys;
  self->_downModifierKeys = v39;

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](BKSDefaults, "externalDefaults"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "keyboardDefaults"));

  v43 = BKLogKeyboard(objc_msgSend(v42, "migrateIfNeeded"));
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v42;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "external defaults: %@", (uint8_t *)&buf, 0xCu);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "modifierKeyRemapping"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100052F14;
  v51[3] = &unk_1000ECD80;
  v46 = v42;
  v52 = v46;
  v53 = self;
  v47 = objc_msgSend(v46, "observeDefault:onQueue:withBlock:", v45, &_dispatch_main_q, v51);

  objc_storeStrong((id *)&self->_server, a4);
  -[BKHIDDomainServiceServer activate](self->_server, "activate");
  objc_initWeak((id *)&buf, self);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100052FC0;
  v49[3] = &unk_1000EC208;
  objc_copyWeak(&v50, (id *)&buf);
  v48 = (id)BSLogAddStateCaptureBlockWithTitle(&_dispatch_main_q, CFSTR("BKKeyboards"), v49);
  objc_destroyWeak(&v50);
  objc_destroyWeak((id *)&buf);

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSMutableArray *eventRecognizers;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
  v5 = objc_msgSend(v3, "eventProcessorOfClass:", objc_opt_class(BKHIDEventRecognizerEngine, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  eventRecognizers = self->_eventRecognizers;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052F08;
  v10[3] = &unk_1000EAD70;
  v11 = v6;
  v8 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](eventRecognizers, "enumerateObjectsUsingBlock:", v10);
  -[BKIOHIDServiceMatcher invalidate](self->_keyboardServiceMatcher, "invalidate");

  v9.receiver = self;
  v9.super_class = (Class)BKKeyboardHIDEventProcessor;
  -[BKKeyboardHIDEventProcessor dealloc](&v9, "dealloc");
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return (NSString *)v3;
}

- (int)eventSourceForSender:(id)a3
{
  BKKeyboardHIDEventProcessor *v3;
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v7;
  void *v8;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = v3->_allKeyboardsBySenderID;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "senderID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](allKeyboardsBySenderID, "objectForKeyedSubscript:", v7));
  LODWORD(v3) = -[BKKeyboardHIDEventProcessor _eventSourceForKeyboardInfo:sender:](v3, "_eventSourceForKeyboardInfo:sender:", v8, v5);

  os_unfair_lock_unlock(p_lock);
  return (int)v3;
}

- (void)setCapsLockLightOn:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_primaryKeyboardInfo)
  {
    -[BKKeyboardHIDEventProcessor _lock_setCapsLockState:forKeyboard:](self, "_lock_setCapsLockState:forKeyboard:", v3);
  }
  else
  {
    v7 = BKLogKeyboard(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "can't set caps lock state; no keyboards attached",
        v9,
        2u);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)keyboardLayout
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = -[NSString copy](self->_keyboardLayout, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)setKeyboardLayout:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *keyboardLayout;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  BKKeyboardHIDEventProcessor *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;

  v5 = a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("keyboardLayout != ((void *)0)")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v18 = (objc_class *)objc_opt_class(self, v17);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138544642;
      v27 = v16;
      v28 = 2114;
      v29 = v20;
      v30 = 2048;
      v31 = self;
      v32 = 2114;
      v33 = CFSTR("BKKeyboardHIDEventProcessor.m");
      v34 = 1024;
      v35 = 391;
      v36 = 2114;
      v37 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
    __break(0);
    JUMPOUT(0x10004DD4CLL);
  }
  v6 = v5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = (NSString *)objc_msgSend(v6, "copy");
  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = v7;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_allKeyboardsBySenderID, "allValues"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        sub_1000792C0(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13), v6);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  -[BKKeyboardHIDEventProcessor _lock_publishUsableKeyboardsToServiceConnections](self, "_lock_publishUsableKeyboardsToServiceConnections");
  os_unfair_lock_unlock(&self->_lock);

}

- (int64_t)activeModifiers
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = -[BKKeyboardHIDEventProcessor _lock_activeModifiers](self, "_lock_activeModifiers");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)addGlobalKeyboardObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  uint64_t v6;
  BSCompoundAssertion *keyboardObserverAssertion;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  id v10;
  void *v11;
  void *v12;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  keyboardObserverAssertion = self->_keyboardObserverAssertion;
  if (!keyboardObserverAssertion)
  {
    v8 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("backboardd.keyboards.global-observers")));
    v9 = self->_keyboardObserverAssertion;
    self->_keyboardObserverAssertion = v8;

    keyboardObserverAssertion = self->_keyboardObserverAssertion;
  }
  v10 = objc_msgSend((id)objc_opt_class(v5, v6), "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion acquireForReason:withContext:](keyboardObserverAssertion, "acquireForReason:withContext:", v11, v5));

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (void)setKeyCommandsToAuthenticate:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *keyCommandsToAuthenticate;
  NSMutableSet *v6;

  v6 = (NSMutableSet *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_keyCommandsToAuthenticate != v6)
  {
    v4 = (NSMutableSet *)-[NSMutableSet copy](v6, "copy");
    keyCommandsToAuthenticate = self->_keyCommandsToAuthenticate;
    self->_keyCommandsToAuthenticate = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)keyboardLanguageForSenderID:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v7));

  if (v8)
    v9 = (void *)v8[7];
  else
    v9 = 0;
  v10 = v9;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)setKeyboardLayout:(id)a3 forSenderID:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  BKKeyboardHIDEventProcessor *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;

  v18 = a3;
  if (!v18)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("keyboardLayout != ((void *)0)"), 0));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v15 = (objc_class *)objc_opt_class(self, v14);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138544642;
      v20 = v13;
      v21 = 2114;
      v22 = v17;
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = CFSTR("BKKeyboardHIDEventProcessor.m");
      v27 = 1024;
      v28 = 457;
      v29 = 2114;
      v30 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    __break(0);
    JUMPOUT(0x10004E114);
  }
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v9));

  sub_1000792C0((uint64_t)v10, v18);
  os_unfair_lock_unlock(p_lock);

}

- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3 forSenderID:(unint64_t)a4
{
  _BOOL4 v5;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v9;
  id v10;

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v9));

  if (v10)
  {
    if (v5)
      -[BKKeyboardHIDEventProcessor _lock_setCapsLockState:forKeyboard:](self, "_lock_setCapsLockState:forKeyboard:", 0, v10);
    sub_1000793E4((uint64_t)v10, v5);
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)setCapsLockDelayOverride:(double)a3 forSenderID:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v9;
  id v10;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v9));

  sub_1000794A4((uint64_t)v10, a3);
  os_unfair_lock_unlock(p_lock);

}

- (void)setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4
{
  _BOOL8 v5;
  os_unfair_lock_s *p_lock;

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BKKeyboardHIDEventProcessor _lock_setCapsLockActive:onSenderID:](self, "_lock_setCapsLockActive:onSenderID:", v5, a4);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCapsLockLightOnForSenderID:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v7;
  _BYTE *v8;
  BOOL v9;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v7));

  if (v8)
    v9 = v8[8] != 0;
  else
    v9 = 0;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)keyboardWantsStandardTypeOverrideForSenderID:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (a3)
  {
    allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v8 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v7));

    if (v8)
      LOBYTE(v9) = v8[13] != 0;
    else
      LOBYTE(v9) = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_allKeyboardsBySenderID, "allValues", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (v12 && *(_BYTE *)(v12 + 13))
          {
            LOBYTE(v9) = 1;
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
LABEL_15:

  os_unfair_lock_unlock(p_lock);
  return (char)v9;
}

- (id)devicePropertiesForSenderID:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  unsigned int v7;
  BKKeyboardInfo *v8;
  id v9;
  void *v10;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v12;
  _QWORD v14[5];

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDAccessibilitySender accessibilityHIDServices](BKHIDAccessibilitySender, "accessibilityHIDServices"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100052ED8;
    v14[3] = &unk_1000EAD90;
    v14[4] = a3;
    v7 = objc_msgSend(v6, "bs_containsObjectPassingTest:", v14);

    if (!v7)
    {
      allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
      v8 = (BKKeyboardInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v12));

      if (v8)
        goto LABEL_4;
LABEL_6:
      v10 = 0;
      goto LABEL_7;
    }
  }
  v8 = self->_primaryKeyboardInfo;
  if (!v8)
    goto LABEL_6;
LABEL_4:
  v9 = sub_1000795E8(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_7:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (NSArray)allUsableDeviceProperties
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray bs_map:](self->_usableKeyboards, "bs_map:", &stru_1000EADD0));
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_usableKeyboards;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        sub_1000793E4(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), v3);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setCapsLockDelayOverride:(double)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_usableKeyboards;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        sub_1000794A4(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), a3);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setStandardType:(unsigned int)a3 forSenderID:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  uint64_t v19;
  void *v20;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v18 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v9));

  if (v18 && *((_DWORD *)v18 + 4) != a3)
  {
    *((_DWORD *)v18 + 4) = a3;
    v10 = v18[3];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v18 + 4)));
    objc_msgSend(v10, "setProperty:forKey:", v11, CFSTR("StandardType"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    v13 = sub_100078D10((uint64_t)v18);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)v14;
    if (v14)
    {
      v19 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v18 + 4)));
      v20 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      objc_msgSend(v12, "setKeyboardTypeRemap:", v17);

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)isCapsLockLightOn
{
  BKKeyboardHIDEventProcessor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = -[BKKeyboardHIDEventProcessor _lock_anyKeyboardHasCapsLockActive](v2, "_lock_anyKeyboardHasCapsLockActive");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  os_unfair_lock_s *p_lock;
  BKKeyboardInfo *primaryKeyboardInfo;
  BOOL capsLockKeyHasLanguageSwitchLabel;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  primaryKeyboardInfo = self->_primaryKeyboardInfo;
  if (primaryKeyboardInfo)
    capsLockKeyHasLanguageSwitchLabel = primaryKeyboardInfo->_capsLockKeyHasLanguageSwitchLabel;
  else
    capsLockKeyHasLanguageSwitchLabel = 0;
  os_unfair_lock_unlock(p_lock);
  return capsLockKeyHasLanguageSwitchLabel;
}

- (NSSet)keyCommandsToAuthenticate
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = -[NSMutableSet copy](self->_keyCommandsToAuthenticate, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)_lock_updateGlobalModifierState
{
  int64_t globalActiveModifiers;
  int64_t v4;
  int64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  globalActiveModifiers = self->_globalActiveModifiers;
  v4 = -[BKKeyboardHIDEventProcessor _lock_activeModifiers](self, "_lock_activeModifiers");
  if (globalActiveModifiers != v4)
  {
    v5 = v4;
    self->_globalActiveModifiers = v4;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion context](self->_keyboardObserverAssertion, "context", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v11, "globalKeyboardModifiersDidChange:") & 1) != 0)
            objc_msgSend(v11, "globalKeyboardModifiersDidChange:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (int64_t)_lock_activeModifiers
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray bs_reduce:block:](self->_usableKeyboards, "bs_reduce:block:", &off_1000F73A8, &stru_1000EAE10));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (BOOL)_lock_anyKeyboardHasCapsLockActive
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_usableKeyboards;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (v6 && *(_BYTE *)(v6 + 8))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)_lock_setKeyboardLightsSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_usableKeyboards;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = !v3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10);
        if (v11 && *(_BYTE *)(v11 + 8))
          objc_msgSend(*(id *)(v11 + 24), "setElementValue:forUsagePage:usage:", v9, 8, 2, (_QWORD)v12);
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_lock_keyboardsDetected:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  _QWORD v6[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052C2C;
  v6[3] = &unk_1000EAE38;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void)_lock_keyboardRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  int64_t v15;
  id v16;
  void *v17;
  int v18;
  id v19;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "senderID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_allKeyboardsBySenderID, "objectForKeyedSubscript:", v5));
  v7 = BKLogKeyboard(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v18 = 138543362;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Keyboard detached: %{public}@", (uint8_t *)&v18, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyForKey:", CFSTR("VendorID")));
    v11 = objc_msgSend(v10, "unsignedIntValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyForKey:", CFSTR("ProductID")));
    v13 = sub_100052828(v11, (int)objc_msgSend(v12, "unsignedIntValue"));

    if (v13)
    {
      v15 = self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen - 1;
      self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen = v15;
      if (!v15)
      {
        v16 = -[BKHIDEventProcessorRegistering eventProcessorOfClass:](self->_eventProcessorRegistry, "eventProcessorOfClass:", objc_opt_class(BKSmartCoverHIDEventProcessor, v14));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        objc_msgSend(v17, "setAttachedCoverRequiresWorkaroundForOpenState:", 0);

      }
    }
    -[BKKeyboardHIDEventProcessor _lock_stopWatchingForGestures:](self, "_lock_stopWatchingForGestures:", v6);
    -[BKKeyboardHIDEventProcessor _lock_usableKeyboardDetached:](self, "_lock_usableKeyboardDetached:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_allKeyboardsBySenderID, "removeObjectForKey:", v5);
  }
  else
  {
    if (v9)
    {
      v18 = 138543362;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Keyboard not found for IOHIDService: %{public}@", (uint8_t *)&v18, 0xCu);
    }

  }
}

- (void)_lock_setPrimaryKeyboard:(id)a3
{
  BKKeyboardInfo *v5;
  BKKeyboardInfo *v6;
  unsigned int keyboardType;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  NSString *keyboardLayout;
  __GSKeyboard *gsKeyboard;
  _DWORD v15[2];
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  __GSKeyboard *v21;

  v5 = (BKKeyboardInfo *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v6 = self->_primaryKeyboardInfo;
  if (v6 != v5)
  {
    objc_storeStrong((id *)&self->_primaryKeyboardInfo, a3);
    if (v5)
    {
      sub_1000792C0((uint64_t)v5, self->_keyboardLayout);
      keyboardType = v5->_keyboardType;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5->_countryCode));
      v9 = GSKeyboardSetHardwareKeyboardAttached(v5->_gsKeyboard, 1);
      v10 = BKLogKeyboard(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v8, "unsignedIntValue");
        keyboardLayout = self->_keyboardLayout;
        gsKeyboard = v5->_gsKeyboard;
        v15[0] = 67109890;
        v15[1] = v12;
        v16 = 1024;
        v17 = keyboardType;
        v18 = 2114;
        v19 = keyboardLayout;
        v20 = 2048;
        v21 = gsKeyboard;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Hardware keyboard attached (countryCode:%d type:%d layout:%{public}@) GS:%p", (uint8_t *)v15, 0x22u);
      }

    }
    else if (v6)
    {
      GSKeyboardSetHardwareKeyboardAttached(v6->_gsKeyboard, 0);
    }
  }

}

- (void)_lock_restoreCapsLockStateToKeyboard:(id)a3
{
  id *v4;
  int v5;
  id *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableDictionary *productIdentifierWithCapsLockActiveToGeneration;
  void *v13;
  id *v14;

  v4 = (id *)a3;
  if (v4)
  {
    v14 = v4;
    v5 = sub_100079078(v4);
    v6 = v14;
    if (v5)
    {
      if (!*((_BYTE *)v14 + 9))
      {
        v7 = objc_msgSend(v14[3], "isVirtualService");
        v6 = v14;
        if ((v7 & 1) == 0)
        {
          v8 = sub_1000795CC(v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          if (v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_productIdentifierWithCapsLockActiveToGeneration, "objectForKey:", v9));

            if (v10)
            {
              v11 = v14[3];
              -[BKKeyboardHIDEventProcessor _lock_setCapsLockActive:onSenderID:](self, "_lock_setCapsLockActive:onSenderID:", 1, objc_msgSend(v11, "senderID"));

              productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14[11]));
              -[NSMutableDictionary setObject:forKey:](productIdentifierWithCapsLockActiveToGeneration, "setObject:forKey:", v13, v9);

LABEL_10:
              v4 = v14;
              goto LABEL_11;
            }
          }

          v6 = v14;
        }
      }
    }
    objc_msgSend(v6[3], "setElementValue:forUsagePage:usage:", 0, 8, 2);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_lock_publishUsableKeyboards:(id)a3 toServiceConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *lock_keyboardPublicationSeed;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v6 = a3;
  v7 = a4;
  if ((-[BKHIDDomainServiceServer responsePendingForConnection:](self->_server, "responsePendingForConnection:", v7) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer didRespondBlockForConnection:](self->_server, "didRespondBlockForConnection:", v7));
    lock_keyboardPublicationSeed = (void *)self->_lock_keyboardPublicationSeed;
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteTarget"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000526E8;
    v12[3] = &unk_1000EAE80;
    objc_copyWeak(v15, &location);
    v11 = v8;
    v14 = v11;
    v15[1] = lock_keyboardPublicationSeed;
    v13 = v7;
    objc_msgSend(v10, "setConnectedKeyboards:withReply:", v6, v12);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);

  }
}

- (void)_lock_publishUsableKeyboardsToServiceConnections
{
  void *v3;
  BKHIDDomainServiceServer *server;
  id v5;
  _QWORD v6[5];
  id v7;

  ++self->_lock_keyboardPublicationSeed;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray bs_map:](self->_usableKeyboards, "bs_map:", &stru_1000EAEA0));
  server = self->_server;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052694;
  v6[3] = &unk_1000EAEC8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[BKHIDDomainServiceServer enumerateUserInfoWithBlock:](server, "enumerateUserInfoWithBlock:", v6);

}

- (void)_lock_usableKeyboardAttached:(id)a3
{
  _QWORD *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  int64_t keyboardGeneration;
  int64_t v9;
  void *v10;
  id v11;
  int v12;
  _QWORD *v13;

  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_usableKeyboards, "containsObject:", v4);
  if ((v5 & 1) == 0)
  {
    v6 = BKLogKeyboard(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Usable keyboard attached: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    keyboardGeneration = self->_keyboardGeneration;
    if (keyboardGeneration >= 0)
      v9 = keyboardGeneration + 1;
    else
      v9 = 1;
    self->_keyboardGeneration = v9;
    if (v4)
      v4[11] = v9;
    -[NSMutableArray addObject:](self->_usableKeyboards, "addObject:", v4);
    if (!self->_primaryKeyboardInfo)
      -[BKKeyboardHIDEventProcessor _lock_setPrimaryKeyboard:](self, "_lock_setPrimaryKeyboard:", v4);
    if (self->_keyboardLayout)
    {
      v10 = v4 ? (void *)v4[6] : 0;
      v11 = v10;

      if (!v11)
        sub_1000792C0((uint64_t)v4, self->_keyboardLayout);
    }
    -[BKKeyboardHIDEventProcessor _lock_restoreCapsLockStateToKeyboard:](self, "_lock_restoreCapsLockStateToKeyboard:", v4);
    -[BKKeyboardHIDEventProcessor _lock_publishUsableKeyboardsToServiceConnections](self, "_lock_publishUsableKeyboardsToServiceConnections");
    if (v4 && *((_BYTE *)v4 + 14))
      BKLogEvent(655361);
  }

}

- (void)_lock_addModifierKeyDown:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_100059BA4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "modifier key down: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableSet addObject:](self->_downModifierKeys, "addObject:", v4);
}

- (void)_lock_removeModifierKeyDown:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_100059BA4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "modifier key up: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableSet removeObject:](self->_downModifierKeys, "removeObject:", v4);
}

- (void)_lock_removeSenderIDFromTracking:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_keyDownToEventSequence, "allKeys"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v9);
        if (v10)
          v11 = *(_QWORD *)(v10 + 8);
        else
          v11 = 0;
        if (v11 == a3)
          -[NSMutableDictionary removeObjectForKey:](self->_keyDownToEventSequence, "removeObjectForKey:");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v7 = v12;
    }
    while (v12);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = -[NSMutableSet copy](self->_downModifierKeys, "copy", 0);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v17);
        if (v18)
          v19 = *(_QWORD *)(v18 + 8);
        else
          v19 = 0;
        if (v19 == a3)
          -[BKKeyboardHIDEventProcessor _lock_removeModifierKeyDown:](self, "_lock_removeModifierKeyDown:");
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      v15 = v20;
    }
    while (v20);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableSet removeObject:](self->_senderIDsWithModifiersOnly, "removeObject:", v21);
  -[NSMutableDictionary removeObjectForKey:](self->_senderIDToKeysDown, "removeObjectForKey:", v21);

}

- (void)_lock_removeCapsLockEntryIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_time_t v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = sub_1000795CC(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_productIdentifierWithCapsLockActiveToGeneration, "objectForKeyedSubscript:", v5));
    v7 = objc_msgSend(v6, "integerValue");

    if (v7)
    {
      v8 = dispatch_time(0, 30000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005262C;
      block[3] = &unk_1000EB798;
      block[4] = self;
      v10 = v5;
      v11 = v7;
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)_lock_usableKeyboardDetached:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id *v12;

  v4 = (id *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[BKKeyboardHIDEventProcessor _lock_removeCapsLockEntryIfNeeded:](self, "_lock_removeCapsLockEntryIfNeeded:", v4);
  v5 = -[NSMutableArray containsObject:](self->_usableKeyboards, "containsObject:", v4);
  if ((_DWORD)v5)
  {
    v6 = BKLogKeyboard(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Usable keyboard detached: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    -[NSMutableArray removeObject:](self->_usableKeyboards, "removeObject:", v4);
    if (v4)
      v8 = v4[3];
    else
      v8 = 0;
    v9 = v8;
    -[BKKeyboardHIDEventProcessor _lock_removeSenderIDFromTracking:](self, "_lock_removeSenderIDFromTracking:", objc_msgSend(v9, "senderID"));

    if (-[BKKeyboardInfo isEqual:](self->_primaryKeyboardInfo, "isEqual:", v4))
    {
      -[BKKeyboardHIDEventProcessor _lock_setPrimaryKeyboard:](self, "_lock_setPrimaryKeyboard:", 0);
      if (-[NSMutableArray count](self->_usableKeyboards, "count"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_usableKeyboards, "firstObject"));
        -[BKKeyboardHIDEventProcessor _lock_setPrimaryKeyboard:](self, "_lock_setPrimaryKeyboard:", v10);

      }
    }
    -[BKKeyboardHIDEventProcessor _lock_publishUsableKeyboardsToServiceConnections](self, "_lock_publishUsableKeyboardsToServiceConnections");
    if (v4 && *((_BYTE *)v4 + 14))
    {
      objc_msgSend(v4[3], "setElementValue:forUsagePage:usage:", 0, 8, 2);
      BKLogEvent(655360);
    }
  }

}

- (void)_lock_cancelKeyDownEvents:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  NSMutableDictionary *keyDownToEventSequence;
  _QWORD v10[6];

  v4 = a3;
  v5 = mach_absolute_time();
  if (v4)
    v6 = (void *)v4[3];
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "senderID");
  keyDownToEventSequence = self->_keyDownToEventSequence;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052554;
  v10[3] = &unk_1000EAEE8;
  v10[4] = v8;
  v10[5] = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyDownToEventSequence, "enumerateKeysAndObjectsUsingBlock:", v10);
  -[BKKeyboardHIDEventProcessor _lock_removeSenderIDFromTracking:](self, "_lock_removeSenderIDFromTracking:", v8);
}

- (int)_eventSourceForKeyboardInfo:(id)a3 sender:(id)a4
{
  if (!a3)
    return objc_msgSend(a4, "eventSource");
  if (objc_msgSend(a4, "isAuthenticated"))
    return 3;
  return 1;
}

- (void)_lock_handleUnicodeEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v12;
  void *v13;
  _BKKeyboardEventExtras *v14;
  unsigned int v15;
  void *v16;
  id v17;

  p_lock = &self->_lock;
  v9 = a5;
  v10 = a4;
  os_unfair_lock_assert_owner(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "senderID")));
  v17 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](allKeyboardsBySenderID, "objectForKeyedSubscript:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDSystemInterfacing deliveryManager](self->_eventSystemInterface, "deliveryManager"));
  v14 = objc_alloc_init(_BKKeyboardEventExtras);
  v15 = -[BKKeyboardHIDEventProcessor _eventSourceForKeyboardInfo:sender:](self, "_eventSourceForKeyboardInfo:sender:", v17, v10);
  if (v14)
    v14->_eventSource = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sequenceForFirstEvent:sender:processor:dispatcher:additionalContext:", a3, v10, self, v9, v14));

  objc_msgSend(v16, "postEvent:position:additionalContext:", a3, 1, v14);
}

- (void)_lock_applyDeliveryInformation:(id)a3 resolution:(id)a4 toEvent:(__IOHIDEvent *)a5
{
  unsigned int *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[6];
  uint8_t buf[4];
  unsigned int *v22;

  v8 = (unsigned int *)a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventKeyboardAttributes baseAttributesFromProvider:](BKSHIDEventKeyboardAttributes, "baseAttributesFromProvider:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDSystemInterfacing deliveryManager](self->_eventSystemInterface, "deliveryManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authenticationOriginator"));
  if (v8)
  {
    if (*((_BYTE *)v8 + 8))
      objc_msgSend(v10, "setOptions:", 128);
    objc_msgSend(v10, "setSource:", v8[3]);
    objc_msgSend(v10, "setGSModifierState:", v8[4]);
    v13 = *((id *)v8 + 3);
    if (v13 && IOHIDEventGetIntegerValue(a5, 196610))
    {
      v14 = objc_msgSend(v13, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDSystemInterfacing clientConnectionManager](self->_eventSystemInterface, "clientConnectionManager"));
      v16 = objc_msgSend(v15, "versionedPIDForPID:", objc_msgSend(v9, "pid"));

      if (v16 == (id)-1)
      {
        v19 = BKLogKeyboard(v17);
        v18 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "invalid audit token for destination:%{public}@", buf, 0xCu);
        }
      }
      else
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000524E0;
        v20[3] = &unk_1000EAF08;
        v20[4] = v14;
        v20[5] = v16;
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buildMessage:", v20));
        objc_msgSend(v10, "setAuthenticationMessage:", v18);
      }

    }
  }
  else
  {
    objc_msgSend(v10, "setSource:", 0);
    objc_msgSend(v10, "setGSModifierState:", 0);
    v13 = 0;
  }
  BKSHIDEventSetAttributes(a5, v10);

}

- (void)_lock_dispatchKeyEvent:(__IOHIDEvent *)a3 keyCommand:(id)a4 keyboardInfo:(id)a5 eventSource:(int)a6 fromSender:(id)a7 dispatcher:(id)a8
{
  id v13;
  uint64_t IntegerValue;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _BKKeyDownKey *v19;
  _BKKeyDownKey *v20;
  id v21;
  BKKeyboardHIDEventProcessor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  __IOHIDEvent *v28;
  void *v29;
  _BKKeyboardEventExtras *v30;
  _BKKeyboardEventExtras *v31;
  id ModifierState;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSMutableSet *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *i;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _BKKeyDownKey *v50;
  void *v52;
  id v53;
  void *v54;
  id v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  __IOHIDEvent *v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  _BKKeyDownKey *v69;

  v53 = a4;
  v56 = a5;
  v13 = a7;
  v55 = a8;
  v57 = objc_claimAutoreleasedReturnValue(-[BKHIDSystemInterfacing deliveryManager](self->_eventSystemInterface, "deliveryManager"));
  IntegerValue = IOHIDEventGetIntegerValue(a3, 196608);
  v15 = IOHIDEventGetIntegerValue(a3, 196609);
  v60 = a3;
  v16 = IOHIDEventGetIntegerValue(a3, 196610);
  v61 = v13;
  v17 = objc_msgSend(v13, "senderID");
  v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v17));
  objc_opt_self(_BKKeyDownKey);
  v19 = objc_alloc_init(_BKKeyDownKey);
  v19->_senderID = (unint64_t)v17;
  v19->_page = IntegerValue;
  v19->_usage = v15;
  v20 = v19;
  v58 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_keyDownToEventSequence, "objectForKey:"));
  v21 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_senderIDToKeysDown, "objectForKey:", v18));
  v62 = v16;
  if (!+[BKSHIDEventKeyCommand _isModifierKeyWithPage:usage:](BKSHIDEventKeyCommand, "_isModifierKeyWithPage:usage:", IntegerValue, v15))
  {
    v22 = self;
    v23 = (void *)v18;
    -[NSMutableSet removeObject:](self->_senderIDsWithModifiersOnly, "removeObject:", v18);
    v25 = v53;
    v24 = v55;
    v27 = v56;
    v26 = (void *)v57;
    if (v16)
      goto LABEL_7;
LABEL_11:
    v54 = v21;
    objc_msgSend(v21, "removeObject:", v20);
    v28 = v60;
    goto LABEL_12;
  }
  v22 = self;
  v23 = (void *)v18;
  if (!objc_msgSend(v21, "count"))
    -[NSMutableSet addObject:](self->_senderIDsWithModifiersOnly, "addObject:", v18);
  v25 = v53;
  v24 = v55;
  v26 = (void *)v57;
  if (!v16)
  {
    -[BKKeyboardHIDEventProcessor _lock_removeModifierKeyDown:](self, "_lock_removeModifierKeyDown:", v20);
    v27 = v56;
    goto LABEL_11;
  }
  -[BKKeyboardHIDEventProcessor _lock_addModifierKeyDown:](self, "_lock_addModifierKeyDown:", v20);
  v27 = v56;
LABEL_7:
  v28 = v60;
  if (!v21)
  {
    v21 = objc_alloc_init((Class)NSMutableSet);
    -[NSMutableDictionary setObject:forKey:](v22->_senderIDToKeysDown, "setObject:forKey:", v21, v23);
  }
  v54 = v21;
  objc_msgSend(v21, "addObject:", v20);
LABEL_12:
  v29 = (void *)v58;
  v30 = objc_alloc_init(_BKKeyboardEventExtras);
  v31 = v30;
  if (v30)
  {
    v30->_eventSource = a6;
    ModifierState = -[NSMutableSet containsObject:](v22->_senderIDsWithModifiersOnly, "containsObject:", v23);
    v31->_modifiersOnly = (char)ModifierState;
    if (!v27)
      goto LABEL_17;
  }
  else
  {
    ModifierState = -[NSMutableSet containsObject:](v22->_senderIDsWithModifiersOnly, "containsObject:", v23);
    if (!v27)
      goto LABEL_17;
  }
  ModifierState = (id)v27[10];
  if (ModifierState)
  {
    ModifierState = (id)GSKeyboardGetModifierState();
    if (v31)
      v31->_GSModifierState = ModifierState;
  }
LABEL_17:
  if (v58)
  {
    if (v62)
      v33 = 2;
    else
      v33 = 3;
    goto LABEL_47;
  }
  if (v62)
  {
    if (!v25)
      goto LABEL_37;
  }
  else
  {
    v34 = BKLogKeyboard(ModifierState);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v69 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "missing a sequence for %{public}@", buf, 0xCu);
    }

    v28 = v60;
    if (!v25)
      goto LABEL_37;
  }
  v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sequenceForKeyCommand:sender:processor:dispatcher:additionalContext:", v25, v61, v22, v24, v31));
  if (v36)
  {
    v29 = (void *)v36;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v37 = v22->_keyCommandsToAuthenticate;
    v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v38)
    {
      v39 = v38;
      v50 = v20;
      v52 = v23;
      v59 = v29;
      v40 = v25;
      v41 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v41)
            objc_enumerationMutation(v37);
          v43 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "keyCommand", v50));
          if (objc_msgSend(v44, "describes:", v40) == (id)3)
          {
            if (v31)
              objc_storeStrong((id *)&v31->_authenticationSpecification, v43);

            goto LABEL_41;
          }

        }
        v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        if (v39)
          continue;
        break;
      }
LABEL_41:

      v25 = v40;
      v24 = v55;
      v27 = v56;
      v26 = (void *)v57;
      v29 = v59;
      v20 = v50;
      v23 = v52;
    }
    else
    {

      v26 = (void *)v57;
    }
    v28 = v60;
    goto LABEL_44;
  }
LABEL_37:
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sequenceForFirstEvent:sender:processor:dispatcher:additionalContext:", v28, v61, v22, v24, v31));
LABEL_44:
  -[NSMutableDictionary setObject:forKey:](v22->_keyDownToEventSequence, "setObject:forKey:", v29, v20);
  if (v62)
    v33 = 1;
  else
    v33 = 3;
LABEL_47:
  objc_msgSend(v29, "postEvent:position:additionalContext:", v28, v33, v31);
  if (v29 && !v62)
    -[NSMutableDictionary removeObjectForKey:](v22->_keyDownToEventSequence, "removeObjectForKey:", v20);
  v45 = sub_100059BA4();
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    v47 = objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", v22->_keyDownToEventSequence));
    v48 = v23;
    v49 = (void *)v47;
    *(_DWORD *)buf = 138543362;
    v69 = (_BKKeyDownKey *)v47;
    _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "keys down: %{public}@", buf, 0xCu);

    v23 = v48;
  }

}

- (void)_lock_handleKeyEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5 bypassCapsLockChecks:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  BKKeyboardInfo *v13;
  BKKeyboardInfo *primaryKeyboardInfo;
  BKKeyboardInfo *v15;
  uint64_t IntegerValue;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  __GSKeyboard *gsKeyboard;
  void *v21;
  void *v22;
  id v23;
  BKKeyboardInfo *v24;
  int64_t v25;

  v10 = a4;
  v11 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "senderID")));
  v13 = (BKKeyboardInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_allKeyboardsBySenderID, "objectForKeyedSubscript:", v12));
  primaryKeyboardInfo = v13;
  if (!v13)
    primaryKeyboardInfo = self->_primaryKeyboardInfo;
  v15 = primaryKeyboardInfo;

  IntegerValue = IOHIDEventGetIntegerValue(a3, 196609);
  v17 = IOHIDEventGetIntegerValue(a3, 196610);
  v18 = -[BKKeyboardHIDEventProcessor _eventSourceForKeyboardInfo:sender:](self, "_eventSourceForKeyboardInfo:sender:", v15, v10);
  if (IntegerValue == 57 && v17)
  {
    if (a6)
      goto LABEL_6;
    if (v15 && v15->_capsLockRomanSwitchMode)
    {
      v24 = v15;
      goto LABEL_10;
    }
    if (sub_100079078(v15))
    {
LABEL_6:
      if (v15)
        v19 = !v15->_capsLockOn;
      else
        v19 = 1;
      -[BKKeyboardHIDEventProcessor _lock_setCapsLockState:forKeyboard:](self, "_lock_setCapsLockState:forKeyboard:", v19, v15);
    }
  }
  if (v15)
  {
LABEL_10:
    gsKeyboard = v15->_gsKeyboard;
    goto LABEL_11;
  }
  gsKeyboard = 0;
LABEL_11:
  if (+[BKSHIDEventKeyCommand _shouldMatchKeyCommandsForEvent:gsKeyboard:](BKSHIDEventKeyCommand, "_shouldMatchKeyCommandsForEvent:gsKeyboard:", a3, gsKeyboard))
  {
    v25 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventKeyCommand keyCommandForEvent:gsKeyboard:activeModifiers:](BKSHIDEventKeyCommand, "keyCommandForEvent:gsKeyboard:activeModifiers:", a3, gsKeyboard, &v25));
    if (v15)
      v15->_activeModifiers = v25;
  }
  else
  {
    v21 = 0;
  }

  -[BKKeyboardHIDEventProcessor _lock_dispatchKeyEvent:keyCommand:keyboardInfo:eventSource:fromSender:dispatcher:](self, "_lock_dispatchKeyEvent:keyCommand:keyboardInfo:eventSource:fromSender:dispatcher:", a3, v21, v15, v18, v10, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_senderIDToKeysDown, "objectForKey:", v12));
  v23 = objc_msgSend(v22, "count");

  if (!v23)
    -[NSMutableSet removeObject:](self->_senderIDsWithModifiersOnly, "removeObject:", v12);

}

- (void)_lock_watchForGestures:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id from;
  id location;
  __int16 v36;
  uint64_t Name;

  v4 = (id *)a3;
  v5 = v4;
  if (v4 && *((_BYTE *)v4 + 14))
  {
    v6 = v4[13];
    if (v6)
    {
      v7 = v6;
LABEL_20:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventSequenceRecognizer recognizerForEventDescriptor:](BKHIDEventSequenceRecognizer, "recognizerForEventDescriptor:", v7));
      objc_msgSend(v26, "setShouldConsumeEvents:", 1);
      objc_storeStrong(v5 + 12, v26);
      -[NSMutableArray addObject:](self->_eventRecognizers, "addObject:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
      v29 = objc_msgSend(v27, "eventProcessorOfClass:", objc_opt_class(BKHIDEventRecognizerEngine, v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100052490;
      v31[3] = &unk_1000EAF30;
      objc_copyWeak(&v32, &from);
      objc_copyWeak(&v33, &location);
      objc_msgSend(v30, "addRecognizer:recognitionBlock:", v26, v31);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      goto LABEL_21;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[3], "propertyForKey:", CFSTR("KeyboardEnabledEvent")));
    v10 = objc_opt_class(NSDictionary, v9);
    v11 = v8;
    v12 = v11;
    if (v10)
    {
      if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("EventType")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UsagePage")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Usage")));

    if (v15 && v16 && v17)
    {
      v18 = (unsigned __int16)objc_msgSend(v16, "unsignedIntegerValue");
      v19 = (unsigned __int16)objc_msgSend(v17, "unsignedIntegerValue");
      v20 = objc_msgSend(v15, "unsignedIntegerValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventUsagePairDescriptor descriptorForHIDEventType:page:usage:](BKSHIDEventUsagePairDescriptor, "descriptorForHIDEventType:page:usage:", v20, v18, v19));
      if (v21)
      {
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "descriptorByAddingSenderIDToMatchCriteria:", objc_msgSend(v5[3], "senderID")));
        v23 = v5[13];
        v5[13] = (id)v22;

      }
      else
      {
        v24 = sub_1000599A0();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location) = 67109378;
          HIDWORD(location) = (_DWORD)v20;
          v36 = 2114;
          Name = IOHIDEventTypeGetName(v20);
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "keyboardActivationChangeEventDescriptor: unsupported KeyboardEnabledEvent:EventType %d (%{public}@)", (uint8_t *)&location, 0x12u);
        }

      }
    }

    v7 = v5[13];
    if (v7)
      goto LABEL_20;
  }
LABEL_21:

}

- (void)_lock_stopWatchingForGestures:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = *((id *)a3 + 12);
    if (v4)
    {
      v9 = v4;
      -[NSMutableArray removeObject:](self->_eventRecognizers, "removeObject:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
      v7 = objc_msgSend(v5, "eventProcessorOfClass:", objc_opt_class(BKHIDEventRecognizerEngine, v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      objc_msgSend(v8, "removeRecognizer:", v9);
      v4 = v9;
    }
  }
  else
  {
    v4 = 0;
  }

}

- (void)smartKeyboardAttachmentStateDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKKeyboardHIDEventProcessor _lock_smartKeyboardAttachmentStateDidChange:](self, "_lock_smartKeyboardAttachmentStateDidChange:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_smartKeyboardAttachmentStateDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v6 = BKLogKeyboard(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "smartKeyboardAttachmentStateDidChange:%{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (sub_10007920C((uint64_t)v4))
  {
    -[BKKeyboardHIDEventProcessor _lock_usableKeyboardAttached:](self, "_lock_usableKeyboardAttached:", v4);
  }
  else
  {
    -[BKKeyboardHIDEventProcessor _lock_cancelKeyDownEvents:](self, "_lock_cancelKeyDownEvents:", v4);
    -[BKKeyboardHIDEventProcessor _lock_usableKeyboardDetached:](self, "_lock_usableKeyboardDetached:", v4);
  }

}

- (void)_lock_postSyntheticCapsLockPressForKeyboard:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  const void *KeyboardEvent;
  uint64_t v8;
  const void *v9;
  BKHIDEventDispatcher *v10;
  id v11;

  if (a3)
    v4 = (void *)*((_QWORD *)a3 + 3);
  else
    v4 = 0;
  v11 = v4;
  v5 = objc_msgSend(v11, "senderID");
  v6 = mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(0, v6, 7, 57, 1, 0);
  IOHIDEventSetSenderID(KeyboardEvent, v5);
  v8 = mach_absolute_time();
  v9 = (const void *)IOHIDEventCreateKeyboardEvent(0, v8, 7, 57, 0, 0);
  IOHIDEventSetSenderID(v9, v5);
  v10 = self->_eventDispatcher;
  -[BKKeyboardHIDEventProcessor _lock_handleKeyEvent:fromSender:dispatcher:bypassCapsLockChecks:](self, "_lock_handleKeyEvent:fromSender:dispatcher:bypassCapsLockChecks:", KeyboardEvent, v11, v10, 1);
  -[BKKeyboardHIDEventProcessor _lock_handleKeyEvent:fromSender:dispatcher:bypassCapsLockChecks:](self, "_lock_handleKeyEvent:fromSender:dispatcher:bypassCapsLockChecks:", v9, v11, v10, 1);

  CFRelease(KeyboardEvent);
  CFRelease(v9);

}

- (void)_lock_setCapsLockState:(BOOL)a3 forKeyboard:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *productIdentifierWithCapsLockActiveToGeneration;
  uint64_t v10;
  void *v11;
  _QWORD *v12;

  v4 = a3;
  v6 = a4;
  v12 = v6;
  if (v6 && *((_BYTE *)v6 + 8) != v4)
  {
    *((_BYTE *)v6 + 8) = v4;
    objc_msgSend(*((id *)v6 + 3), "setElementValue:forUsagePage:usage:", v4, 8, 2);
    v6 = v12;
  }
  v7 = sub_1000795CC(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
    if (v4)
    {
      if (v12)
        v10 = v12[11];
      else
        v10 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
      -[NSMutableDictionary setObject:forKey:](productIdentifierWithCapsLockActiveToGeneration, "setObject:forKey:", v11, v8);

    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](productIdentifierWithCapsLockActiveToGeneration, "removeObjectForKey:", v8);
    }
  }

}

- (void)_lock_setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4
{
  _BOOL4 v5;
  NSMutableDictionary *allKeyboardsBySenderID;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  __int16 v24;
  NSObject *v25;

  v5 = a3;
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](allKeyboardsBySenderID, "objectForKey:", v8));

  if (v9)
  {
    if (*(_BYTE *)(v9 + 9))
    {
      v11 = BKLogKeyboard(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v22 = 134217984;
        v23 = a4;
        v13 = "setCapsLockActive: [senderID %llX] the caps lock key is a language switch -- you cannot modify caps lock state";
LABEL_16:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      v15 = sub_100079078((_QWORD *)v9);
      if ((v15 & 1) != 0)
      {
        v16 = CFSTR("off");
        if (v5)
          v16 = CFSTR("active");
        v12 = v16;
        v17 = (*(_BYTE *)(v9 + 8) != 0) ^ v5;
        v18 = BKLogKeyboard(v12);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if ((v17 & 1) != 0)
        {
          if (v20)
          {
            v22 = 134218242;
            v23 = a4;
            v24 = 2114;
            v25 = v12;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "setCapsLockActive: [senderID %llX] set caps lock to %{public}@", (uint8_t *)&v22, 0x16u);
          }

          -[BKKeyboardHIDEventProcessor _lock_postSyntheticCapsLockPressForKeyboard:](self, "_lock_postSyntheticCapsLockPressForKeyboard:", v9);
        }
        else
        {
          if (v20)
          {
            v22 = 134218242;
            v23 = a4;
            v24 = 2114;
            v25 = v12;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "setCapsLockActive: [senderID %llX] caps lock is already %{public}@", (uint8_t *)&v22, 0x16u);
          }

        }
      }
      else
      {
        v21 = BKLogKeyboard(v15);
        v12 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v22 = 134217984;
          v23 = a4;
          v13 = "setCapsLockActive: [senderID %llX] the capslock key on this keyboard has been remapped and there are no "
                "keys mapped to capslock";
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    v14 = BKLogKeyboard(v10);
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = 134217984;
      v23 = a4;
      v13 = "setCapsLockActive: [senderID %llX] no such keyboard";
      goto LABEL_16;
    }
  }

}

- (void)_modifierRemappingsDidChange
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  os_unfair_lock_t lock;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];

  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = BKLogKeyboard(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_modifierRemappingsDidChange", buf, 2u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_usableKeyboards;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (v11)
        {
          if (*(_BYTE *)(v11 + 8))
          {
            v12 = sub_100079078(*(_QWORD **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
            if ((v12 & 1) == 0)
            {
              v13 = BKLogKeyboard(v12);
              v14 = objc_claimAutoreleasedReturnValue(v13);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                v15 = *(id *)(v11 + 24);
                v16 = objc_msgSend(v15, "senderID");
                *(_DWORD *)buf = 134217984;
                v23 = v16;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_modifierRemappingsDidChange: [senderID %llX] capslock unmapped", buf, 0xCu);

              }
              -[BKKeyboardHIDEventProcessor _lock_postSyntheticCapsLockPressForKeyboard:](self, "_lock_postSyntheticCapsLockPressForKeyboard:", v11);
            }
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  int Type;
  os_unfair_lock_s *p_lock;
  uint64_t IntegerValue;
  uint64_t v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v10 = *a3;
  Type = IOHIDEventGetType(*a3);
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (Type == 30)
  {
    -[BKKeyboardHIDEventProcessor _lock_handleUnicodeEvent:fromSender:dispatcher:](self, "_lock_handleUnicodeEvent:fromSender:dispatcher:", v10, v8, v9);
  }
  else
  {
    IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue(v10, 196608);
    v14 = (unsigned __int16)IOHIDEventGetIntegerValue(v10, 196609);
    if ((IntegerValue != 7 || v14 == 102) && !GSKeyboardIsGlobeKeyUsagePair(IntegerValue, v14))
    {
      v15 = 0;
      goto LABEL_8;
    }
    -[BKKeyboardHIDEventProcessor _lock_handleKeyEvent:fromSender:dispatcher:bypassCapsLockChecks:](self, "_lock_handleKeyEvent:fromSender:dispatcher:bypassCapsLockChecks:", v10, v8, v9, 0);
    -[BKKeyboardHIDEventProcessor _lock_updateGlobalModifierState](self, "_lock_updateGlobalModifierState");
  }
  v15 = 1;
LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6
{
  id v11;
  id v12;
  id v13;
  const void *Copy;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t IntegerValue;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t ConciseDescription;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  uint64_t v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  objc_class *v44;
  uint64_t v45;
  NSString *v46;
  void *v47;
  uint64_t v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  void *v52;
  NSString *v53;
  void *v54;
  uint64_t v55;
  objc_class *v56;
  NSString *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  BKKeyboardHIDEventProcessor *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  void *v70;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  Copy = (const void *)IOHIDEventCreateCopy(0, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "display"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_hardwareIdentifier"));
  _BKHIDNoteUserEventOccurredOnDisplay(v16);

  v17 = v11;
  if (!v17)
  {
    v34 = (objc_class *)objc_opt_class(_BKKeyboardEventExtras, v18);
    v35 = NSStringFromClass(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("extras"), v36));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v38 = NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v41 = (objc_class *)objc_opt_class(self, v40);
      v42 = NSStringFromClass(v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      *(_DWORD *)buf = 138544642;
      v60 = v39;
      v61 = 2114;
      v62 = v43;
      v63 = 2048;
      v64 = self;
      v65 = 2114;
      v66 = CFSTR("BKKeyboardHIDEventProcessor.m");
      v67 = 1024;
      v68 = 1382;
      v69 = 2114;
      v70 = v37;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
    __break(0);
    JUMPOUT(0x100051890);
  }
  v19 = v17;
  v20 = objc_opt_class(_BKKeyboardEventExtras, v18);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
  {
    v44 = (objc_class *)objc_msgSend(v19, "classForCoder");
    if (!v44)
      v44 = (objc_class *)objc_opt_class(v19, v45);
    v46 = NSStringFromClass(v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v49 = (objc_class *)objc_opt_class(_BKKeyboardEventExtras, v48);
    v50 = NSStringFromClass(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("extras"), v47, v51));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v53 = NSStringFromSelector(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      v56 = (objc_class *)objc_opt_class(self, v55);
      v57 = NSStringFromClass(v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      *(_DWORD *)buf = 138544642;
      v60 = v54;
      v61 = 2114;
      v62 = v58;
      v63 = 2048;
      v64 = self;
      v65 = 2114;
      v66 = CFSTR("BKKeyboardHIDEventProcessor.m");
      v67 = 1024;
      v68 = 1382;
      v69 = 2114;
      v70 = v52;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v52), "UTF8String"));
    __break(0);
    JUMPOUT(0x1000519CCLL);
  }

  -[BKKeyboardHIDEventProcessor _lock_applyDeliveryInformation:resolution:toEvent:](self, "_lock_applyDeliveryInformation:resolution:toEvent:", v19, v12, Copy);
  IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue(a3, 196608);
  v22 = +[BKSHIDEventKeyCommand _isModifierKeyWithPage:usage:](BKSHIDEventKeyCommand, "_isModifierKeyWithPage:usage:", IntegerValue, (unsigned __int16)IOHIDEventGetIntegerValue(a3, 196609));
  if ((_DWORD)v22)
  {
    v23 = BKLogKeyboard(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      ConciseDescription = BKSHIDEventGetConciseDescription(a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue(ConciseDescription);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", v12));
      *(_DWORD *)buf = 138543618;
      v60 = v26;
      v61 = 2114;
      v62 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ -> %{public}@", buf, 0x16u);

    }
  }
  v28 = sub_100059BA4();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v31 = BKSHIDEventGetConciseDescription(a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", v12));
    *(_DWORD *)buf = 138543618;
    v60 = v32;
    v61 = 2114;
    v62 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%{public}@ -> %{public}@", buf, 0x16u);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dispatcher"));
  objc_msgSend(v30, "postEvent:toDestination:", Copy, v12);

  CFRelease(Copy);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  __IOHIDEvent *v17;
  int Type;
  uint64_t v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a9;
  v17 = *a3;
  Type = IOHIDEventGetType(*a3);
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (Type == 30)
  {
    v19 = 1;
  }
  else if (IOHIDEventGetIntegerValue(v17, 196610))
  {
    v19 = 1;
  }
  else
  {
    v19 = 3;
  }
  objc_msgSend(v15, "postEvent:position:additionalContext:fromBuffer:toResolution:", v17, v19, v13, v14, v16);
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (void)display:(id)a3 didBecomeBlank:(BOOL)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_lock;

  v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BKKeyboardHIDEventProcessor _lock_setKeyboardLightsSuspended:](self, "_lock_setKeyboardLightsSuspended:", v4);
  os_unfair_lock_unlock(p_lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_compactMap:", &stru_1000EAF78));
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDSystemInterfacing senderCache](self->_eventSystemInterface, "senderCache"));
  objc_msgSend(v6, "addSenderInfo:", v5);

  -[BKKeyboardHIDEventProcessor _lock_keyboardsDetected:](self, "_lock_keyboardsDetected:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)serviceDidDisappear:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[BKKeyboardHIDEventProcessor _lock_keyboardRemoved:](self, "_lock_keyboardRemoved:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = objc_msgSend(v5, "appendObject:withName:", self->_keyboardLayout, CFSTR("keyboardLayout"));
  v7 = objc_msgSend(v5, "appendObject:withName:", self->_primaryKeyboardInfo, CFSTR("primaryKeyboard"));
  v8 = objc_msgSend(v5, "appendObject:withName:", self->_usableKeyboards, CFSTR("usableKeyboards"));
  v9 = objc_msgSend(v5, "appendBool:withName:", self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen > 0, CFSTR("StrictWakeHallEffectSensors"));
  v10 = objc_msgSend(v5, "appendObject:withName:", self->_keyDownToEventSequence, CFSTR("keyDownToEventSequence"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100051EE4;
  v11[3] = &unk_1000ECB10;
  v11[4] = self;
  objc_msgSend(v5, "appendCustomFormatWithName:block:", CFSTR("globalActiveModifiers"), v11);

  os_unfair_lock_unlock(p_lock);
}

- (id)setObservingUsableKeyboardConnections:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer currentConnection](self->_server, "currentConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v6));
  v8 = objc_msgSend(v4, "BOOLValue");
  if (v8 == objc_msgSend(v7, "BOOLValue")
    || (-[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:", v4, v6), !v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray bs_map:](self->_usableKeyboards, "bs_map:", &stru_1000EAF98));
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downModifierKeys, 0);
  objc_storeStrong((id *)&self->_primaryKeyboardInfo, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_eventProcessorRegistry, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_eventSystemInterface, 0);
  objc_storeStrong((id *)&self->_keyboardServiceMatcher, 0);
  objc_storeStrong((id *)&self->_productIdentifierWithCapsLockActiveToGeneration, 0);
  objc_storeStrong((id *)&self->_senderIDsWithModifiersOnly, 0);
  objc_storeStrong((id *)&self->_senderIDToKeysDown, 0);
  objc_storeStrong((id *)&self->_keyDownToEventSequence, 0);
  objc_storeStrong((id *)&self->_displayBlankingObservationAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardObserverAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyCommandsToAuthenticate, 0);
  objc_storeStrong((id *)&self->_eventRecognizers, 0);
  objc_storeStrong((id *)&self->_usableKeyboards, 0);
  objc_storeStrong((id *)&self->_allKeyboardsBySenderID, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
