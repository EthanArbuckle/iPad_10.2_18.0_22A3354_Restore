@implementation TTRILabeledIconCell

- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC15RemindersUICore19TTRILabeledIconCell *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_cellDelegate) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_isSelected) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_isDebugTitleFramesEnabled) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_selectionView) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_debugViews);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC15RemindersUICore19TTRILabeledIconCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  _TtC15RemindersUICore19TTRILabeledIconCell *v2;

  v2 = self;
  sub_1B4376D1C();

}

- (void)buttonAction:(id)a3
{
  _TtC15RemindersUICore19TTRILabeledIconCell *v4;
  _TtC15RemindersUICore19TTRILabeledIconCell *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (MEMORY[0x1B5E3D8DC]((char *)self + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_cellDelegate))
  {
    sub_1B43767D4(*(unint64_t *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_index));

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B4314F88((uint64_t)v6);
}

- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithFrame:(CGRect)a3
{
  _TtC15RemindersUICore19TTRILabeledIconCell *result;

  result = (_TtC15RemindersUICore19TTRILabeledIconCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore19TTRILabeledIconCell)initWithArrangedSubviews:(id)a3
{
  _TtC15RemindersUICore19TTRILabeledIconCell *result;

  result = (_TtC15RemindersUICore19TTRILabeledIconCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_cellDelegate);
  sub_1B424A154((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_titleFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_selectionView));
  sub_1B4224758(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_debugViews), *(void **)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore19TTRILabeledIconCell_debugViews));
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  id v7;
  char *v8;
  _TtC15RemindersUICore19TTRILabeledIconCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v7 = a3;
  v8 = (char *)a5;
  v9 = self;
  sub_1B4377BFC(v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  _TtC15RemindersUICore19TTRILabeledIconCell *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_1B4377D1C((uint64_t)v12, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4;
  _TtC15RemindersUICore19TTRILabeledIconCell *v5;

  v4 = a3;
  v5 = self;
  sub_1B4378094();

}

@end
