@implementation NowPlayingLyricsCell

- (void)layoutSubviews
{
  _TtC12NowPlayingUI20NowPlayingLyricsCell *v2;

  v2 = self;
  sub_972A4();

}

- (_TtC12NowPlayingUI20NowPlayingLyricsCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_isBottomHairlineVisible) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_bottomHairlineView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_lyricsView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_tableViewCell) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[NowPlayingLyricsCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI20NowPlayingLyricsCell)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI20NowPlayingLyricsCell *)sub_975B4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_lyricsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_tableViewCell));
}

@end
