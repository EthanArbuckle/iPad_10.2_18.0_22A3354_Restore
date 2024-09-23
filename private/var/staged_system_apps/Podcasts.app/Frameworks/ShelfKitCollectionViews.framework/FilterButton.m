@implementation FilterButton

- (_TtC23ShelfKitCollectionViews12FilterButton)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews12FilterButton *result;

  sub_2183A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews12FilterButton)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews12FilterButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_hoverRecognizer) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_isHovering) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews12FilterButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/FilterButton.swift", 42, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  _TtC23ShelfKitCollectionViews12FilterButton *v2;

  v2 = self;
  sub_2187D0();

}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (void)didHover:(id)a3
{
  id v4;
  char *v5;
  _TtC23ShelfKitCollectionViews12FilterButton *v6;

  v4 = a3;
  v6 = self;
  v5 = (char *)objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 1) <= 3)
    *((_BYTE *)&v6->super.super.super.super.super.isa
    + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_isHovering) = 0x101u >> (8 * ((_BYTE)v5 - 1));
  sub_2187D0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_hoverRecognizer));
}

@end
