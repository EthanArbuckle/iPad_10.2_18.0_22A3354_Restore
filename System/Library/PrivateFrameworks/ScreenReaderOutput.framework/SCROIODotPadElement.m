@implementation SCROIODotPadElement

- (SCROIODotPadElement)initWithCentral:(id)a3 peripheral:(id)a4
{
  id v7;
  id v8;
  SCROIODotPadElement *v9;
  SCROIODotPadElement *v10;
  unsigned int v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SCROIODotPadElement;
  v9 = -[SCROIODotPadElement init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_central, a3);
    objc_storeStrong((id *)&v10->_peripheral, a4);
    do
      v11 = __ldxr((unsigned int *)&_currentIdentifier);
    while (__stxr(v11 + 1, (unsigned int *)&_currentIdentifier));
    v10->_identifier = v11;
  }

  return v10;
}

- (id)dotFamilyIdentifier
{
  return CFSTR("com.apple.braille.driver.dot.pad");
}

- (int)transport
{
  return 32;
}

- (int)identifier
{
  return self->_identifier;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CBCentralManager)central
{
  return self->_central;
}

- (NSString)address
{
  void *v2;
  void *v3;

  -[CBPeripheral identifier](self->_peripheral, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  return -[CBPeripheral name](self->_peripheral, "name");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_central, 0);
}

@end
