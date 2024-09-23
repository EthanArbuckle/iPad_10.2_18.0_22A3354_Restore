@implementation TTRIAccountsListsCellAccessoryView

- (void)_didInvalidateIntrinsicContentSize
{
  char *v2;
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v9.receiver;
  -[TTRIAccountsListsCellAccessoryView _didInvalidateIntrinsicContentSize](&v9, "_didInvalidateIntrinsicContentSize");
  v3 = &v2[OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_layoutDelegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_layoutDelegate]);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(Strong, v5);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 8))(v2, ObjectType, v7);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (_TtC9Reminders34TTRIAccountsListsCellAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders34TTRIAccountsListsCellAccessoryView *)sub_100027884(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView);
  if (v3)
    objc_msgSend(v3, "effectiveLayoutSizeFittingSize:", result.width, result.height);
  else
    __break(1u);
  return result;
}

- (_TtC9Reminders34TTRIAccountsListsCellAccessoryView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders34TTRIAccountsListsCellAccessoryView *)sub_1003E61FC(v3, v4);
}

- (void)sizeToFit
{
  void *v2;
  _TtC9Reminders34TTRIAccountsListsCellAccessoryView *v3;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, "intrinsicContentSize");
    -[TTRIAccountsListsCellAccessoryView frame](v3, "frame");
    -[TTRIAccountsListsCellAccessoryView setFrame:](v3, "setFrame:");

  }
  else
  {
    __break(1u);
  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView);
  if (v2)
    objc_msgSend(v2, "intrinsicContentSize");
  else
    __break(1u);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC9Reminders34TTRIAccountsListsCellAccessoryView *v4;
  objc_super v5;
  _QWORD v6[4];

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6[3] = ObjectType;
  v6[0] = self;
  v4 = self;
  static UIAccessibility.removeButtonShapesStatusChangeObserver(_:)(v6);
  sub_100027F10(v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[TTRIAccountsListsCellAccessoryView dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_preferredTintColor));
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_layoutDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_countLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView_disclosureImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView____lazy_storage___chevronFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIAccountsListsCellAccessoryView____lazy_storage___chevronConfiguration));
}

- (void)buttonShapesSettingDidChange
{
  _TtC9Reminders34TTRIAccountsListsCellAccessoryView *v2;

  v2 = self;
  sub_100028358();

}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  UIAccessibilityTraits v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v7.receiver;
  v3 = -[TTRIAccountsListsCellAccessoryView accessibilityTraits](&v7, "accessibilityTraits");
  v4 = UIAccessibilityTraitHeader;

  v5 = -1;
  if ((v4 & v3) != 0)
    v5 = ~v4;
  return v5 & v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  -[TTRIAccountsListsCellAccessoryView setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

@end
