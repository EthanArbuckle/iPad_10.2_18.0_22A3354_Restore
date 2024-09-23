@implementation SSVFamilyAccountPair

- (SSVFamilyAccountPair)initWithDownloaderAccountIdentifier:(unint64_t)a3 purchaserAccountIdentifier:(unint64_t)a4 familyIdentifier:(unint64_t)a5
{
  SSVFamilyAccountPair *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSVFamilyAccountPair;
  result = -[SSVFamilyAccountPair init](&v9, sel_init);
  if (result)
  {
    result->_downloaderAccountIdentifier = a3;
    result->_familyIdentifier = a5;
    result->_purchaserAccountIdentifier = a4;
  }
  return result;
}

- (unint64_t)downloaderAccountIdentifier
{
  return self->_downloaderAccountIdentifier;
}

- (unint64_t)familyIdentifier
{
  return self->_familyIdentifier;
}

- (unint64_t)purchaserAccountIdentifier
{
  return self->_purchaserAccountIdentifier;
}

@end
