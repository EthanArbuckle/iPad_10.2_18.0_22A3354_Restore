@implementation NCNotificationListDebugView

- (int64_t)depth
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_depth);
}

- (void)setDepth:(int64_t)a3
{
  uint64_t v3;
  NCNotificationListDebugView *v4;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_depth);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_depth) = (Class)a3;
  if (v3 != a3)
  {
    v4 = self;
    -[NCNotificationListDebugView updateColor](v4, sel_updateColor);
    sub_1CFD55EC4();

  }
}

- (int64_t)index
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_index);
}

- (void)setIndex:(int64_t)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_index);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_index) = (Class)a3;
  if (v3 != a3)
    -[NCNotificationListDebugView updateColor](self, sel_updateColor);
}

+ (BOOL)shouldShow
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_standardDefaults);
  v3 = objc_msgSend(v2, sel_listDebugGuides);

  return v3;
}

- (NCNotificationListDebugView)initWithListView:(id)a3
{
  return (NCNotificationListDebugView *)sub_1CFD5600C(a3);
}

- (void)displayRect:(CGRect)a3 withName:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NCNotificationListDebugView *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = sub_1CFD7C4C0();
  v11 = v10;
  v12 = self;
  sub_1CFD56348(v9, v11, x, y, width, height);

  swift_bridgeObjectRelease();
}

- (NCNotificationListDebugView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo27NCNotificationListDebugViewC22UserNotificationsUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)didMoveToWindow
{
  NCNotificationListDebugView *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListDebugView;
  v2 = self;
  -[NCNotificationListDebugView didMoveToWindow](&v3, sel_didMoveToWindow);
  sub_1CFD56990();

}

- (void)layoutSubviews
{
  NCNotificationListDebugView *v2;

  v2 = self;
  NCNotificationListDebugView.layoutSubviews()();

}

- (BOOL)showUI
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_showUI);
}

- (void)setShowUI:(BOOL)a3
{
  NCNotificationListDebugView *v4;

  v4 = self;
  sub_1CFD56F5C(a3);

}

- (NCNotificationListView)listView
{
  return (NCNotificationListView *)(id)MEMORY[0x1D17DD63C]((char *)self+ OBJC_IVAR___NCNotificationListDebugView_listView, a2);
}

- (void)setListView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSDictionary)additionalRectsByName
{
  void *v2;

  type metadata accessor for AccessoryView();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CFD7C460();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setAdditionalRectsByName:(id)a3
{
  type metadata accessor for AccessoryView();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_additionalRectsByName) = (Class)sub_1CFD7C46C();
  swift_bridgeObjectRelease();
}

- (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8810DebugLabel)label
{
  return (_TtC22UserNotificationsUIKitP33_E56270D007896E6F9A012E31D0F23E8810DebugLabel *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_label);
}

- (void)setLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_label);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_label) = (Class)a3;
  v3 = a3;

}

+ (double)outlineWidth
{
  return 1.0;
}

- (UIColor)color
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___NCNotificationListDebugView_color));
}

- (void)setColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_color);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCNotificationListDebugView_color) = (Class)a3;
  v3 = a3;

}

- (void)updateColor
{
  NCNotificationListDebugView *v2;

  v2 = self;
  sub_1CFD57228();

}

- (NCNotificationListDebugView)initWithFrame:(CGRect)a3
{
  NCNotificationListDebugView *result;

  result = (NCNotificationListDebugView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

}

@end
