@implementation _TipKitViewInternal

- (_TtC12TipKitLegacy19_TipKitViewInternal)initWithCoder:(id)a3
{
  id v4;
  _TtC12TipKitLegacy19_TipKitViewInternal *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12TipKitLegacy19_TipKitViewInternal_tipContentView) = 0;
  v4 = a3;

  result = (_TtC12TipKitLegacy19_TipKitViewInternal *)sub_248A9C7A8();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC12TipKitLegacy19_TipKitViewInternal *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12TipKitLegacy19_TipKitViewInternal_tipContentView);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    -[_TipKitViewInternal bounds](v3, sel_bounds);
    v6 = v5;
    LODWORD(v5) = 1148846080;
    LODWORD(v7) = 1132068864;
    objc_msgSend(v4, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v6, 0.0, v5, v7);
    v9 = v8;
    v11 = v10;

  }
  else
  {
    -[_TipKitViewInternal bounds](self, sel_bounds);
    v9 = v12;
    v11 = v13;
  }
  v14 = v9;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _TipKitViewInternal();
  v2 = v3.receiver;
  -[_TipKitViewInternal layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_invalidateIntrinsicContentSize, v3.receiver, v3.super_class);

}

- (_TtC12TipKitLegacy19_TipKitViewInternal)initWithFrame:(CGRect)a3
{
  _TtC12TipKitLegacy19_TipKitViewInternal *result;

  result = (_TtC12TipKitLegacy19_TipKitViewInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12TipKitLegacy19_TipKitViewInternal_tipContentView));
}

@end
