@implementation IntelligenceUI.RotaryPlaceholderLabel.SegmentView

- (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView)initWithCoder:(id)a3
{
  _TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *result;

  result = (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *)sub_186507E04();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_s22RotaryPlaceholderLabelC11SegmentViewCMa(0);
  v2 = v7.receiver;
  -[UIView didMoveToWindow](&v7, sel_didMoveToWindow);
  v3 = objc_msgSend(v2, sel_layer, v7.receiver, v7.super_class);
  v4 = objc_msgSend(v2, sel_traitCollection);
  objc_msgSend(v4, sel_displayScale);
  v6 = v5;

  objc_msgSend(v3, sel_setContentsScale_, v6);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  CGContext *v7;
  CGContext *v8;
  _TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *v9;
  _TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = self;
  v7 = UIGraphicsGetCurrentContext();
  if (v7)
  {
    v8 = v7;
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    CGContextClearRect(v7, v11);
    objc_msgSend(*(id *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView_fragment), sel_drawAtPoint_inContext_, v8, x, y);

    v9 = (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *)v8;
  }
  else
  {
    v9 = v10;
  }

}

- (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView)initWithFrame:(CGRect)a3
{
  _TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *result;

  result = (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1855C7050((uint64_t)self+ OBJC_IVAR____TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView_segment, _s22RotaryPlaceholderLabelC11TextSegmentVMa);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView_fragment));
}

@end
