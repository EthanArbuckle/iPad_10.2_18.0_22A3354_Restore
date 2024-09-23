@implementation TPKTipContentAnnotationBubbleView

- (TPKTipContentAnnotationBubbleView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowDirection) = (Class)-1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowPinning) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___TPKTipContentAnnotationBubbleView____lazy_storage___maskLayer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TPKTipContentAnnotationBubbleView();
  return -[TPKTipContentAnnotationBubbleView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (TPKTipContentAnnotationBubbleView)initWithCoder:(id)a3
{
  return (TPKTipContentAnnotationBubbleView *)sub_248A92238(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TPKTipContentAnnotationBubbleView____lazy_storage___maskLayer));
}

@end
