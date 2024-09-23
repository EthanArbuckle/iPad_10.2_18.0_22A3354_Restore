@implementation _PXAssetsWidgetTileIdentifierConverter

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  return a3->length == 1 && a3->index[0] >> 1 == 16050;
}

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->length == 1 && a3->index[0] >> 1 == 16050;
}

@end
