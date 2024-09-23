@implementation SocialProfileEditorCell

- (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell *)sub_B1328C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B14AF8();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  _TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell *v15;
  char v16;

  length = a4.length;
  location = a4.location;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v12 = v11;
  v13 = a3;
  v14 = a5;
  v15 = self;
  sub_B13604(v13, location, length, v10, v12);
  LOBYTE(length) = v16;

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell *v2;

  v2 = self;
  sub_B13CF8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell_customTopSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell_customBottomSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell_validationRule));
}

@end
