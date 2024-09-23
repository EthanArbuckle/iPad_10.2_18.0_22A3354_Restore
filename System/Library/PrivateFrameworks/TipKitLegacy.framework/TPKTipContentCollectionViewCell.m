@implementation TPKTipContentCollectionViewCell

- (TPKContentView)tipView
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView);
  swift_beginAccess();
  return (TPKContentView *)*v2;
}

- (void)setTipView:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (TPKContentView)tipContentView
{
  TPKTipContentCollectionViewCell *v2;
  id v3;

  v2 = self;
  v3 = sub_248A78D4C();

  return (TPKContentView *)v3;
}

- (void)prepareForReuse
{
  char *v2;
  id *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPKTipContentCollectionViewCell();
  v2 = (char *)v5.receiver;
  -[TPKTipContentCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  v3 = (id *)&v2[OBJC_IVAR___TPKTipContentCollectionViewCell_tipView];
  swift_beginAccess();
  if (*v3)
  {
    objc_msgSend(*v3, sel_removeFromSuperview);
    v4 = *v3;
  }
  else
  {
    v4 = 0;
  }
  *v3 = 0;

}

- (void)setContent:(id)a3 contentController:(id)a4
{
  id v6;
  id v7;
  TPKTipContentCollectionViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_248A78EF0(v6, v7);

}

- (TPKTipContentCollectionViewCell)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TPKTipContentCollectionViewCell();
  return -[TPKTipContentCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (TPKTipContentCollectionViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPKTipContentCollectionViewCell();
  return -[TPKTipContentCollectionViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView));
}

@end
