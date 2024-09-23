@implementation ButtonContainingCollectionReusableView

- (_TtC16MusicApplication38ButtonContainingCollectionReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication38ButtonContainingCollectionReusableView *)sub_861C34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication38ButtonContainingCollectionReusableView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _TtC16MusicApplication38ButtonContainingCollectionReusableView *result;

  v5 = OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_textDrawingCache;
  v6 = type metadata accessor for TextDrawing.Cache();
  swift_allocObject(v6, 120, 7);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_buttonTitle);
  *v8 = 0;
  v8[1] = 0xE000000000000000;
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_buttonSelectionHandler);
  *v9 = 0;
  v9[1] = 0;

  result = (_TtC16MusicApplication38ButtonContainingCollectionReusableView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ButtonContainingCollectionReusableView.swift", 61, 2, 30, 0);
  __break(1u);
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication38ButtonContainingCollectionReusableView *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_862960(v4);

  return v6;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication38ButtonContainingCollectionReusableView *v2;

  v2 = self;
  sub_862070();

}

- (void)tintColorDidChange
{
  char *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ButtonContainingCollectionReusableView();
  v2 = (char *)v7.receiver;
  -[ButtonContainingCollectionReusableView tintColorDidChange](&v7, "tintColorDidChange");
  v3 = objc_msgSend(v2, "tintColor", v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_button];
    objc_msgSend(v5, "setTitleColor:forState:", v3, 0);
    v6 = objc_msgSend(v4, "colorWithAlphaComponent:", 0.2);
    objc_msgSend(v5, "setTitleColor:forState:", v6, 1);

  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_textDrawingCache));
  swift_bridgeObjectRelease();
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_buttonSelectionHandler), *(_QWORD *)&self->textDrawingCache[OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_buttonSelectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_button));
}

@end
