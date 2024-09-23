@implementation DOCInlineRenameOverlayView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC5Files26DOCInlineRenameOverlayView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = DOCInlineRenameOverlayView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5Files26DOCInlineRenameOverlayView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Files26DOCInlineRenameOverlayView_itemCell);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCInlineRenameOverlayView();
  return -[DOCInlineRenameOverlayView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC5Files26DOCInlineRenameOverlayView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Files26DOCInlineRenameOverlayView_itemCell);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCInlineRenameOverlayView();
  return -[DOCInlineRenameOverlayView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files26DOCInlineRenameOverlayView_itemCell);
}

@end
