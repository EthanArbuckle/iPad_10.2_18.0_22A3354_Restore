@implementation TUISegmentedControlBoxLayout

- (double)computeDerivedHeight
{
  if (qword_2CB640 != -1)
    dispatch_once(&qword_2CB640, &stru_2410E0);
  return *(double *)&qword_2CB648;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  double v3;
  unsigned int v4;
  uint64_t v6;

  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  if (v3 <= -3.40282347e38)
  {
    v6 = 4286578687;
  }
  else
  {
    if (v3 < 3.40282347e38)
    {
      *(float *)&v4 = v3;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v4 | 0x7FC0000000000000);
    }
    v6 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUISegmentedControlBoxLayout;
  v6 = -[TUIStatefulElementBoxLayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v9, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setShouldVendControlView:", 1);
  return v7;
}

@end
