@implementation PXAssetsSectionButton

+ (double)preferredHeightWithExtendedTraitCollection:(id)a3 numberOfLines:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;

  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = (id)UIFontTextStyleFromPXFontTextStyle();
  v9 = UITraitCollectionFromPXTraitCollection(objc_msgSend(v7, sel_traitCollection));
  swift_unknownObjectRelease();
  v10 = objc_msgSend(v6, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, v8, v9);

  objc_msgSend(v10, sel_lineHeight);
  v12 = v11;

  return v12 * (double)a4;
}

+ (id)configurationWithTitle:(id)a3 numberOfLines:(int64_t)a4 action:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  uint64_t *v13;
  uint64_t (**v14)();
  id v15;
  objc_super v17;

  v6 = _Block_copy(a5);
  v7 = sub_1A7AE3764();
  v9 = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  v11 = (objc_class *)type metadata accessor for AssetsSectionButton.Configuration();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtCC12PhotosUICore19AssetsSectionButton13Configuration_title];
  *v13 = v7;
  v13[1] = v9;
  *(_QWORD *)&v12[OBJC_IVAR____TtCC12PhotosUICore19AssetsSectionButton13Configuration_numberOfLines] = a4;
  v14 = (uint64_t (**)())&v12[OBJC_IVAR____TtCC12PhotosUICore19AssetsSectionButton13Configuration_action];
  *v14 = sub_1A6C77528;
  v14[1] = (uint64_t (*)())v10;
  v17.receiver = v12;
  v17.super_class = v11;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  sub_1A7ADBF34();
  v15 = objc_msgSendSuper2(&v17, sel_init);
  swift_bridgeObjectRelease();
  swift_release();
  return v15;
}

- (PXAssetsSectionButton)initWithFrame:(CGRect)a3
{
  return (PXAssetsSectionButton *)sub_1A6FF2D60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PXAssetsSectionButton)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  PXAssetsSectionButton *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXAssetsSectionButton_configuration) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXAssetsSectionButton_userData) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR___PXAssetsSectionButton_clippingRect);
  *v4 = 0u;
  v4[1] = 0u;
  v5 = a3;

  result = (PXAssetsSectionButton *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AssetsSectionButton();
  v2 = (char *)v4.receiver;
  -[PXAssetsSectionButton layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR___PXAssetsSectionButton_button];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (NSCopying)userData
{
  swift_beginAccess();
  return (NSCopying *)(id)swift_unknownObjectRetain();
}

- (void)setUserData:(id)a3
{
  PXAssetsSectionButton *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A6FF37B4((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (CGRect)clippingRect
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR___PXAssetsSectionButton_clippingRect);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR___PXAssetsSectionButton_clippingRect);
  swift_beginAccess();
  *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (void)prepareForReuse
{
  void (*v2)(_QWORD);
  PXAssetsSectionButton *v3;

  v2 = *(void (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x78);
  v3 = self;
  v2(0);

}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
