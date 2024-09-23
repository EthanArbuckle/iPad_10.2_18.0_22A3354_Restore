@implementation VUICompositeBitmapImageOfSizeForImages

void __VUICompositeBitmapImageOfSizeForImages_block_invoke(uint64_t a1, CGContextRef c)
{
  CGPath *v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  CGImage *v14;
  size_t v15;
  size_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGBlendMode v23;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect ClipBoundingBox;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(double *)(a1 + 40) > 0.0)
  {
    +[VUICoreUtilities radiiFromRadius:](VUICoreUtilities, "radiiFromRadius:");
    v4 = +[VUICoreUtilities createPathForRadii:inRect:isContinuous:](VUICoreUtilities, "createPathForRadii:inRect:isContinuous:", 1);
    CGContextAddPath(c, v4);
    CGPathRelease(v4);
    CGContextClip(c);
  }
  ClipBoundingBox = CGContextGetClipBoundingBox(c);
  x = ClipBoundingBox.origin.x;
  y = ClipBoundingBox.origin.y;
  width = ClipBoundingBox.size.width;
  height = ClipBoundingBox.size.height;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(CGImage **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v15 = CGImageGetWidth(v14);
        v16 = CGImageGetHeight(v14);
        v17 = *(double *)(a1 + 48) / (double)v15;
        v18 = (double)v16;
        if (v17 < *(double *)(a1 + 56) / (double)v16)
          v17 = *(double *)(a1 + 56) / (double)v16;
        CGAffineTransformMakeScale(&v24, v17, v17);
        v32.origin.x = 0.0;
        v32.origin.y = 0.0;
        v32.size.width = (double)v15;
        v32.size.height = v18;
        v33 = CGRectApplyAffineTransform(v32, &v24);
        v19 = v33.origin.x;
        v20 = v33.origin.y;
        v21 = v33.size.width;
        v22 = v33.size.height;
        CGContextSaveGState(c);
        v23 = *(_DWORD *)(a1 + 64);
        if (v23)
          CGContextSetBlendMode(c, v23);
        +[VUICoreUtilities centerRect:inRect:](VUICoreUtilities, "centerRect:inRect:", v19, v20, v21, v22, x, y, width, height);
        CGContextDrawImage(c, v34, v14);
        CGContextRestoreGState(c);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

}

@end
