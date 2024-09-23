@implementation STMutableStewieStatusDomainData

- (void)setStewieActive:(BOOL)a3
{
  if (self->super._stewieActive != a3)
    self->super._stewieActive = a3;
}

- (void)setStewieConnected:(BOOL)a3
{
  if (self->super._stewieConnected != a3)
    self->super._stewieConnected = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STStewieStatusDomainData initWithData:](+[STStewieStatusDomainData allocWithZone:](STStewieStatusDomainData, "allocWithZone:", a3), self);
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
