@implementation ContainerDetail.HeaderCell

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)_s10HeaderCellCMa();
  -[ContainerDetail.HeaderCell bounds](&v6, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  void (*v8)(char *, __n128);
  uint64_t v9;
  __n128 v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_s10HeaderCellCMa();
  v7 = (char *)v11.receiver;
  -[ContainerDetail.HeaderCell setBounds:](&v11, "setBounds:", x, y, width, height);
  v8 = *(void (**)(char *, __n128))&v7[OBJC_IVAR____TtCV16MusicApplication15ContainerDetail10HeaderCell_didSetBoundsBlock];
  if (v8)
  {
    v9 = *(_QWORD *)&v7[OBJC_IVAR____TtCV16MusicApplication15ContainerDetail10HeaderCell_didSetBoundsBlock + 8];
    v10 = swift_retain(v9);
    v8(v7, v10);
    sub_5C198((uint64_t)v8, v9);
  }

}

- (_TtCV16MusicApplication15ContainerDetail10HeaderCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail10HeaderCell_didSetBoundsBlock);
  v9 = (objc_class *)_s10HeaderCellCMa();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[ContainerDetail.HeaderCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCV16MusicApplication15ContainerDetail10HeaderCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCV16MusicApplication15ContainerDetail10HeaderCell *v6;
  objc_super v8;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCV16MusicApplication15ContainerDetail10HeaderCell_didSetBoundsBlock);
  *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s10HeaderCellCMa();
  v5 = a3;
  v6 = -[ContainerDetail.HeaderCell initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCV16MusicApplication15ContainerDetail10HeaderCell_didSetBoundsBlock), *(_QWORD *)&self->didSetBoundsBlock[OBJC_IVAR____TtCV16MusicApplication15ContainerDetail10HeaderCell_didSetBoundsBlock]);
}

@end
