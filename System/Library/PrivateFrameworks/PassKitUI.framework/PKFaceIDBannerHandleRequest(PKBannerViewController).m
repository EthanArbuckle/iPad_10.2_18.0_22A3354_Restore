@implementation PKFaceIDBannerHandleRequest(PKBannerViewController)

- (_QWORD)createBannerViewController
{
  PKFaceIDBannerViewController *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  objc_super v5;

  objc_opt_self();
  v0 = [PKFaceIDBannerViewController alloc];
  if (!v0)
    return 0;
  v5.receiver = v0;
  v5.super_class = (Class)PKFaceIDBannerViewController;
  v1 = objc_msgSendSuper2(&v5, sel_initWithNibName_bundle_, 0, 0);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.192, 0.82, 0.345, 1.0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v1[131];
    v1[131] = v2;

    v1[127] = 0;
    v1[124] = *MEMORY[0x1E0DC4878];
  }
  return v1;
}

@end
