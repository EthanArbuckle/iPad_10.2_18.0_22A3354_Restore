@implementation TTRListBadgeView.SelectionLayer

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)init
{
  char *v2;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer *v3;
  objc_super v5;

  v2 = (char *)self
     + OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer_shape;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 0;
  v2[40] = 2;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRListBadgeView.SelectionLayer();
  v3 = -[TTRNoDefaultImplicitActionLayer init](&v5, sel_init);
  -[TTRListBadgeView.SelectionLayer setBackgroundColor:](v3, sel_setBackgroundColor_, 0);
  return v3;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)initWithLayer:(id)a3
{
  char *v4;
  uint64_t v5;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer *v6;
  objc_super v8;
  _QWORD v9[4];

  swift_unknownObjectRetain();
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  v4 = (char *)self
     + OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer_shape;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v4[40] = 2;
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v5 = sub_1B4908378();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRListBadgeView.SelectionLayer();
  v6 = -[TTRNoDefaultImplicitActionLayer initWithLayer:](&v8, sel_initWithLayer_, v5);
  swift_unknownObjectRelease();
  -[TTRListBadgeView.SelectionLayer setBackgroundColor:](v6, sel_setBackgroundColor_, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer *result;

  v4 = (char *)self
     + OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer_shape;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v4[40] = 2;
  v5 = a3;

  result = (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A414SelectionLayer *)sub_1B4908144();
  __break(1u);
  return result;
}

@end
