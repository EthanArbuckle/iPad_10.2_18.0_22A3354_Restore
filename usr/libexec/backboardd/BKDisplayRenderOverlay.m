@implementation BKDisplayRenderOverlay

- (BKDisplayRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BKDisplayRenderOverlay *v12;
  BKDisplayRenderOverlay *v13;
  uint64_t v14;
  BKDisplayRenderOverlayPersistenceCoordinator *persistenceCoordinator;
  void *v16;
  void *v17;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
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
  objc_super v44;
  _BYTE buf[24];
  BKDisplayRenderOverlay *v46;
  __int128 v47;
  __int128 p_scale;
  uint64_t v49;
  uint64_t v50;

  v8 = a3;
  if (!v8)
  {
    v19 = (objc_class *)objc_opt_class(BKSDisplayRenderOverlayDescriptor, v9);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("descriptor"), v21));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v26 = (objc_class *)objc_opt_class(self, v25);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      v46 = self;
      LOWORD(v47) = 2114;
      *(_QWORD *)((char *)&v47 + 2) = CFSTR("BKDisplayRenderOverlay.m");
      WORD5(v47) = 1024;
      HIDWORD(v47) = 35;
      LOWORD(p_scale) = 2114;
      *(_QWORD *)((char *)&p_scale + 2) = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
    __break(0);
    JUMPOUT(0x10003EAD4);
  }
  v10 = v8;
  v11 = objc_opt_class(BKSDisplayRenderOverlayDescriptor, v9);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v29 = (objc_class *)objc_msgSend(v10, "classForCoder");
    if (!v29)
      v29 = (objc_class *)objc_opt_class(v10, v30);
    v31 = NSStringFromClass(v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v34 = (objc_class *)objc_opt_class(BKSDisplayRenderOverlayDescriptor, v33);
    v35 = NSStringFromClass(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("descriptor"), v32, v36));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v38 = NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v41 = (objc_class *)objc_opt_class(self, v40);
      v42 = NSStringFromClass(v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2048;
      v46 = self;
      LOWORD(v47) = 2114;
      *(_QWORD *)((char *)&v47 + 2) = CFSTR("BKDisplayRenderOverlay.m");
      WORD5(v47) = 1024;
      HIDWORD(v47) = 35;
      LOWORD(p_scale) = 2114;
      *(_QWORD *)((char *)&p_scale + 2) = v37;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
    __break(0);
    JUMPOUT(0x10003EC10);
  }

  v44.receiver = self;
  v44.super_class = (Class)BKDisplayRenderOverlay;
  v12 = -[BKDisplayRenderOverlay init](&v44, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_descriptor, a3);
    v13->_level = a4;
    v14 = objc_claimAutoreleasedReturnValue(+[BKDisplayRenderOverlayPersistenceCoordinator sharedInstance](BKDisplayRenderOverlayPersistenceCoordinator, "sharedInstance"));
    persistenceCoordinator = v13->_persistenceCoordinator;
    v13->_persistenceCoordinator = (BKDisplayRenderOverlayPersistenceCoordinator *)v14;

    v13->_type = 0;
    *(_WORD *)&v13->_visible = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "display"));
    if (objc_msgSend(v16, "isExternal"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentMode"));
      v13->_scale = (double)(unint64_t)objc_msgSend(v17, "preferredScale");

    }
    else
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_10000FBA8;
      v46 = (BKDisplayRenderOverlay *)&unk_1000EA5A0;
      v47 = 0uLL;
      p_scale = (unint64_t)&v13->_scale;
      v49 = 0;
      v50 = 0;
      sub_10000FA60(buf);
    }

  }
  return v13;
}

- (id)_initWithPersistenceData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  double v8;
  BKDisplayRenderOverlay *v9;
  BKDisplayRenderOverlay *v10;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptor"));
    objc_msgSend(v4, "level");
    v7 = v6;

    LODWORD(v8) = v7;
    v9 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](self, "initWithOverlayDescriptor:level:", v5, v8);

    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKDisplayRenderOverlay *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (self->_visible)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Must dismiss before releasing")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKDisplayRenderOverlay.m");
      v20 = 1024;
      v21 = 66;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x10003EE04);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKDisplayRenderOverlay;
  -[BKDisplayRenderOverlay dealloc](&v11, "dealloc");
}

- (NSString)name
{
  return (NSString *)-[BKSDisplayRenderOverlayDescriptor name](self->_descriptor, "name");
}

- (CADisplay)display
{
  return (CADisplay *)-[BKSDisplayRenderOverlayDescriptor display](self->_descriptor, "display");
}

- (int64_t)interfaceOrientation
{
  return (int64_t)-[BKSDisplayRenderOverlayDescriptor interfaceOrientation](self->_descriptor, "interfaceOrientation");
}

- (BOOL)lockBacklight
{
  return -[BKSDisplayRenderOverlayDescriptor lockBacklight](self->_descriptor, "lockBacklight");
}

- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties
{
  return (BKSDisplayProgressIndicatorProperties *)-[BKSDisplayRenderOverlayDescriptor progressIndicatorProperties](self->_descriptor, "progressIndicatorProperties");
}

- (BOOL)isInterstitial
{
  return -[BKSDisplayRenderOverlayDescriptor isInterstitial](self->_descriptor, "isInterstitial");
}

- (void)setAnimates:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_animates != a3)
  {
    self->_animates = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003F734;
    v3[3] = &unk_1000ECDA8;
    v3[4] = self;
    -[BKDisplayRenderOverlay _wrapInCATransaction:](self, "_wrapInCATransaction:", v3);
  }
}

- (BOOL)presentWithAnimationSettings:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  if (self->_visible)
    goto LABEL_5;
  v5 = sub_100059A88();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescription](self, "succinctDescription"));
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2114;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting overlay: %{public}@ with animation settings: %{public}@", buf, 0x16u);

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003F6E4;
  v10[3] = &unk_1000ECE20;
  v12 = &v13;
  v10[4] = self;
  v11 = v4;
  -[BKDisplayRenderOverlay _wrapInCATransaction:](self, "_wrapInCATransaction:", v10);
  self->_visible = 1;

  if (*((_BYTE *)v14 + 24))
  {
LABEL_5:
    +[CATransaction flush](CATransaction, "flush");
    v8 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)freeze
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BKDisplayRenderOverlay *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;

  if (!self->_visible)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't freeze a hidden overlay")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v11 = (objc_class *)objc_opt_class(self, v10);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138544642;
      v16 = v9;
      v17 = 2114;
      v18 = v13;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("BKDisplayRenderOverlay.m");
      v23 = 1024;
      v24 = 144;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    __break(0);
    JUMPOUT(0x10003F24CLL);
  }
  if (!self->_frozen)
  {
    self->_frozen = 1;
    v3 = sub_100059A88();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescription](self, "succinctDescription"));
      *(_DWORD *)buf = 138543362;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Freezing overlay: %{public}@", buf, 0xCu);

    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003F6DC;
    v14[3] = &unk_1000ECDA8;
    v14[4] = self;
    -[BKDisplayRenderOverlay _wrapInCATransaction:](self, "_wrapInCATransaction:", v14);
  }
}

- (void)dismissWithAnimationSettings:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  if (self->_visible)
  {
    v5 = sub_100059A88();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescription](self, "succinctDescription"));
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing render overlay %{public}@ with animation settings: %{public}@", buf, 0x16u);

    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003F6A8;
    v8[3] = &unk_1000ECD80;
    v8[4] = self;
    v9 = v4;
    -[BKDisplayRenderOverlay _wrapInCATransaction:](self, "_wrapInCATransaction:", v8);
    self->_visible = 0;

  }
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  return 1;
}

- (id)_persistenceData
{
  _BKDisplayRenderOverlayPersistenceData *v3;
  double v4;

  v3 = objc_alloc_init(_BKDisplayRenderOverlayPersistenceData);
  -[_BKDisplayRenderOverlayPersistenceData setOverlayType:](v3, "setOverlayType:", -[BKDisplayRenderOverlay type](self, "type"));
  -[_BKDisplayRenderOverlayPersistenceData setDescriptor:](v3, "setDescriptor:", self->_descriptor);
  *(float *)&v4 = self->_level;
  -[_BKDisplayRenderOverlayPersistenceData setLevel:](v3, "setLevel:", v4);
  return v3;
}

- (void)_wrapInCATransaction:(id)a3
{
  void (**v3)(_QWORD);

  if (a3)
  {
    v3 = (void (**)(_QWORD))a3;
    +[CATransaction begin](CATransaction, "begin");
    v3[2](v3);

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (NSString)description
{
  return (NSString *)-[BKDisplayRenderOverlay descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("level"), 0, self->_level);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  BKDisplayRenderOverlay *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F650;
  v8[3] = &unk_1000ECD80;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  v6 = v5;
  return v6;
}

- (BKSDisplayRenderOverlayDescriptor)descriptor
{
  return self->_descriptor;
}

- (float)level
{
  return self->_level;
}

- (int64_t)type
{
  return self->_type;
}

- (void)_setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)disablesDisplayUpdates
{
  return self->_disablesDisplayUpdates;
}

- (BOOL)animates
{
  return self->_animates;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BKDisplayRenderOverlayPersistenceCoordinator)_persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (void)_setPersistenceCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceCoordinator, a3);
}

- (double)_scale
{
  return self->_scale;
}

- (void)_setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
