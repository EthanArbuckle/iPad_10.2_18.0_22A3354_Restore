@implementation ContainerDetail.TracklistCell

- (_TtCV5Music15ContainerDetail13TracklistCell)initWithFrame:(CGRect)a3
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
  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtCV5Music15ContainerDetail13TracklistCell_data) = xmmword_100ECA930;
  v8.receiver = self;
  v8.super_class = (Class)_s13TracklistCellCMa();
  return -[ContainerDetail.TracklistCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCV5Music15ContainerDetail13TracklistCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtCV5Music15ContainerDetail13TracklistCell_data) = xmmword_100ECA930;
  v5.receiver = self;
  v5.super_class = (Class)_s13TracklistCellCMa();
  return -[ContainerDetail.TracklistCell initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1004C8A20(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtCV5Music15ContainerDetail13TracklistCell_data), *(_QWORD *)&self->data[OBJC_IVAR____TtCV5Music15ContainerDetail13TracklistCell_data]);
}

@end
