@implementation MessageListItemDragContext

+ (id)withItem:(id)a3 messageList:(id)a4
{
  id v5;
  id v6;
  MessageListItemDragContext *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[MessageListItemDragContext initWithItem:messageList:]([MessageListItemDragContext alloc], "initWithItem:messageList:", v5, v6);

  return v7;
}

+ (BOOL)dragItemsAreAllMessageListItems:(id)a3
{
  return objc_msgSend(a3, "ef_all:", &stru_10051F100);
}

- (MessageListItemDragContext)initWithItem:(id)a3 messageList:(id)a4
{
  id v7;
  id v8;
  MessageListItemDragContext *v9;
  MessageListItemDragContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MessageListItemDragContext;
  v9 = -[MessageListItemDragContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageListItem, a3);
    objc_storeStrong((id *)&v10->_messageList, a4);
  }

  return v10;
}

- (UIDragItem)dragItem
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIDragItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext itemProvider](self, "itemProvider"));
  v5 = objc_msgSend(v3, "initWithItemProvider:", v4);

  return (UIDragItem *)v5;
}

- (NSItemProvider)itemProvider
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext visibleSubjectString](self, "visibleSubjectString"));
  objc_msgSend(v3, "setSuggestedName:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext messageListItem](self, "messageListItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flags"));
  v7 = objc_msgSend(v6, "draft");

  if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010FC64;
    v15[3] = &unk_10051F150;
    v15[4] = self;
    objc_msgSend(v3, "registerObjectOfClass:visibility:loadHandler:", objc_opt_class(NSUserActivity), 1, v15);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext messageList](self, "messageList"));

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10010FE94;
      v14[3] = &unk_10051BD48;
      v14[4] = self;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState stateWithBuilder:](ConversationViewRestorationState, "stateWithBuilder:", v14));
      if (v9)
      {
        v10 = objc_opt_class(NSUserActivity);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10010FF60;
        v12[3] = &unk_10051F178;
        v12[4] = self;
        v13 = v9;
        objc_msgSend(v3, "registerObjectOfClass:visibility:loadHandler:", v10, 1, v12);

      }
    }
  }

  return (NSItemProvider *)v3;
}

- (NSString)visibleSubjectString
{
  NSString *visibleSubjectString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  visibleSubjectString = self->_visibleSubjectString;
  if (!visibleSubjectString)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext messageListItem](self, "messageListItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subject"));

    if (objc_msgSend(v5, "length"))
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subjectString"));
      v7 = self->_visibleSubjectString;
      self->_visibleSubjectString = v6;
    }
    else
    {
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_100531B00, CFSTR("Main")));
      v9 = self->_visibleSubjectString;
      self->_visibleSubjectString = v8;

    }
    visibleSubjectString = self->_visibleSubjectString;
  }
  return visibleSubjectString;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilemail.internalEMMessageListItemTransfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessage externalDataTypeIdentifiers](EMMessage, "externalDataTypeIdentifiers"));
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSAttributedString *v14;
  int v15;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100110534;
  v24[3] = &unk_10051F1A0;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v6));
  v25 = v8;
  v9 = objc_retainBlock(v24);
  if (objc_msgSend(v8, "conformsToType:", UTTypeEmailMessage))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext _loadDisplayMessageDataWithCompletion:](self, "_loadDisplayMessageDataWithCompletion:", v7));
  }
  else
  {
    if (objc_msgSend(v8, "conformsToType:", UTTypeURL))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext messageListItem](self, "messageListItem"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subject"));

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100110630;
      v20[3] = &unk_10051F1C8;
      v23 = v7;
      v21 = v12;
      v22 = v6;
      v13 = v12;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext _loadDisplayMessageContentWithCompletion:](self, "_loadDisplayMessageContentWithCompletion:", v20));

    }
    else
    {
      v14 = objc_opt_new(NSAttributedString);
      v15 = ((uint64_t (*)(_QWORD *, NSAttributedString *))v9[2])(v9, v14);

      if (v15)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10011071C;
        v17[3] = &unk_10051F1C8;
        v19 = v7;
        v17[4] = self;
        v18 = v6;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext _loadDisplayMessageContentWithCompletion:](self, "_loadDisplayMessageContentWithCompletion:", v17));

        v13 = v19;
      }
      else
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v10 = 0;
        (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v13);
      }
    }

  }
  return v10;
}

- (id)_loadDisplayMessageContentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EMContentRequestOptions optionsWithRequestedRepresentationType:networkUsage:](EMContentRequestOptions, "optionsWithRequestedRepresentationType:networkUsage:", EMContentRepresentationTypeRaw, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext messageListItem](self, "messageListItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestRepresentationWithOptions:completionHandler:", v5, v4));

  return v9;
}

- (id)_loadDisplayMessageDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100110A74;
  v7[3] = &unk_10051F1F0;
  v8 = a3;
  v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListItemDragContext _loadDisplayMessageContentWithCompletion:](self, "_loadDisplayMessageContentWithCompletion:", v7));

  return v5;
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setVisibleSubjectString:(id)a3
{
  objc_storeStrong((id *)&self->_visibleSubjectString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleSubjectString, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_messageListItem, 0);
}

@end
