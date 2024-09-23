@implementation VideoControlButton

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VideoControlButton();
  return -[VideoControlButton isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoControlButton();
  v4 = v5.receiver;
  -[VideoControlButton setSelected:](&v5, "setSelected:", v3);
  sub_2A4728();

}

- (_TtC23ShelfKitCollectionViews18VideoControlButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC23ShelfKitCollectionViews18VideoControlButton *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectedGlyph) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectedType) = 7;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectionHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews18VideoControlButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/VideoControlButton.swift", 48, 2, 155, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews18VideoControlButton *v2;

  v2 = self;
  sub_2A5088();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC23ShelfKitCollectionViews18VideoControlButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_2A57E8();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)wasTapped
{
  _TtC23ShelfKitCollectionViews18VideoControlButton *v2;

  v2 = self;
  -[VideoControlButton setSelected:](v2, "setSelected:", -[VideoControlButton isSelected](v2, "isSelected") ^ 1);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC23ShelfKitCollectionViews18VideoControlButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[VideoControlButton bounds](v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (qword_3CFD00 != -1)
    swift_once(&qword_3CFD00, sub_2A411C);
  v20.origin.x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, *(double *)&xmmword_3E0460, *((double *)&xmmword_3E0460 + 1));
  v19.x = x;
  v19.y = y;
  v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (_TtC23ShelfKitCollectionViews18VideoControlButton)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews18VideoControlButton *result;

  result = (_TtC23ShelfKitCollectionViews18VideoControlButton *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.VideoControlButton", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_backdrop));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_glyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectedGlyph));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectionHandler), *(_QWORD *)&self->backdrop[OBJC_IVAR____TtC23ShelfKitCollectionViews18VideoControlButton_selectionHandler]);
}

@end
