@implementation TTRNoAnimationContainerGridView

- (void)layoutSubviews
{
  _TtC15RemindersUICore31TTRNoAnimationContainerGridView *v2;

  v2 = self;
  TTRNoAnimationContainerGridView.layoutSubviews()();

}

- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore31TTRNoAnimationContainerGridView *)sub_1B44CAB24(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TTRNoAnimationContainerGridView);
}

- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithArrangedSubviewRows:(id)a3
{
  void *v3;
  _TtC15RemindersUICore31TTRNoAnimationContainerGridView *v5;
  objc_super v7;

  v3 = a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4E55A0);
    sub_1B4906DAC();
    v3 = (void *)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRNoAnimationContainerGridView();
  v5 = -[NUIContainerGridView initWithArrangedSubviewRows:](&v7, sel_initWithArrangedSubviewRows_, v3);

  return v5;
}

- (_TtC15RemindersUICore31TTRNoAnimationContainerGridView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore31TTRNoAnimationContainerGridView *)sub_1B42FB42C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for TTRNoAnimationContainerGridView);
}

@end
