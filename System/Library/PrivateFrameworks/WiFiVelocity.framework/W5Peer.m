@implementation W5Peer

- (W5Peer)initWithCompanionLinkDevice:(id)a3
{
  W5Peer *v4;
  _QWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)W5Peer;
  v4 = -[W5Peer init](&v7, sel_init);
  if (v4)
  {
    v4->_peerID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "idsDeviceIdentifier"), "copy");
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
    v4->_model = (NSString *)objc_msgSend((id)objc_msgSend(a3, "model"), "copy");
    v4->_proximity = (int)objc_msgSend(a3, "proximity");
    *(_OWORD *)&v4->_discoveryFlags = xmmword_209C6A2A0;
    if (a3)
      objc_msgSend(a3, "operatingSystemVersion");
    else
      memset(v6, 0, sizeof(v6));
    if (-[W5Peer _isOSVersionSupported:](v4, "_isOSVersionSupported:", v6)
      && ((objc_msgSend(a3, "statusFlags") & 2) != 0
       || (objc_msgSend(a3, "statusFlags") & 4) != 0
       && (objc_msgSend((id)objc_msgSend(a3, "serviceTypes"), "containsObject:", CFSTR("com.apple.wifivelocityd.rapportWake")) & 1) != 0|| (objc_msgSend(a3, "statusFlags") & 4) != 0 && -[W5Peer type](v4, "type") == 1))
    {
      v4->_discoveryFlags |= 2uLL;
    }
  }
  return v4;
}

- (BOOL)_isOSVersionSupported:(id *)a3
{
  int64_t var0;
  BOOL v4;
  BOOL result;

  var0 = a3->var0;
  switch(-[W5Peer type](self, "type"))
  {
    case 1:
      v4 = var0 <= 14;
      goto LABEL_3;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      v4 = var0 <= 17;
      goto LABEL_3;
    case 6:
      v4 = var0 <= 10;
      goto LABEL_3;
    case 8:
      v4 = var0 <= 1;
LABEL_3:
      result = !v4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5Peer;
  -[W5Peer dealloc](&v3, sel_dealloc);
}

- (int64_t)type
{
  NSString *v2;
  int64_t v3;

  v2 = -[W5Peer model](self, "model");
  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("iPod")) != 0x7FFFFFFFFFFFFFFFLL)
    return 3;
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("iPad")) != 0x7FFFFFFFFFFFFFFFLL)
    return 4;
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("iPhone")) != 0x7FFFFFFFFFFFFFFFLL)
    return 2;
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("Mac")) != 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("AppleTV")) != 0x7FFFFFFFFFFFFFFFLL)
    return 5;
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("Watch")) != 0x7FFFFFFFFFFFFFFFLL)
    return 6;
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("HomePod")) != 0x7FFFFFFFFFFFFFFFLL
    || -[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("AudioAccessory")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 7;
  }
  if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("rProd")) != 0x7FFFFFFFFFFFFFFFLL
    || -[NSString rangeOfString:](v2, "rangeOfString:", CFSTR("RealityDevice")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    return 8;
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *peerID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v4 = v3;
  peerID = CFSTR("LOCAL");
  if (self->_peerID)
    peerID = (const __CFString *)self->_peerID;
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@] %@ / %@, "), peerID, self->_name, self->_model);
  if (self->_build)
    objc_msgSend(v4, "appendFormat:", CFSTR("%@, "), self->_build);
  if (self->_os)
    objc_msgSend(v4, "appendFormat:", CFSTR("%@, "), self->_os);
  if (self->_version)
    objc_msgSend(v4, "appendFormat:", CFSTR("%@, "), self->_version);
  if (self->_nearby)
    objc_msgSend(v4, "appendFormat:", CFSTR("Nearby=%d, "), 1);
  if (self->_discoveryFlags)
    objc_msgSend(v4, "appendFormat:", CFSTR("DiscoveryFlags=%lu, "), self->_discoveryFlags);
  if (self->_controlFlags)
    objc_msgSend(v4, "appendFormat:", CFSTR("ControlFlags=%lu, "), self->_controlFlags);
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(", ")))
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 2);
  return (id)objc_msgSend(v4, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)W5Peer;
  return -[W5Peer conformsToProtocol:](&v4, sel_conformsToProtocol_, a3);
}

- (BOOL)isEqualToPeer:(id)a3
{
  NSString *peerID;
  uint64_t v6;

  peerID = self->_peerID;
  if (peerID == (NSString *)objc_msgSend(a3, "peerID"))
  {
    LOBYTE(v6) = 1;
  }
  else if (self->_peerID)
  {
    v6 = objc_msgSend(a3, "peerID");
    if (v6)
      LOBYTE(v6) = -[NSString isEqual:](self->_peerID, "isEqual:", objc_msgSend(a3, "peerID"));
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[W5Peer isEqualToPeer:](self, "isEqualToPeer:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_peerID, "hash");
}

- (id)companionLinkDevice
{
  RPCompanionLinkDevice *device;
  RPCompanionLinkDevice *v4;

  device = self->_device;
  if (device)

  v4 = (RPCompanionLinkDevice *)objc_alloc_init(MEMORY[0x24BE7CBF8]);
  self->_device = v4;
  -[RPCompanionLinkDevice setIdentifier:](v4, "setIdentifier:", self->_peerID);
  return self->_device;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5Peer *v4;

  v4 = -[W5Peer init](+[W5Peer allocWithZone:](W5Peer, "allocWithZone:", a3), "init");
  -[W5Peer setName:](v4, "setName:", self->_name);
  -[W5Peer setPeerID:](v4, "setPeerID:", self->_peerID);
  -[W5Peer setModel:](v4, "setModel:", self->_model);
  -[W5Peer setBuild:](v4, "setBuild:", self->_build);
  -[W5Peer setVersion:](v4, "setVersion:", self->_version);
  -[W5Peer setOs:](v4, "setOs:", self->_os);
  -[W5Peer setNearby:](v4, "setNearby:", self->_nearby);
  -[W5Peer setProximity:](v4, "setProximity:", self->_proximity);
  -[W5Peer setDevice:](v4, "setDevice:", objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_device, 1, 0), 0));
  -[W5Peer setControlFlags:](v4, "setControlFlags:", self->_controlFlags);
  -[W5Peer setDiscoveryFlags:](v4, "setDiscoveryFlags:", self->_discoveryFlags);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_peerID, CFSTR("_peerID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_model, CFSTR("_model"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_build, CFSTR("_build"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_version, CFSTR("_version"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_os, CFSTR("_os"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_nearby, CFSTR("_nearby"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_proximity, CFSTR("_proximity"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_device, CFSTR("_device"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_controlFlags, CFSTR("_controlFlags"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_discoveryFlags, CFSTR("_discoveryFlags"));
}

- (W5Peer)initWithCoder:(id)a3
{
  W5Peer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)W5Peer;
  v4 = -[W5Peer init](&v6, sel_init);
  if (v4)
  {
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name")), "copy");
    v4->_peerID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_peerID")), "copy");
    v4->_model = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_model")), "copy");
    v4->_build = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_build")), "copy");
    v4->_version = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_version")), "copy");
    v4->_os = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_os")), "copy");
    v4->_nearby = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_nearby"));
    v4->_proximity = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_proximity"));
    v4->_device = (RPCompanionLinkDevice *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_device"));
    v4->_discoveryFlags = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_discoveryFlags"));
    v4->_controlFlags = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_controlFlags"));
  }
  return v4;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)os
{
  return self->_os;
}

- (void)setOs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)nearby
{
  return self->_nearby;
}

- (void)setNearby:(BOOL)a3
{
  self->_nearby = a3;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (int64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int64_t)a3
{
  self->_controlFlags = a3;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
