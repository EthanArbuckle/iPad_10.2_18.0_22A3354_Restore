@implementation CRLWPTextSelectionManager

- (double)minimumCaretHitRegionWidth
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_minimumCaretHitRegionWidth);
}

- (void)setMinimumCaretHitRegionWidth:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_minimumCaretHitRegionWidth) = a3;
}

- (_TtC8Freeform11CRLWPLayout)layout
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;
  void *v3;

  v2 = self;
  v3 = sub_1005E6200();

  return (_TtC8Freeform11CRLWPLayout *)v3;
}

- (_TtC8Freeform12CRLTextRange)markedTextSelection
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;
  char *v3;

  v2 = self;
  v3 = sub_1005E62E4();

  return (_TtC8Freeform12CRLTextRange *)v3;
}

- (_TtC8Freeform12CRLTextRange)selectedTextRange
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;
  char *v3;

  v2 = self;
  v3 = sub_1005E6498();

  return (_TtC8Freeform12CRLTextRange *)v3;
}

- (void)setSelectedTextRange:(id)a3
{
  void *v4;
  _TtC8Freeform25CRLWPTextSelectionManager *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange) = (Class)a3;
  v6 = a3;
  v5 = self;

  (*(void (**)(void))((swift_isaMask & (uint64_t)v5->super.isa) + 0x268))();
}

- (_TtC8Freeform12CRLTextRange)selectedTextRangeWithoutMarkedText
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange));
}

- (_NSRange)selectedRange
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v2 = self;
  sub_1005E65EC();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void (*v10)(void);
  _TtC8Freeform25CRLWPTextSelectionManager *v11;

  length = a3.length;
  location = a3.location;
  v6 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  v11 = self;
  v7 = (objc_class *)sub_10060EDE4(location, length);
  v8 = *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange);
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange) = v7;
  v9 = v7;

  v10 = *(void (**)(void))((swift_isaMask & (uint64_t)v11->super.isa) + 0x268);
  v10();

  v10();
}

- (NSString)selectedText
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1005E6814();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC8Freeform15CRLTextPosition)beginningOfDocument
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1005E6AE4();

  return (_TtC8Freeform15CRLTextPosition *)v3;
}

- (_TtC8Freeform15CRLTextPosition)endOfDocument
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1005E6C38();

  return (_TtC8Freeform15CRLTextPosition *)v3;
}

- (id)selectWordAt:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform25CRLWPTextSelectionManager *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_1005E6D70(x, y);

  return v6;
}

- (void)dealloc
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;

  v2 = self;
  sub_1005E720C();
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_interactiveCanvasController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_editor);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController));

}

- (id)textIn:(id)a3
{
  id v4;
  _TtC8Freeform25CRLWPTextSelectionManager *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a3;
  v5 = self;
  sub_1005E734C((uint64_t)v4);
  v7 = v6;

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)textRangeFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_100610A44((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (id)positionFrom:(id)a3 offset:(int64_t)a4
{
  char *v6;
  _TtC8Freeform25CRLWPTextSelectionManager *v7;
  id v8;

  v6 = (char *)a3;
  v7 = self;
  v8 = sub_1005E7634(v6, a4);

  return v8;
}

- (int64_t)offsetFrom:(id)a3 to:(id)a4
{
  uint64_t v6;
  char *v7;
  char *v8;
  _TtC8Freeform25CRLWPTextSelectionManager *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t result;

  v6 = qword_1013DCB58;
  v7 = (char *)a3;
  v8 = (char *)a4;
  v9 = self;
  if (v6 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v10 = *(_QWORD *)&v8[OBJC_IVAR____TtC8Freeform15CRLTextPosition_location];
  v11 = *(_QWORD *)&v7[OBJC_IVAR____TtC8Freeform15CRLTextPosition_location];

  result = v10 - v11;
  if (__OFSUB__(v10, v11))
    __break(1u);
  return result;
}

- (int64_t)compare:(id)a3 to:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for CRLTextPosition();
  v7 = swift_dynamicCastClass(a4, v6);
  if (!v7)
    return 1;
  v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  v9 = *(_QWORD *)(v7 + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  if (v9 < v8)
    return 1;
  if (v8 >= v9)
    return 0;
  return -1;
}

- (CGRect)firstRectFor:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1005E8250(self, (uint64_t)a2, a3, sub_1005E78B4);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  _TtC8Freeform25CRLWPTextSelectionManager *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v7 = qword_1013DCB58;
  v8 = self;
  if (v7 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v9 = (id)qword_10147ECB0;
  sub_1005E7ACC((uint64_t)v8, location, length, a4, &v14);

  v11 = *((double *)&v14 + 1);
  v10 = *(double *)&v14;
  v12 = v15;
  v13 = v16;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)caretRectFor:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1005E8250(self, (uint64_t)a2, a3, sub_1005E8048);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)closestPositionTo:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform25CRLWPTextSelectionManager *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_1005E82C8(x, y);

  return v6;
}

- (id)closestPositionTo:(CGPoint)a3 within:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC8Freeform25CRLWPTextSelectionManager *v8;
  char *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_1005E84F8(v7, x, y);

  return v9;
}

- (int64_t)characterIndexForPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  _TtC8Freeform25CRLWPTextSelectionManager *v6;
  id v7;
  int64_t v8;

  y = a3.y;
  x = a3.x;
  v5 = qword_1013DCB58;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v7 = (id)qword_10147ECB0;
  v8 = sub_1005E893C(1, x, y);

  return v8;
}

- (id)characterRangeAt:(CGPoint)a3
{
  _TtC8Freeform25CRLWPTextSelectionManager *v3;

  v3 = self;
  sub_100704C18((uint64_t)v3, &_mh_execute_header, (uint64_t)"characterRange(at:)", 19, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 269);

  return 0;
}

- (void)setSelectedTextRangeFor:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform25CRLWPTextSelectionManager *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1005E8BB8(x, y);

}

- (_TtC8Freeform26CRLSelectionViewController)selectionViewController
{
  return (_TtC8Freeform26CRLSelectionViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController));
}

- (void)setSelectionViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController) = (Class)a3;
  v3 = a3;

}

- (BOOL)displayingSelectionView
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  return v2 && *(_QWORD *)(v2 + OBJC_IVAR____TtC8Freeform26CRLSelectionViewController_rotatedOverlayView) != 0;
}

- (void)refresh
{
  void (*v2)(void);
  _TtC8Freeform25CRLWPTextSelectionManager *v3;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x268);
  v3 = self;
  v2();

}

- (void)updateSelectionViews
{
  _QWORD *v2;
  void (*v3)(void);
  _TtC8Freeform25CRLWPTextSelectionManager *v4;
  _QWORD *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  if (v2)
  {
    v3 = *(void (**)(void))((*v2 & swift_isaMask) + 0x188);
    v4 = self;
    v5 = v2;
    v3();

  }
}

- (id)selectionRectsFor:(id)a3
{
  id v4;
  _TtC8Freeform25CRLWPTextSelectionManager *v5;

  v4 = a3;
  v5 = self;
  sub_100704C18((uint64_t)v5, &_mh_execute_header, (uint64_t)"selectionRects(for:)", 20, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 393);

  sub_1005E96D4();
  return Array._bridgeToObjectiveC()().super.isa;
}

- (id)positionWithin:(id)a3 farthestIn:(int64_t)a4
{
  id v5;
  _TtC8Freeform25CRLWPTextSelectionManager *v6;

  v5 = a3;
  v6 = self;
  sub_100704C18((uint64_t)v6, &_mh_execute_header, (uint64_t)"position(within:farthestIn:)", 28, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 398);

  return 0;
}

- (id)characterRangeByExtending:(id)a3 in:(int64_t)a4
{
  id v5;
  _TtC8Freeform25CRLWPTextSelectionManager *v6;

  v5 = a3;
  v6 = self;
  sub_100704C18((uint64_t)v6, &_mh_execute_header, (uint64_t)"characterRange(byExtending:in:)", 31, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 403);

  return 0;
}

- (id)positionFrom:(id)a3 in:(int64_t)a4 offset:(int64_t)a5
{
  id v6;
  _TtC8Freeform25CRLWPTextSelectionManager *v7;

  v6 = a3;
  v7 = self;
  sub_100704C18((uint64_t)v7, &_mh_execute_header, (uint64_t)"position(from:in:offset:)", 25, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 408);

  return 0;
}

- (BOOL)isSelectingCaret:(CGPoint)a3
{
  _TtC8Freeform25CRLWPTextSelectionManager *v3;

  v3 = self;
  sub_100704C18((uint64_t)v3, &_mh_execute_header, (uint64_t)"isSelectingCaret(_:)", 20, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 413);

  return 0;
}

- (void)beginLoupeSessionAt:(CGPoint)a3
{
  _TtC8Freeform25CRLWPTextSelectionManager *v3;

  v3 = self;
  sub_100704C18((uint64_t)v3, &_mh_execute_header, (uint64_t)"beginLoupeSession(at:)", 22, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 418);

}

- (void)moveLoupeTo:(CGPoint)a3
{
  _TtC8Freeform25CRLWPTextSelectionManager *v3;

  v3 = self;
  sub_100704C18((uint64_t)v3, &_mh_execute_header, (uint64_t)"moveLoupe(to:)", 14, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 422);

}

- (void)endLoupeSession
{
  _TtC8Freeform25CRLWPTextSelectionManager *v2;

  v2 = self;
  sub_100704C18((uint64_t)v2, &_mh_execute_header, (uint64_t)"endLoupeSession()", 17, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 426);

}

- (_TtC8Freeform25CRLWPTextSelectionManager)init
{
  _TtC8Freeform25CRLWPTextSelectionManager *result;

  result = (_TtC8Freeform25CRLWPTextSelectionManager *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPTextSelectionManager", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
