@implementation TSWPDefaultGraphicalAttachmentRenderer

- (void)drawAttachment:(id)a3 inContext:(CGContext *)a4 selection:(id)a5
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGRect v10;

  objc_msgSend(a3, "size");
  v7 = v6;
  v9 = v8;
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.578999996, 0.702000022, 0.910000026, 1.0), "CGColor"));
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.833999991, 0.883000016, 0.967000008, 1.0), "CGColor"));
  CGContextSetLineWidth(a4, 1.0);
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = v7;
  v10.size.height = v9;
  CGContextFillRect(a4, v10);
}

@end
