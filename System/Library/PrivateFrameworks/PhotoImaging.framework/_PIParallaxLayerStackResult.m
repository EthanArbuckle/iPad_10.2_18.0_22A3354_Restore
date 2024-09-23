@implementation _PIParallaxLayerStackResult

- (PFParallaxLayerStack)layerStack
{
  return self->_layerStack;
}

- (void)setLayerStack:(id)a3
{
  objc_storeStrong((id *)&self->_layerStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerStack, 0);
}

@end
