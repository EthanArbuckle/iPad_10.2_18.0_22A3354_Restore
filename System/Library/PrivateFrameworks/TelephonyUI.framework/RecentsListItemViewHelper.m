@implementation RecentsListItemViewHelper

- (UILabel)titleLabel
{
  return (UILabel *)*(id *)self->titleLabel;
}

- (UILabel)subtitleLabel
{
  return (UILabel *)*(id *)self->subtitleLabel;
}

- (UILabel)extraSubtitleLabel
{
  return (UILabel *)*(id *)self->extraSubtitleLabel;
}

- (UIDateLabel)dateLabel
{
  return (UIDateLabel *)*(id *)self->dateLabel;
}

- (UILabel)occurrenceCountLabel
{
  return (UILabel *)*(id *)self->occurrenceCountLabel;
}

- (void)updateForReducedTransparancy
{
  swift_retain();
  sub_1BCFDFBC8();
  swift_release();
}

- (void)didTapDetailAccessoryButtonWithSender:(id)a3
{
  uint64_t (*v3)(uint64_t);
  id v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;

  v3 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 60);
  v4 = a3;
  v5 = swift_retain();
  v6 = (void (*)(void))v3(v5);
  if (v6)
  {
    v7 = (uint64_t)v6;
    v6();
    sub_1BCFDA32C(v7);
  }

  swift_release();
}

- (void)didTapCallButtonWithSender:(id)a3
{
  uint64_t (*v3)(uint64_t);
  id v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;

  v3 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 63);
  v4 = a3;
  v5 = swift_retain();
  v6 = (void (*)(void))v3(v5);
  if (v6)
  {
    v7 = (uint64_t)v6;
    v6();
    sub_1BCFDA32C(v7);
  }

  swift_release();
}

@end
