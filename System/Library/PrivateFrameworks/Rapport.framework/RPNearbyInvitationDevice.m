@implementation RPNearbyInvitationDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationDevice)initWithCoder:(id)a3
{
  id v4;
  RPNearbyInvitationDevice *v5;
  RPNearbyInvitationDevice *v6;
  objc_super v8;
  uint64_t v9;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPNearbyInvitationDevice;
  v5 = -[RPEndpoint initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v9 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_deviceColor = v9;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RPNearbyInvitationDevice;
  -[RPEndpoint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  if (self->_deviceColor)
    objc_msgSend(v4, "encodeInteger:forKey:");

}

- (id)description
{
  return -[RPNearbyInvitationDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v9;
  uint64_t v10;
  id v11;

  NSAppendPrintF();
  v11 = 0;
  -[RPEndpoint identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v4 = v11;

  v10 = -[RPNearbyInvitationDevice deviceColor](self, "deviceColor", v9);
  NSAppendPrintF();
  v5 = v4;

  -[RPEndpoint model](self, "model", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    NSAppendPrintF();
    v7 = v5;

    v5 = v7;
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  NSString *identifier;
  void *v4;

  identifier = self->super._identifier;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v4);

  return (char)identifier;
}

- (unsigned)updateWithSFDevice:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 Int64Ranged;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RPNearbyInvitationDevice;
  v4 = a3;
  v5 = -[RPEndpoint updateWithSFDevice:](&v10, sel_updateWithSFDevice_, v4);
  objc_msgSend(v4, "bleDevice", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "advertisementFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();

  if (self->_deviceColor != Int64Ranged)
  {
    self->_deviceColor = Int64Ranged;
    v5 |= 2u;
  }
  return v5;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RPNearbyInvitationDevice;
  return -[RPEndpoint updateWithEndpoint:](&v4, sel_updateWithEndpoint_, a3);
}

- (unsigned)deviceColor
{
  return self->_deviceColor;
}

- (BOOL)inBubble
{
  return self->_inBubble;
}

- (void)setInBubble:(BOOL)a3
{
  self->_inBubble = a3;
}

- (BOOL)wasTriggered
{
  return self->_wasTriggered;
}

- (void)setWasTriggered:(BOOL)a3
{
  self->_wasTriggered = a3;
}

@end
