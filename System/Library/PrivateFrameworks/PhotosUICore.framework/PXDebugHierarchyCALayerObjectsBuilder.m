@implementation PXDebugHierarchyCALayerObjectsBuilder

+ (id)buildLayerTreeForDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 options:(unint64_t)a5
{
  void *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "buildObjectTreeForDebugHierarchyWithIdentifier:provider:options:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXDebugHierarchyCALayerObjectsBuilder.m"), 19, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[self buildObjectTreeForDebugHierarchyWithIdentifier:identifier provider:provider options:options]"), v11, v12);

    }
  }
  return v7;
}

+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v6, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (v7)
  {
    objc_msgSend(v7, "bounds");
    PXRectFlippedVertically();
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v16 = v20;
  }
  objc_msgSend(v8, "setFrame:", v10, v12, v14, v16);
  objc_msgSend(v6, "zPosition");
  objc_msgSend(v8, "setZPosition:");
  objc_msgSend(v6, "alpha");
  *(float *)&v21 = v21;
  objc_msgSend(v8, "setOpacity:", v21);
  objc_msgSend(v8, "setContents:", objc_msgSend(v6, "previewImage"));
  objc_msgSend(v6, "contentsGravity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentsGravity:", v22);

  objc_msgSend(v6, "contentsRect");
  objc_msgSend(v8, "setContentsRect:");
  objc_msgSend(v8, "setMasksToBounds:", 1);
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v6, "backgroundColor"));
  objc_msgSend(v6, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v23);

  objc_msgSend(v7, "addSublayer:", v8);
  return v8;
}

@end
