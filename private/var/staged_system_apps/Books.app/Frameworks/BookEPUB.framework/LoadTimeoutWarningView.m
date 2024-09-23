@implementation LoadTimeoutWarningView

- (void)layoutSubviews
{
  _TtC8BookEPUB22LoadTimeoutWarningView *v2;

  v2 = self;
  sub_4FA5C();

}

- (_TtC8BookEPUB22LoadTimeoutWarningView)initWithCoder:(id)a3
{
  _TtC8BookEPUB22LoadTimeoutWarningView *result;

  result = (_TtC8BookEPUB22LoadTimeoutWarningView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000002C69C0, "BookEPUB/ContentLoaderPlaceholderView.swift", 43, 2, 84, 0);
  __break(1u);
  return result;
}

- (void)buttonAction
{
  void (*v2)(void);
  _TtC8BookEPUB22LoadTimeoutWarningView *v3;

  v2 = *(void (**)(void))((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookEPUB22LoadTimeoutWarningView_action);
  v3 = self;
  v2();

}

- (_TtC8BookEPUB22LoadTimeoutWarningView)initWithFrame:(CGRect)a3
{
  sub_517C8((uint64_t)self, (uint64_t)a2, (uint64_t)"BookEPUB.LoadTimeoutWarningView", 31);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB22LoadTimeoutWarningView_labelHeightConstraint));
  swift_release(*(_QWORD *)&self->label[OBJC_IVAR____TtC8BookEPUB22LoadTimeoutWarningView_action]);
}

@end
