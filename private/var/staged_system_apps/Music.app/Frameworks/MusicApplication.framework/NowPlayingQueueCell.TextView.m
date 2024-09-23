@implementation NowPlayingQueueCell.TextView

- (void)layoutSubviews
{
  char *v2;
  void (*v3)(__n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingQueueCell.TextView();
  v2 = (char *)v6.receiver;
  -[NowPlayingQueueCell.TextView layoutSubviews](&v6, "layoutSubviews");
  v3 = *(void (**)(__n128))&v2[OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCell8TextView_didLayoutSubviews];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCell8TextView_didLayoutSubviews + 8];
    v5 = swift_retain(v4);
    v3(v5);
    sub_5C198((uint64_t)v3, v4);
  }

}

- (_TtCC16MusicApplication19NowPlayingQueueCell8TextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v10;
  objc_class *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCell8TextView_didLayoutSubviews);
  v11 = (objc_class *)type metadata accessor for NowPlayingQueueCell.TextView();
  *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[NowPlayingQueueCell.TextView initWithFrame:textContainer:](&v13, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtCC16MusicApplication19NowPlayingQueueCell8TextView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCC16MusicApplication19NowPlayingQueueCell8TextView *v6;
  objc_super v8;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCell8TextView_didLayoutSubviews);
  *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NowPlayingQueueCell.TextView();
  v5 = a3;
  v6 = -[NowPlayingQueueCell.TextView initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCell8TextView_didLayoutSubviews), *(_QWORD *)&self->didLayoutSubviews[OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCell8TextView_didLayoutSubviews]);
}

@end
