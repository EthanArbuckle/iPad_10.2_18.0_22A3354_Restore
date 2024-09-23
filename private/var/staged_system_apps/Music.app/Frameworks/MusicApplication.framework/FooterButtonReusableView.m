@implementation FooterButtonReusableView

- (_TtC16MusicApplication24FooterButtonReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24FooterButtonReusableView *)sub_A93C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24FooterButtonReusableView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC16MusicApplication24FooterButtonReusableView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_title);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_selectionHandler);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_buttonAlignment) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView____lazy_storage___button) = 0;
  v6 = a3;

  result = (_TtC16MusicApplication24FooterButtonReusableView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/FooterButtonReusableView.swift", 47, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication24FooterButtonReusableView *v2;

  v2 = self;
  sub_A974C();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_title]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_selectionHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_selectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView____lazy_storage___button));
}

@end
