@implementation ErrorShieldView

- (_TtC23ShelfKitCollectionViews15ErrorShieldView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews15ErrorShieldView *result;

  sub_229B88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews15ErrorShieldView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC23ShelfKitCollectionViews15ErrorShieldView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_retryHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews15ErrorShieldView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ErrorShieldView.swift", 45, 2, 141, 0);
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  v5 = a3;
  -[ErrorShieldView willMoveToWindow:](&v6, "willMoveToWindow:", v5);
  if (v5)
  {
    ErrorPresenter.update()();

  }
}

- (void)didMoveToWindow
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  -[ErrorShieldView didMoveToWindow](&v2, "didMoveToWindow");
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[ErrorShieldView layoutSubviews](&v3, "layoutSubviews");
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_errorView], "setFrame:");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_errorView));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_retryHandler), *(_QWORD *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ErrorShieldView_retryHandler]);
}

@end
