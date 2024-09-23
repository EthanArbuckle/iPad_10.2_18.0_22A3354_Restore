@implementation TTRIHashtagWrappingCollectionView

- (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *)sub_1B46BF9F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *)sub_1B46BFF48(a3);
}

- (void)layoutSubviews
{
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v2;

  v2 = self;
  TTRIHashtagWrappingCollectionView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = TTRIHashtagWrappingCollectionView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_wrappingContainer);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_isLayoutSizeDependentOnPerpendicularAxis);
  else
    __break(1u);
  return (char)v2;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double height;
  double width;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  -[TTRIHashtagWrappingCollectionView _layoutSizeThatFits:fixedAxes:](&v9, sel__layoutSizeThatFits_fixedAxes_, a4, width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)addTagButtonAction:(id)a3
{
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v4;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  _OWORD v9[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v6))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *, uint64_t, uint64_t))(v7 + 16))(self, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_1B41EA560((uint64_t)v9, &qword_1ED4ED170);
}

- (void)hashtagButtonAction:(id)a3
{
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v4;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v5;
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
  sub_1B46C14E8((uint64_t)v6);

  sub_1B41EA560((uint64_t)v6, &qword_1ED4ED170);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_wrappingContainer));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_internalSelection;
  v4 = sub_1B49046DC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1B449905C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_focusGuide));
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  NUIContainerView *v4;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v5;

  v4 = (NUIContainerView *)a3;
  v5 = self;
  TTRIHashtagWrappingCollectionView.containerViewDidLayoutArrangedSubviews(_:)(v4);

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  id v9;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v10;
  char v11;

  v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B5E3D8DC](v6))
  {
    v7 = *((_QWORD *)v6 + 1);
    swift_getObjectType();
    v8 = *(uint64_t (**)(void))(v7 + 32);
    v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    v11 = v8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  sub_1B46C2984(self, (uint64_t)a2, a3, (uint64_t)a4, 0);
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  sub_1B46C2984(self, (uint64_t)a2, a3, (uint64_t)a4, 1uLL);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B46C1928((char **)a4);
  v10 = v9;
  sub_1B46C1E48((uint64_t)v8, v9);
  if (v10)
  {
    swift_bridgeObjectRelease();
    v10 = 2;
  }
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3788]), sel_initWithDropOperation_, v10);

  swift_unknownObjectRelease();
  return v11;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1B46C50BC((char **)a4);

  swift_unknownObjectRelease();
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_1B46C539C((uint64_t)v10);

  return v12;
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v5;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1B46C1E48(0, 1uLL);
  v7 = *(uint64_t *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState);
  v8 = *(_QWORD *)((char *)&v6->super.super._responderFlags
                 + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState);
  *(_OWORD *)((char *)&v6->super.super.super.isa
            + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_dropState) = xmmword_1B490F240;
  sub_1B449905C(v7, v8);
  v9 = (Class *)((char *)&v6->super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore33TTRIHashtagWrappingCollectionView_targetHashtagLabelForPerformingDrop);
  *v9 = 0;
  v9[1] = 0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v6;
  char *v7;

  v5 = a3;
  v6 = self;
  v7 = _s15RemindersUICore33TTRIHashtagWrappingCollectionViewC22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B46C5994();
  v10 = v9;

  return v10;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B46C5994();
  v10 = v9;

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _TtC15RemindersUICore33TTRIHashtagWrappingCollectionView *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  _s15RemindersUICore33TTRIHashtagWrappingCollectionViewC22contextMenuInteraction_10willEndFor8animatorySo09UIContexthI0C_So0nH13ConfigurationCSo0nhI9Animating_pSgtF_0();

  swift_unknownObjectRelease();
}

@end
