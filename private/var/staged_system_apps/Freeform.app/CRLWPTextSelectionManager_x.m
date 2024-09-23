@implementation CRLWPTextSelectionManager_x

- (id)selectionRectsFor:(id)a3
{
  id v4;
  _TtC8Freeform27CRLWPTextSelectionManager_x *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  sub_100951490(v4);

  sub_1005E96D4();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)isSelectingCaret:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  _TtC8Freeform27CRLWPTextSelectionManager_x *v5;
  unsigned __int8 v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_100951964(x, y);

  return v6 & 1;
}

- (CGRect)firstRectFor:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1005E8250(self, (uint64_t)a2, a3, sub_100951BD4);
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
  _TtC8Freeform27CRLWPTextSelectionManager_x *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v7 = self;
  sub_100951D50(location, length, a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)caretRectFor:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1005E8250(self, (uint64_t)a2, a3, sub_1009522CC);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
