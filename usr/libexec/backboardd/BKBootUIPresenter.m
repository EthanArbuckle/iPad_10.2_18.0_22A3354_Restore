@implementation BKBootUIPresenter

- (BKBootUIPresenter)initWithSystemAppSentinel:(id)a3 alternateSystemAppManager:(id)a4 firstBootDetector:(id)a5 bootUIOverlayVendor:(id)a6 renderOverlayManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BKBootUIPresenter *v16;
  BKBootUIPresenter *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *queue;
  uint64_t v24;
  BSInvalidatable *systemShellObserving;
  void *v26;
  void *v27;
  OS_dispatch_queue *v28;
  BKBootUIPresenter *v29;
  id v30;
  id v31;
  NSObject *v32;
  _QWORD block[4];
  BKBootUIPresenter *v35;
  _QWORD v36[4];
  id v37;
  BKBootUIPresenter *v38;
  objc_super v39;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v39.receiver = self;
  v39.super_class = (Class)BKBootUIPresenter;
  v16 = -[BKBootUIPresenter init](&v39, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_systemAppSentinel, a3);
    objc_storeStrong((id *)&v17->_bootUIOverlayVendor, a6);
    objc_storeStrong((id *)&v17->_renderOverlayManager, a7);
    objc_storeStrong((id *)&v17->_firstBootDetector, a5);
    v19 = (objc_class *)objc_opt_class(v17, v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS(v21, 33);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)SerialWithQoS;

    v17->_screenOwnerPID = -1;
    -[BKFirstBootDetector addObserver:](v17->_firstBootDetector, "addObserver:", v17);
    v24 = objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel addSystemShellObserver:reason:](v17->_systemAppSentinel, "addSystemShellObserver:reason:", v17, CFSTR("BootUIPresenter")));
    systemShellObserving = v17->_systemShellObserving;
    v17->_systemShellObserving = (BSInvalidatable *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "hideAppleLogoOnLaunch"));
    v28 = v17->_queue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10009449C;
    v36[3] = &unk_1000ECD80;
    v37 = v26;
    v29 = v17;
    v38 = v29;
    v30 = v26;
    v31 = objc_msgSend(v30, "observeDefault:onQueue:withBlock:", v27, v28, v36);

    v32 = v17->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000944E4;
    block[3] = &unk_1000ECDA8;
    v35 = v29;
    dispatch_sync(v32, block);

  }
  return v17;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  BKBootUIPresenter *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;

  if (self->_systemActivityAssertion)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Must dismiss overlay before releasing")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v9 = (objc_class *)objc_opt_class(self, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138544642;
      v28 = v7;
      v29 = 2114;
      v30 = v11;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BKBootUIPresenter.m");
      v35 = 1024;
      v36 = 105;
      v37 = 2114;
      v38 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    __break(0);
    JUMPOUT(0x100092344);
  }
  if (self->_overlay)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Must dismiss overlay before releasing")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = (objc_class *)objc_opt_class(self, v15);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138544642;
      v28 = v14;
      v29 = 2114;
      v30 = v18;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BKBootUIPresenter.m");
      v35 = 1024;
      v36 = 106;
      v37 = 2114;
      v38 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    __break(0);
    JUMPOUT(0x100092430);
  }
  if (self->_underlay)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Must dismiss underlay before releasing")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v23 = (objc_class *)objc_opt_class(self, v22);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138544642;
      v28 = v21;
      v29 = 2114;
      v30 = v25;
      v31 = 2048;
      v32 = self;
      v33 = 2114;
      v34 = CFSTR("BKBootUIPresenter.m");
      v35 = 1024;
      v36 = 107;
      v37 = 2114;
      v38 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
    __break(0);
    JUMPOUT(0x10009251CLL);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v26.receiver = self;
  v26.super_class = (Class)BKBootUIPresenter;
  -[BKBootUIPresenter dealloc](&v26, "dealloc");
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescription](self->_overlay, "succinctDescription"));
  v5 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("_overlay"), 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescription](self->_underlay, "succinctDescription"));
  v7 = objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("_underlay"), 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));
  return (NSString *)v8;
}

- (BOOL)isShowingBootUI
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100094480;
  v5[3] = &unk_1000ECDD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dismissOverlayWithAnimationSettings:(id)a3 requstedByPID:(int)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094360;
  block[3] = &unk_1000ECDF8;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (BOOL)sustainOverlayForReason:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094244;
  block[3] = &unk_1000ECE20;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)unsustainOverlayForReason:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094124;
  block[3] = &unk_1000ECD80;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)firstBootDetectorDidFinishFirstBoot:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BKBootUIPresenter *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100094010;
  v7[3] = &unk_1000ECD80;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)systemShellDidFinishLaunching:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BKBootUIPresenter *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093F38;
  v7[3] = &unk_1000ECD80;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)systemShellChangedWithPrimary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BKBootUIPresenter *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093E60;
  v7[3] = &unk_1000ECD80;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_sync
{
  dispatch_sync((dispatch_queue_t)self->_queue, &stru_1000ECE40);
}

- (void)_queue_setScreenOwnerPID:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  NSString *screenOwnerBundleIdentifier;
  id v19;
  NSObject *v20;
  NSString *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  NSString *v29;
  _BYTE v30[128];

  v3 = *(_QWORD *)&a3;
  self->_screenOwnerPID = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel systemShells](self->_systemAppSentinel, "systemShells"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "pid", (_QWORD)v22) == (_DWORD)v3)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
          v17 = (NSString *)objc_msgSend(v16, "copy");
          screenOwnerBundleIdentifier = self->_screenOwnerBundleIdentifier;
          self->_screenOwnerBundleIdentifier = v17;

          v15 = (NSString *)v6;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = BSBundleIDForPID(v3, v12);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue(v13);
  v15 = self->_screenOwnerBundleIdentifier;
  self->_screenOwnerBundleIdentifier = v14;
LABEL_11:

  v19 = sub_1000597D0();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_screenOwnerBundleIdentifier;
    *(_DWORD *)buf = 67109378;
    v27 = v3;
    v28 = 2114;
    v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "screen owner is now pid:%d (%{public}@)", buf, 0x12u);
  }

}

- (void)_queue_updateOverlayForReason:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int *p_screenOwnerPID;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  int v21;
  NSString *screenOwnerBundleIdentifier;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  id v27;
  NSString *v28;
  NSString *v29;
  id v30;
  NSObject *v31;
  int v32;
  id v33;
  NSString *v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  id v41;
  int screenOwnerPID;
  unsigned int v43;
  void *v44;
  id v45;
  unsigned int v46;
  id v48;
  NSObject *v49;
  unsigned int v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  _BYTE v63[18];
  _BYTE v64[128];

  v4 = a3;
  BSDispatchQueueAssert(self->_queue, v5);
  v6 = objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel systemShellState](self->_systemAppSentinel, "systemShellState"));
  v7 = v6;
  if (v6)
  {
    v8 = *(id *)(v6 + 16);
    if (*(_BYTE *)(v7 + 8))
    {
      v9 = sub_1000597D0();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v63 = v8;
      v11 = "updateOverlay: Waiting for alternate shells -- (%{public}@) is temporary screen owner";
      v12 = v10;
      v13 = 12;
      goto LABEL_5;
    }
    v57 = v7;
    p_screenOwnerPID = &self->_screenOwnerPID;
    if (self->_screenOwnerPID > 0)
    {
      v15 = *(void **)(v57 + 24);
LABEL_8:
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v10 = v15;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v59;
        v56 = v4;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v59 != v18)
              objc_enumerationMutation(v10);
            v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
            v21 = *p_screenOwnerPID;
            if (v21 == objc_msgSend(v20, "pid"))
            {
              v30 = sub_1000597D0();
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = *p_screenOwnerPID;
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v63 = v32;
                *(_WORD *)&v63[4] = 2114;
                *(_QWORD *)&v63[6] = v20;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "updateOverlay: pid:%d still exists (%{public}@)", buf, 0x12u);
              }

              v33 = v20;
              v8 = v33;
              v4 = v56;
              goto LABEL_25;
            }
            screenOwnerBundleIdentifier = self->_screenOwnerBundleIdentifier;
            if (screenOwnerBundleIdentifier)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bundleIdentifier"));
              v24 = -[NSString isEqual:](screenOwnerBundleIdentifier, "isEqual:", v23);

              if (v24)
              {
                v25 = sub_1000597D0();
                v26 = objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)v63 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "updateOverlay: New instance of owner shell (%{public}@)", buf, 0xCu);
                }

                v27 = v20;
                self->_screenOwnerPID = objc_msgSend(v27, "pid");
                v28 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleIdentifier"));
                v29 = self->_screenOwnerBundleIdentifier;
                self->_screenOwnerBundleIdentifier = v28;

                v8 = v27;
              }
            }
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
          v4 = v56;
          if (v17)
            continue;
          break;
        }
      }
LABEL_25:

      v34 = self->_screenOwnerBundleIdentifier;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
      LOBYTE(v34) = -[NSString isEqual:](v34, "isEqual:", v35);

      if ((v34 & 1) != 0)
      {
        v7 = v57;
      }
      else
      {
        v36 = sub_1000597D0();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        v7 = v57;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = self->_screenOwnerBundleIdentifier;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v63 = v38;
          *(_WORD *)&v63[8] = 2114;
          *(_QWORD *)&v63[10] = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "updateOverlay: Screen owner missing (expected:%{public}@) got:%{public}@", buf, 0x16u);

        }
        self->_screenOwnerPID = -1;
        v40 = self->_screenOwnerBundleIdentifier;
        self->_screenOwnerBundleIdentifier = 0;

      }
      goto LABEL_34;
    }
  }
  else
  {
    v57 = 0;
    v8 = 0;
    p_screenOwnerPID = &self->_screenOwnerPID;
    if (self->_screenOwnerPID > 0)
    {
      v15 = 0;
      goto LABEL_8;
    }
  }
  v41 = sub_1000597D0();
  v10 = objc_claimAutoreleasedReturnValue(v41);
  v7 = v57;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v11 = "updateOverlay: No explicit screen owner";
    v12 = v10;
    v13 = 2;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
  }
LABEL_34:

  screenOwnerPID = self->_screenOwnerPID;
  v43 = objc_msgSend(v8, "pid");
  if (v8)
  {
    if (v7)
      v44 = *(void **)(v7 + 32);
    else
      v44 = 0;
    v45 = v44;
    v46 = objc_msgSend(v45, "containsObject:", v8);

  }
  else
  {
    v46 = 0;
  }
  if (screenOwnerPID != v43 && v46 == 0)
  {
    -[BKBootUIPresenter _queue_addOverlayForReason:](self, "_queue_addOverlayForReason:", v4);
  }
  else
  {
    v48 = sub_1000597D0();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = objc_msgSend(v8, "pid");
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v63 = v50;
      *(_WORD *)&v63[4] = 1024;
      *(_DWORD *)&v63[6] = screenOwnerPID == v43;
      *(_WORD *)&v63[10] = 1024;
      *(_DWORD *)&v63[12] = v46;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "updateOverlay: pid:%d explicitlyDismissed:%{BOOL}u finishedStartup:%{BOOL}u", buf, 0x14u);
    }

    if (self->_isOverlaySustained)
    {
      v51 = v7;
      self->_dismissSustainedOverlayIfUnsustained = 1;
      v52 = sub_1000597D0();
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v63 = v4;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "updateOverlay: Not dismissing because overlay has been sustained by the system app: %{public}@ ", buf, 0xCu);
      }

      v7 = v51;
    }
    else
    {
      v54 = sub_1000597D0();
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v63 = v4;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "updateOverlay: Dismissing overlay: %{public}@ ", buf, 0xCu);
      }

      -[BKBootUIPresenter _queue_removeOverlayWithAnimationSettings:](self, "_queue_removeOverlayWithAnimationSettings:", 0);
    }
  }

}

- (void)_queue_removeOverlayWithAnimationSettings:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  BKDisplayRenderOverlay *overlay;
  BKDisplayRenderOverlay *v9;
  SWSystemActivityAssertion *systemActivityAssertion;
  uint8_t v11[16];

  v4 = a3;
  BSDispatchQueueAssert(self->_queue, v5);
  if (self->_systemActivityAssertion)
  {
    v6 = sub_1000597D0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removeOverlayWithAnimationSettings: Removing the overlay", v11, 2u);
    }

    overlay = self->_overlay;
    if (overlay)
    {
      -[BKDisplayRenderOverlayManager removeOverlay:withAnimationSettings:](self->_renderOverlayManager, "removeOverlay:withAnimationSettings:", overlay, v4);
      v9 = self->_overlay;
      self->_overlay = 0;

    }
    -[SWSystemActivityAssertion invalidate](self->_systemActivityAssertion, "invalidate");
    systemActivityAssertion = self->_systemActivityAssertion;
    self->_systemActivityAssertion = 0;

  }
}

- (void)_queue_continueAddingOverlayForReason:(id)a3 generation:(unint64_t)a4
{
  int v4;
  id v6;
  uint64_t v7;
  SWSystemActivityAssertion *systemActivityAssertion;
  id v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  BKDisplayRenderOverlay *v13;
  BKDisplayRenderOverlay *overlay;
  void *v15;
  int v16;
  int v17;
  __int16 v18;
  id v19;

  v4 = a4;
  v6 = a3;
  BSDispatchQueueAssert(self->_queue, v7);
  systemActivityAssertion = self->_systemActivityAssertion;
  v9 = sub_1000597D0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (systemActivityAssertion)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 67109378;
      v17 = v4;
      v18 = 2114;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "addOverlay(%d-%{public}@): Adding the overlay", (uint8_t *)&v16, 0x12u);
    }

    LODWORD(v12) = 1161523200;
    v13 = (BKDisplayRenderOverlay *)objc_claimAutoreleasedReturnValue(-[BKBootUIOverlayVendor currentOverlayWithLevel:](self->_bootUIOverlayVendor, "currentOverlayWithLevel:", v12));
    overlay = self->_overlay;
    self->_overlay = v13;

    -[BKDisplayRenderOverlay setAnimates:](self->_overlay, "setAnimates:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self->_overlay, "descriptor"));
    objc_msgSend(v15, "_setInterstitial:", 1);

    -[BKDisplayRenderOverlayManager applyOverlay:withAnimationSettings:](self->_renderOverlayManager, "applyOverlay:withAnimationSettings:", self->_overlay, 0);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 67109378;
      v17 = v4;
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "addOverlay(%d-%{public}@): canceled adding overlay", (uint8_t *)&v16, 0x12u);
    }

  }
}

- (void)_queue_acquireActivityAssertionForReason:(id)a3 generation:(unint64_t)a4 continuation:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  SWSystemActivityAssertion *systemActivityAssertion;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  double v34;
  uint8_t buf[4];
  _BYTE v36[18];
  __int16 v37;
  BKBootUIPresenter *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;

  v9 = a3;
  v10 = a5;
  BSDispatchQueueAssert(self->_queue, v11);
  v12 = objc_msgSend(objc_alloc((Class)SWSystemActivityAssertion), "initWithIdentifier:", CFSTR("BKBootUIPresenter"));
  if (!v12)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nil activity assertion")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v26 = (objc_class *)objc_opt_class(self, v25);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)v36 = v24;
      *(_WORD *)&v36[8] = 2114;
      *(_QWORD *)&v36[10] = v28;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = CFSTR("BKBootUIPresenter.m");
      v41 = 1024;
      v42 = 339;
      v43 = 2114;
      v44 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    __break(0);
    JUMPOUT(0x1000935F8);
  }
  v13 = v12;
  v14 = sub_1000597D0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v36 = a4;
    *(_WORD *)&v36[4] = 2114;
    *(_QWORD *)&v36[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "addOverlay(%d-%{public}@): waiting for activity assertion", buf, 0x12u);
  }

  v17 = BSContinuousMachTimeNow(v16);
  objc_storeStrong((id *)&self->_systemActivityAssertion, v13);
  systemActivityAssertion = self->_systemActivityAssertion;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100093CF0;
  v29[3] = &unk_1000ECE68;
  v34 = v17;
  v32 = v10;
  v33 = a4;
  v30 = v9;
  v31 = v13;
  v19 = v13;
  v20 = v10;
  v21 = v9;
  -[SWSystemActivityAssertion acquireWithTimeout:handler:](systemActivityAssertion, "acquireWithTimeout:handler:", v29, 16.0);

}

- (void)_queue_addOverlayForReason:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t addOverlayGeneration;
  unint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  void *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  unint64_t v24;
  uint8_t buf[4];
  _BYTE v26[18];
  __int16 v27;
  BKBootUIPresenter *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v5 = a3;
  BSDispatchQueueAssert(self->_queue, v6);
  addOverlayGeneration = self->_addOverlayGeneration;
  if (addOverlayGeneration + 1 > 1)
    v8 = addOverlayGeneration + 1;
  else
    v8 = 1;
  self->_addOverlayGeneration = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  v10 = objc_msgSend(v9, "hideAppleLogoOnLaunch");

  if (v10)
  {
    v11 = sub_1000597D0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v26 = v8;
      *(_WORD *)&v26[4] = 2114;
      *(_QWORD *)&v26[6] = v5;
      v13 = "addOverlay(%d-%{public}@): Not showing the boot UI overlay because we were told to hide it";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (self->_systemActivityAssertion)
  {
    v14 = sub_1000597D0();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v26 = v8;
      *(_WORD *)&v26[4] = 2114;
      *(_QWORD *)&v26[6] = v5;
      v13 = "addOverlay(%d-%{public}@): Overlay pending or already in place";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (self->_overlay)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("overlay should have been removed")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v19 = (objc_class *)objc_opt_class(self, v18);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)v26 = v17;
      *(_WORD *)&v26[8] = 2114;
      *(_QWORD *)&v26[10] = v21;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = CFSTR("BKBootUIPresenter.m");
      v31 = 1024;
      v32 = 373;
      v33 = 2114;
      v34 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
    __break(0);
    JUMPOUT(0x1000938A4);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100093B58;
  v22[3] = &unk_1000ECEB8;
  v22[4] = self;
  v23 = v5;
  v24 = v8;
  -[BKBootUIPresenter _queue_acquireActivityAssertionForReason:generation:continuation:](self, "_queue_acquireActivityAssertionForReason:generation:continuation:", v23, v8, v22);

LABEL_12:
}

- (void)_queue_addUnderlay
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  BKDisplayRenderOverlay *underlay;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  double v11;
  BKDisplayRenderOverlay *v12;
  BKDisplayRenderOverlay *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  BSDispatchQueueAssert(self->_queue, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  v4 = objc_msgSend(v3, "hideAppleLogoOnLaunch");

  if (v4)
  {
    v5 = sub_1000597D0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "addUnderlay: Not showing the boot UI underlay because we were told to hide it", buf, 2u);
    }

  }
  else
  {
    underlay = self->_underlay;
    v8 = sub_1000597D0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (underlay)
    {
      if (v10)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "addUnderlay: Underlay already in place", v14, 2u);
      }

    }
    else
    {
      if (v10)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "addUnderlay:  Adding the underlay", v15, 2u);
      }

      LODWORD(v11) = -1.0;
      v12 = (BKDisplayRenderOverlay *)objc_claimAutoreleasedReturnValue(-[BKBootUIOverlayVendor currentOverlayWithLevel:](self->_bootUIOverlayVendor, "currentOverlayWithLevel:", v11));
      v13 = self->_underlay;
      self->_underlay = v12;

      -[BKDisplayRenderOverlayManager applyOverlay:withAnimationSettings:](self->_renderOverlayManager, "applyOverlay:withAnimationSettings:", self->_underlay, 0);
    }
  }
}

- (void)_queue_removeUnderlay
{
  id v3;
  NSObject *v4;
  BKDisplayRenderOverlay *underlay;
  uint8_t v6[16];

  BSDispatchQueueAssert(self->_queue, a2);
  if (self->_underlay)
  {
    v3 = sub_1000597D0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_queue_removeUnderlay: Removing the underlay", v6, 2u);
    }

    -[BKDisplayRenderOverlayManager removeOverlay:withAnimationSettings:](self->_renderOverlayManager, "removeOverlay:withAnimationSettings:", self->_underlay, 0);
    underlay = self->_underlay;
    self->_underlay = 0;

  }
}

- (SWSystemActivityAssertion)systemActivityAssertion
{
  return self->_systemActivityAssertion;
}

- (void)setSystemActivityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_systemActivityAssertion, a3);
}

- (BKDisplayRenderOverlay)underlay
{
  return self->_underlay;
}

- (void)setUnderlay:(id)a3
{
  objc_storeStrong((id *)&self->_underlay, a3);
}

- (BKDisplayRenderOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenOwnerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_systemActivityAssertion, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_underlay, 0);
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_renderOverlayManager, 0);
  objc_storeStrong((id *)&self->_firstBootDetector, 0);
  objc_storeStrong((id *)&self->_systemAppSentinel, 0);
  objc_storeStrong((id *)&self->_bootUIOverlayVendor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)sharedInstance
{
  if (qword_100117608 != -1)
    dispatch_once(&qword_100117608, &stru_1000ECD58);
  return (id)qword_100117600;
}

@end
