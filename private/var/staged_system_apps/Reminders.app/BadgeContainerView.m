@implementation BadgeContainerView

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *)sub_100378F54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithCoder:(id)a3
{
  _TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *v4;
  id v5;
  _TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *result;

  v4 = (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *)((char *)&self->super
                                                                                        + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  *(_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4226UnanimatedContainerBoxView *)((char *)&self->super
                                                                                    + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView____lazy_storage___badgeOvalClipMask) = 0;
  v5 = a3;

  result = (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRITemplatesListCell.swift", 37, 2, 277, 0);
  __break(1u);
  return result;
}

- (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView)initWithArrangedSubviews:(id)a3
{
  _TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *result;

  result = (_TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *)_swift_stdlib_reportUnimplementedInitializer("Reminders.BadgeContainerView", 28, "init(arrangedSubviews:)", 23, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_badgeView));
  sub_100254288(*(void **)((char *)&self->super+ OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView), *(void **)&self->badgeView[OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView], *(void **)&self->sharingIconView[OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView_sharingIconView]);
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView____lazy_storage___badgeOvalClipMask));
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  id v7;
  id v8;
  _TtC9RemindersP33_867866E3C408EC8E125699C6A4109C4218BadgeContainerView *v9;
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
  double v20;
  CGRect result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1003799C0((uint64_t)v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
