@implementation PKDashboardPassAuxiliaryPassInformationItem

+ (id)identifier
{
  return CFSTR("auxiliaryPassInformation");
}

- (PKPassAuxiliaryPassInformationItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
