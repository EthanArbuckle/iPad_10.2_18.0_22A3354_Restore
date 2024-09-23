@implementation SXTextTangierContainerRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[SXTextTangierContainerRep _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierContainerRep;
  -[SXTextTangierContainerRep dealloc](&v3, sel_dealloc);
}

@end
