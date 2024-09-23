@implementation NSAttributedString(UIKitAdditions)

- (uint64_t)_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:()UIKitAdditions
{
  void *v5;
  uint64_t v6;

  if (!objc_msgSend(a1, "length"))
    goto LABEL_4;
  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v5 = 0;
  }
  v6 = objc_msgSend(a1, "_ui_resolvedTextAlignmentForParagraphStyle:userInterfaceLayoutDirection:", v5, a3);

  return v6;
}

- (uint64_t)_ui_resolvedTextAlignmentForParagraphStyle:()UIKitAdditions userInterfaceLayoutDirection:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "alignment");
    v8 = objc_msgSend(v6, "baseWritingDirection");
    if (v8 != -1)
      goto LABEL_6;
  }
  else
  {
    v7 = 4;
  }
  v8 = a4 != 0;
LABEL_6:
  if ((unint64_t)(v7 - 3) >= 2)
    v9 = v7;
  else
    v9 = 2 * (v8 == 1);

  return v9;
}

- (uint64_t)_ui_resolvedTextAlignment
{
  return objc_msgSend(a1, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"));
}

- (uint64_t)_ui_resolvedTextAlignmentForParagraphStyle:()UIKitAdditions
{
  void *v4;
  id v5;
  uint64_t v6;

  v4 = (void *)UIApp;
  v5 = a3;
  v6 = objc_msgSend(a1, "_ui_resolvedTextAlignmentForParagraphStyle:userInterfaceLayoutDirection:", v5, objc_msgSend(v4, "userInterfaceLayoutDirection"));

  return v6;
}

- (uint64_t)_ui_resolvedWritingDirection
{
  return objc_msgSend(a1, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"));
}

- (uint64_t)_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:()UIKitAdditions
{
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v5)
      {
LABEL_8:
        v6 = a3 != 0;

        return v6;
      }
    }
    else
    {

    }
  }
  v6 = objc_msgSend(0, "baseWritingDirection");
  if (v6 == -1)
  {
    v5 = 0;
    goto LABEL_8;
  }
  return v6;
}

- (id)_ui_attributedStringWithOriginalFontAttributes
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return a1;
  v3 = v2;
  v9 = 0;
  v10 = 0;
  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F78, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (!v4 && v5 == v3)
    return a1;
  v7 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v7, "_ui_restoreOriginalFontAttributes");
  return v7;
}

- (id)_ui_glyphImageViewsScale:()UIKitAdditions outImageRect:outLineRect:outBaselineOffset:
{
  const __CTLine *v11;
  const __CTLine *v12;
  _QWORD *ContextStack;
  CGContext *v14;
  CGFloat v15;
  uint64_t i;
  const __CTRun *v17;
  CFIndex GlyphCount;
  BOOL v19;
  CFIndex v20;
  CGImageRef Image;
  CGImage *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGImageRef v32;
  CGImage *v33;
  void *v34;
  UIImageView *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double *v50;
  const __CTLine *v51;
  CGFloat *v52;
  double height;
  double width;
  id obj;
  uint64_t v56;
  uint64_t v57;
  id v58;
  double x;
  double y;
  double v61;
  CGFloat v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;
  CFRange v69;
  CFRange v70;
  CGRect ImageBounds;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect BoundsWithOptions;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  if (-[__CFAttributedString length](a1, "length"))
  {
    v11 = CTLineCreateWithAttributedString(a1);
    if (v11)
    {
      v12 = v11;
      ImageBounds = CTLineGetImageBounds(v11, 0);
      v72.origin.x = UIRectIntegralWithScale(ImageBounds.origin.x, ImageBounds.origin.y, ImageBounds.size.width, ImageBounds.size.height, a2);
      v73 = CGRectInset(v72, -1.0, -1.0);
      x = v73.origin.x;
      y = v73.origin.y;
      height = v73.size.height;
      width = v73.size.width;
      _UIGraphicsBeginImageContextWithOptions(0, 0, v73.size.width, v73.size.height, a2);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack >= 1)
      {
        v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        if (v14)
        {
          v50 = a4;
          v52 = a5;
          v74.origin.x = x;
          v74.origin.y = y;
          v74.size.height = height;
          v74.size.width = width;
          v15 = CGRectGetHeight(v74);
          CGContextTranslateCTM(v14, -x, y + v15);
          CGContextScaleCTM(v14, 1.0, -1.0);
          v51 = v12;
          CTLineGetGlyphRuns(v12);
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          if (v57)
          {
            v56 = *(_QWORD *)v64;
            do
            {
              for (i = 0; i != v57; ++i)
              {
                if (*(_QWORD *)v64 != v56)
                  objc_enumerationMutation(obj);
                v17 = *(const __CTRun **)(*((_QWORD *)&v63 + 1) + 8 * i);
                GlyphCount = CTRunGetGlyphCount(v17);
                if (CTRunGetFont())
                  v19 = GlyphCount < 1;
                else
                  v19 = 1;
                if (!v19)
                {
                  v20 = 0;
                  do
                  {
                    v69.location = v20;
                    v69.length = 1;
                    CTRunDraw(v17, v14, v69);
                    Image = CGBitmapContextCreateImage(v14);
                    if (Image)
                    {
                      v22 = Image;
                      v70.location = v20;
                      v70.length = 1;
                      v75 = CTRunGetImageBounds(v17, v14, v70);
                      v76 = CGRectInset(v75, -1.0, -1.0);
                      v23 = v76.origin.x;
                      v24 = v76.origin.y;
                      v25 = v76.size.width;
                      v26 = v76.size.height;
                      v61 = (v76.origin.x - x) * a2;
                      v27 = height * a2 - (CGRectGetHeight(v76) + v76.origin.y - y) * a2;
                      v77.origin.x = v23;
                      v77.origin.y = v24;
                      v77.size.width = v25;
                      v77.size.height = v26;
                      v28 = CGRectGetWidth(v77) * a2;
                      v78.origin.x = v23;
                      v78.origin.y = v24;
                      v62 = v25;
                      v78.size.width = v25;
                      v78.size.height = v26;
                      v29 = CGRectGetHeight(v78);
                      v79.origin.x = UIRectIntegralWithScale(v61, v27, v28, v29 * a2, 1.0);
                      v91.origin.x = 0.0;
                      v91.origin.y = 0.0;
                      v91.size.width = width * a2;
                      v91.size.height = height * a2;
                      v80 = CGRectIntersection(v79, v91);
                      v30 = v80.origin.x;
                      v31 = v80.origin.y;
                      v32 = CGImageCreateWithImageInRect(v22, v80);
                      if (v32)
                      {
                        v33 = v32;
                        +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v32, 0, a2);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        v35 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v34);
                        objc_msgSend(v34, "size");
                        v37 = v36;
                        objc_msgSend(v34, "size");
                        -[UIImageView setFrame:](v35, "setFrame:", v30 / a2, v31 / a2, v37, v38);
                        objc_msgSend(v58, "addObject:", v35);
                        CGImageRelease(v33);

                      }
                      CGImageRelease(v22);
                      v81.origin.x = v23;
                      v81.origin.y = v24;
                      v81.size.width = v62;
                      v81.size.height = v26;
                      CGContextClearRect(v14, v81);
                    }
                    ++v20;
                  }
                  while (GlyphCount != v20);
                }
              }
              v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
            }
            while (v57);
          }

          a5 = v52;
          a4 = v50;
          v12 = v51;
        }
      }
      UIGraphicsEndImageContext();
      if (a4)
      {
        v82.origin.x = x;
        v82.origin.y = y;
        v82.size.width = width;
        v82.size.height = height;
        v39 = 0.0 - (y + CGRectGetHeight(v82));
        v83.origin.x = x;
        v83.origin.y = y;
        v83.size.width = width;
        v83.size.height = height;
        v40 = CGRectGetWidth(v83);
        v84.origin.x = x;
        v84.origin.y = y;
        v84.size.width = width;
        v84.size.height = height;
        v41 = CGRectGetHeight(v84);
        *a4 = x;
        a4[1] = v39;
        a4[2] = v40;
        a4[3] = v41;
      }
      if (a5)
      {
        BoundsWithOptions = CTLineGetBoundsWithOptions(v12, 0x11uLL);
        v86.origin.x = UIRectIntegralWithScale(BoundsWithOptions.origin.x, BoundsWithOptions.origin.y, BoundsWithOptions.size.width, BoundsWithOptions.size.height, a2);
        v87 = CGRectInset(v86, -1.0, -1.0);
        v42 = v87.origin.x;
        v43 = v87.origin.y;
        v44 = v87.size.width;
        v45 = v87.size.height;
        v46 = 0.0 - (CGRectGetHeight(v87) + v87.origin.y);
        v88.origin.x = v42;
        v88.origin.y = v43;
        v88.size.width = v44;
        v88.size.height = v45;
        v47 = CGRectGetWidth(v88);
        v89.origin.x = v42;
        v89.origin.y = v43;
        v89.size.width = v44;
        v89.size.height = v45;
        v48 = CGRectGetHeight(v89);
        *a5 = v42;
        a5[1] = v46;
        a5[2] = v47;
        a5[3] = v48;
      }
      if (a6)
      {
        v90.origin.x = x;
        v90.origin.y = y;
        v90.size.height = height;
        v90.size.width = width;
        *a6 = y + CGRectGetHeight(v90);
      }
      CFRelease(v12);
    }
  }
  return v58;
}

@end
