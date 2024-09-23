@implementation MFConversationItemFooterView

- (void)render:(id)a3
{
  char *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (char *)objc_msgSend(v6, "type");
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (!v4)
      -[MFConversationItemFooterView hideAttribution](self, "hideAttribution");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderName"));
    -[MFConversationItemFooterView showAttributionWithSenderName:](self, "showAttributionWithSenderName:", v5);

  }
}

@end
