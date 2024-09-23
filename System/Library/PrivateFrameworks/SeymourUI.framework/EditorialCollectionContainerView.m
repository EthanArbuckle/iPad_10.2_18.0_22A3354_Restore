@implementation EditorialCollectionContainerView

- (_TtC9SeymourUI32EditorialCollectionContainerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI32EditorialCollectionContainerView *result;

  sub_22B3D1990();
  return result;
}

- (_TtC9SeymourUI32EditorialCollectionContainerView)initWithCoder:(id)a3
{
  id v3;
  _TtC9SeymourUI32EditorialCollectionContainerView *result;

  v3 = a3;
  sub_22B3D2C6C();
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EditorialCollectionContainerView();
  v2 = v3.receiver;
  -[EditorialCollectionContainerView layoutSubviews](&v3, sel_layoutSubviews);
  sub_22B3D2610();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._layerRetained
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_titleWidthConstraint));
}

@end
