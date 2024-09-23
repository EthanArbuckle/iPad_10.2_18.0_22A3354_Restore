@implementation STMutableStatusItemsStatusDomainDataChangeContext

- (void)setUserInitiated:(BOOL)a3
{
  if (self->super._userInitiated != a3)
    self->super._userInitiated = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  id v5;
  BOOL v6;
  objc_super v7;

  result = +[STStatusItemsStatusDomainDataChangeContext allocWithZone:](STStatusItemsStatusDomainDataChangeContext, "allocWithZone:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[STStatusItemsStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated");
    v7.receiver = v5;
    v7.super_class = (Class)STStatusItemsStatusDomainDataChangeContext;
    result = -[STStatusItemsStatusDomainDataChangeContext init](&v7, sel_init);
    if (result)
      *((_BYTE *)result + 8) = v6;
  }
  return result;
}

@end
