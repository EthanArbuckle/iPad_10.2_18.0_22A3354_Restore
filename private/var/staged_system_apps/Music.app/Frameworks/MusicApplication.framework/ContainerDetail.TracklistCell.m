@implementation ContainerDetail.TracklistCell

- (_TtCV16MusicApplication15ContainerDetail13TracklistCell)initWithFrame:(CGRect)a3
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
            + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail13TracklistCell_data) = xmmword_106C820;
  v8.receiver = self;
  v8.super_class = (Class)_s13TracklistCellCMa();
  return -[ContainerDetail.TracklistCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCV16MusicApplication15ContainerDetail13TracklistCell)initWithCoder:(id)a3
{
  id v4;
  _TtCV16MusicApplication15ContainerDetail13TracklistCell *v5;
  objc_super v7;

  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail13TracklistCell_data) = xmmword_106C820;
  v7.receiver = self;
  v7.super_class = (Class)_s13TracklistCellCMa();
  v4 = a3;
  v5 = -[ContainerDetail.TracklistCell initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  sub_2CAEC4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtCV16MusicApplication15ContainerDetail13TracklistCell_data), *(_QWORD *)&self->data[OBJC_IVAR____TtCV16MusicApplication15ContainerDetail13TracklistCell_data]);
}

@end
