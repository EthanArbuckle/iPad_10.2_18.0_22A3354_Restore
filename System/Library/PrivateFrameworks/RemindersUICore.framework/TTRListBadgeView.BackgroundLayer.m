@implementation TTRListBadgeView.BackgroundLayer

- (float)opacity
{
  uint64_t v3;
  void *v4;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer *v5;
  float v6;
  float v7;

  v3 = MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_fillLayer, a2);
  if (!v3)
    return 1.0;
  v4 = (void *)v3;
  v5 = self;
  objc_msgSend(v4, sel_opacity);
  v7 = v6;

  return v7;
}

- (void)setOpacity:(float)a3
{
  uint64_t v5;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer *v6;
  double v7;
  id v8;

  v5 = MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_fillLayer, a2);
  if (v5)
  {
    v8 = (id)v5;
    v6 = self;
    *(float *)&v7 = a3;
    objc_msgSend(v8, sel_setOpacity_, v7);

  }
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)init
{
  return (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer *)sub_1B4861134();
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B4864A28();
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  return (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer *)sub_1B4861364(v4);
}

- (void)layoutSublayers
{
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer *v2;

  v2 = self;
  sub_1B48614EC();

}

- (void).cxx_destruct
{
  sub_1B4862C3C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(void **)((char *)&self->super.super._attr.refcount+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(uint64_t *)((char *)&self->super.super._attr.layer+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(void **)((char *)&self->super.super._attr._objc_observation_info+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(void **)&self->shape[OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings]);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
