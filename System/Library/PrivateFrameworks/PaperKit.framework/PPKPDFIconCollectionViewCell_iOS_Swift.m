@implementation PPKPDFIconCollectionViewCell_iOS_Swift

- (void)prepareForReuse
{
  PPKPDFIconCollectionViewCell_iOS_Swift *v2;

  v2 = self;
  PPKPDFIconCollectionViewCell_iOS_Swift.prepareForReuse()();

}

- (PPKPDFIconCollectionViewCell_iOS_Swift)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___PPKPDFIconCollectionViewCell_iOS_Swift_imageFetch) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PPKPDFIconCollectionViewCell_iOS_Swift();
  return -[PPKPDFIconCollectionViewCell_iOS initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (PPKPDFIconCollectionViewCell_iOS_Swift)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___PPKPDFIconCollectionViewCell_iOS_Swift_imageFetch) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PPKPDFIconCollectionViewCell_iOS_Swift();
  return -[PPKPDFIconCollectionViewCell_iOS initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
