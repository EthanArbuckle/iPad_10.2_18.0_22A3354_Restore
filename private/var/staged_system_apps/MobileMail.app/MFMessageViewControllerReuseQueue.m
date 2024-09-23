@implementation MFMessageViewControllerReuseQueue

- (MFMessageViewControllerReuseQueue)initWithScene:(id)a3
{
  id v4;
  MFMessageViewControllerReuseQueue *v5;
  MFMessageViewControllerReuseQueue *v6;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *keyOrdering;
  NSMutableDictionary *v9;
  NSMutableDictionary *messageViewControllers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFMessageViewControllerReuseQueue;
  v5 = -[MFMessageViewControllerReuseQueue init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    keyOrdering = v6->_keyOrdering;
    v6->_keyOrdering = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageViewControllers = v6->_messageViewControllers;
    v6->_messageViewControllers = v9;

  }
  return v6;
}

- (id)debugDescription
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = -[MFMessageViewControllerReuseQueue generatedMessageViewControllersCount](self, "generatedMessageViewControllersCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue keyOrdering](self, "keyOrdering"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue messageViewControllers](self, "messageViewControllers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p (\n\tgenerated:%lu\n\tkeyOrdering: %@\n\tmessageViewControllers:%@)"), v3, self, v4, v5, v6));

  return v7;
}

- (id)_dequeueMessageViewControllerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue messageViewControllers](self, "messageViewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue messageViewControllers](self, "messageViewControllers"));
    objc_msgSend(v7, "removeObjectForKey:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue keyOrdering](self, "keyOrdering"));
    objc_msgSend(v8, "removeObject:", v4);

  }
  return v6;
}

- (id)_dequeueLeastRecentlyUsedMessageViewController
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue keyOrdering](self, "keyOrdering", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue _dequeueMessageViewControllerForKey:](self, "_dequeueMessageViewControllerForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7)));
      if (v8)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (void)_evictLeastRecentlyUsedMessageViewControllers
{
  void *v3;
  id v4;
  id v5;

  while (1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue messageViewControllers](self, "messageViewControllers"));
    v4 = objc_msgSend(v3, "count");

    if ((unint64_t)v4 < 6)
      break;
    v5 = -[MFMessageViewControllerReuseQueue _dequeueLeastRecentlyUsedMessageViewController](self, "_dequeueLeastRecentlyUsedMessageViewController");
  }
}

- (id)dequeueMessageViewControllerForContentRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  MFMessageViewController *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  id v12;
  MFMessageViewController *v13;
  uint64_t v14;
  NSObject *v15;
  MFMessageViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MFMessageViewController *v21;
  int v23;
  void *v24;
  __int16 v25;
  MFMessageViewController *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
  v6 = objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue _dequeueMessageViewControllerForKey:](self, "_dequeueMessageViewControllerForKey:", v5));
  v7 = (MFMessageViewController *)v6;
  if (v6)
  {
    v8 = MFLogGeneral(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v23 = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v7;
      v10 = "#MVCReuseQueue ← [%@: %@]";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v23, 0x16u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (-[MFMessageViewControllerReuseQueue generatedMessageViewControllersCount](self, "generatedMessageViewControllersCount") < 5)goto LABEL_9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue messageViewControllers](self, "messageViewControllers"));
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    goto LABEL_9;
  v13 = (MFMessageViewController *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue _dequeueLeastRecentlyUsedMessageViewController](self, "_dequeueLeastRecentlyUsedMessageViewController"));
  v14 = MFLogGeneral(-[MFMessageViewController prepareForReuse](v13, "prepareForReuse"));
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v23 = 138412546;
    v24 = v5;
    v25 = 2112;
    v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#MVCReuseQueue ⇠ [%@: %@]", (uint8_t *)&v23, 0x16u);
  }

  if (!v13)
  {
LABEL_9:
    v16 = [MFMessageViewController alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue scene](self, "scene"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accountsController"));
    v7 = -[MFMessageViewController initWithScene:accountsController:](v16, "initWithScene:accountsController:", v17, v19);

    v20 = MFLogGeneral(-[MFMessageViewControllerReuseQueue setGeneratedMessageViewControllersCount:](self, "setGeneratedMessageViewControllersCount:", (char *)-[MFMessageViewControllerReuseQueue generatedMessageViewControllersCount](self, "generatedMessageViewControllersCount")+ 1));
    v9 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v23 = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v7;
      v10 = "#MVCReuseQueue + [%@: %@]";
      goto LABEL_11;
    }
LABEL_12:

    v13 = v7;
  }
  v21 = v13;

  return v21;
}

- (void)enqueueMessageViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemID"));

  if (v6)
  {
    v8 = MFLogGeneral(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#MVCReuseQueue → [%@: %@]", (uint8_t *)&v12, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue messageViewControllers](self, "messageViewControllers"));
    objc_msgSend(v10, "setObject:forKey:", v4, v6);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue keyOrdering](self, "keyOrdering"));
    objc_msgSend(v11, "insertObject:atIndex:", v6, 0);

  }
  -[MFMessageViewControllerReuseQueue _evictLeastRecentlyUsedMessageViewControllers](self, "_evictLeastRecentlyUsedMessageViewControllers");

}

- (void)drain
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue messageViewControllers](self, "messageViewControllers"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewControllerReuseQueue keyOrdering](self, "keyOrdering"));
  objc_msgSend(v4, "removeAllObjects");

  -[MFMessageViewControllerReuseQueue setGeneratedMessageViewControllersCount:](self, "setGeneratedMessageViewControllersCount:", 0);
}

- (NSMutableOrderedSet)keyOrdering
{
  return self->_keyOrdering;
}

- (void)setKeyOrdering:(id)a3
{
  objc_storeStrong((id *)&self->_keyOrdering, a3);
}

- (NSMutableDictionary)messageViewControllers
{
  return self->_messageViewControllers;
}

- (void)setMessageViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_messageViewControllers, a3);
}

- (unint64_t)generatedMessageViewControllersCount
{
  return self->_generatedMessageViewControllersCount;
}

- (void)setGeneratedMessageViewControllersCount:(unint64_t)a3
{
  self->_generatedMessageViewControllersCount = a3;
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageViewControllers, 0);
  objc_storeStrong((id *)&self->_keyOrdering, 0);
}

@end
