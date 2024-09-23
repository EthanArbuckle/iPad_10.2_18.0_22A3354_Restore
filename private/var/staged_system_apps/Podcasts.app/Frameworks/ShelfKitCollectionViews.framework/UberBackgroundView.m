@implementation UberBackgroundView

- (_TtC23ShelfKitCollectionViews18UberBackgroundView)initWithFrame:(CGRect)a3
{
  return -[UberBackgroundView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[UberBackgroundView layoutSubviews](&v3, "layoutSubviews");
  objc_msgSend(v2, "bringSubviewToFront:", *(_QWORD *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_gradientOverlayView], v3.receiver, v3.super_class);
  objc_msgSend(v2, "bringSubviewToFront:", *(_QWORD *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_navGradientView]);

}

- (_TtC23ShelfKitCollectionViews18UberBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews18UberBackgroundView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_backgroundImageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_offset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_zoomFactor) = (Class)0x3FF0000000000000;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews18UberBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/UberBackgroundView.swift", 48, 2, 130, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_gradientOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18UberBackgroundView_navGradientView));
}

@end
