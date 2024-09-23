@implementation MFConversationCurrentVisibleMessageStrategy

- (MFConversationCurrentVisibleMessageStrategy)initWithConversationViewController:(id)a3
{
  id v5;
  MFConversationCurrentVisibleMessageStrategy *v6;
  MFConversationCurrentVisibleMessageStrategy *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFConversationCurrentVisibleMessageStrategy.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

  }
  v10.receiver = self;
  v10.super_class = (Class)MFConversationCurrentVisibleMessageStrategy;
  v6 = -[MFConversationCurrentVisibleMessageStrategy init](&v10, "init");
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_viewController, v5);

  return v7;
}

- (id)persistentIDForEMMessageObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationCurrentVisibleMessageStrategy viewController](self, "viewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_persistentIDForEMMessageObjectID:", v4));

  return v6;
}

- (MessageContentRepresentationRequest)currentVisibleMessageContentRequest
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[10];
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[4];
  BOOL v29;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "collectionView"));
  objc_msgSend(v3, "mf_visibleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(WeakRetained, "conversationSortOrder");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001539CC;
  v28[3] = &unk_100520BA8;
  v29 = v12 != (id)1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingComparator:", v28));

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100153A6C;
  v26 = sub_100153A7C;
  v27 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100153A84;
  v20[3] = &unk_100520BD0;
  v20[6] = v5;
  v20[7] = v7;
  v20[8] = v9;
  v20[9] = v11;
  v20[4] = v21;
  v20[5] = &v22;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
  v15 = v23[5];
  v16 = objc_opt_class(MFMessageConversationViewCell);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "viewModel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "messageContentRequest"));

  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

  return (MessageContentRepresentationRequest *)v18;
}

- (ConversationViewControllerBase)viewController
{
  return (ConversationViewControllerBase *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
