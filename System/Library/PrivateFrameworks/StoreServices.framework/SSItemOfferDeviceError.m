@implementation SSItemOfferDeviceError

- (id)_initWithMessage:(id)a3 title:(id)a4 URLTitle:(id)a5 URL:(id)a6
{
  SSItemOfferDeviceError *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SSItemOfferDeviceError;
  v10 = -[SSItemOfferDeviceError init](&v12, sel_init);
  if (v10)
  {
    v10->_localizedMessage = (NSString *)a3;
    v10->_localizedTitle = (NSString *)a4;
    v10->_localizedURLTitle = (NSString *)a5;
    v10->_url = (NSURL *)a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemOfferDeviceError;
  -[SSItemOfferDeviceError dealloc](&v3, sel_dealloc);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedURLTitle
{
  return self->_localizedURLTitle;
}

- (NSURL)URL
{
  return self->_url;
}

@end
