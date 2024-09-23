@implementation TRIXPCInternalServiceWrapper

- (TRIXPCInternalServiceWrapper)initWithUnderlyingHandler:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TRIXPCInternalServiceWrapper;
  return -[TRIXPCHandlerWrapper initWithUnderlyingHandler:forProtocol:](&v4, sel_initWithUnderlyingHandler_forProtocol_, a3, &unk_1EFC7E850);
}

@end
