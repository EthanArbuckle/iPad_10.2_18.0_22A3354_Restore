@implementation TUIFeedRendererImageResourceObserver

- (TUIFeedRendererImageResourceObserver)initWithRenderModel:(id)a3 timeout:(double)a4
{
  id v7;
  TUIFeedRendererImageResourceObserver *v8;
  TUIFeedRendererImageResourceObserver *v9;
  dispatch_group_t v10;
  OS_dispatch_group *group;
  NSHashTable *v12;
  NSHashTable *enteredImageResources;
  dispatch_queue_t v14;
  OS_dispatch_queue *completionQueue;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUIFeedRendererImageResourceObserver;
  v8 = -[TUIFeedRendererImageResourceObserver init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_renderModel, a3);
    v10 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v10;

    v12 = (NSHashTable *)objc_alloc_init((Class)NSHashTable);
    enteredImageResources = v9->_enteredImageResources;
    v9->_enteredImageResources = v12;

    v14 = dispatch_queue_create("TUIFeedRendererImageResourceObserver.completionQueue", 0);
    completionQueue = v9->_completionQueue;
    v9->_completionQueue = (OS_dispatch_queue *)v14;

    v9->_timeout = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)waitForImageResources:(id)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  NSHashTable *v7;
  NSHashTable *imageResources;
  NSHashTable *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  dispatch_time_t v17;
  NSObject *completionQueue;
  OS_dispatch_group *group;
  OS_dispatch_queue *v20;
  id v21;
  _QWORD v22[5];
  _QWORD block[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v21 = a3;
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v28 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v29 = v4;
  v30 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUIResourceCollector createImageResourceCollector](TUIResourceCollector, "createImageResourceCollector"));
  -[TUIRenderModelLayer appendResourcesToCollector:transform:](self->_renderModel, "appendResourcesToCollector:transform:", v5, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageResources"));
  v7 = (NSHashTable *)objc_msgSend(v6, "copy");
  imageResources = self->_imageResources;
  self->_imageResources = v7;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = self->_imageResources;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "addInterest");
        objc_msgSend(v13, "addNonVolatileInterest");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageContentWithOptions:", 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "image"));
        v16 = v15 == 0;

        if (v16)
        {
          os_unfair_lock_lock(&self->_lock);
          if (-[NSHashTable containsObject:](self->_enteredImageResources, "containsObject:", v13))
          {
            os_unfair_lock_unlock(&self->_lock);
          }
          else
          {
            -[NSHashTable addObject:](self->_enteredImageResources, "addObject:", v13);
            dispatch_group_enter((dispatch_group_t)self->_group);
            os_unfair_lock_unlock(&self->_lock);
            objc_msgSend(v13, "addObserver:", self);
          }
        }

      }
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v10);
  }

  *(_QWORD *)&v28 = 0;
  *((_QWORD *)&v28 + 1) = &v28;
  *(_QWORD *)&v29 = 0x3032000000;
  *((_QWORD *)&v29 + 1) = sub_8ADB8;
  *(_QWORD *)&v30 = sub_8ADE0;
  *((_QWORD *)&v30 + 1) = objc_retainBlock(v21);
  v17 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  completionQueue = self->_completionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8ADE8;
  block[3] = &unk_240288;
  block[4] = &v28;
  dispatch_after(v17, completionQueue, block);
  group = self->_group;
  v20 = self->_completionQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_8AE3C;
  v22[3] = &unk_240288;
  v22[4] = &v28;
  TUIDispatchGroupNotifyViaRunloopIfMain(group, v20, v22);
  _Block_object_dispose(&v28, 8);

}

- (void)_leaveGroupIfImageResourceLoaded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageContentWithOptions:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));

  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    if (-[NSHashTable containsObject:](self->_enteredImageResources, "containsObject:", v4))
    {
      -[NSHashTable removeObject:](self->_enteredImageResources, "removeObject:", v4);
      dispatch_group_leave((dispatch_group_t)self->_group);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v7 = TUIDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_17DA14((uint64_t)v4, v8);

  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  -[TUIFeedRendererImageResourceObserver _leaveGroupIfImageResourceLoaded:](self, "_leaveGroupIfImageResourceLoaded:", a3);
}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (void)setImageResources:(id)a3
{
  objc_storeStrong((id *)&self->_imageResources, a3);
}

- (NSHashTable)enteredImageResources
{
  return self->_enteredImageResources;
}

- (void)setEnteredImageResources:(id)a3
{
  objc_storeStrong((id *)&self->_enteredImageResources, a3);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (TUIRenderModelLayer)renderModel
{
  return self->_renderModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_enteredImageResources, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end
