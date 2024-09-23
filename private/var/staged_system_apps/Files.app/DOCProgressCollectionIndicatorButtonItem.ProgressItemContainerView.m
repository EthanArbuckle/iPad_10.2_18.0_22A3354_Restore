@implementation DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView

- (_TtCC5Files40DOCProgressCollectionIndicatorButtonItemP33_5AA9AA04A7C2840F7F12009703A5ACCD25ProgressItemContainerView)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC5Files40DOCProgressCollectionIndicatorButtonItemP33_5AA9AA04A7C2840F7F12009703A5ACCD25ProgressItemContainerView_isActivePopoverSource) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView();
  return -[DOCView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (BOOL)isActivePopoverSource
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtCC5Files40DOCProgressCollectionIndicatorButtonItemP33_5AA9AA04A7C2840F7F12009703A5ACCD25ProgressItemContainerView_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC5Files40DOCProgressCollectionIndicatorButtonItemP33_5AA9AA04A7C2840F7F12009703A5ACCD25ProgressItemContainerView_isActivePopoverSource) = a3;
  -[DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView setNeedsLayout](self, "setNeedsLayout");
}

@end
