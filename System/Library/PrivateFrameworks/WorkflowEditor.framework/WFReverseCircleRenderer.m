@implementation WFReverseCircleRenderer

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGRect v16;
  CGRect v17;

  -[MKOverlayRenderer rectForMapRect:](self, "rectForMapRect:", *MEMORY[0x24BDDAFF0], *(double *)(MEMORY[0x24BDDAFF0] + 8), *(double *)(MEMORY[0x24BDDAFF0] + 16), *(double *)(MEMORY[0x24BDDAFF0] + 24));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  CGContextSaveGState(a4);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  CGContextAddRect(a4, v16);
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  -[MKOverlayPathRenderer fillColor](self, "fillColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v15, "CGColor"));

  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  CGContextFillRect(a4, v17);
  CGContextRestoreGState(a4);
}

@end
