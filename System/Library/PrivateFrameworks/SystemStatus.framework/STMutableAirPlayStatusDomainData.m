@implementation STMutableAirPlayStatusDomainData

- (void)setAirPlayState:(unint64_t)a3
{
  if (self->super._airPlayState != a3)
    self->super._airPlayState = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->super._bundleIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    bundleIdentifier = self->super._bundleIdentifier;
    self->super._bundleIdentifier = v4;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STAirPlayStatusDomainData initWithData:]((id *)+[STAirPlayStatusDomainData allocWithZone:](STAirPlayStatusDomainData, "allocWithZone:", a3), self);
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
