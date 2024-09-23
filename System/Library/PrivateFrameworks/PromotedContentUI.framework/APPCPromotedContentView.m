@implementation APPCPromotedContentView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  APPCPromotedContentView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  objc_super v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for PromotedContentView();
  v20.receiver = self;
  v20.super_class = v8;
  v9 = self;
  -[APPCPromotedContentView frame](&v20, sel_frame);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19.receiver = v9;
  v19.super_class = v8;
  -[APPCPromotedContentView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  -[APPCPromotedContentView frame](v9, sel_frame);
  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  if (!CGRectEqualToRect(v21, v22))
  {
    v18 = sub_1B12C0B98();
    (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v9->super.super.super.isa) + 0x2E0))(v18);
  }

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PromotedContentView();
  -[APPCPromotedContentView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)readiness
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_readiness);
}

- (void)setReadiness:(int64_t)a3
{
  APPCPromotedContentView *v4;

  v4 = self;
  sub_1B130661C(a3);

}

- (NSString)description
{
  APPCPromotedContentView *v2;
  void *v3;

  v2 = self;
  sub_1B13066E8();

  v3 = (void *)sub_1B1372B74();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (APPCPromotedContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s17PromotedContentUI0aB4ViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  APPCPromotedContentView *v2;

  v2 = self;
  PromotedContentView.__deallocating_deinit();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___APPCPromotedContentView_expandedAdTapGestureRecognizer));
  swift_unknownObjectRelease();

  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR___APPCPromotedContentView_interactionDelegate);
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR___APPCPromotedContentView_interactionPresentationDelegate);

  sub_1B12D0D40((uint64_t)self + OBJC_IVAR___APPCPromotedContentView_videoActionTimestamp, &qword_1ED387ED8);
  sub_1B12D4038((uint64_t)self + OBJC_IVAR___APPCPromotedContentView_urlOpener);

}

- (void)layoutSubviews
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PromotedContentView();
  v2 = v4.receiver;
  -[APPCPromotedContentView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = sub_1B12C0B98();
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x2E0))(v3);

}

- (void)sizeCategoryChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1B1371C68();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371C5C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (APPCPromotedContentView)initWithFrame:(CGRect)a3
{
  APPCPromotedContentView *result;

  result = (APPCPromotedContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)tappedPrivacyMarker:(id)a3
{
  id v4;
  APPCPromotedContentView *v5;

  v4 = a3;
  v5 = self;
  sub_1B130FA54();

}

- (void)newsTransparencyViewControllerDidDismiss:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(id, uint64_t, uint64_t);
  id v9;
  APPCPromotedContentView *v10;

  v5 = (char *)self + OBJC_IVAR___APPCPromotedContentView_interactionDelegate;
  if (MEMORY[0x1B5E1B0F0]((char *)self + OBJC_IVAR___APPCPromotedContentView_interactionDelegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 24);
    v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)tapRecognized:(id)a3
{
  void *v4;
  id v5;
  APPCPromotedContentView *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_tapGestureRecognizer);
  v5 = a3;
  v6 = self;
  v7 = v4;
  sub_1B134C82C((uint64_t)v7);

}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4;
  APPCPromotedContentView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  sub_1B1372D84();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
  v6 = (id)sub_1B1372F70();
  sub_1B1372988();

}

@end
