@implementation _BKDisplayAnnotationControllerReference

- (_BKDisplayAnnotationControllerReference)initWithController:(id)a3
{
  os_unfair_lock_s *v5;
  _BKDisplayAnnotationControllerReference *v6;
  _BKDisplayAnnotationControllerReference *v7;
  objc_super v9;

  v5 = (os_unfair_lock_s *)a3;
  v9.receiver = self;
  v9.super_class = (Class)_BKDisplayAnnotationControllerReference;
  v6 = -[_BKDisplayAnnotationControllerReference init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    if (v5)
    {
      os_unfair_lock_lock(v5 + 8);
      ++*(_QWORD *)&v5[10]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v5 + 8);
    }
  }

  return v7;
}

- (void)dealloc
{
  BKDisplayAnnotationController *controller;
  os_unfair_lock_s *p_lock;
  uint64_t lock_externalReferenceCount;
  BKDisplayAnnotationDisplayController *displayController;
  BKDisplayAnnotationController *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSString *v16;
  BKDisplayAnnotationController *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  BKDisplayAnnotationController *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  BKDisplayAnnotationController *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  controller = self->_controller;
  if (controller)
  {
    p_lock = &controller->_lock;
    os_unfair_lock_lock(&controller->_lock);
    lock_externalReferenceCount = controller->_lock_externalReferenceCount;
    controller->_lock_externalReferenceCount = lock_externalReferenceCount - 1;
    if (lock_externalReferenceCount <= 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_externalReferenceCount >= 0")));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v16 = NSStringFromSelector("removeExternalReference");
        v17 = (BKDisplayAnnotationController *)objc_claimAutoreleasedReturnValue(v16);
        v19 = (objc_class *)objc_opt_class(controller, v18);
        v20 = NSStringFromClass(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138544642;
        v24 = v17;
        v25 = 2114;
        v26 = v21;
        v27 = 2048;
        v28 = controller;
        v29 = 2114;
        v30 = CFSTR("BKDisplayAnnotationController.m");
        v31 = 1024;
        v32 = 282;
        v33 = 2114;
        v34 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
      __break(0);
      JUMPOUT(0x10004AC58);
    }
    if (lock_externalReferenceCount == 1)
    {
      displayController = controller->_displayController;
      v7 = controller;
      if (displayController)
      {
        v8 = sub_1000598B8();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "removing last reference to %{public}@", buf, 0xCu);
        }

        os_unfair_lock_lock(&displayController->_lock);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationController display](v7, "display"));
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueId"));
        v12 = objc_msgSend(v11, "length");
        v13 = (void *)BKSDisplayUUIDMainKey;
        if (v12)
          v13 = v11;
        v14 = v13;

        -[NSMutableDictionary removeObjectForKey:](displayController->_lock_displayToAnnotationContext, "removeObjectForKey:", v14);
        os_unfair_lock_unlock(&displayController->_lock);

      }
      -[BKDisplayAnnotationController _lock_invalidate](v7, "_lock_invalidate");
    }
    os_unfair_lock_unlock(p_lock);
  }
  v22.receiver = self;
  v22.super_class = (Class)_BKDisplayAnnotationControllerReference;
  -[_BKDisplayAnnotationControllerReference dealloc](&v22, "dealloc");
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_controller;
}

- (BKDisplayAnnotationController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
