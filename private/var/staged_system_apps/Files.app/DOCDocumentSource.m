@implementation DOCDocumentSource

- (UIImage)iconPreferingSymbolImages
{
  return (UIImage *)-[DOCDocumentSource iconForSize:](self, "iconForSize:", 1);
}

- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors
{
  return 0;
}

@end
