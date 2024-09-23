@implementation WFSheetView

- (_TtC14WorkflowEditor11WFSheetView)init
{
  sub_2267BEFF8();
}

- (_TtC14WorkflowEditor11WFSheetView)initWithFrame:(CGRect)a3
{
  sub_2267BF050();
}

- (_TtC14WorkflowEditor11WFSheetView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2267BF240();
}

- (void)layoutSubviews
{
  _TtC14WorkflowEditor11WFSheetView *v2;

  v2 = self;
  sub_2267BF434();

}

- (void)handleDimmingLayerTap
{
  _TtC14WorkflowEditor11WFSheetView *v2;

  v2 = self;
  sub_2267BF880();

}

- (void)handlePanGestureWithRecognizer:(id)a3
{
  id v4;
  _TtC14WorkflowEditor11WFSheetView *v5;

  v4 = a3;
  v5 = self;
  sub_2267BF8E0(v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC14WorkflowEditor11WFSheetView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_2267C2130((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_226674E94((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_delegate, &qword_25587D2E0);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_contentView);
  sub_226674E94((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_contentProvider, &qword_25587D318);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_scrollView);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_translationView);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_backdropView);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_gradientLayer);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_borderView);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_grabberView);
  sub_22666DCBC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14WorkflowEditor11WFSheetView_pendingLayoutWork));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIGestureRecognizer *v6;
  id v7;
  _TtC14WorkflowEditor11WFSheetView *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = a4;
  v8 = self;
  v9 = WFSheetView.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

@end
