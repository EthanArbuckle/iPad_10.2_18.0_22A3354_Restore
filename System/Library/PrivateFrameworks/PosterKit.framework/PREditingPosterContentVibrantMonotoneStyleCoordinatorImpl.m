@implementation PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl

void __99___PREditingPosterContentVibrantMonotoneStyleCoordinatorImpl_transparancyBackgroundImageForHeight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  CGContext *v5;
  void *v6;
  CGContext *v7;
  CGRect v8;
  CGRect v9;

  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  v8.size.width = *(CGFloat *)(a1 + 32);
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.height = v8.size.width;
  CGContextAddRect(v4, v8);
  v5 = (CGContext *)objc_msgSend(v3, "CGContext");
  v9.origin.x = *(CGFloat *)(a1 + 32);
  v9.origin.y = v9.origin.x;
  v9.size.width = v9.origin.x;
  v9.size.height = v9.origin.x;
  CGContextAddRect(v5, v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.851, 0.847, 0.855, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFill");

  v7 = (CGContext *)objc_msgSend(v3, "CGContext");
  CGContextFillPath(v7);
}

@end
