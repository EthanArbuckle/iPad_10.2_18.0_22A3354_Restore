@implementation PBOfficeArtWriterClient

- (unsigned)eshSchemeColorIndexForOADSchemeColorValue:(int)a3 state:(id)a4
{
  return +[PBColorScheme eshSchemeColorIndexForOADSchemeColorValue:](PBColorScheme, "eshSchemeColorIndexForOADSchemeColorValue:", *(_QWORD *)&a3, a4);
}

@end
