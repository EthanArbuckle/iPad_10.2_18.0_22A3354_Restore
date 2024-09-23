@implementation CollectionViewSection.SectionHeaderView

- (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView *)sub_22A944(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _QWORD *v6;
  _TtCV16MusicApplication21CollectionViewSection17SectionHeaderView *result;

  v4 = (char *)self + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView_contentConfiguration;
  v5 = a3;
  sub_22A664((uint64_t)v4);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView_artworkCachingReference) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView____lazy_storage___contentView);
  *v6 = 0;
  v6[1] = 0;

  result = (_TtCV16MusicApplication21CollectionViewSection17SectionHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/CollectionViewSection.swift", 44, 2, 310, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  _QWORD *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[CollectionViewSection.SectionHeaderView layoutSubviews](&v4, "layoutSubviews");
  v3 = sub_22AA28();
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtCV16MusicApplication21CollectionViewSection17SectionHeaderView *v5;
  _QWORD *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_22AA28();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtCV16MusicApplication21CollectionViewSection17SectionHeaderView *v2;
  _QWORD *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = self;
  v3 = sub_22AA28();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_230794((uint64_t)self + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView_contentConfiguration);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCV16MusicApplication21CollectionViewSection17SectionHeaderView____lazy_storage___contentView));
}

@end
