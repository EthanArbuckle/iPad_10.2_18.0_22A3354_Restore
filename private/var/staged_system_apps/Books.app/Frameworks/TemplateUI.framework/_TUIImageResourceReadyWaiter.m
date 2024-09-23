@implementation _TUIImageResourceReadyWaiter

- (_TUIImageResourceReadyWaiter)initWithImageResources:(id)a3 assertion:(id)a4 assertionQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TUIImageResourceReadyWaiter *v11;
  _TUIImageResourceReadyWaiter *v12;
  dispatch_group_t v13;
  OS_dispatch_group *group;
  NSHashTable *v15;
  NSHashTable *imageResources;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  OS_dispatch_group *v23;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_TUIImageResourceReadyWaiter;
  v11 = -[_TUIImageResourceReadyWaiter init](&v31, "init");
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = dispatch_group_create();
    group = v12->_group;
    v12->_group = (OS_dispatch_group *)v13;

    v15 = (NSHashTable *)objc_msgSend(v8, "copy");
    imageResources = v12->_imageResources;
    v12->_imageResources = v15;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v21);
          dispatch_group_enter((dispatch_group_t)v12->_group);
          objc_msgSend(v22, "addObserver:", v12);
          if ((objc_msgSend(v22, "isImageLoading") & 1) == 0)
          {
            dispatch_group_leave((dispatch_group_t)v12->_group);
            objc_msgSend(v22, "removeObserver:", v12);
            -[NSHashTable removeObject:](v12->_imageResources, "removeObject:", v22);
          }
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v19);
    }

    objc_storeStrong((id *)&v12->_assertion, a4);
    v23 = v12->_group;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10B348;
    v25[3] = &unk_23D938;
    v26 = v9;
    TUIDispatchGroupNotifyViaRunloopIfMain(v23, v10, v25);

  }
  return v12;
}

- (void)dealloc
{
  NSHashTable *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_imageResources;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "removeObserver:", self);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_TUIImageResourceReadyWaiter;
  -[_TUIImageResourceReadyWaiter dealloc](&v8, "dealloc");
}

- (void)imageResourceDidChangeImage:(id)a3
{
  unsigned int v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "isImageLoaded");
  os_unfair_lock_lock(&self->_lock);
  if (v4 && -[NSHashTable containsObject:](self->_imageResources, "containsObject:", v5))
  {
    -[NSHashTable removeObject:](self->_imageResources, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v5, "removeObserver:", self);
    dispatch_group_leave((dispatch_group_t)self->_group);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (TUIAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
