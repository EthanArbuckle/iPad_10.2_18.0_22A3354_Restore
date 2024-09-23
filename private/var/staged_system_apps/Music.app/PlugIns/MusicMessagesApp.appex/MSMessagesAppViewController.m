@implementation MSMessagesAppViewController

- (void)mma_shareRichLinkMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[MSMessagesAppViewController requestPresentationStyle:](self, "requestPresentationStyle:", 0);
  v5 = (void *)objc_opt_new(MSRichLink);
  objc_msgSend(v5, "set_linkMetadata:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSMessagesAppViewController activeConversation](self, "activeConversation"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004380;
  v8[3] = &unk_100464368;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "insertRichLink:completionHandler:", v5, v8);

}

@end
