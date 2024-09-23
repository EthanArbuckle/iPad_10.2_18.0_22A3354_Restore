@implementation TTRIRemindersListDisclosureView

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TTRIRemindersListDisclosureView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *v7;
  void *v8;
  UIColor *v9;
  void *v10;
  UIColor *v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v6 = a3;
  v7 = self;
  -[TTRIRemindersListDisclosureView setTintColor:](&v14, sel_setTintColor_, v6);
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_collapsed);
  v13.receiver = v7;
  v13.super_class = ObjectType;
  v9 = -[TTRIRemindersListDisclosureView tintColor](&v13, sel_tintColor);
  objc_msgSend(v8, sel_setTintColor_, v9);

  v10 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_expanded);
  v12.receiver = v7;
  v12.super_class = ObjectType;
  v11 = -[TTRIRemindersListDisclosureView tintColor](&v12, sel_tintColor);
  objc_msgSend(v10, sel_setTintColor_, v11);

}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)init
{
  return (_TtC15RemindersUICore31TTRIRemindersListDisclosureView *)TTRIRemindersListDisclosureView.init()();
}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s15RemindersUICore31TTRIRemindersListDisclosureViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_name_object_, v5, *MEMORY[0x1E0DC44E0], 0);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[NUIContainerBoxView dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_collapsed));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_expanded));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_imageConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_cachedCollapsedImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_cachedExpandedImage));
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_class *v4;
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *v9;
  UIEvent_optional v11;

  v4 = (objc_class *)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = NUIContainerView.ttr_pointIncludingExpandedHitTestInsets(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (void)subtaskDisclosureButtonAction:(id)a3
{
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *v4;
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  _OWORD v9[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListDisclosureView_actionDelegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v6))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC15RemindersUICore31TTRIRemindersListDisclosureView *, uint64_t, uint64_t))(v7 + 8))(self, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B4314F88((uint64_t)v9);
}

- (void)buttonShapesSettingDidChange
{
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *v2;

  v2 = self;
  sub_1B446E0E0();

}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithFrame:(CGRect)a3
{
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *result;

  result = (_TtC15RemindersUICore31TTRIRemindersListDisclosureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore31TTRIRemindersListDisclosureView)initWithArrangedSubviews:(id)a3
{
  _TtC15RemindersUICore31TTRIRemindersListDisclosureView *result;

  result = (_TtC15RemindersUICore31TTRIRemindersListDisclosureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
