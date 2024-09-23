@implementation _PIParallaxCompoundLayerStackResult

- (PFWallpaperCompoundLayerStack)compoundLayerStack
{
  return self->_compoundLayerStack;
}

- (void)setCompoundLayerStack:(id)a3
{
  objc_storeStrong((id *)&self->_compoundLayerStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundLayerStack, 0);
}

@end
