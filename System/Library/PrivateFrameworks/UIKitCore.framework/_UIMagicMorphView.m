@implementation _UIMagicMorphView

- (BOOL)wantsEdgeAntialiasing
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_wantsEdgeAntialiasing);
}

- (void)setWantsEdgeAntialiasing:(BOOL)a3
{
  _UIMagicMorphView *v4;

  v4 = self;
  sub_1857053D8(a3);

}

- (BOOL)allowsElasticMorph
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_allowsElasticMorph);
}

- (void)setAllowsElasticMorph:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_allowsElasticMorph) = a3;
}

- (unint64_t)preferredMorphingAxis
{
  return *(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_preferredMorphingAxis);
}

- (void)setPreferredMorphingAxis:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_preferredMorphingAxis) = (Class)a3;
}

- (_UIMagicMorphView)initWithFrame:(CGRect)a3
{
  return (_UIMagicMorphView *)sub_1857059A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIMagicMorphView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1857097FC();
}

- (void)morphTo:(id)a3
{
  id (*v4)();
  _UIMagicMorphView *v5;

  v4 = (id (*)())a3;
  v5 = self;
  sub_185705C1C(v4);

}

- (void)reset
{
  _UIMagicMorphView *v2;

  v2 = self;
  sub_1857070B8();

}

- (void)layoutSubviews
{
  _UIMagicMorphView *v2;

  v2 = self;
  sub_185707248();

}

- (void)updateContentSize
{
  _UIMagicMorphView *v2;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_contentSizeDidChange) = 1;
  v2 = self;
  -[UIView setNeedsLayout](v2, sel_setNeedsLayout);
  if (objc_msgSend((id)objc_opt_self(), sel__isInAnimationBlock))
    -[UIView layoutIfNeeded](v2, sel_layoutIfNeeded);

}

- (void)addMilestone:(id)a3 named:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  _UIMagicMorphView *v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v6 = sub_1865074F8();
  v8 = v7;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____UIMagicMorphView_milestones);
  swift_beginAccess();
  v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v9;
  *v9 = 0x8000000000000000;
  sub_185647E38((uint64_t)v10, v6, v8, isUniquelyReferenced_nonNull_native);
  *v9 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)removeMilestoneWithNamed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UIMagicMorphView *v7;
  void *v8;

  v4 = sub_1865074F8();
  v6 = v5;
  swift_beginAccess();
  v7 = self;
  v8 = (void *)sub_1856BE4E0(v4, v6);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
