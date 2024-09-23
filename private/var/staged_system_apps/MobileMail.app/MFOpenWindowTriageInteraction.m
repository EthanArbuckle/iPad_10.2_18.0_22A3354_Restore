@implementation MFOpenWindowTriageInteraction

+ (id)interactionWithMessageListItem:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageList:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;
  id v17;

  v10 = a3;
  v11 = a6;
  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0)
  {
    v17 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v16.receiver = a1;
    v16.super_class = (Class)&OBJC_METACLASS___MFOpenWindowTriageInteraction;
    v13 = objc_msgSendSuper2(&v16, "interactionWithMessageListItems:undoManager:origin:actor:", v12, 0, a4, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    objc_msgSend(v14, "setMessageList:", v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)menuActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v15 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageListItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFOpenWindowTriageInteraction messageList](self, "messageList"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100198604;
  v18[3] = &unk_10051B3B0;
  v11 = v6;
  v18[4] = self;
  v19 = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100198624;
  v16[3] = &unk_10051B3B0;
  v12 = v15;
  v16[4] = self;
  v17 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MFBayAdoption openMessageInNewWindowActionWithMessage:messageList:preparation:completion:](MFBayAdoption, "openMessageInNewWindowActionWithMessage:messageList:preparation:completion:", v9, v10, v18, v16));

  return v13;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_messageList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageList, 0);
}

@end
