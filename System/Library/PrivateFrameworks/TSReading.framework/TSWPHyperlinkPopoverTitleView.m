@implementation TSWPHyperlinkPopoverTitleView

- (TSWPHyperlinkPopoverTitleView)initWithFrame:(CGRect)a3 titleString:(id)a4
{
  TSWPHyperlinkPopoverTitleView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPHyperlinkPopoverTitleView;
  v5 = -[TSWPHyperlinkPopoverTitleView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    -[TSWPHyperlinkPopoverTitleView setTitleString:](v5, "setTitleString:", objc_msgSend(a4, "stringByRemovingPercentEncoding"));
    -[TSWPHyperlinkPopoverTitleView setOpaque:](v5, "setOpaque:", 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkPopoverTitleView;
  -[TSWPHyperlinkPopoverTitleView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double i;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  NSString *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[TSWPHyperlinkPopoverTitleView bounds](self, "bounds");
  CGContextClearRect(CurrentContext, v26);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "CGColor"));
  for (i = 18.0; ; i = i + -1.0)
  {
    v6 = objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", i);
    -[NSString sizeWithFont:](-[TSWPHyperlinkPopoverTitleView titleString](self, "titleString"), "sizeWithFont:", v6);
    v8 = v7;
    -[TSWPHyperlinkPopoverTitleView bounds](self, "bounds");
    if (i == 12.0 || v8 < v9)
      break;
  }
  v11 = -[TSWPHyperlinkPopoverTitleView titleString](self, "titleString");
  -[TSWPHyperlinkPopoverTitleView bounds](self, "bounds");
  -[NSString sizeWithFont:constrainedToSize:lineBreakMode:](v11, "sizeWithFont:constrainedToSize:lineBreakMode:", v6, 5, v12, v13);
  v15 = v14;
  v17 = v16;
  -[TSWPHyperlinkPopoverTitleView bounds](self, "bounds");
  v19 = v18 - v17;
  -[TSWPHyperlinkPopoverTitleView bounds](self, "bounds");
  v21 = v20 - v15;
  -[TSWPHyperlinkPopoverTitleView bounds](self, "bounds");
  -[NSString drawInRect:withFont:lineBreakMode:alignment:](-[TSWPHyperlinkPopoverTitleView titleString](self, "titleString"), "drawInRect:withFont:lineBreakMode:alignment:", v6, 5, 1, v24 + v21 * 0.5, v22 + v19 * 0.5, v25 - v21, v23 - v19);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

@end
