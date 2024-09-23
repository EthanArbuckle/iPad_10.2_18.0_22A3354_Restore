@implementation ICDebugStatusRootView

- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView *result;

  v4 = (char *)self + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_panStart;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_xPosition) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_yPosition) = 0;
  v5 = a3;

  result = (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x8000000100481190, "MobileNotes/ICDebugStatusWindow.swift", 37, 2, 110, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  char *v7;
  id v8;
  id v9;
  id v10;
  char *Strong;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self);
  v7 = (char *)v13.receiver;
  v8 = a4;
  v9 = -[ICDebugStatusRootView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
    goto LABEL_4;
  v10 = v9;
  if ((objc_msgSend(v9, "isDescendantOfView:", *(_QWORD *)&v7[OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_container], v13.receiver, v13.super_class) & 1) == 0)
  {

LABEL_4:
    Strong = (char *)swift_unknownObjectUnownedLoadStrong(&v7[OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_anchor]);
    v10 = objc_msgSend(Strong, "hitTest:withEvent:", v8, x, y);

    v8 = v7;
    v7 = Strong;
  }

  return v10;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[ICDebugStatusRootView layoutSubviews](&v3, "layoutSubviews");
  sub_1001C9A4C();

}

- (void)safeAreaInsetsDidChange
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[ICDebugStatusRootView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  if (v2[OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_panStart + 16] == 1)
    sub_1001C9784();

}

- (void)handlePanGesture:(id)a3
{
  id v4;
  _TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView *v5;

  v4 = a3;
  v5 = self;
  sub_1001C9D7C(v4);

}

- (void)updateColors
{
  _TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView *v2;

  v2 = self;
  sub_1001C9960();

}

- (void)updateInitialPosition
{
  _TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView *v2;

  v2 = self;
  sub_1001C9784();

}

- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView)initWithFrame:(CGRect)a3
{
  sub_1001C9F58((uint64_t)self, (uint64_t)a2, (uint64_t)"MobileNotes.ICDebugStatusRootView", 33, (uint64_t)"init(frame:)", 12);
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_anchor, a2);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_container));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_xPosition));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC421ICDebugStatusRootView_yPosition));
}

@end
