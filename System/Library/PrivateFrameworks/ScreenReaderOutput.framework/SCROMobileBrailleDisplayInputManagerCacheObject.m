@implementation SCROMobileBrailleDisplayInputManagerCacheObject

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modelIdentifier, a3);
}

- (int)brailleInputMode
{
  return self->_brailleInputMode;
}

- (void)setBrailleInputMode:(int)a3
{
  self->_brailleInputMode = a3;
}

- (NSString)driverIdentifier
{
  return self->_driverIdentifier;
}

- (void)setDriverIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_driverIdentifier, a3);
}

- (NSMutableDictionary)commandDictionary
{
  return self->_commandDictionary;
}

- (void)setCommandDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_commandDictionary, a3);
}

- (NSMutableArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedIdentifiers, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
  objc_storeStrong((id *)&self->_productName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);
  objc_storeStrong((id *)&self->_commandDictionary, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_driverIdentifier, 0);
}

@end
