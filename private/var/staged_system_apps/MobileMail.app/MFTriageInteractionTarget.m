@implementation MFTriageInteractionTarget

- (MFTriageInteractionTarget)initWithMessageListItem:(id)a3 primaryMessage:(id)a4 selectedMessageContent:(id)a5 primaryMessageContentRequest:(id)a6 targetPreference:(int64_t)a7 preferQuickCompositionalActions:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  MFTriageInteractionTarget *v19;
  MFTriageInteractionTarget *v20;
  NSArray *v21;
  NSArray *selectedMessageContent;
  void *v24;
  void *v25;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTriageInteractionTarget.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageListItem"));

    if (v16)
      goto LABEL_3;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTriageInteractionTarget.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryMessage"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)MFTriageInteractionTarget;
  v19 = -[MFTriageInteractionTarget init](&v27, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageListItem, a3);
    objc_storeStrong((id *)&v20->_primaryMessage, a4);
    v21 = (NSArray *)objc_msgSend(v17, "copy");
    selectedMessageContent = v20->_selectedMessageContent;
    v20->_selectedMessageContent = v21;

    objc_storeStrong((id *)&v20->_primaryMessageContentRequest, a6);
    v20->_targetPreference = a7;
    v20->_preferQuickCompositionalActions = a8;
  }

  return v20;
}

- (NSArray)targetedMessages
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if ((id)-[MFTriageInteractionTarget targetPreference](self, "targetPreference") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteractionTarget messageListItem](self, "messageListItem"));
    v11 = v3;
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MFTriageInteractionTarget primaryMessage](self, "primaryMessage"));
    v3 = (void *)v5;
    if (!v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteractionTarget messageListItem](self, "messageListItem"));
      v9 = v8;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

      goto LABEL_6;
    }
    v10 = v5;
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  v6 = (void *)v4;
LABEL_6:

  return (NSArray *)v6;
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

- (void)setMessageListItem:(id)a3
{
  objc_storeStrong((id *)&self->_messageListItem, a3);
}

- (EMMessage)primaryMessage
{
  return self->_primaryMessage;
}

- (void)setPrimaryMessage:(id)a3
{
  objc_storeStrong((id *)&self->_primaryMessage, a3);
}

- (NSArray)selectedMessageContent
{
  return self->_selectedMessageContent;
}

- (void)setSelectedMessageContent:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMessageContent, a3);
}

- (MessageContentRepresentationRequest)primaryMessageContentRequest
{
  return self->_primaryMessageContentRequest;
}

- (void)setPrimaryMessageContentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_primaryMessageContentRequest, a3);
}

- (int64_t)targetPreference
{
  return self->_targetPreference;
}

- (void)setTargetPreference:(int64_t)a3
{
  self->_targetPreference = a3;
}

- (BOOL)preferQuickCompositionalActions
{
  return self->_preferQuickCompositionalActions;
}

- (void)setPreferQuickCompositionalActions:(BOOL)a3
{
  self->_preferQuickCompositionalActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryMessageContentRequest, 0);
  objc_storeStrong((id *)&self->_selectedMessageContent, 0);
  objc_storeStrong((id *)&self->_primaryMessage, 0);
  objc_storeStrong((id *)&self->_messageListItem, 0);
}

@end
