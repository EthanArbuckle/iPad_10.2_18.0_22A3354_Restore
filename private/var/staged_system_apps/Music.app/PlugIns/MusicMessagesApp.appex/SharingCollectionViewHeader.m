@implementation SharingCollectionViewHeader

- (_TtC16MusicMessagesApp27SharingCollectionViewHeader)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp27SharingCollectionViewHeader *)sub_100021DF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp27SharingCollectionViewHeader)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicMessagesApp27SharingCollectionViewHeader *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader_layoutInvalidationHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC16MusicMessagesApp27SharingCollectionViewHeader *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003A4070, "MusicMessagesApp/SharingCollectionViewHeader.swift", 50, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *v3;
  _TtC16MusicMessagesApp27SharingCollectionViewHeader *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SharingCollectionViewHeader();
  -[SharingCollectionViewHeader dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader__label));
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader_layoutInvalidationHandler), *(_QWORD *)&self->_label[OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader_layoutInvalidationHandler]);
}

- (void)prepareForReuse
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharingCollectionViewHeader();
  v2 = (char *)v3.receiver;
  -[SharingCollectionViewHeader prepareForReuse](&v3, "prepareForReuse");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader__label], "sizeToFit", v3.receiver, v3.super_class);
  objc_msgSend(v2, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicMessagesApp27SharingCollectionViewHeader *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_100022294(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicMessagesApp27SharingCollectionViewHeader *v2;

  v2 = self;
  sub_100022414();

}

- (UILabel)accessibilityShareRecentlyPlayedLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicMessagesApp27SharingCollectionViewHeader__label));
}

@end
