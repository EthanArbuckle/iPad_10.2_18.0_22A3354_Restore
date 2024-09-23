@implementation BKSharedCADisplayProvider

- (BKSharedCADisplayProvider)init
{
  BKSharedCADisplayProvider *v2;
  BKSharedCADisplayProvider *v3;
  NSMutableSet *v4;
  NSMutableSet *lock_monitors;
  NSMutableSet *v6;
  NSMutableSet *lock_observedDisplays;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKSharedCADisplayProvider;
  v2 = -[BKSharedCADisplayProvider init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    lock_monitors = v3->_lock_monitors;
    v3->_lock_monitors = v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    lock_observedDisplays = v3->_lock_observedDisplays;
    v3->_lock_observedDisplays = v6;

    -[BKSharedCADisplayProvider _lock_updateObservingState](v3, "_lock_updateObservingState");
  }
  return v3;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *lock_monitors;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_monitors = self->_lock_monitors;
  self->_lock_monitors = 0;

  -[BKSharedCADisplayProvider _lock_updateObservingState](self, "_lock_updateObservingState");
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)displays
{
  return (NSArray *)+[CADisplay displays](CADisplay, "displays");
}

- (CADisplay)mainDisplay
{
  return (CADisplay *)+[CADisplay mainDisplay](CADisplay, "mainDisplay");
}

- (void)addMonitor:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObject:](self->_lock_monitors, "addObject:", v5);

  -[BKSharedCADisplayProvider _lock_updateObservingState](self, "_lock_updateObservingState");
  os_unfair_lock_unlock(p_lock);
}

- (void)removeMonitor:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_lock_monitors, "removeObject:", v5);

  -[BKSharedCADisplayProvider _lock_updateObservingState](self, "_lock_updateObservingState");
  os_unfair_lock_unlock(p_lock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  os_unfair_lock_s *p_lock;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  unsigned int v38;
  id v39;
  unsigned int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  _QWORD *v47;
  id *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *i;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id obj;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  id v89;
  _QWORD v90[5];
  id v91;
  _QWORD v92[5];
  id v93;
  uint8_t v94[128];
  uint8_t buf[4];
  _BYTE v96[18];
  __int16 v97;
  void *v98;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = objc_opt_class(CADisplay, v13);
  v15 = v11;
  v16 = v15;
  if (v14)
  {
    if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  if (off_100116650 == a6)
  {
    v20 = sub_10005992C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uniqueId"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v96 = v18;
    *(_WORD *)&v96[8] = 2114;
    *(_QWORD *)&v96[10] = v22;
    v23 = "available modes changed for display %{public}@ %{public}@";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

    goto LABEL_19;
  }
  if (off_100116658 == a6)
  {
    v24 = sub_10005992C();
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uniqueId"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v96 = v18;
    *(_WORD *)&v96[8] = 2114;
    *(_QWORD *)&v96[10] = v22;
    v23 = "current modes changed for display %{public}@ %{public}@";
    goto LABEL_18;
  }
  if (off_100116660 == a6)
  {
    v25 = sub_10005992C();
    v21 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uniqueId"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v96 = v18;
      *(_WORD *)&v96[8] = 2114;
      *(_QWORD *)&v96[10] = v22;
      v23 = "logical scale changed for display %{public}@ %{public}@";
      goto LABEL_18;
    }
LABEL_19:

LABEL_20:
    v26 = objc_opt_class(CADisplay, v19);
    v27 = v16;
    v28 = v27;
    if (v26)
    {
      if ((objc_opt_isKindOfClass(v27, v26) & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v30 = v29;

    v31 = objc_msgSend(v30, "immutableCopy");
    v76 = v31;
    if (!v31)
    {
LABEL_62:

      goto LABEL_63;
    }
    v69 = v18;
    v70 = v16;
    v71 = v12;
    v72 = v10;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v33 = -[NSMutableSet copy](self->_lock_monitors, "copy");
    os_unfair_lock_unlock(p_lock);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v33;
    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
    if (!v77)
      goto LABEL_61;
    v75 = *(_QWORD *)v80;
    v73 = (void *)BKSDisplayUUIDMainKey;
LABEL_28:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v80 != v75)
        objc_enumerationMutation(obj);
      v35 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v34);
      v36 = v76;
      if (!v35)
        goto LABEL_57;
      os_unfair_lock_lock((os_unfair_lock_t)(v35 + 60));
      v37 = objc_msgSend(*(id *)(v35 + 64), "copy");
      os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 60));
      v78 = v37;
      v38 = objc_msgSend((id)v35, "_filterDisplay:usingPredicate:", v36, v37);
      os_unfair_lock_lock((os_unfair_lock_t)(v35 + 24));
      v39 = v36;
      v40 = objc_msgSend(v39, "displayId");
      v41 = v40;
      v42 = *(void **)(v35 + 48);
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v40));
      v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", v43));

      if (v38)
      {
        if (v44)
        {
          v45 = *(NSObject **)(v35 + 16);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v96 = v40;
            *(_WORD *)&v96[4] = 2114;
            *(_QWORD *)&v96[6] = v44;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "modified display %d -- %{public}@", buf, 0x12u);
          }
          objc_msgSend(*(id *)(v35 + 40), "setObject:forKey:", v39, v44, v69, v70, v71, v72);
          v90[0] = _NSConcreteStackBlock;
          v90[1] = 3221225472;
          v90[2] = sub_100085160;
          v90[3] = &unk_1000EC730;
          v90[4] = v35;
          v46 = v39;
          v91 = v46;
          v47 = objc_retainBlock(v90);
          v48 = &v91;
        }
        else
        {
          v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "uniqueId"));
          v53 = objc_msgSend(v52, "length");
          v54 = v73;
          if (v53)
            v54 = v52;
          v44 = v54;

          v55 = *(NSObject **)(v35 + 16);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v96 = v40;
            *(_WORD *)&v96[4] = 2114;
            *(_QWORD *)&v96[6] = v44;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "adding display %d -- %{public}@", buf, 0x12u);
          }
          v92[0] = _NSConcreteStackBlock;
          v92[1] = 3221225472;
          v92[2] = sub_100085154;
          v92[3] = &unk_1000EC730;
          v92[4] = v35;
          v46 = v39;
          v93 = v46;
          v47 = objc_retainBlock(v92);
          objc_msgSend(*(id *)(v35 + 40), "setObject:forKey:", v46, v44);
          v56 = *(void **)(v35 + 48);
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v41));
          objc_msgSend(v56, "setObject:forKey:", v44, v57);

          v48 = &v93;
        }
      }
      else
      {
        v49 = *(NSObject **)(v35 + 16);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v96 = v40;
          *(_WORD *)&v96[4] = 2114;
          *(_QWORD *)&v96[6] = v44;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "removing display %d -- %{public}@", buf, 0x12u);
        }
        v46 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v35 + 40), "objectForKey:", v44, v69, v70, v71, v72));

        if (!v46)
        {
          v47 = 0;
          goto LABEL_47;
        }
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_10008516C;
        v88[3] = &unk_1000EC730;
        v88[4] = v35;
        v89 = v39;
        v47 = objc_retainBlock(v88);
        objc_msgSend(*(id *)(v35 + 40), "removeObjectForKey:", v44);
        v50 = *(void **)(v35 + 48);
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v41));
        objc_msgSend(v50, "removeObjectForKey:", v51);

        v48 = &v89;
      }

LABEL_47:
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v35 + 32), "context", v69, v70, v71, v72));
      v59 = objc_msgSend(v58, "copy");

      os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 24));
      if (v47)
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v60 = v59;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v85;
          do
          {
            for (i = 0; i != v62; i = (char *)i + 1)
            {
              if (*(_QWORD *)v85 != v63)
                objc_enumerationMutation(v60);
              ((void (*)(_QWORD *, _QWORD))v47[2])(v47, *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i));
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v84, buf, 16);
          }
          while (v62);
        }

      }
LABEL_57:

      if ((id)++v34 == v77)
      {
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
        v77 = v65;
        if (!v65)
        {
LABEL_61:

          v12 = v71;
          v10 = v72;
          v18 = v69;
          v16 = v70;
          goto LABEL_62;
        }
        goto LABEL_28;
      }
    }
  }
  if (off_100116648 == a6)
    goto LABEL_20;
  if (off_100116668 == a6)
  {
    v66 = sub_10005992C();
    v21 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "pointScale")));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uniqueId"));
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v96 = v67;
      *(_WORD *)&v96[8] = 2114;
      *(_QWORD *)&v96[10] = v18;
      v97 = 2114;
      v98 = v68;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "point scale changed to %{public}@ for display %{public}@ %{public}@", buf, 0x20u);

    }
    goto LABEL_19;
  }
  v83.receiver = self;
  v83.super_class = (Class)BKSharedCADisplayProvider;
  -[BKSharedCADisplayProvider observeValueForKeyPath:ofObject:change:context:](&v83, "observeValueForKeyPath:ofObject:change:context:", v10, v16, v12, a6);
LABEL_63:

}

- (void)_lock_updateObservingState
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSMutableSet *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];

  if (-[NSMutableSet count](self->_lock_monitors, "count"))
  {
    if (!self->_isObserving)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSharedCADisplayProvider displays](self, "displays"));
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v6)
              objc_enumerationMutation(v3);
            -[BKSharedCADisplayProvider _lock_addObserversToDisplay:](self, "_lock_addObserversToDisplay:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v5);
      }
      self->_isObserving = 1;

    }
  }
  else if (self->_isObserving)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_lock_observedDisplays;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          -[BKSharedCADisplayProvider _lock_removeObserversFromDisplay:](self, "_lock_removeObserversFromDisplay:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)j), (_QWORD)v13);
        }
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

    self->_isObserving = 0;
  }
}

- (void)_lock_addObserversToDisplay:(id)a3
{
  NSMutableSet *lock_observedDisplays;
  void *v6;
  id v7;

  lock_observedDisplays = self->_lock_observedDisplays;
  v7 = a3;
  if (-[NSMutableSet containsObject:](lock_observedDisplays, "containsObject:"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKCADisplayMonitor.m"), 162, CFSTR("attempting to add ourselves as an observer for an already tracked display. did we mix up mutable and immutable?"));

  }
  -[NSMutableSet addObject:](self->_lock_observedDisplays, "addObject:", v7);
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("availableModes"), 0, off_100116650);
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("currentMode"), 0, off_100116658);
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("logicalScale"), 0, off_100116660);
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("pointScale"), 0, off_100116668);

}

- (void)_lock_removeObserversFromDisplay:(id)a3
{
  NSMutableSet *lock_observedDisplays;
  void *v6;
  id v7;

  lock_observedDisplays = self->_lock_observedDisplays;
  v7 = a3;
  if ((-[NSMutableSet containsObject:](lock_observedDisplays, "containsObject:") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKCADisplayMonitor.m"), 171, CFSTR("attempting to remove ourselves as an observer for an untracked display. did we mix up mutable and immutable?"));

  }
  -[NSMutableSet removeObject:](self->_lock_observedDisplays, "removeObject:", v7);
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("availableModes"), off_100116650);
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("currentMode"), off_100116658);
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("logicalScale"), off_100116660);
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("pointScale"), off_100116668);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observedDisplays, 0);
  objc_storeStrong((id *)&self->_lock_monitors, 0);
}

+ (id)sharedInstance
{
  if (qword_100117570 != -1)
    dispatch_once(&qword_100117570, &stru_1000EC6A0);
  return (id)qword_100117578;
}

@end
