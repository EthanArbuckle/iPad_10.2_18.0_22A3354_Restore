@implementation RWIProtocolNetworkWebSocketFrame

- (RWIProtocolNetworkWebSocketFrame)initWithOpcode:(double)a3 mask:(BOOL)a4 payloadData:(id)a5 payloadLength:(double)a6
{
  _BOOL8 v7;
  id v10;
  RWIProtocolNetworkWebSocketFrame *v11;
  RWIProtocolNetworkWebSocketFrame *v12;
  objc_super v14;

  v7 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  v11 = -[RWIProtocolJSONObject init](&v14, sel_init);
  if (v11)
  {
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("payloadData"));
    -[RWIProtocolNetworkWebSocketFrame setOpcode:](v11, "setOpcode:", a3);
    -[RWIProtocolNetworkWebSocketFrame setMask:](v11, "setMask:", v7);
    -[RWIProtocolNetworkWebSocketFrame setPayloadData:](v11, "setPayloadData:", v10);
    -[RWIProtocolNetworkWebSocketFrame setPayloadLength:](v11, "setPayloadLength:", a6);
    v12 = v11;
  }

  return v11;
}

- (void)setOpcode:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("opcode"), a3);
}

- (double)opcode
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("opcode"));
  return result;
}

- (void)setMask:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("mask"));
}

- (BOOL)mask
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("mask"));
}

- (void)setPayloadData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("payloadData"));
}

- (NSString)payloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("payloadData"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPayloadLength:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("payloadLength"), a3);
}

- (double)payloadLength
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkWebSocketFrame;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("payloadLength"));
  return result;
}

@end
