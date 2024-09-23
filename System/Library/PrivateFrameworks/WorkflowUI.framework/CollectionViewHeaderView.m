@implementation CollectionViewHeaderView

- (void)prepareForReuse
{
  _TtC10WorkflowUI24CollectionViewHeaderView *v2;

  v2 = self;
  sub_2201A9958();

}

- (_TtC10WorkflowUI24CollectionViewHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUI24CollectionViewHeaderView *)sub_2201A9E58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUI24CollectionViewHeaderView)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUI24CollectionViewHeaderView *)sub_2201A9EE4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI24CollectionViewHeaderView_hostingView));
}

@end
