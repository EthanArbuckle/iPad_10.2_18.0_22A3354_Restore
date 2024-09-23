@implementation WorkoutPlanBannerCell

- (_TtC9SeymourUI21WorkoutPlanBannerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21WorkoutPlanBannerCell *)sub_22B380EB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21WorkoutPlanBannerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3828DC();
}

- (void)prepareForReuse
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9SeymourUI21WorkoutPlanBannerCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v7 = self;
  -[WorkoutPlanBannerCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v6, v9);
  swift_endAccess();

}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_itemInfo, &qword_255B861D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_actionButtonContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_platterView));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_styleProvider;
  v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_styleProvider);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI21WorkoutPlanBannerCell_styleProvider);
  v7 = v4;
  v6 = (void *)*((_QWORD *)v3 + 3);

}

@end
