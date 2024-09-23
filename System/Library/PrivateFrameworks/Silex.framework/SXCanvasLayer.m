@implementation SXCanvasLayer

- (void)layoutSublayers
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)objc_msgSend((id)-[SXCanvasLayer superclass](self, "superclass"), "superclass");
  objc_msgSendSuper(&v5, a2);
  v4.receiver = self;
  v4.super_class = (Class)SXCanvasLayer;
  -[TSDCanvasLayer layoutSublayers](&v4, sel_layoutSublayers);
}

@end
