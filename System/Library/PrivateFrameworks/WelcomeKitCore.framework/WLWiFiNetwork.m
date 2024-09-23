@implementation WLWiFiNetwork

- (WLWiFiNetwork)initWithWiFiNetworkRef:(__WiFiNetwork *)a3
{
  WLWiFiNetwork *v4;
  WLWiFiNetwork *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLWiFiNetwork;
  v4 = -[WLWiFiNetwork init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[WLWiFiNetwork setRef:](v4, "setRef:", a3);
    CFRetain(-[WLWiFiNetwork ref](v5, "ref"));
    -[WLWiFiNetwork setChannel:](v5, "setChannel:", objc_msgSend((id)WiFiNetworkGetChannel(), "integerValue"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(-[WLWiFiNetwork ref](self, "ref"));
  v3.receiver = self;
  v3.super_class = (Class)WLWiFiNetwork;
  -[WLWiFiNetwork dealloc](&v3, sel_dealloc);
}

- (NSString)ssid
{
  -[WLWiFiNetwork ref](self, "ref");
  return (NSString *)WiFiNetworkGetSSID();
}

- (__WiFiNetwork)ref
{
  return self->_ref;
}

- (void)setRef:(__WiFiNetwork *)a3
{
  self->_ref = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

@end
