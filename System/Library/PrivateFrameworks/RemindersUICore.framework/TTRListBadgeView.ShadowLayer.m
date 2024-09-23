@implementation TTRListBadgeView.ShadowLayer

- (void)layoutSublayers
{
  id v2;
  CGPathRef v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  v2 = v4.receiver;
  -[TTRListBadgeView.ShadowLayer layoutSublayers](&v4, sel_layoutSublayers);
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  v3 = CGPathCreateWithEllipseInRect(v5, 0);
  objc_msgSend(v2, sel_setShadowPath_, v3);

}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  return -[TTRNoDefaultImplicitActionLayer init](&v3, sel_init);
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)initWithLayer:(id)a3
{
  uint64_t v4;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer *v5;
  objc_super v7;
  _QWORD v8[4];

  swift_unknownObjectRetain();
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v4 = sub_1B4908378();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  v5 = -[TTRNoDefaultImplicitActionLayer initWithLayer:](&v7, sel_initWithLayer_, v4);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  return -[TTRNoDefaultImplicitActionLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
