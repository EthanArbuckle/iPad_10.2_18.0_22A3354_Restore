@implementation ActivityIndicatorTitleView

- (UILabel)titleLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_titleLabel, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return (UIActivityIndicatorView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_activityIndicatorView);
}

- (void)setActivityIndicatorView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_activityIndicatorView, a3);
}

- (_TtC6Health26ActivityIndicatorTitleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_titleLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_activityIndicatorView, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ActivityIndicatorTitleView();
  return -[ActivityIndicatorTitleView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC6Health26ActivityIndicatorTitleView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_titleLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_activityIndicatorView, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivityIndicatorTitleView();
  return -[ActivityIndicatorTitleView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_titleLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6Health26ActivityIndicatorTitleView_activityIndicatorView);
}

@end
