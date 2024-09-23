@implementation W5WiFiChannel

- (W5WiFiChannel)initWithChannel:(int64_t)a3 flags:(unsigned int)a4
{
  W5WiFiChannel *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)W5WiFiChannel;
  result = -[W5WiFiChannel init](&v7, sel_init);
  if (result)
  {
    result->_channel = a3;
    result->_flags = a4;
  }
  return result;
}

- (W5WiFiChannel)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[W5WiFiChannel init] unavailable"), 0));
}

- (int64_t)channelWidth
{
  unsigned int flags;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;

  flags = self->_flags;
  v3 = 80;
  v4 = 40;
  v5 = 20;
  if ((flags & 2) == 0)
    v5 = -1;
  if ((flags & 4) == 0)
    v4 = v5;
  if ((flags & 0x400) == 0)
    v3 = v4;
  if ((flags & 0x800) != 0)
    return 160;
  else
    return v3;
}

- (id)description
{
  id v3;

  if (!objc_opt_class())
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ldg%ld/%ld"), -[W5WiFiChannel band](self, "band"), -[W5WiFiChannel channel](self, "channel"), -[W5WiFiChannel channelWidth](self, "channelWidth"));
  v3 = objc_alloc_init(MEMORY[0x24BE29F10]);
  objc_msgSend(v3, "setChannel:", -[W5WiFiChannel channel](self, "channel"));
  objc_msgSend(v3, "setFlags:", -[W5WiFiChannel flags](self, "flags"));
  return (id)objc_msgSend(v3, "description");
}

- (int64_t)band
{
  unsigned int flags;
  int64_t v3;
  uint64_t v4;

  flags = self->_flags;
  v3 = 5;
  v4 = 6;
  if ((flags & 0x2000) == 0)
    v4 = -1;
  if ((flags & 0x10) == 0)
    v3 = v4;
  if ((flags & 8) != 0)
    return 2;
  else
    return v3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5WiFiChannel;
  if (-[W5WiFiChannel conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (BOOL)isEqualToChannel:(id)a3
{
  int64_t channel;
  unsigned int flags;

  channel = self->_channel;
  if (channel != objc_msgSend(a3, "channel"))
    return 0;
  flags = self->_flags;
  return flags == objc_msgSend(a3, "flags");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5WiFiChannel isEqualToChannel:](self, "isEqualToChannel:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return self->_channel ^ self->_flags;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[W5WiFiChannel initWithChannel:flags:](+[W5WiFiChannel allocWithZone:](W5WiFiChannel, "allocWithZone:", a3), "initWithChannel:flags:", self->_channel, self->_flags);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_channel, CFSTR("_channel"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_flags, CFSTR("_flags"));
}

- (W5WiFiChannel)initWithCoder:(id)a3
{
  return -[W5WiFiChannel initWithChannel:flags:](self, "initWithChannel:flags:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_channel")), objc_msgSend(a3, "decodeIntForKey:", CFSTR("_flags")));
}

- (id)snifferDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld (%ld GHz) / %ld MHz"), -[W5WiFiChannel channel](self, "channel"), -[W5WiFiChannel band](self, "band"), -[W5WiFiChannel channelWidth](self, "channelWidth"));
}

- (int64_t)channel
{
  return self->_channel;
}

- (unsigned)flags
{
  return self->_flags;
}

@end
