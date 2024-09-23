@implementation SPIAsrInitializationStartedOrChangedEventContext

+ (id)context
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SPIAsrInitializationStartedOrChangedEventContext;
  objc_msgSendSuper2(&v3, sel_context);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setContextForUsage:(id)a3
{
  objc_msgSend(a3, "setContext:", 8);
}

@end
