@implementation CRLWPTextSelectionManager_i

- (CGRect)firstRectFor:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v8;
  double v9;
  CGFloat x;
  double v11;
  CGFloat y;
  double v13;
  CGFloat width;
  double v15;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_interactiveCanvasController);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, "convertUnscaledToBoundsRect:", sub_1005E78B4(v7));
    x = v9;
    y = v11;
    width = v13;
    height = v15;

  }
  else
  {
    x = CGRectInfinite.origin.x;
    y = CGRectInfinite.origin.y;
    width = CGRectInfinite.size.width;
    height = CGRectInfinite.size.height;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)positionFrom:(id)a3 in:(int64_t)a4 offset:(int64_t)a5
{
  char *v8;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v9;
  char *v10;

  v8 = (char *)a3;
  v9 = self;
  v10 = sub_100D00534(v8, a4, a5);

  return v10;
}

- (id)selectionRectsFor:(id)a3
{
  id v4;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  sub_100D007CC(v4);

  sub_1005E96D4();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (CGRect)caretRectFor:(id)a3
{
  id v4;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  v5 = self;
  v6 = sub_100D00DB4(v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)closestPositionTo:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_100D00188(x, y);

  return v6;
}

- (id)positionWithin:(id)a3 farthestIn:(int64_t)a4
{
  id v6;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_100D00434((uint64_t)v6, a4);

  return v8;
}

- (id)characterRangeByExtending:(id)a3 in:(int64_t)a4
{
  id v6;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_100D00440((uint64_t)v6, a4);

  return v8;
}

- (BOOL)isSelectingCaret:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v5;
  unsigned __int8 v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_100D01144(x, y);

  return v6 & 1;
}

- (void)updateSelectionViews
{
  _QWORD *v2;
  void (*v3)(void);
  _TtC8Freeform27CRLWPTextSelectionManager_i *v4;
  _QWORD *v5;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  if (v2)
  {
    v3 = *(void (**)(void))((*v2 & swift_isaMask) + 0x188);
    v4 = self;
    v5 = v2;
    v3();

  }
}

- (void)beginLoupeSessionAt:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  v5 = qword_1013DCB58;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v7 = (id)qword_10147ECB0;
  sub_100D01434((uint64_t)v6, x, y);

}

- (void)moveLoupeTo:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  _TtC8Freeform27CRLWPTextSelectionManager_i *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  v5 = qword_1013DCB58;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_1013DCB58, sub_1006185A4);
  v7 = (id)qword_10147ECB0;
  sub_100D015DC(v6, x, y);

}

- (void)endLoupeSession
{
  _TtC8Freeform27CRLWPTextSelectionManager_i *v2;

  v2 = self;
  sub_100D00620();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLWPTextSelectionManager_i_loupeSession));
}

@end
