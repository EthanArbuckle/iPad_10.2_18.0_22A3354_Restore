@implementation NCNotificationCollapsingQueue

- (NCNotificationCollapsingQueue)init
{
  NCNotificationCollapsingQueue *v2;
  uint64_t v3;
  NSMutableArray *requests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationCollapsingQueue;
  v2 = -[NCNotificationCollapsingQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableArray *)v3;

    v2->_collapsingThreshold = 5;
  }
  return v2;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[NCNotificationCollapsingQueue requests](self, "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)enqueuedRequestIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[NCNotificationCollapsingQueue requests](self, "requests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "notificationIdentifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (void)addNotificationRequest:(id)a3
{
  unint64_t v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[NCNotificationCollapsingQueue _indexOfRequestMatchingNotificationRequest:](self, "_indexOfRequestMatchingNotificationRequest:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v4;
    -[NCNotificationCollapsingQueue requests](self, "requests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v7, v9);
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v9, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preemptsPresentedNotification");

  if (!v6)
  {
    -[NCNotificationCollapsingQueue requests](self, "requests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);
    goto LABEL_6;
  }
  -[NCNotificationCollapsingQueue _insertPreemptingNotificationRequest:](self, "_insertPreemptingNotificationRequest:", v9);
LABEL_7:

}

- (void)replaceNotificationRequest:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[NCNotificationCollapsingQueue _indexOfRequestMatchingNotificationRequest:](self, "_indexOfRequestMatchingNotificationRequest:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NCNotificationCollapsingQueue requests](self, "requests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v5, v7);

  }
}

- (void)removeNotificationRequest:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;

  v4 = -[NCNotificationCollapsingQueue _indexOfRequestMatchingNotificationRequest:](self, "_indexOfRequestMatchingNotificationRequest:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NCNotificationCollapsingQueue requests](self, "requests");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", v5);

  }
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NCNotificationCollapsingQueue requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)containsNotificationRequestMatchingRequest:(id)a3
{
  return -[NCNotificationCollapsingQueue _indexOfRequestMatchingNotificationRequest:](self, "_indexOfRequestMatchingNotificationRequest:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)peekNextNotificationRequest
{
  return -[NCNotificationCollapsingQueue peekNextNotificationRequestPassingTest:](self, "peekNextNotificationRequestPassingTest:", 0);
}

- (id)peekNextNotificationRequestPassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = (unsigned int (**)(id, void *))a3;
  -[NCNotificationCollapsingQueue requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[NCNotificationCollapsingQueue requests](self, "requests");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NCNotificationCollapsingQueue _collapsedNotificationRequestForNotificationRequest:atIndex:](self, "_collapsedNotificationRequestForNotificationRequest:atIndex:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4 || v4[2](v4, v10))
        break;
      ++v7;

      -[NCNotificationCollapsingQueue requests](self, "requests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v7 >= v12)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (id)notificationRequestsCoalescebleWithCoalescedRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NCNotificationCollapsingQueue requests](self, "requests", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "matchesThreadForRequest:", v11))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_insertPreemptingNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NCNotificationCollapsingQueue requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_0);

  -[NCNotificationCollapsingQueue requests](self, "requests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "addObject:", v4);
  else
    objc_msgSend(v7, "insertObject:atIndex:", v4, v6);

}

uint64_t __70__NCNotificationCollapsingQueue__insertPreemptingNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preemptsPresentedNotification") ^ 1;

  return v3;
}

- (unint64_t)_indexOfRequestMatchingNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NCNotificationCollapsingQueue requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__NCNotificationCollapsingQueue__indexOfRequestMatchingNotificationRequest___block_invoke;
  v9[3] = &unk_24D2700E8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __76__NCNotificationCollapsingQueue__indexOfRequestMatchingNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (id)_requestsCollapsibleWithNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NCNotificationCollapsingQueue requests](self, "requests", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isCollapsibleWithNotificationRequest:", v4))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)_collapsedCountForCollapsibleRequests:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isCollapsedNotification"))
          v10 = objc_msgSend(v9, "collapsedNotificationsCount");
        else
          v10 = 1;
        v6 += v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_collapsedNotificationRequestFromCollapsibleRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationIdentifier:", v7);

  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionIdentifier:", v8);

  objc_msgSend(v6, "threadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThreadIdentifier:", v9);

  objc_msgSend(v6, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimestamp:", v10);

  objc_msgSend(v6, "requestDestinations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestDestinations:", v11);

  objc_msgSend(v6, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOptions:", v12);

  objc_msgSend(v6, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContext:", v13);

  objc_msgSend(v6, "settingsSections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSettingsSections:", v14);

  objc_msgSend(v6, "sound");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSound:", v15);

  objc_msgSend(v6, "sourceInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceInfo:", v16);

  objc_msgSend(v6, "cancelAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCancelAction:", v17);

  objc_msgSend(v6, "clearAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClearAction:", v18);

  objc_msgSend(v6, "closeAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloseAction:", v19);

  objc_msgSend(v6, "defaultAction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultAction:", v20);

  objc_msgSend(v6, "silenceAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSilenceAction:", v21);

  v22 = (void *)objc_opt_new();
  objc_msgSend(v6, "content");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "customHeader");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCustomHeader:", v24);

  objc_msgSend(v6, "content");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "defaultHeader");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDefaultHeader:", v26);

  objc_msgSend(v6, "content");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "icons");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIcons:", v28);

  objc_msgSend(v6, "content");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "carPlayIcons");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCarPlayIcons:", v30);

  objc_msgSend(v6, "content");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hiddenPreviewsBodyPlaceholder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHiddenPreviewsBodyPlaceholder:", v32);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDate:", v33);

  objc_msgSend(v5, "setContent:", v22);
  objc_msgSend(v5, "setIsCollapsedNotification:", 1);
  v34 = -[NCNotificationCollapsingQueue _collapsedCountForCollapsibleRequests:](self, "_collapsedCountForCollapsibleRequests:", v4);

  objc_msgSend(v5, "setCollapsedNotificationsCount:", v34);
  return v5;
}

- (id)_collapsedNotificationRequestForNotificationRequest:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[NCNotificationCollapsingQueue _requestsCollapsibleWithNotificationRequest:](self, "_requestsCollapsibleWithNotificationRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NCNotificationCollapsingQueue _collapsedCountForCollapsibleRequests:](self, "_collapsedCountForCollapsibleRequests:", v7);
  v9 = v6;
  if (-[NCNotificationCollapsingQueue collapsingThreshold](self, "collapsingThreshold") >= 2)
  {
    v9 = v6;
    if (v8 >= -[NCNotificationCollapsingQueue collapsingThreshold](self, "collapsingThreshold"))
    {
      -[NCNotificationCollapsingQueue _collapsedNotificationRequestFromCollapsibleRequests:](self, "_collapsedNotificationRequestFromCollapsibleRequests:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NCNotificationCollapsingQueue requests](self, "requests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectsInArray:", v7);

      -[NCNotificationCollapsingQueue requests](self, "requests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertObject:atIndex:", v9, a4);

    }
  }

  return v9;
}

- (unint64_t)collapsingThreshold
{
  return self->_collapsingThreshold;
}

- (void)setCollapsingThreshold:(unint64_t)a3
{
  self->_collapsingThreshold = a3;
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
