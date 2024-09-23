@implementation CRLTrackerManipulatorCoordinator

- (CRLTrackerManipulatorCoordinator)init
{
  CRLTrackerManipulatorCoordinator *v2;
  NSMutableSet *v3;
  NSMutableSet *mRegisteredTMs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLTrackerManipulatorCoordinator;
  v2 = -[CRLTrackerManipulatorCoordinator init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mRegisteredTMs = v2->mRegisteredTMs;
    v2->mRegisteredTMs = v3;

  }
  return v2;
}

- (void)registerTrackerManipulator:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  if (qword_10147E5C0 != -1)
    dispatch_once(&qword_10147E5C0, &stru_10124F3D0);
  v5 = off_1013DB4F8;
  if (os_log_type_enabled((os_log_t)off_1013DB4F8, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_opt_class(v4, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "registering %@", (uint8_t *)&v11, 0xCu);

  }
  -[NSMutableSet addObject:](self->mRegisteredTMs, "addObject:", v4);

}

- (void)unregisterTrackerManipulator:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  if (qword_10147E5C0 != -1)
    dispatch_once(&qword_10147E5C0, &stru_10124F3F0);
  v5 = off_1013DB4F8;
  if (os_log_type_enabled((os_log_t)off_1013DB4F8, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_opt_class(v4, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "unregistering %@", (uint8_t *)&v11, 0xCu);

  }
  -[NSMutableSet removeObject:](self->mRegisteredTMs, "removeObject:", v4);

}

- (BOOL)hasRegisteredTrackerManipulator:(id)a3
{
  return -[NSMutableSet containsObject:](self->mRegisteredTMs, "containsObject:", a3);
}

- (BOOL)takeControlWithTrackerManipulator:(id)a3
{
  CRLTrackerManipulator *v5;
  CRLTrackerManipulator *v6;
  CRLTrackerManipulator **p_mControllingTM;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  Class v13;
  NSString *v14;
  __CFString *v15;
  CRLTrackerManipulator *v16;
  Class v17;
  NSString *v18;
  __CFString *v19;
  uint64_t v20;
  CRLTrackerManipulator *v21;
  uint64_t v22;
  double v23;
  id v24;
  CRLTrackerManipulator *mControllingTM;
  double v26;
  id v27;
  BOOL v28;
  void *v30;
  uint64_t v31;
  CRLTrackerManipulator *v32;
  Class v33;
  NSString *v34;
  __CFString *v35;
  Class v36;
  NSString *v37;
  __CFString *v38;
  uint8_t buf[4];
  __CFString *v40;
  __int16 v41;
  __CFString *v42;

  v5 = (CRLTrackerManipulator *)a3;
  v6 = v5;
  p_mControllingTM = &self->mControllingTM;
  if (self->mControllingTM != v5)
  {
    if (v5
      && !-[CRLTrackerManipulatorCoordinator hasRegisteredTrackerManipulator:](self, "hasRegisteredTrackerManipulator:", v5))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124F410);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1CE48();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124F430);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1CDA4(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTrackerManipulatorCoordinator takeControlWithTrackerManipulator:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 55, 0, "attempting to take control with an unregistered TM %@", v6);

    }
    if (qword_10147E5C0 != -1)
      dispatch_once(&qword_10147E5C0, &stru_10124F450);
    v11 = off_1013DB4F8;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      if (v6)
      {
        objc_opt_class(v6, v12);
        v14 = NSStringFromClass(v13);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(v14);
      }
      else
      {
        v15 = CFSTR("(null)");
      }
      v16 = *p_mControllingTM;
      if (*p_mControllingTM)
      {
        objc_opt_class(*p_mControllingTM, v12);
        v18 = NSStringFromClass(v17);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(v18);
      }
      else
      {
        v19 = CFSTR("(null)");
      }
      *(_DWORD *)buf = 138412546;
      v40 = v15;
      v41 = 2112;
      v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "attempting to take control with %@ from controllingTM %@", buf, 0x16u);
      if (v16)

      if (v6)
    }

    v21 = *p_mControllingTM;
    if (!*p_mControllingTM || v21 == v6)
      goto LABEL_32;
    if (-[CRLTrackerManipulator allowTrackerManipulatorToTakeControl:](v21, "allowTrackerManipulatorToTakeControl:", v6))
    {
      if ((objc_opt_respondsToSelector(*p_mControllingTM, "didRelinquishControl") & 1) != 0)
        -[CRLTrackerManipulator didRelinquishControl](*p_mControllingTM, "didRelinquishControl");
      *(_QWORD *)&v23 = objc_opt_class(self, v22).n128_u64[0];
      objc_msgSend(v24, "p_removeDynamicSubclass:", self->mControllingTM, v23);
      mControllingTM = self->mControllingTM;
      self->mControllingTM = 0;

LABEL_32:
      *(_QWORD *)&v26 = objc_opt_class(self, v20).n128_u64[0];
      objc_msgSend(v27, "p_dynamicallySubclassGRForNotification:", v6, v26);
      objc_storeStrong((id *)&self->mControllingTM, a3);
      if ((objc_opt_respondsToSelector(self->mControllingTM, "willTakeControl") & 1) != 0)
        -[CRLTrackerManipulator willTakeControl](*p_mControllingTM, "willTakeControl");
      -[CRLTrackerManipulatorCoordinator p_notifyControlChange](self, "p_notifyControlChange");
      goto LABEL_35;
    }
    if (qword_10147E5C0 != -1)
      dispatch_once(&qword_10147E5C0, &stru_10124F470);
    v30 = off_1013DB4F8;
    if (!os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
LABEL_49:

      v28 = 0;
      goto LABEL_36;
    }
    v32 = *p_mControllingTM;
    if (v32)
    {
      objc_opt_class(v32, v31);
      v34 = NSStringFromClass(v33);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue(v34);
      if (v6)
      {
LABEL_42:
        objc_opt_class(v6, v31);
        v37 = NSStringFromClass(v36);
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue(v37);
LABEL_45:
        *(_DWORD *)buf = 138412546;
        v40 = v35;
        v41 = 2112;
        v42 = v38;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_INFO, "ControllingTM %@ will not release control to %@", buf, 0x16u);
        if (v6)

        if (v32)
        goto LABEL_49;
      }
    }
    else
    {
      v35 = CFSTR("(null)");
      if (v6)
        goto LABEL_42;
    }
    v38 = CFSTR("(null)");
    goto LABEL_45;
  }
LABEL_35:
  v28 = 1;
LABEL_36:

  return v28;
}

- (BOOL)relinquishTrackerManipulatorControl:(id)a3
{
  _BOOL4 v3;
  uint64_t v5;
  double v6;
  id v7;
  CRLTrackerManipulator *mControllingTM;
  void *v9;
  CRLTrackerManipulator *v10;
  NSObject *v11;
  uint64_t v12;
  Class v13;
  NSString *v14;
  void *v15;
  int v17;
  void *v18;

  if (self->mControllingTM != a3)
    goto LABEL_2;
  if (objc_msgSend(a3, "allowTrackerManipulatorToTakeControl:", 0))
  {
    if ((objc_opt_respondsToSelector(self->mControllingTM, "didRelinquishControl") & 1) != 0)
      -[CRLTrackerManipulator didRelinquishControl](self->mControllingTM, "didRelinquishControl");
    *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
    objc_msgSend(v7, "p_removeDynamicSubclass:", self->mControllingTM, v6);
    mControllingTM = self->mControllingTM;
    self->mControllingTM = 0;

    -[CRLTrackerManipulatorCoordinator p_notifyControlChange](self, "p_notifyControlChange");
    LOBYTE(v3) = 1;
  }
  else
  {
    if (qword_10147E5C0 != -1)
      dispatch_once(&qword_10147E5C0, &stru_10124F490);
    v9 = off_1013DB4F8;
    v3 = os_log_type_enabled((os_log_t)off_1013DB4F8, OS_LOG_TYPE_INFO);
    if (v3)
    {
      v10 = self->mControllingTM;
      v11 = v9;
      objc_opt_class(v10, v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v17 = 138412290;
      v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ControllingTM %@ will not relinquish control", (uint8_t *)&v17, 0xCu);

LABEL_2:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)operationWillEnd
{
  void *v3;
  CRLTrackerManipulator *mControllingTM;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;

  if (qword_10147E5C0 != -1)
    dispatch_once(&qword_10147E5C0, &stru_10124F4B0);
  v3 = off_1013DB4F8;
  if (os_log_type_enabled((os_log_t)off_1013DB4F8, OS_LOG_TYPE_INFO))
  {
    mControllingTM = self->mControllingTM;
    v5 = v3;
    objc_opt_class(mControllingTM, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "operation will end with controllingTM: %@", buf, 0xCu);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = -[NSMutableSet copy](self->mRegisteredTMs, "copy", 0);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v15, "operationWillEnd") & 1) != 0)
          objc_msgSend(v15, "operationWillEnd");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)operationDidEnd
{
  void *v3;
  CRLTrackerManipulator *mControllingTM;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t *p_mControllingTM;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  Class v22;
  NSString *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;

  if (qword_10147E5C0 != -1)
    dispatch_once(&qword_10147E5C0, &stru_10124F4D0);
  v3 = off_1013DB4F8;
  if (os_log_type_enabled((os_log_t)off_1013DB4F8, OS_LOG_TYPE_INFO))
  {
    mControllingTM = self->mControllingTM;
    v5 = v3;
    objc_opt_class(mControllingTM, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "operation did end with controllingTM: %@", buf, 0xCu);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = -[NSMutableSet copy](self->mRegisteredTMs, "copy");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "operationDidEnd");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  -[NSMutableSet removeAllObjects](self->mRegisteredTMs, "removeAllObjects");
  p_mControllingTM = (uint64_t *)&self->mControllingTM;
  -[CRLTrackerManipulatorCoordinator relinquishTrackerManipulatorControl:](self, "relinquishTrackerManipulatorControl:", self->mControllingTM);
  if (self->mControllingTM)
  {
    v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F4F0);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1CED0(p_mControllingTM, v17, v16);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F510);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1CDA4(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTrackerManipulatorCoordinator operationDidEnd]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"));
    objc_opt_class(*p_mControllingTM, v21);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 126, 0, "Controlling TM %@ would not give up control at the end of an operation", v24);

  }
}

- (void)p_notifyControlChange
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[NSMutableSet copy](self->mRegisteredTMs, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "trackerManipulatorDidTakeControl:") & 1) != 0)
          objc_msgSend(v8, "trackerManipulatorDidTakeControl:", self->mControllingTM);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

+ (void)p_dynamicallySubclassGRForNotification:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *Class;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  Class v24;
  objc_class *ClassPair;
  void *v26;
  uint64_t v27;
  Class v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  Class v32;
  NSString *v33;
  void *v34;

  v4 = a3;
  objc_opt_class(UIGestureRecognizer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    objc_opt_class(CRLTrackerManipulatorCoordinator, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_sync_enter(v9);
    if (!qword_101415390)
    {
      v10 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      v11 = (void *)qword_101415390;
      qword_101415390 = (uint64_t)v10;

    }
    Class = object_getClass(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101415390, "dictionaryRepresentation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues"));
    v15 = objc_msgSend(v14, "containsObject:", Class);

    if (v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124F558);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1CFA4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124F578);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100E11864();
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 179, 0, "trying to subclass something that is already subclassed %@", v4);
LABEL_14:

LABEL_19:
      objc_sync_exit(v9);

      goto LABEL_20;
    }
    v19 = (objc_class *)objc_msgSend((id)qword_101415390, "objectForKey:", Class);
    if (!v19)
    {
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__TSDResetNotifying%s"), class_getName(Class));
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v20));
      v22 = (const char *)objc_msgSend(v21, "UTF8String");

      objc_opt_class(v4, v23);
      ClassPair = objc_allocateClassPair(v24, v22, 0);
      v19 = ClassPair;
      if (!ClassPair)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124F598);
        v26 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
        {
          objc_opt_class(a1, v27);
          v29 = NSStringFromClass(v28);
          objc_claimAutoreleasedReturnValue(v29);
          sub_100E1D02C();
        }

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124F5B8);
        v30 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100E11864();
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"));
        objc_opt_class(a1, v31);
        v33 = NSStringFromClass(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 198, 0, "No dynamic subclass for %@!", v34);

        goto LABEL_14;
      }
      class_addMethod(ClassPair, "reset", (IMP)sub_1002EF9C4, "v@:");
      objc_registerClassPair(v19);
      objc_msgSend((id)qword_101415390, "setObject:forKey:", v19, Class);
    }
    object_setClass(v4, v19);
    goto LABEL_19;
  }
LABEL_20:

}

+ (void)p_removeDynamicSubclass:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_class *Class;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_class *Superclass;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_opt_class(UIGestureRecognizer, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    objc_opt_class(CRLTrackerManipulatorCoordinator, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_sync_enter(v8);
    Class = object_getClass(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101415390, "dictionaryRepresentation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
    v12 = objc_msgSend(v11, "containsObject:", Class);

    if ((v12 & 1) != 0)
    {
      Superclass = class_getSuperclass(Class);
      object_setClass(v3, Superclass);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124F5D8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1D0B0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124F5F8);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100E11864();
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLTrackerManipulatorCoordinator p_removeDynamicSubclass:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 212, 0, "removing dynamic subclass from GR %@ that doesn't have one!", v3);

    }
    objc_sync_exit(v8);

  }
}

- (CRLTrackerManipulator)controllingTM
{
  return self->mControllingTM;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mControllingTM, 0);
  objc_storeStrong((id *)&self->mRegisteredTMs, 0);
}

@end
