@implementation _CRLLayerDescription

- (NSString)layerClass
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLayerClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)layerPointer
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLayerPointer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)layerPurpose
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLayerPurpose:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)repClass
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRepClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)repPointer
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRepPointer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)layerBounds
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLayerBounds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)layerPosition
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLayerPosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)levelInTree
{
  return self->_levelInTree;
}

- (void)setLevelInTree:(unint64_t)a3
{
  self->_levelInTree = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerPosition, 0);
  objc_storeStrong((id *)&self->_layerBounds, 0);
  objc_storeStrong((id *)&self->_repPointer, 0);
  objc_storeStrong((id *)&self->_repClass, 0);
  objc_storeStrong((id *)&self->_layerPurpose, 0);
  objc_storeStrong((id *)&self->_layerPointer, 0);
  objc_storeStrong((id *)&self->_layerClass, 0);
}

@end
