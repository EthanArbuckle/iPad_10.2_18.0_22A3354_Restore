@implementation MFMessageComposeViewController(DelegateAdapter)

- (id)sl_messageComposeResultHandler
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, sel_sl_messageComposeResultHandler);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resultHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setSl_messageComposeResultHandler:()DelegateAdapter
{
  id v4;
  SLMessageComposeViewControllerDelegateAdapter *value;

  if (a3)
  {
    v4 = a3;
    value = objc_alloc_init(SLMessageComposeViewControllerDelegateAdapter);
    -[SLMessageComposeViewControllerDelegateAdapter setResultHandler:](value, "setResultHandler:", v4);

  }
  else
  {
    value = 0;
  }
  objc_msgSend(a1, "setMessageComposeDelegate:", value);
  objc_setAssociatedObject(a1, sel_sl_messageComposeResultHandler, value, (void *)1);

}

@end
