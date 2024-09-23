@implementation STMutableWifiStatusDomainData

- (void)setWifiActive:(BOOL)a3
{
  if (self->super._wifiActive != a3)
    self->super._wifiActive = a3;
}

- (void)setSignalStrengthBars:(unint64_t)a3
{
  if (self->super._signalStrengthBars != a3)
    self->super._signalStrengthBars = a3;
}

- (void)setAssociatedToIOSHotspot:(BOOL)a3
{
  if (self->super._associatedToIOSHotspot != a3)
    self->super._associatedToIOSHotspot = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STWifiStatusDomainData initWithData:](+[STWifiStatusDomainData allocWithZone:](STWifiStatusDomainData, "allocWithZone:", a3), self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableData:", self);

  return isKindOfClass & 1;
}

@end
