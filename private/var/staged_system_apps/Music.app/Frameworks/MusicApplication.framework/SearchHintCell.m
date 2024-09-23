@implementation SearchHintCell

- (_TtC16MusicApplication14SearchHintCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication14SearchHintCell *)sub_542498(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication14SearchHintCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplication14SearchHintCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication14SearchHintCell__highlightedText);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___magnifierImageView) = 0;
  v5 = a3;

  result = (_TtC16MusicApplication14SearchHintCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/SearchHintCell.swift", 37, 2, 23, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication14SearchHintCell *v2;

  v2 = self;
  sub_542654();

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication14SearchHintCell *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_54325C(v4);

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication14SearchHintCell *v6;

  v5 = a3;
  v6 = self;
  sub_54292C(a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->_highlightedText[OBJC_IVAR____TtC16MusicApplication14SearchHintCell__highlightedText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication14SearchHintCell____lazy_storage___magnifierImageView));
}

@end
