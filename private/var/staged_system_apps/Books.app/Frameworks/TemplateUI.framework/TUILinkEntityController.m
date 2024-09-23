@implementation TUILinkEntityController

- (TUILinkEntityController)initWithFeedId:(id)a3 queue:(id)a4 viewResolver:(id)a5
{
  id v9;
  id v10;
  TUILinkEntityController *v11;
  TUILinkEntityController *v12;
  uint64_t v13;
  NSHashTable *q_observers;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUILinkEntityController;
  v11 = -[TUILinkEntityController init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    v11->_feedId.uniqueIdentifier = a3.var0;
    objc_storeStrong((id *)&v11->_queue, a4);
    objc_storeWeak((id *)&v12->_viewResolver, v10);
    v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    q_observers = v12->_q_observers;
    v12->_q_observers = (NSHashTable *)v13;

  }
  return v12;
}

- (void)attachToTracker:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_tracker, a3);
  v5 = a3;
  objc_msgSend(v5, "addVisibilityObserver:", self);

}

- (void)detachFromTracker
{
  NSObject *queue;
  TUIVisibilityTracker *tracker;
  _QWORD block[5];

  -[TUIVisibilityTracker removeVisibilityObserver:](self->_tracker, "removeVisibilityObserver:", self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_ADEA4;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async(queue, block);
  tracker = self->_tracker;
  self->_tracker = 0;

}

- (void)visibleContentsChanged:(id)a3
{
  id v4;
  TUIVisibilityChangeNode *v5;
  TUIVisibilityChangeNode *q_visibleNode;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  NSHashTable *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  TUILinkEntityController *v24;
  __int16 v25;
  NSMutableArray *v26;
  __int16 v27;
  NSMutableArray *v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (TUIVisibilityChangeNode *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNode"));
  q_visibleNode = self->_q_visibleNode;
  self->_q_visibleNode = v5;

  v7 = objc_opt_new(NSMutableArray);
  v8 = objc_opt_new(NSMutableArray);
  v18 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNode"));
  sub_AE41C(v7, v8, v9, 0);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_q_observers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v16 = TUILinkEntityObserverLog();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v24 = self;
          v25 = 2112;
          v26 = v7;
          v27 = 2112;
          v28 = v8;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "visible-content-changed observer[%p]: added=%@ removed=%@", buf, 0x20u);
        }

        objc_msgSend(v15, "linkEntityController:visibleEntityReferencesWithAdded:removed:", self, v7, v8);
      }
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v12);
  }

}

- (void)addLinkEntityObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_AE754;
  v7[3] = &unk_23D7D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeLinkEntityObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_AEAA0;
  v7[3] = &unk_23D7D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)visibleLinkEntityReferencesWithFilter:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_AEC4C;
    block[3] = &unk_240950;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
}

- (void)invokeAction:(id)a3 forLinkEntityReference:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  id WeakRetained;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  unint64_t uniqueIdentifier;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  id v47;
  id v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *log;
  _BOOL4 v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint8_t buf[4];
  unint64_t v62;
  __int16 v63;
  id v64;
  __int16 v65;
  NSObject *v66;
  __int16 v67;
  id v68;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject resolvePath](v11, "resolvePath"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewResolver);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "resolveViewWithPath:", v14));

  v17 = v16;
  v18 = TUILinkEntityActionLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218754;
    v62 = uniqueIdentifier;
    v63 = 2112;
    v64 = v10;
    v65 = 2112;
    v66 = v11;
    v67 = 2112;
    v68 = v12;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "[fid:%lu] performAction:%@ linkEntity:%@ params:%@", buf, 0x2Au);
  }

  if (v17)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject layoutAttributes](v17, "layoutAttributes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "renderModel"));
    v23 = TUIProtocolCast(&OBJC_PROTOCOL___TUIRenderModelActionContaining, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "actionHandler"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject model](v11, "model"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "actionsMap"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v10));

    if (!v27)
    {
      v35 = TUILinkEntityActionLog();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_17E13C((uint64_t)self, (uint64_t)v10, v36);

      if (v13)
        v13[2](v13, 0);
      v31 = v17;
      goto LABEL_33;
    }
    v57 = v25;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "refId"));

    v58 = v14;
    v59 = v10;
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "refId"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject descendentViewWithRefId:](v17, "descendentViewWithRefId:", v29));

      v56 = v30 == 0;
      if (v30)
      {
        v31 = v30;
        v32 = v17;
      }
      else
      {
        v37 = TUILinkEntityActionLog();
        log = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v49 = self->_feedId.uniqueIdentifier;
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "refId"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject layoutAttributes](v17, "layoutAttributes"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "renderModel"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "tui_identifierToString"));
          *(_DWORD *)buf = 134218754;
          v62 = v49;
          v63 = 2112;
          v64 = v52;
          v65 = 2112;
          v66 = v17;
          v67 = 2112;
          v68 = v50;
          _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to lookup refId:%@ descendentOfView:%@ (%@); falling back on view",
            buf,
            0x2Au);

          v32 = log;
          v31 = v17;
        }
        else
        {
          v31 = v17;
          v32 = log;
        }
      }

    }
    else
    {
      v56 = 1;
      v31 = v17;
    }
    if (v12)
      v38 = v12;
    else
      v38 = &__NSDictionary0__struct;
    v39 = objc_msgSend(v38, "mutableCopy");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[TUIElementActionTriggerHandler argumentsForView:](TUIElementActionTriggerHandler, "argumentsForView:", v31));
    objc_msgSend(v39, "addEntriesFromDictionary:", v40);

    v41 = objc_msgSend(v39, "copy");
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trigger"));
    if (v42
      && (v43 = (void *)v42,
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trigger")),
          v45 = objc_msgSend(v60, "hasActionForTrigger:", v44),
          v44,
          v43,
          v45))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trigger"));
      objc_msgSend(v60, "invoke:view:allowRefId:arguments:", v46, v31, v56, v41);

      if (v13)
        v13[2](v13, 1);
    }
    else
    {
      v47 = objc_loadWeakRetained((id *)&self->_actionHandler);

      if (v47)
      {
        v48 = objc_loadWeakRetained((id *)&self->_actionHandler);
        objc_msgSend(v48, "handleAction:forLinkEntity:withParameters:sourceView:completion:", v59, v11, v41, v31, v13);

        v10 = v59;
        v12 = v41;
LABEL_32:
        v25 = v57;
        v14 = v58;
LABEL_33:

        goto LABEL_34;
      }
      v13[2](v13, 0);
    }
    v12 = v41;
    v10 = v59;
    goto LABEL_32;
  }
  v33 = TUILinkEntityActionLog();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    sub_17E08C((uint64_t)self, v14, v34);

  if (v13)
    v13[2](v13, 0);
LABEL_34:

}

- (TUILinkEntityActionHandling)actionHandler
{
  return (TUILinkEntityActionHandling *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_q_observers, 0);
  objc_storeStrong((id *)&self->_q_visibleNode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_destroyWeak((id *)&self->_viewResolver);
}

@end
