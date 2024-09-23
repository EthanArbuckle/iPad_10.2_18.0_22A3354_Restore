@implementation RAPPhotoCarouselCollectionViewCell

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;

  v7 = type metadata accessor for RAPPhotoCarouselCollectionViewCell();
  v2 = sub_100008B04(&qword_1014A0A90);
  String.init<A>(describing:)(&v7, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (UGCPhotoCarouselCell)photoCarouselCell
{
  return (UGCPhotoCarouselCell *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super
                                                                         + OBJC_IVAR____TtC4Maps34RAPPhotoCarouselCollectionViewCell_photoCarouselCell));
}

- (UGCPhotoCarouselController)carouselController
{
  return (UGCPhotoCarouselController *)objc_msgSend(*(id *)((char *)&self->super+ OBJC_IVAR____TtC4Maps34RAPPhotoCarouselCollectionViewCell_photoCarouselCell), "carouselController");
}

- (void)setCarouselController:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super + OBJC_IVAR____TtC4Maps34RAPPhotoCarouselCollectionViewCell_photoCarouselCell), "setCarouselController:", a3);
}

- (_TtC4Maps34RAPPhotoCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps34RAPPhotoCarouselCollectionViewCell *)sub_10020446C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps34RAPPhotoCarouselCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC4Maps34RAPPhotoCarouselCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC4Maps34RAPPhotoCarouselCollectionViewCell_photoCarouselCell;
  v6 = objc_allocWithZone((Class)UGCPhotoCarouselCell);
  v7 = a3;
  *(MapsThemeCollectionViewListCell *)((char *)&self->super + v5) = (MapsThemeCollectionViewListCell)objc_msgSend(v6, "init");

  result = (_TtC4Maps34RAPPhotoCarouselCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/RAPPhotoCarouselCollectionViewCell.swift", 45, 2, 31, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
