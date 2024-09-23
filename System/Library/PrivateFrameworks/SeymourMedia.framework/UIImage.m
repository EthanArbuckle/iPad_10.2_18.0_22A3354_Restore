@implementation UIImage

uint64_t __54__UIImage_SeymourMedia__imageWithSize_format_actions___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__UIImage_SeymourMedia__compositedImageWithSize_images_cornerRadius_blendMode_legacyMode___block_invoke(uint64_t a1, CGContextRef c)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double MinX;
  double MinY;
  double MaxX;
  double v11;
  double MaxY;
  id v13;
  double x;
  double y;
  double width;
  double height;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  CGImage *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGBlendMode v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect ClipBoundingBox;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v40 = *MEMORY[0x24BDAC8D0];
  if (*(double *)(a1 + 40) > 0.0)
  {
    v4 = *MEMORY[0x24BDBEFB0];
    v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v6 = *(double *)(a1 + 48);
    v7 = *(double *)(a1 + 56);
    v41.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
    v41.origin.y = v5;
    v41.size.width = v6;
    v41.size.height = v7;
    MinX = CGRectGetMinX(v41);
    v42.origin.x = v4;
    v42.origin.y = v5;
    v42.size.width = v6;
    v42.size.height = v7;
    MinY = CGRectGetMinY(v42);
    v43.origin.x = v4;
    v43.origin.y = v5;
    v43.size.width = v6;
    v43.size.height = v7;
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = v4;
    v44.origin.y = v5;
    v44.size.width = v6;
    v44.size.height = v7;
    v11 = MaxX - CGRectGetMinX(v44);
    v45.origin.x = v4;
    v45.origin.y = v5;
    v45.size.width = v6;
    v45.size.height = v7;
    MaxY = CGRectGetMaxY(v45);
    v46.origin.x = v4;
    v46.origin.y = v5;
    v46.size.width = v6;
    v46.size.height = v7;
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", MinX, MinY, v11, MaxY - CGRectGetMinY(v46), *(double *)(a1 + 40));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextAddPath(c, (CGPathRef)objc_msgSend(v13, "CGPath"));
    CGContextClip(c);

  }
  ClipBoundingBox = CGContextGetClipBoundingBox(c);
  x = ClipBoundingBox.origin.x;
  y = ClipBoundingBox.origin.y;
  width = ClipBoundingBox.size.width;
  height = ClipBoundingBox.size.height;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = *(id *)(a1 + 32);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i)), "CGImage");
        v24 = (double)CGImageGetWidth(v23);
        v25 = (double)CGImageGetHeight(v23);
        v26 = *(double *)(a1 + 48) / v24;
        v27 = *(double *)(a1 + 56) / v25;
        memset(&v34.c, 0, 32);
        if (v26 < v27)
          v26 = v27;
        *(_OWORD *)&v34.a = 0uLL;
        CGAffineTransformMakeScale(&v34, v26, v26);
        v33 = v34;
        v48.origin.x = 0.0;
        v48.origin.y = 0.0;
        v48.size.width = v24;
        v48.size.height = v25;
        v49 = CGRectApplyAffineTransform(v48, &v33);
        v28 = v49.origin.x;
        v29 = v49.origin.y;
        v30 = v49.size.width;
        v31 = v49.size.height;
        CGContextSaveGState(c);
        v32 = *(_DWORD *)(a1 + 72);
        if (v32)
          CGContextSetBlendMode(c, v32);
        objc_msgSend((id)objc_opt_class(), "centerRect:inRect:", v28, v29, v30, v31, x, y, width, height);
        CGContextDrawImage(c, v50, v23);
        CGContextRestoreGState(c);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v20);
  }

}

@end
