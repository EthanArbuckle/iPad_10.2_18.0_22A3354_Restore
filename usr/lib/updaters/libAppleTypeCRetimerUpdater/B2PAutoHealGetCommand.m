@implementation B2PAutoHealGetCommand

- (B2PAutoHealGetCommand)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)B2PAutoHealGetCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 374);
}

- (B2PAutoHealGetCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  -[B2PAutoHealGetCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

@end
