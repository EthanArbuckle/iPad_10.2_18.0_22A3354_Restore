@implementation ArtistListViewController.Cell

- (_TtCC16MusicApplication24ArtistListViewController4Cell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ArtistListViewController.Cell();
  return -[ArtistListViewController.Cell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC16MusicApplication24ArtistListViewController4Cell)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication24ArtistListViewController4Cell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArtistListViewController.Cell();
  v4 = a3;
  v5 = -[ArtistListViewController.Cell initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
