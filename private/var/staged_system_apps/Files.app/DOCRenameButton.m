@implementation DOCRenameButton

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC5Files15DOCRenameButton *v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self;
  sub_1003CB3E0(v5, v7);

  swift_bridgeObjectRelease(v7);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCRenameButton();
  v2 = (char *)v5.receiver;
  -[DOCRenameButton layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Files15DOCRenameButton_dimLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  _TtC5Files15DOCRenameButton *v17;
  void *v18;
  uint64_t v20;

  v7 = type metadata accessor for UIPointerShape(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v20 - v13;
  *(uint64_t *)((char *)&v20 - v13) = 0x4024000000000000;
  (*(void (**)(char *, _QWORD, uint64_t, double))(v8 + 104))((char *)&v20 - v13, enum case for UIPointerShape.verticalBeam(_:), v7, v12);
  sub_10004F2F0(0, (unint64_t *)&unk_100649080, UIPointerStyle_ptr);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v14, v7);
  v15 = a3;
  v16 = a4;
  v17 = self;
  v18 = (void *)UIPointerStyle.init(shape:constrainedAxes:)(v10, 2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);

  return v18;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  sub_1003CB084(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_1005E6A90, (uint64_t)sub_1003CB2A8, (uint64_t)&unk_1005E6AA8);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  sub_1003CB084(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_1005E6A40, (uint64_t)sub_1003CB2A0, (uint64_t)&unk_1005E6A58);
}

- (_TtC5Files15DOCRenameButton)initWithFrame:(CGRect)a3
{
  _TtC5Files15DOCRenameButton *result;

  result = (_TtC5Files15DOCRenameButton *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCRenameButton", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files15DOCRenameButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files15DOCRenameButton_dimLayer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.hoverEffectsAllowedIfInteractionDisabled[OBJC_IVAR____TtC5Files15DOCRenameButton_text]);
}

@end
