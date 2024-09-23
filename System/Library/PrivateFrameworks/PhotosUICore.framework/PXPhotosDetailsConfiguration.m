@implementation PXPhotosDetailsConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setOptions:", -[PXPhotosDetailsConfiguration options](self, "options"));
  objc_msgSend(v4, "setBarsControllerClass:", -[PXPhotosDetailsConfiguration barsControllerClass](self, "barsControllerClass"));
  -[PXPhotosDetailsConfiguration unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnlockDeviceHandlerWithActionType:", v5);

  -[PXPhotosDetailsConfiguration unlockDeviceStatus](self, "unlockDeviceStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnlockDeviceStatus:", v6);

  return v4;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (Class)barsControllerClass
{
  return self->_barsControllerClass;
}

- (void)setBarsControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_barsControllerClass, a3);
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (void)setUnlockDeviceStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong((id *)&self->_barsControllerClass, 0);
}

@end
