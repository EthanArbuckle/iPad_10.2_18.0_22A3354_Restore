@implementation B2PFirmwareVersionGetCommand

- (B2PFirmwareVersionGetCommand)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)B2PFirmwareVersionGetCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 260);
}

- (B2PFirmwareVersionGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  -[B2PFirmwareVersionGetCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

@end
