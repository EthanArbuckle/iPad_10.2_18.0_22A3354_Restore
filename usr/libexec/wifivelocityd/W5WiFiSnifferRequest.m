@implementation W5WiFiSnifferRequest

- (W5WiFiSnifferRequest)init
{
  W5WiFiSnifferRequest *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5WiFiSnifferRequest;
  v2 = -[W5WiFiSnifferRequest init](&v5, "init");
  if (v2)
  {
    v3 = os_transaction_create("com.apple.wifivelocity.W5WiFiSnifferRequest");
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.W5WiFiSnifferRequest", v3);
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", self->_transaction);

  self->_transaction = 0;
  v3.receiver = self;
  v3.super_class = (Class)W5WiFiSnifferRequest;
  -[W5WiFiSnifferRequest dealloc](&v3, "dealloc");
}

- (id)description
{
  NSMutableString *v3;

  v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("UUID: %@\n"), self->_uuid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Channel: %ld (%@)\n"), -[W5WiFiChannel channel](self->_channel, "channel"), W5DescriptionForChannelWidth(self->_channel));
  return -[NSMutableString copy](v3, "copy");
}

- (BOOL)isEqualToWiFiSnifferRequest:(id)a3
{
  return -[NSUUID isEqual:](self->_uuid, "isEqual:", objc_msgSend(a3, "uuid"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 == self)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class(self, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
      return -[W5WiFiSnifferRequest isEqualToWiFiSnifferRequest:](self, "isEqualToWiFiSnifferRequest:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5WiFiSnifferRequest *v4;

  v4 = -[W5WiFiSnifferRequest init](+[W5WiFiSnifferRequest allocWithZone:](W5WiFiSnifferRequest, "allocWithZone:", a3), "init");
  -[W5WiFiSnifferRequest setUuid:](v4, "setUuid:", self->_uuid);
  -[W5WiFiSnifferRequest setChannel:](v4, "setChannel:", self->_channel);
  -[W5WiFiSnifferRequest setDuration:](v4, "setDuration:", self->_duration);
  -[W5WiFiSnifferRequest setOutputFile:](v4, "setOutputFile:", self->_outputFile);
  -[W5WiFiSnifferRequest setReply:](v4, "setReply:", self->_reply);
  -[W5WiFiSnifferRequest setMonitorMode:](v4, "setMonitorMode:", self->_monitorMode);
  -[W5WiFiSnifferRequest setTcpDump:](v4, "setTcpDump:", self->_tcpDump);
  -[W5WiFiSnifferRequest setSnaplen:](v4, "setSnaplen:", self->_snaplen);
  -[W5WiFiSnifferRequest setNoAutoStop:](v4, "setNoAutoStop:", self->_noAutoStop);
  -[W5WiFiSnifferRequest setRotationInterval:](v4, "setRotationInterval:", self->_rotationInterval);
  -[W5WiFiSnifferRequest setMaxSize:](v4, "setMaxSize:", self->_maxSize);
  -[W5WiFiSnifferRequest setMaxFiles:](v4, "setMaxFiles:", self->_maxFiles);
  return v4;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)monitorMode
{
  return self->_monitorMode;
}

- (void)setMonitorMode:(BOOL)a3
{
  self->_monitorMode = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (W5WiFiChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSURL)outputFile
{
  return self->_outputFile;
}

- (void)setOutputFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)tcpDump
{
  return self->_tcpDump;
}

- (void)setTcpDump:(BOOL)a3
{
  self->_tcpDump = a3;
}

- (BOOL)noAutoStop
{
  return self->_noAutoStop;
}

- (void)setNoAutoStop:(BOOL)a3
{
  self->_noAutoStop = a3;
}

- (int64_t)snaplen
{
  return self->_snaplen;
}

- (void)setSnaplen:(int64_t)a3
{
  self->_snaplen = a3;
}

- (int64_t)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(int64_t)a3
{
  self->_rotationInterval = a3;
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int64_t)a3
{
  self->_maxSize = a3;
}

- (int64_t)maxFiles
{
  return self->_maxFiles;
}

- (void)setMaxFiles:(int64_t)a3
{
  self->_maxFiles = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
