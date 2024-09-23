@implementation DOCTokenChainView

- (_TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView)initWithFrame:(CGRect)a3
{
  return (_TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView *)sub_10033D054(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100340788();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  _TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10033D270();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)resignFirstResponder
{
  _TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10033D4C8();
  v4 = v3;

  return v4 & 1;
}

- (NSArray)keyCommands
{
  return (NSArray *)sub_10033F198(self, (uint64_t)a2, sub_10033D664);
}

- (void)selectAll:(id)a3
{
  sub_10033FD90(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))sub_10033D758);
}

- (BOOL)hasText
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_tokens;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_tokens, v4, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v2 + 16) != 0;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView *v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  sub_10033D970();

  swift_bridgeObjectRelease(v5);
}

- (void)deleteBackward
{
  _TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView *v2;

  v2 = self;
  sub_10033E33C();

}

- (void)tap:(id)a3
{
  -[DOCTokenChainView becomeFirstResponder](self, "becomeFirstResponder", a3);
}

- (void)directionKeyCommand:(id)a3
{
  id v4;
  _TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView *v5;

  v4 = a3;
  v5 = self;
  sub_100340858();

}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_coTextfield);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_font));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_tokens));
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)0;
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)0;
}

- (UITextRange)markedTextRange
{
  return (UITextRange *)0;
}

- (NSDictionary)markedTextStyle
{
  return (NSDictionary *)0;
}

- (id)beginningOfDocument
{
  return objc_msgSend(objc_allocWithZone((Class)UITextPosition), "init");
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -[DOCTokenChainView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection", a3, a4) != 0;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  sub_10004F2F0(0, &qword_10064F628, UITextSelectionRect_ptr);
  return Array._bridgeToObjectiveC()().super.isa;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

@end
