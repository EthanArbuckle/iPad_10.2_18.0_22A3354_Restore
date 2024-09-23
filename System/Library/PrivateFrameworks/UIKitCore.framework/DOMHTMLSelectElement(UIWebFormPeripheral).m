@implementation DOMHTMLSelectElement(UIWebFormPeripheral)

- (id)createPeripheral
{
  return +[UIWebFormSelectPeripheral createPeripheralWithDOMHTMLSelectElement:](UIWebFormSelectPeripheral, "createPeripheralWithDOMHTMLSelectElement:", a1);
}

@end
