@implementation PXDebugHierarchyViewTreeBuilder

+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  PXDebug *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v6;
  v17 = objc_alloc_init(PXDebug);
  -[PXDebug setFrame:](v17, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v7, "alpha");
  -[PXDebug setAlpha:](v17, "setAlpha:");
  -[PXDebug setPreviewImage:](v17, "setPreviewImage:", objc_msgSend(v7, "previewImage"));
  -[PXDebug setBackgroundColor:](v17, "setBackgroundColor:", objc_msgSend(v7, "backgroundColor"));
  objc_msgSend(v7, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXDebug setName:](v17, "setName:", v18);
  objc_msgSend(v16, "addSubview:", v17);

  return v17;
}

@end
