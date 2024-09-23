@implementation UIImage(NCAdditions)

+ (id)nc_imageFromPDFWithFileURL:()NCAdditions size:
{
  CGPDFDocument *v8;
  void *v9;

  v8 = CGPDFDocumentCreateWithURL(url);
  objc_msgSend(a1, "nc_imageWithPDDocument:size:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGPDFDocumentRelease(v8);
  return v9;
}

+ (CGPDFPage)nc_imageWithPDDocument:()NCAdditions size:
{
  CGPDFPage *Page;
  CGPDFPage *v8;
  double width;
  double height;
  CGContext *CurrentContext;
  CGRect BoxRect;

  if (document)
  {
    Page = CGPDFDocumentGetPage(document, 1uLL);
    v8 = Page;
    if (Page)
    {
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFArtBox);
      width = BoxRect.size.width;
      height = BoxRect.size.height;
      BoxRect.origin.x = a4;
      BoxRect.origin.y = a5;
      UIGraphicsBeginImageContextWithOptions((CGSize)BoxRect.origin, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(CurrentContext, a4 / width, a5 / height);
      CGContextDrawPDFPage(CurrentContext, v8);
      UIGraphicsGetImageFromCurrentImageContext();
      v8 = (CGPDFPage *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
