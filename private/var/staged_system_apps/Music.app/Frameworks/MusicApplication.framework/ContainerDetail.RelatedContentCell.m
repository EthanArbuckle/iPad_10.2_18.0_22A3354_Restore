@implementation ContainerDetail.RelatedContentCell

- (_TtCV16MusicApplication15ContainerDetail18RelatedContentCell)initWithFrame:(CGRect)a3
{
  return (_TtCV16MusicApplication15ContainerDetail18RelatedContentCell *)sub_3ACD38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV16MusicApplication15ContainerDetail18RelatedContentCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_3AD31C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail18RelatedContentCell_relatedContent));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail18RelatedContentCell_parent);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail18RelatedContentCell_verticalStackVC));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail18RelatedContentCell_contentSizeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail18RelatedContentCell__heightConstraint));
}

@end
