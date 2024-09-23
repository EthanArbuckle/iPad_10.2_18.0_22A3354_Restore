@implementation UIViewController

- (double)be_autoScaleFactor
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController be_pdfView](self, "be_pdfView"));
  if (-[UIViewController be_useOverrideAutoScale](self, "be_useOverrideAutoScale")
    || objc_msgSend(v3, "be_useOverrideAutoScale"))
  {
    -[UIViewController be_overrideAutoScale](self, "be_overrideAutoScale");
    v5 = v4;
    objc_msgSend(v3, "be_overrideAutoScale");
    if (v5 < v6)
      v5 = v6;
  }
  else
  {
    -[UIViewController be_autoScaleFactor](self, "be_autoScaleFactor");
    v5 = v7;
  }

  return v5;
}

- (void)setBe_overrideAutoScale:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_setAssociatedObject(self, "be_overrideAutoScale", v4, (char *)&dword_0 + 1);

}

- (double)be_overrideAutoScale
{
  id AssociatedObject;
  void *v3;
  double v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(self, "be_overrideAutoScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setBe_useOverrideAutoScale:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, "be_useOverrideAutoScale", v4, (char *)&dword_0 + 1);

}

- (BOOL)be_useOverrideAutoScale
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "be_useOverrideAutoScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (PDFView)be_pdfView
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if ((objc_opt_isKindOfClass(self, +[UIViewController be_PDFPageViewControllerClass](UIViewController, "be_PDFPageViewControllerClass")) & 1) != 0)
  {
    *(_QWORD *)&v3 = objc_opt_class(PDFView).n128_u64[0];
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController valueForKeyPath:](self, "valueForKeyPath:", CFSTR("_private.pdfView"), v3));
    v7 = BUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  else
  {
    v8 = 0;
  }
  return (PDFView *)v8;
}

+ (void)be_enablePDFPageViewControllerHacks
{
  if (qword_20F7A8 != -1)
    dispatch_once(&qword_20F7A8, &stru_1C1F88);
}

+ (Class)be_PDFPageViewControllerClass
{
  if (qword_20F7B8 != -1)
    dispatch_once(&qword_20F7B8, &stru_1C1FA8);
  return (Class)(id)qword_20F7B0;
}

@end
