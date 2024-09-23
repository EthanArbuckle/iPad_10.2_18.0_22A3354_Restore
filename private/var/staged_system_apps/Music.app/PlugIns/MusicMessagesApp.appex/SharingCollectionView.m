@implementation SharingCollectionView

- (_TtC16MusicMessagesApp21SharingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _TtC16MusicMessagesApp21SharingCollectionView *v10;
  id v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SharingCollectionView();
  v9 = a4;
  v10 = -[SharingCollectionView initWithFrame:collectionViewLayout:](&v13, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
  -[SharingCollectionView setDelaysContentTouches:](v10, "setDelaysContentTouches:", 0, v13.receiver, v13.super_class);
  if (qword_1004B6E58 != -1)
    swift_once(&qword_1004B6E58, sub_10001BBF8);
  v11 = (id)qword_1004F4570;
  -[SharingCollectionView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  return v10;
}

- (_TtC16MusicMessagesApp21SharingCollectionView)initWithCoder:(id)a3
{
  _TtC16MusicMessagesApp21SharingCollectionView *result;

  result = (_TtC16MusicMessagesApp21SharingCollectionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003A4070, "MusicMessagesApp/SharingCollectionView.swift", 44, 2, 29, 0);
  __break(1u);
  return result;
}

@end
