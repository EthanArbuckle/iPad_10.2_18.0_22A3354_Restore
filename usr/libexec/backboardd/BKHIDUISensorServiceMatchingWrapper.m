@implementation BKHIDUISensorServiceMatchingWrapper

- (void)serviceDidDisappear:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  NSArray *v16;
  NSArray *lock_serviceWrappers;
  os_unfair_lock_t lock;
  BKHIDUISensorServiceMatchingWrapper *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  v4 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[NSArray mutableCopy](self->_lock_serviceWrappers, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = self;
  v6 = self->_lock_serviceWrappers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "service", lock));
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          v14 = BKLogUISensor();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v25 = v11;
            v26 = 2114;
            v27 = v4;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "removed %{public}@ for service:%{public}@", buf, 0x16u);
          }

          objc_msgSend(v5, "removeObject:", v11);
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

  v16 = (NSArray *)objc_msgSend(v5, "copy");
  lock_serviceWrappers = v19->_lock_serviceWrappers;
  v19->_lock_serviceWrappers = v16;

  os_unfair_lock_unlock(lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v6;
  void *v7;
  NSArray *lock_serviceWrappers;
  NSArray *v9;
  NSArray *v10;
  id v11;
  id v12;
  _QWORD v13[5];

  p_lock = &self->_lock;
  v6 = a4;
  os_unfair_lock_lock(p_lock);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000056A4;
  v13[3] = &unk_1000EC160;
  v13[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_map:", v13));

  lock_serviceWrappers = self->_lock_serviceWrappers;
  if (lock_serviceWrappers)
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](lock_serviceWrappers, "arrayByAddingObjectsFromArray:", v7));
  else
    v9 = v7;
  v10 = self->_lock_serviceWrappers;
  self->_lock_serviceWrappers = v9;

  v11 = -[BKSHIDUISensorMode copy](self->_lock_activeMode, "copy");
  v12 = -[NSArray copy](self->_lock_serviceWrappers, "copy");
  if (v11)
    -[BKHIDUISensorServiceMatchingWrapper _lock_applyUIMode:toWrappers:](self, "_lock_applyUIMode:toWrappers:", v11, v12);
  os_unfair_lock_unlock(p_lock);

}

- (BKHIDUISensorServiceMatchingWrapper)init
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  BKHIDUISensorServiceMatchingWrapper *result;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKHIDUISensorServiceMatchingWrapper *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nope")));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138544642;
    v13 = v6;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("BKHIDUISensorServiceMatchingWrapper.m");
    v20 = 1024;
    v21 = 37;
    v22 = 2114;
    v23 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

  }
  result = (BKHIDUISensorServiceMatchingWrapper *)_bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  __break(0);
  return result;
}

- (BKHIDUISensorServiceMatchingWrapper)initWithMatchingDictionary:(id)a3 instantiateWrapperUsingBlock:(id)a4
{
  id v6;
  id v7;
  BKHIDUISensorServiceMatchingWrapper *v8;
  BKHIDUISensorServiceMatchingWrapper *v9;
  id v10;
  id instantiateWrapperBlock;
  id v12;
  void *v13;
  BKIOHIDServiceMatcher *v14;
  BKIOHIDServiceMatcher *serviceMatcher;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BKHIDUISensorServiceMatchingWrapper;
  v8 = -[BKHIDUISensorServiceMatchingWrapper init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v7, "copy");
    instantiateWrapperBlock = v9->_instantiateWrapperBlock;
    v9->_instantiateWrapperBlock = v10;

    v12 = objc_alloc((Class)BKIOHIDServiceMatcher);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    v14 = (BKIOHIDServiceMatcher *)objc_msgSend(v12, "initWithMatchingDictionary:dataProvider:", v6, v13);
    serviceMatcher = v9->_serviceMatcher;
    v9->_serviceMatcher = v14;

    -[BKIOHIDServiceMatcher startObserving:queue:](v9->_serviceMatcher, "startObserving:queue:", v9, &_dispatch_main_q);
  }

  return v9;
}

- (void)resetCalibration
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_lock_serviceWrappers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "resetCalibration", (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)applyUIMode:(id)a3
{
  BKSHIDUISensorMode *v4;
  BKSHIDUISensorMode *lock_activeMode;
  BKSHIDUISensorMode *v6;

  v4 = (BKSHIDUISensorMode *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_activeMode = self->_lock_activeMode;
  self->_lock_activeMode = v4;
  v6 = v4;

  -[BKHIDUISensorServiceMatchingWrapper _lock_applyUIMode:toWrappers:](self, "_lock_applyUIMode:toWrappers:", v6, self->_lock_serviceWrappers);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateCharacteristics:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_lock_serviceWrappers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "updateCharacteristics:", v4, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsProximityLPAEventTransitions
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_lock_serviceWrappers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "supportsProximityLPAEventTransitions", (_QWORD)v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

- (void)_lock_applyUIMode:(id)a3 toWrappers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "applyUIMode:", v6, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BKIOHIDServiceMatcher)serviceMatcher
{
  return self->_serviceMatcher;
}

- (void)setServiceMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_serviceMatcher, a3);
}

- (id)instantiateWrapperBlock
{
  return self->_instantiateWrapperBlock;
}

- (void)setInstantiateWrapperBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_instantiateWrapperBlock, 0);
  objc_storeStrong((id *)&self->_serviceMatcher, 0);
  objc_storeStrong((id *)&self->_lock_activeMode, 0);
  objc_storeStrong((id *)&self->_lock_serviceWrappers, 0);
}

@end
