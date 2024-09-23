@implementation BCTurnPageButton

- (BOOL)useMaterialFill
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_useMaterialFill;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_useMaterialFill, v4, 0, 0);
  return *v2;
}

- (void)setUseMaterialFill:(BOOL)a3
{
  int v3;
  _BYTE *v5;
  int v6;
  BCTurnPageButton *v7;
  _BYTE v8[24];

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___BCTurnPageButton_useMaterialFill;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_useMaterialFill, v8, 1, 0);
  v6 = *v5;
  *v5 = v3;
  if (v6 != v3)
  {
    v7 = self;
    sub_1A8954();

  }
}

- (BOOL)hovering
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_hovering;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_hovering, v4, 0, 0);
  return *v2;
}

- (void)setHovering:(BOOL)a3
{
  BOOL *v5;
  BCTurnPageButton *v6;
  _BYTE v7[24];

  v5 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_hovering;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_hovering, v7, 1, 0);
  *v5 = a3;
  v6 = self;
  sub_1A7780();

}

- (BOOL)pressed
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_pressed;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_pressed, v4, 0, 0);
  return *v2;
}

- (void)setPressed:(BOOL)a3
{
  _BOOL4 v3;
  _BYTE *v5;
  double v6;
  void *v7;
  _BYTE v8[24];

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___BCTurnPageButton_pressed;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_pressed, v8, 1, 0);
  *v5 = v3;
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BCTurnPageButton_pressedLayer);
  if (v7)
  {
    LODWORD(v6) = 0;
    if (v3)
      *(float *)&v6 = 1.0;
    objc_msgSend(v7, "setOpacity:", v6);
  }
}

- (UIColor)fillColor
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BCTurnPageButton_fillColor);
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_fillColor, v4, 0, 0);
  return (UIColor *)*v2;
}

- (void)setFillColor:(id)a3
{
  id v5;
  BCTurnPageButton *v6;

  v5 = a3;
  v6 = self;
  sub_1A7E58(a3);

}

- (BCTurnPageButtonAccessibilityDelegate)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR___BCTurnPageButton_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_delegate, v4, 0, 0);
  return (BCTurnPageButtonAccessibilityDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR___BCTurnPageButton_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___BCTurnPageButton_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

+ (id)leftButton
{
  uint64_t v2;
  _BYTE *v3;

  v2 = type metadata accessor for TurnPageButton();
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "buttonWithType:", 0);
  v3[OBJC_IVAR___BCTurnPageButton_direction] = 0;
  sub_1A82D8();
  return v3;
}

+ (id)rightButton
{
  uint64_t v2;
  _BYTE *v3;

  v2 = type metadata accessor for TurnPageButton();
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "buttonWithType:", 0);
  v3[OBJC_IVAR___BCTurnPageButton_direction] = 1;
  sub_1A82D8();
  return v3;
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  BCTurnPageButton *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v9);
  swift_unknownObjectRelease(a3);
  sub_1A87D4();

  sub_184A38(v9);
}

- (BCTurnPageButton)initWithFrame:(CGRect)a3
{
  return (BCTurnPageButton *)TurnPageButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BCTurnPageButton)initWithCoder:(id)a3
{
  return (BCTurnPageButton *)TurnPageButton.init(coder:)(a3);
}

- (void).cxx_destruct
{

  sub_175F14((uint64_t)self + OBJC_IVAR___BCTurnPageButton_delegate);
}

- (NSString)accessibilityLabel
{
  BCTurnPageButton *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  TurnPageButton.accessibilityLabel.getter();
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

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)accessibilityElementDidBecomeFocused
{
  char *v2;
  char *v3;
  char *v4;
  void *Strong;
  void *v6;
  uint64_t v7;
  char v8[24];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TurnPageButton();
  v2 = (char *)v9.receiver;
  -[BCTurnPageButton accessibilityElementDidBecomeFocused](&v9, "accessibilityElementDidBecomeFocused");
  v3 = &v2[OBJC_IVAR___BCTurnPageButton_hovering];
  swift_beginAccess(&v2[OBJC_IVAR___BCTurnPageButton_hovering], v8, 1, 0);
  *v3 = 1;
  sub_1A7780();
  v4 = &v2[OBJC_IVAR___BCTurnPageButton_delegate];
  swift_beginAccess(&v2[OBJC_IVAR___BCTurnPageButton_delegate], &v7, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = Strong;
    objc_msgSend(Strong, "updateTurnPageButtonsForFocusChange");

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)accessibilityElementDidLoseFocus
{
  char *v2;
  char *v3;
  char *v4;
  void *Strong;
  void *v6;
  uint64_t v7;
  char v8[24];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TurnPageButton();
  v2 = (char *)v9.receiver;
  -[BCTurnPageButton accessibilityElementDidLoseFocus](&v9, "accessibilityElementDidLoseFocus");
  v3 = &v2[OBJC_IVAR___BCTurnPageButton_hovering];
  swift_beginAccess(&v2[OBJC_IVAR___BCTurnPageButton_hovering], v8, 1, 0);
  *v3 = 0;
  sub_1A7780();
  v4 = &v2[OBJC_IVAR___BCTurnPageButton_delegate];
  swift_beginAccess(&v2[OBJC_IVAR___BCTurnPageButton_delegate], &v7, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = Strong;
    objc_msgSend(Strong, "updateTurnPageButtonsForFocusChange");

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

@end
