@implementation PDFView

+ (void)be_enableAutoscaleHacks
{
  if (qword_20F7C0 != -1)
    dispatch_once(&qword_20F7C0, &stru_1C1FC8);
}

- (double)be_autoScaleFactor
{
  double result;

  if (-[PDFView be_useOverrideAutoScale](self, "be_useOverrideAutoScale"))
    -[PDFView be_overrideAutoScale](self, "be_overrideAutoScale");
  else
    -[PDFView be_autoScaleFactor](self, "be_autoScaleFactor");
  return result;
}

- (void)setBe_overrideAutoScale:(double)a3
{
  PDFView *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PDFView be_associatedPageViewController](self, "be_associatedPageViewController"));
  v5 = (PDFView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "be_pdfView"));

  if (v5 == self)
    objc_msgSend(v7, "setBe_overrideAutoScale:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_setAssociatedObject(self, "be_overrideAutoScale", v6, (char *)&dword_0 + 1);

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
  _BOOL8 v3;
  PDFView *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PDFView be_associatedPageViewController](self, "be_associatedPageViewController"));
  v5 = (PDFView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "be_pdfView"));

  if (v5 == self)
    objc_msgSend(v7, "setBe_useOverrideAutoScale:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_setAssociatedObject(self, "be_useOverrideAutoScale", v6, (char *)&dword_0 + 1);

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

- (id)be_associatedPageViewController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView valueForKeyPath:](self, "valueForKeyPath:", CFSTR("_private.documentViewController")));
  objc_opt_class(UIPageViewController);
  v4 = BUDynamicCast(v3, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  return v7;
}

@end
