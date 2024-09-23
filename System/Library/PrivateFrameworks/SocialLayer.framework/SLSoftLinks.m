@implementation SLSoftLinks

+ (id)newComposeViewControllerInstance
{
  return (id)objc_msgSend(objc_alloc((Class)getMFMessageComposeViewControllerClass()), "init");
}

+ (id)newComposeViewControllerDelegateInstance:(id)a3
{
  id v3;
  SLComposeViewControllerDelegate *v4;

  v3 = a3;
  v4 = -[SLComposeViewControllerDelegate initWithCallback:]([SLComposeViewControllerDelegate alloc], "initWithCallback:", v3);

  return v4;
}

+ (id)newComposeViewControllerInstanceWithDelegate:(id)a3 itemProvider:(id)a4 collaborationOptions:(id)a5 collaborationMetadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)getMFMessageComposeViewControllerClass()), "init");
  objc_msgSend(v13, "setMessageComposeDelegate:", v12);

  objc_msgSend(v13, "insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:", v11, v10, v9, 1);
  return v13;
}

+ (BOOL)canSendText
{
  return objc_msgSend(getMFMessageComposeViewControllerClass(), "canSendText");
}

@end
