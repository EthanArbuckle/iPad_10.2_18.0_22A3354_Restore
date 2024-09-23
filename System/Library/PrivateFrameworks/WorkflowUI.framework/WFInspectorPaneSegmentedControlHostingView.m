@implementation WFInspectorPaneSegmentedControlHostingView

- (WFInspectorPaneSegmentedControlHostingView)initWithDelegate:(id)a3 showsDetailsButton:(BOOL)a4
{
  swift_unknownObjectRetain();
  return (WFInspectorPaneSegmentedControlHostingView *)sub_220220B08((uint64_t)a3, a4);
}

- (WFInspectorPaneSegmentedControlHostingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220220BF8();
}

- (WFInspectorPaneSegmentedControlHostingView)initWithFrame:(CGRect)a3
{
  sub_220220F58();
}

- (void).cxx_destruct
{
  sub_2200A0118((uint64_t)self + OBJC_IVAR___WFInspectorPaneSegmentedControlHostingView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFInspectorPaneSegmentedControlHostingView_segmentedControl));
}

@end
