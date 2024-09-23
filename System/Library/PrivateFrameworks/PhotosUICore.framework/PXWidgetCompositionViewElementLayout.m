@implementation PXWidgetCompositionViewElementLayout

- (PXWidgetCompositionViewElementLayout)init
{
  void *v3;
  objc_super v5;
  _OWORD v6[5];
  uint64_t v7;

  v3 = (void *)objc_opt_class();
  if (v3)
  {
    objc_msgSend(v3, "viewTileIdentifier");
  }
  else
  {
    v7 = 0;
    memset(v6, 0, sizeof(v6));
  }
  v5.receiver = self;
  v5.super_class = (Class)PXWidgetCompositionViewElementLayout;
  return -[PXSingleTileLayout initWithTileIdentifier:](&v5, sel_initWithTileIdentifier_, v6);
}

+ (PXTileIdentifier)viewTileIdentifier
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = xmmword_1A7C0C980;
  return result;
}

@end
