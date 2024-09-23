@implementation RCPPlayerPlaybackOptions

- (void).cxx_destruct
{
  objc_storeStrong(&self->_customizeHIDEvent, 0);
}

- (unint64_t)timestampForEventReplay:(id)a3
{
  if (self->_useHIDEventTimestampsForDelivery)
    return objc_msgSend(a3, "timestamp");
  else
    return objc_msgSend(a3, "deliveryTimestamp");
}

- (double)playbackSpeedFactor
{
  return self->_playbackSpeedFactor;
}

- (BOOL)linkEventDeliveryToDisplayRefreshRate
{
  return self->_linkEventDeliveryToDisplayRefreshRate;
}

- (id)customizeHIDEvent
{
  return self->_customizeHIDEvent;
}

- (RCPPlayerPlaybackOptions)init
{
  RCPPlayerPlaybackOptions *v2;
  RCPPlayerPlaybackOptions *v3;
  __int128 v4;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCPPlayerPlaybackOptions;
  v2 = -[RCPPlayerPlaybackOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RCPPlayerPlaybackOptions setPlaybackSpeedFactor:](v2, "setPlaybackSpeedFactor:", 1.0);
    -[RCPPlayerPlaybackOptions setMinDelayBetweenSends:](v3, "setMinDelayBetweenSends:", 0.0);
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v6[0] = *MEMORY[0x1E0C9BAA8];
    v6[1] = v4;
    v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[RCPPlayerPlaybackOptions setTransform:](v3, "setTransform:", v6);
    -[RCPPlayerPlaybackOptions setLinkEventDeliveryToDisplayRefreshRate:](v3, "setLinkEventDeliveryToDisplayRefreshRate:", 0);
  }
  return v3;
}

- (void)setPlaybackSpeedFactor:(double)a3
{
  self->_playbackSpeedFactor = a3;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (void)setMinDelayBetweenSends:(double)a3
{
  self->_minDelayBetweenSends = a3;
}

- (void)setLinkEventDeliveryToDisplayRefreshRate:(BOOL)a3
{
  self->_linkEventDeliveryToDisplayRefreshRate = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (double)minDelayBetweenSends
{
  return self->_minDelayBetweenSends;
}

- (double)firstEventFrameDelay
{
  return self->_firstEventFrameDelay;
}

- (void)setFirstEventFrameDelay:(double)a3
{
  self->_firstEventFrameDelay = a3;
}

- (BOOL)useVirtualHIDServices
{
  return self->_useVirtualHIDServices;
}

- (void)setUseVirtualHIDServices:(BOOL)a3
{
  self->_useVirtualHIDServices = a3;
}

- (BOOL)useHIDEventTimestampsForDelivery
{
  return self->_useHIDEventTimestampsForDelivery;
}

- (void)setUseHIDEventTimestampsForDelivery:(BOOL)a3
{
  self->_useHIDEventTimestampsForDelivery = a3;
}

- (BOOL)ignoreSenderProperties
{
  return self->_ignoreSenderProperties;
}

- (void)setIgnoreSenderProperties:(BOOL)a3
{
  self->_ignoreSenderProperties = a3;
}

- (void)setCustomizeHIDEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
