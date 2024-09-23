@implementation UIVectorTextLayoutRun

void __52___UIVectorTextLayoutRun_enumerateGlyphsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  void *v16;
  const __CTFont *v17;
  CGPathRef PathForGlyph;
  const CGPath *v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v24;
  CGFloat MinY;
  CGMutablePathRef v26;
  void *v27;
  CGAffineTransform *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform transform;
  CGRect v37;
  CGRect PathBoundingBox;
  CGRect v39;

  v37.origin.x = a5;
  v37.origin.y = a6;
  v37.size.width = a7;
  v37.size.height = a8;
  if (!CGRectIsEmpty(v37))
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setGlyph:", a2);
    objc_msgSend(v16, "setRect:", a5, a6, a7, a8);
    v17 = *(const __CTFont **)(a1 + 40);
    if (v17 && (PathForGlyph = CTFontCreatePathForGlyph(v17, a2, (const CGAffineTransform *)(a1 + 48))) != 0)
    {
      v19 = PathForGlyph;
      CFAutorelease(PathForGlyph);
      PathBoundingBox = CGPathGetPathBoundingBox(v19);
      x = PathBoundingBox.origin.x;
      y = PathBoundingBox.origin.y;
      width = PathBoundingBox.size.width;
      height = PathBoundingBox.size.height;
      memset(&transform, 0, sizeof(transform));
      v24 = -CGRectGetMinX(PathBoundingBox);
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      MinY = CGRectGetMinY(v39);
      CGAffineTransformMakeTranslation(&transform, v24, -MinY);
      v26 = CGPathCreateMutableCopyByTransformingPath(v19, &transform);
      +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", CFAutorelease(v26));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPath:", v27);

      v35 = transform;
      CGAffineTransformInvert(&v34, &v35);
      CGAffineTransformTranslate(&v35, &v34, a3, a4);
      transform = v35;
      v33 = v35;
      v28 = &v33;
    }
    else
    {
      objc_msgSend(v16, "setPath:", 0);
      v29 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v30 = *MEMORY[0x1E0C9BAA8];
      v31 = v29;
      v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v28 = (CGAffineTransform *)&v30;
    }
    objc_msgSend(v16, "setPathTransform:", v28, v30, v31, v32, *(_OWORD *)&v33.a, *(_OWORD *)&v33.c, *(_OWORD *)&v33.tx);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
