@implementation WeekdayPlannerModalityCell

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WeekdayPlannerModalityCell();
  return -[WeekdayPlannerModalityCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  unsigned int v5;
  char *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WeekdayPlannerModalityCell();
  v4 = (char *)v7.receiver;
  -[WeekdayPlannerModalityCell setHighlighted:](&v7, sel_setHighlighted_, v3);
  v5 = objc_msgSend(v4, sel_isHighlighted, v7.receiver, v7.super_class);
  v6 = &v4[OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider];
  if (v5)
    v6 = &v4[OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider + 8];
  objc_msgSend(v4, sel_setBackgroundColor_, *(_QWORD *)v6);

}

- (_TtC9SeymourUI26WeekdayPlannerModalityCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26WeekdayPlannerModalityCell *)sub_22B3695CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26WeekdayPlannerModalityCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B36B8FC();
}

- (void)didMoveToWindow
{
  char *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WeekdayPlannerModalityCell();
  v2 = (char *)v7.receiver;
  -[WeekdayPlannerModalityCell didMoveToWindow](&v7, sel_didMoveToWindow);
  v3 = *(id *)&v2[OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_separatorHeightConstraint];
  v4 = objc_msgSend(v2, sel_window, v7.receiver, v7.super_class);
  sub_22BA7D994();
  v6 = v5;

  objc_msgSend(v3, sel_setConstant_, v6);
  objc_msgSend(v2, sel_setNeedsUpdateConstraints);

}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI26WeekdayPlannerModalityCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for WeekdayPlannerModalityCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[WeekdayPlannerModalityCell prepareForReuse](&v11, sel_prepareForReuse);
  -[WeekdayPlannerModalityCell directionalLayoutMargins](v7, sel_directionalLayoutMargins);
  -[WeekdayPlannerModalityCell setDirectionalLayoutMargins:](v7, sel_setDirectionalLayoutMargins_);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI26WeekdayPlannerModalityCell *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = -[WeekdayPlannerModalityCell contentView](v9, sel_contentView);
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_separator));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  v4 = *(void **)((char *)&self->super.super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  v6 = *(NSMutableArray **)((char *)&self->super.super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  v7 = *(UITraitCollection **)((char *)&self->super.super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  v8 = *(UIViewAnimationInfo **)((char *)&self->super.super.super.super._animationInfo
                               + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  v9 = *(id *)((char *)&self->super.super.super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  v10 = *(_UITraitChangeRegistry **)((char *)&self->super.super.super.super._traitChangeRegistry
                                   + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super._layerRetained
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_styleProvider));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26WeekdayPlannerModalityCell_separatorHeightConstraint));
}

@end
