@implementation PhotosSearchBar.LayoutManager

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  __int128 v14;
  uint64_t v15;
  id v16;
  CGContext *v17;
  _TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager *v18;
  _OWORD v19[3];

  v14 = *(_OWORD *)&a7->c;
  v19[0] = *(_OWORD *)&a7->a;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&a7->tx;
  type metadata accessor for Key(0);
  sub_24409930C((uint64_t)&qword_25733ADE0);
  v15 = sub_244287580();
  v16 = a6;
  v17 = a9;
  v18 = self;
  sub_2441E5574((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)v16, (uint64_t *)v19, v15, v17);

  swift_bridgeObjectRelease();
}

- (void)drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  NSUInteger length;
  NSUInteger location;
  _TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager *v6;

  length = a3.length;
  location = a3.location;
  v6 = self;
  sub_2441E58A8(location, length);

}

- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager)init
{
  return (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager *)sub_2441E5E84();
}

- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager)initWithCoder:(id)a3
{
  return (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager *)sub_2441E5F64(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
