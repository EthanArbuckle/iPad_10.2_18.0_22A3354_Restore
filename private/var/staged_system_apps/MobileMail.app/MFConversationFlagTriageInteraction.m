@implementation MFConversationFlagTriageInteraction

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___MFConversationFlagTriageInteraction;
  v11 = objc_msgSendSuper2(&v17, "interactionWithMessageListItemSelection:undoManager:origin:actor:reason:", v10, a4, a5, a6, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if ((objc_msgSend(v10, "isSelectAll") & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageListItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayMessage"));
    objc_msgSend(v12, "setDisplayMessage:", v15);

  }
  return v12;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(objc_alloc((Class)MSMessageListItemSelection), "initWithMessageListItems:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v12, v11, a5, a6));

  return v13;
}

+ (id)interactionWithReferenceMessage:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v10 = a3;
  v11 = a4;
  v15 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "interactionWithMessageListItems:undoManager:origin:actor:", v12, v11, a5, a6));

  return v13;
}

- (EMMessage)referenceMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationFlagTriageInteraction displayMessage](self, "displayMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "result"));

  return (EMMessage *)v3;
}

- (EFFuture)displayMessage
{
  return self->_displayMessage;
}

- (void)setDisplayMessage:(id)a3
{
  objc_storeStrong((id *)&self->_displayMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
}

@end
