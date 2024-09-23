@implementation THWButtonUtilities

+ (id)navigationArrowImageWithSize:(CGSize)a3 direction:(int)a4 color:(id)a5 highlighted:(BOOL)a6 contentsScale:(double)a7
{
  _BOOL4 v8;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  CGContext *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGImage *v41;
  CGImage *Image;
  TSUImage *v43;
  double v45;
  CGFloat v46;
  uint64_t v47;
  CGFloat v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v8 = a6;
  TSDMultiplySizeScalar(a3.width, a3.height, a7);
  v12 = TSDRectWithSize(v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (CGContext *)TSDBitmapContextCreate(3);
  v20 = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("ib_chevron_forward"), THBundle());
  objc_msgSend(v20, "size");
  v22 = v21;
  v24 = v23;
  CGContextSaveGState(v19);
  if (a4 == 4)
  {
    CGContextScaleCTM(v19, -1.0, 1.0);
    CGContextTranslateCTM(v19, -v16, 0.0);
  }
  TSDMultiplySizeScalar(v22, v24, a7);
  v26 = TSDRectWithSize(v25);
  v27 = TSDCenterRectOverRect(v26);
  v29 = v28;
  v31 = v30;
  v34 = TSDRoundedPointForScale(v32, v27, v33, a7);
  v36 = v35;
  v45 = v12;
  v47 = v18;
  v37 = v34 + a7;
  v38 = v16;
  v39 = v14;
  if (v8)
    v40 = 0.5;
  else
    v40 = 1.0;
  v41 = (CGImage *)objc_msgSend(v20, "CGImageForContentsScale:", a7, *(_QWORD *)&v45, v47);
  v49.origin.x = v37;
  v49.origin.y = v36;
  v49.size.width = v29;
  v49.size.height = v31;
  CGContextClipToMask(v19, v49, v41);
  CGContextSetBlendMode(v19, kCGBlendModeMultiply);
  CGContextSetFillColorWithColor(v19, (CGColorRef)objc_msgSend(objc_msgSend(a5, "colorWithAlphaComponent:", v40), "CGColor"));
  v50.origin.x = v37;
  v50.origin.y = v36;
  v50.size.width = v29;
  v50.size.height = v31;
  CGContextFillRect(v19, v50);
  CGContextRestoreGState(v19);
  CGContextSetStrokeColorWithColor(v19, (CGColorRef)objc_msgSend(objc_msgSend(a5, "colorWithAlphaComponent:", v40 * 0.4), "CGColor"));
  CGContextSetLineWidth(v19, a7);
  v51.origin.x = v46;
  v51.size.height = v48;
  v51.origin.y = v39;
  v51.size.width = v38;
  v52 = CGRectInset(v51, a7 * 0.5, a7 * 0.5);
  CGContextStrokeEllipseInRect(v19, v52);
  Image = CGBitmapContextCreateImage(v19);
  v43 = +[TSUImage imageWithCGImage:](TSUImage, "imageWithCGImage:", Image);
  CGImageRelease(Image);
  CGContextRelease(v19);
  return v43;
}

@end
