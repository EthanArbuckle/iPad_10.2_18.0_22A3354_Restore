@implementation RoundHeaderButton

- (_TtC23ShelfKitCollectionViews17RoundHeaderButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17RoundHeaderButton *)sub_E6C48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unsigned)viewForLastBaselineLayout
{
  int v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;

  v1 = a1[OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_usesBoundsForBaselineGuide];
  v2 = a1;
  if (v1 == 1)
  {
    v3 = (unsigned __int8 *)sub_E6F90();

    v2 = v3;
  }
  return v2;
}

- (_TtC23ShelfKitCollectionViews17RoundHeaderButton)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews17RoundHeaderButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_progressView) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_usesBoundsForBaselineGuide) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton____lazy_storage___layoutView) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews17RoundHeaderButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/RoundHeaderButton.swift", 47, 2, 76, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17RoundHeaderButton____lazy_storage___layoutView));
}

@end
