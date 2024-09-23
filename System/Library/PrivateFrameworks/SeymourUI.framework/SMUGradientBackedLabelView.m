@implementation SMUGradientBackedLabelView

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___SMUGradientBackedLabelView_label));
}

- (SMUGradientBackedLabelView)initWithFrame:(CGRect)a3
{
  return (SMUGradientBackedLabelView *)sub_22B487670(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  SMUGradientBackedLabelView *v2;

  v2 = self;
  sub_22B4880D0();

}

- (SMUGradientBackedLabelView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B489D90();
}

- (void).cxx_destruct
{

}

@end
