@implementation CRLErrorImageProvider

+ (CRLErrorImageProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100219FF0;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_1014150E8 != -1)
    dispatch_once(&qword_1014150E8, block);
  return (CRLErrorImageProvider *)(id)qword_1014150E0;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isError
{
  return 1;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat width;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  CGColor *v10;
  CGPDFDocument *v11;
  CGPDFPage *Page;
  CGPDFPage *v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat MaxY;
  CGAffineTransform v36;
  __n128 v37;
  __int128 v38;
  __int128 v39;
  double v40;
  double v41;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v43 = a4;
  if (sub_100192BD4(&v43.origin.x) && sub_100192BD4(&v43.origin.y))
  {
    width = v43.size.width;
    if (v43.size.width != 0.0)
    {
      height = v43.size.height;
      if (v43.size.height != 0.0)
      {
        x = v43.origin.x;
        y = v43.origin.y;
        if (!CGRectIsInfinite(*(CGRect *)(&width - 2)) && !CGRectIsNull(v43))
        {
          CGContextSetShouldAntialias(a3, 1);
          v10 = sub_100011C1C(0.939999998, 0.939999998, 0.939999998, 1.0);
          CGContextSetFillColorWithColor(a3, v10);
          CGColorRelease(v10);
          CGContextFillRect(a3, v43);
          v11 = -[CRLErrorImageProvider p_iconPDFDocument](self, "p_iconPDFDocument");
          if (v11)
          {
            Page = CGPDFDocumentGetPage(v11, 1uLL);
            if (Page)
            {
              v13 = Page;
              memset(&v42, 0, sizeof(v42));
              v40 = 0.0;
              v41 = 0.0;
              v14 = sub_10041069C(Page, (uint64_t)&v42, &v40);
              v16 = v15;
              v18 = v17;
              v20 = v19;
              v21 = v43.size.width;
              v22 = v43.size.height;
              v23 = sub_1000603DC(v43.size.width, v43.size.height, 0.35);
              v24 = v40;
              v25 = v41;
              sub_100062DDC(v40, v41, v23, v26);
              v27 = sub_10005FDDC();
              v31 = sub_1000616BC(v27, v28, v29, v30, v43.origin.x, v43.origin.y, v21, v22);
              v38 = 0u;
              v39 = 0u;
              v37 = 0u;
              v36 = v42;
              sub_100410A70((__n128 *)&v36, &v37, v24, v25, v31, v32, v33, v34);
              *(__n128 *)&v36.a = v37;
              *(_OWORD *)&v36.c = v38;
              *(_OWORD *)&v36.tx = v39;
              CGContextConcatCTM(a3, &v36);
              v44.origin.x = v14;
              v44.origin.y = v16;
              v44.size.width = v18;
              v44.size.height = v20;
              CGContextClipToRect(a3, v44);
              v45.origin.x = v14;
              v45.origin.y = v16;
              v45.size.width = v18;
              v45.size.height = v20;
              MaxY = CGRectGetMaxY(v45);
              CGContextTranslateCTM(a3, 0.0, MaxY);
              CGContextScaleCTM(a3, 1.0, -1.0);
              CGContextDrawPDFPage(a3, v13);
            }
          }
        }
      }
    }
  }
}

- (CGPDFDocument)p_iconPDFDocument
{
  if (qword_1014150F8 != -1)
    dispatch_once(&qword_1014150F8, &stru_101245948);
  return (CGPDFDocument *)objc_msgSend((id)qword_1014150F0, "CGPDFDocument");
}

@end
