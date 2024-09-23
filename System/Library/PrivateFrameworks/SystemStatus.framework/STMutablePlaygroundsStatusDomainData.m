@implementation STMutablePlaygroundsStatusDomainData

- (void)setPlaygroundsActive:(BOOL)a3
{
  if (self->super._playgroundsActive != a3)
    self->super._playgroundsActive = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  id v5;
  BOOL v6;
  objc_super v7;

  result = +[STPlaygroundsStatusDomainData allocWithZone:](STPlaygroundsStatusDomainData, "allocWithZone:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[STPlaygroundsStatusDomainData isPlaygroundsActive](self, "isPlaygroundsActive");
    v7.receiver = v5;
    v7.super_class = (Class)STPlaygroundsStatusDomainData;
    result = -[STPlaygroundsStatusDomainData init](&v7, sel_init);
    if (result)
      *((_BYTE *)result + 8) = v6;
  }
  return result;
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
