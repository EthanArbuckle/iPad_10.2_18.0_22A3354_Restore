@implementation DOMHTMLInputElement(UIWebFormPeripheral)

- (id)createPeripheral
{
  void *v2;

  if (objc_msgSend(a1, "isAssistedDateType"))
  {
    +[UIWebFormDateTimePeripheral createPeripheralWithDOMHTMLInputElement:](UIWebFormDateTimePeripheral, "createPeripheralWithDOMHTMLInputElement:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
