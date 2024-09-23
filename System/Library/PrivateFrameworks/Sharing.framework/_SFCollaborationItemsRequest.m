@implementation _SFCollaborationItemsRequest

- (_SFCollaborationItemsRequest)initWithActivityItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _SFCollaborationItemsRequest *v8;
  NSObject *v9;
  uint64_t v10;
  NSArray *activityItems;
  uint64_t v12;
  id completionHandler;
  uint64_t v14;
  NSMutableArray *remainingActivityItems;
  uint64_t v16;
  NSMutableArray *collaborationItems;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_SFCollaborationItemsRequest;
  v8 = -[_SFCollaborationItemsRequest init](&v19, sel_init);
  if (v8)
  {
    share_sheet_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v21 = v6;
      _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_INFO, "New _SFCollaborationItemsRequest for activityItems:%{private}@", buf, 0xCu);
    }

    v10 = objc_msgSend(v6, "copy");
    activityItems = v8->_activityItems;
    v8->_activityItems = (NSArray *)v10;

    v12 = objc_msgSend(v7, "copy");
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v12;

    v14 = objc_msgSend(v6, "mutableCopy");
    remainingActivityItems = v8->_remainingActivityItems;
    v8->_remainingActivityItems = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    collaborationItems = v8->_collaborationItems;
    v8->_collaborationItems = (NSMutableArray *)v16;

  }
  return v8;
}

- (void)cancel
{
  -[_SFCollaborationItemsRequest setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (id)collaborationService
{
  void *v3;
  void *v4;

  -[_SFCollaborationItemsRequest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collaborationServiceForItemsRequest:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_processRemainingActivityItems
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(id, void *, _QWORD);

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[_SFCollaborationItemsRequest supportsMultipleCollaboration](self, "supportsMultipleCollaboration"))
  {
    v3 = 0;
  }
  else
  {
    -[_SFCollaborationItemsRequest collaborationItems](self, "collaborationItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 2)
    {
      -[_SFCollaborationItemsRequest collaborationItems](self, "collaborationItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "type"))
      {
        v3 = 0;
      }
      else
      {
        -[_SFCollaborationItemsRequest collaborationItems](self, "collaborationItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v8, "type") == 0;

      }
    }
    else
    {
      v3 = 0;
    }

  }
  -[_SFCollaborationItemsRequest remainingActivityItems](self, "remainingActivityItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v3 || !v10)
  {
    -[_SFCollaborationItemsRequest completionHandler](self, "completionHandler");
    v24 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
    -[_SFCollaborationItemsRequest setCompletionHandler:](self, "setCompletionHandler:", 0);
    -[_SFCollaborationItemsRequest collaborationItems](self, "collaborationItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, v14, 0);
  }
  else
  {
    -[_SFCollaborationItemsRequest remainingActivityItems](self, "remainingActivityItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v24 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();

    -[_SFCollaborationItemsRequest remainingActivityItems](self, "remainingActivityItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", 0);

    -[_SFCollaborationItemsRequest delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collaborationItemsRequest:resolveActivityItem:", self, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFCollaborationItemsRequest collaborationItems](self, "collaborationItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "type") == 1)
    {
      v18 = 0;
    }
    else
    {
      -[_SFCollaborationItemsRequest collaborationItems](self, "collaborationItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v20, "type") != 2;

    }
    -[_SFCollaborationItemsRequest collaborationService](self, "collaborationService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFCollaborationItemsRequest managedFileURL](self, "managedFileURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFCollaborationItemInspector inspectActivityItemValue:activityItem:service:shouldInspectFiles:managedFileURL:isURLProviderSupported:](SFCollaborationItemInspector, "inspectActivityItemValue:activityItem:service:shouldInspectFiles:managedFileURL:isURLProviderSupported:", v15, v24, v21, v18, v22, -[_SFCollaborationItemsRequest isURLProviderSupported](self, "isURLProviderSupported"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      -[_SFCollaborationItemsRequest _addCollaborationItem:](self, "_addCollaborationItem:", v23);
    -[_SFCollaborationItemsRequest _processRemainingActivityItems](self, "_processRemainingActivityItems");

  }
}

- (void)_addCollaborationItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  void *v20;
  _BOOL4 v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  v21 = objc_msgSend(v4, "type") != 1 && objc_msgSend(v4, "type") != 2;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_SFCollaborationItemsRequest remainingActivityItems](self, "remainingActivityItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[_SFCollaborationItemsRequest delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "collaborationItemsRequest:resolveActivityItem:", self, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFCollaborationItemsRequest collaborationService](self, "collaborationService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFCollaborationItemsRequest managedFileURL](self, "managedFileURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFCollaborationItemInspector inspectActivityItemValue:activityItem:service:shouldInspectFiles:managedFileURL:isURLProviderSupported:](SFCollaborationItemInspector, "inspectActivityItemValue:activityItem:service:shouldInspectFiles:managedFileURL:isURLProviderSupported:", v12, v9, v13, v21, v14, -[_SFCollaborationItemsRequest isURLProviderSupported](self, "isURLProviderSupported"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {

          goto LABEL_16;
        }
        objc_msgSend(v22, "addObject:", v9);
        if (v12)
          objc_msgSend(v20, "addObject:", v12);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_16:

  -[_SFCollaborationItemsRequest remainingActivityItems](self, "remainingActivityItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsInArray:", v22);

  objc_msgSend(v18, "setSendCopyActivityItems:", v22);
  objc_msgSend(v18, "setSendCopyActivityItemValues:", v20);
  -[_SFCollaborationItemsRequest collaborationItems](self, "collaborationItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

}

- (_SFCollaborationItemsRequestDelegate)delegate
{
  return (_SFCollaborationItemsRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)supportsMultipleCollaboration
{
  return self->_supportsMultipleCollaboration;
}

- (void)setSupportsMultipleCollaboration:(BOOL)a3
{
  self->_supportsMultipleCollaboration = a3;
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isURLProviderSupported
{
  return self->_isURLProviderSupported;
}

- (void)setIsURLProviderSupported:(BOOL)a3
{
  self->_isURLProviderSupported = a3;
}

- (NSMutableArray)remainingActivityItems
{
  return self->_remainingActivityItems;
}

- (void)setRemainingActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_remainingActivityItems, a3);
}

- (NSMutableArray)collaborationItems
{
  return self->_collaborationItems;
}

- (void)setCollaborationItems:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationItems, 0);
  objc_storeStrong((id *)&self->_remainingActivityItems, 0);
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
