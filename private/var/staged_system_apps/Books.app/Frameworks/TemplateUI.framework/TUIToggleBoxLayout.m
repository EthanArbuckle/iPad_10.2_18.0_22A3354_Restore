@implementation TUIToggleBoxLayout

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  unsigned int v3;
  uint64_t v5;

  if (*(double *)&qword_2CB390 <= -3.40282347e38)
  {
    v5 = 4286578687;
  }
  else
  {
    if (*(double *)&qword_2CB390 < 3.40282347e38)
    {
      *(float *)&v3 = *(double *)&qword_2CB390;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v3 | 0x7FC0000000000000);
    }
    v5 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  unsigned int v3;
  uint64_t v5;

  if (*(double *)&qword_2CB388 <= -3.40282347e38)
  {
    v5 = 4286578687;
  }
  else
  {
    if (*(double *)&qword_2CB388 < 3.40282347e38)
    {
      *(float *)&v3 = *(double *)&qword_2CB388;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v3 | 0x7FC0000000000000);
    }
    v5 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIToggleBoxLayout;
  v6 = -[TUIStatefulElementBoxLayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v9, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setShouldVendControlView:", 1);
  return v7;
}

@end
