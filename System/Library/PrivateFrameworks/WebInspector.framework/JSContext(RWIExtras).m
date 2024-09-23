@implementation JSContext(RWIExtras)

- (RWIProtocolInspector)_inspector
{
  RWIProtocolInspector *AssociatedObject;

  AssociatedObject = (RWIProtocolInspector *)objc_getAssociatedObject(a1, &-[JSContext(RWIExtras) _inspector]::rwiProtocolInspectorAssociatedObjectKey);
  if (!AssociatedObject)
  {
    objc_msgSend(a1, "JSGlobalContextRef");
    AssociatedObject = -[RWIProtocolInspector initWithController:]([RWIProtocolInspector alloc], "initWithController:", JSGlobalContextGetAugmentableInspectorController());
    objc_setAssociatedObject(a1, &-[JSContext(RWIExtras) _inspector]::rwiProtocolInspectorAssociatedObjectKey, AssociatedObject, (void *)0x301);
    if (AssociatedObject)
      CFRelease(AssociatedObject);
  }
  return AssociatedObject;
}

@end
