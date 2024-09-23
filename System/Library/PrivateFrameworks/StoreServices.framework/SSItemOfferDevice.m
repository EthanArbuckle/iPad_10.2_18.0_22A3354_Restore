@implementation SSItemOfferDevice

- (SSItemOfferDevice)init
{
  return -[SSItemOfferDevice initWithOfferDeviceDicitionary:](self, "initWithOfferDeviceDicitionary:", 0);
}

- (SSItemOfferDevice)initWithDeviceIdentifier:(int64_t)a3
{
  SSItemOfferDevice *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSItemOfferDevice;
  result = -[SSItemOfferDevice init](&v5, sel_init);
  if (result)
    result->_deviceIdentifier = a3;
  return result;
}

- (SSItemOfferDevice)initWithOfferDeviceDicitionary:(id)a3
{
  SSItemOfferDevice *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  objc_super v21;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSItemOfferDevice.m"), 42, CFSTR("Must provide device dictionary"));
  v21.receiver = self;
  v21.super_class = (Class)SSItemOfferDevice;
  v5 = -[SSItemOfferDevice init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("device-type-id"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_deviceIdentifier = (int)objc_msgSend(v6, "intValue");
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("minimum-product-version"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_minimumProductVersion = (NSString *)v7;
    v8 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-device-description"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v8 = 0;
    v9 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-device-title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v9 = 0;
    v10 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-device-description-url"));
    objc_opt_class();
    v11 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v12 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-device-description-url-title"));
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v9 | v8)
    {
      if ((isKindOfClass & 1) == 0)
        v12 = 0;
      v5->_incompatibleDeviceError = (SSItemOfferDeviceError *)-[SSItemOfferDeviceError _initWithMessage:title:URLTitle:URL:]([SSItemOfferDeviceError alloc], "_initWithMessage:title:URLTitle:URL:", v8, v9, v12, v11);
    }
    v14 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-product-version-description"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v14 = 0;
    v15 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-product-version-title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v15 = 0;
    v16 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-product-version-description-url"));
    objc_opt_class();
    v17 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
    v18 = objc_msgSend(a3, "objectForKey:", CFSTR("minimum-product-version-description-url-title"));
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();
    if (v15 | v14)
    {
      if ((v19 & 1) == 0)
        v18 = 0;
      v5->_incompatibleSystemError = (SSItemOfferDeviceError *)-[SSItemOfferDeviceError _initWithMessage:title:URLTitle:URL:]([SSItemOfferDeviceError alloc], "_initWithMessage:title:URLTitle:URL:", v14, v15, v18, v17);
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemOfferDevice;
  -[SSItemOfferDevice dealloc](&v3, sel_dealloc);
}

- (int64_t)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (SSItemOfferDeviceError)incompatibleDeviceError
{
  return self->_incompatibleDeviceError;
}

- (SSItemOfferDeviceError)incompatibleSystemError
{
  return self->_incompatibleSystemError;
}

- (NSString)minimumProductVersion
{
  return self->_minimumProductVersion;
}

@end
