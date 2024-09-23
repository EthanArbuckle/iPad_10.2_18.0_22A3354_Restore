@implementation SKRFlowExtensionSubsystem

+ (id)initForPlugInKit
{
  objc_msgSend((id)objc_opt_self(), sel__startListening);
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FlowExtensionSubsystem()), sel_init);
}

- (SKRFlowExtensionSubsystem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FlowExtensionSubsystem();
  return -[SKRFlowExtensionSubsystem init](&v3, sel_init);
}

@end
