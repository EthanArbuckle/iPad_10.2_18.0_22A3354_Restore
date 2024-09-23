@implementation _UICAPackageView

+ (BOOL)_shouldCatchDecodingExceptions
{
  if (_shouldCatchDecodingExceptions_onceToken != -1)
    dispatch_once(&_shouldCatchDecodingExceptions_onceToken, &__block_literal_global_668);
  return _shouldCatchDecodingExceptions___shouldCatchDecodingExceptions;
}

+ (void)loadPackageViewWithObject:(id)a3 publishedObjectViewClassMap:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(17, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend((id)objc_opt_class(), "_shouldCatchDecodingExceptions");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke;
    block[3] = &unk_1E16EC450;
    v26 = v12;
    v22 = v8;
    v25 = a1;
    v23 = v9;
    v24 = v10;
    v13 = v10;
    dispatch_async(v11, block);

    v14 = v22;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v27 = CFSTR("CAARFileLoadingMessage");
    v28[0] = CFSTR("Failed to get the QOS_CLASS_UTILITY queue");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CAARFileLoadingDomain"), 950001, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85___UICAPackageView_loadPackageViewWithObject_publishedObjectViewClassMap_completion___block_invoke_5;
    v18[3] = &unk_1E16B2F48;
    v19 = v17;
    v20 = v10;
    v14 = v10;
    v13 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], v18);

  }
}

+ (id)_newViewHierarchyFrom:(id)a3 publishedObjectViewClassMap:(id)a4 into:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "rootLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateViewForLayer(v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __75___UICAPackageView__newViewHierarchyFrom_publishedObjectViewClassMap_into___block_invoke;
  v24 = &unk_1E16EC478;
  v25 = v7;
  v26 = v12;
  v13 = v12;
  v14 = v7;
  objc_msgSend(v9, "foreachLayer:", &v21);
  v15 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v11, "frame", v21, v22, v23, v24);
  objc_msgSend(v8, "setFrame:", v15, v16);
  objc_msgSend(v8, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v9, "isGeometryFlipped");

  objc_msgSend(v17, "setGeometryFlipped:", v18);
  objc_msgSend(v8, "addSubview:", v11);

  v19 = (void *)objc_msgSend(v13, "copy");
  return v19;
}

- (_UICAPackageView)initWithData:(id)a3 publishedObjectViewClassMap:(id)a4
{
  id v6;
  id v7;
  _UICAPackageView *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  CAPackage *package;
  CAPackage *v13;
  NSArray *v14;
  NSArray *rootViews;
  _UICAPackageView *v16;
  id v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UICAPackageView;
  v8 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    v9 = *MEMORY[0x1E0CD3070];
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithData:type:options:error:", v6, v9, 0, &v18);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v18;
    package = v8->_package;
    v8->_package = (CAPackage *)v10;

    v13 = v8->_package;
    if (!v13)
    {
      NSLog(CFSTR("Failed to decode CAPackage with error %@"), v11);

      v16 = 0;
      goto LABEL_6;
    }
    v14 = +[_UICAPackageView _newViewHierarchyFrom:publishedObjectViewClassMap:into:](_UICAPackageView, "_newViewHierarchyFrom:publishedObjectViewClassMap:into:", v13, v7, v8);
    rootViews = v8->_rootViews;
    v8->_rootViews = v14;

  }
  v16 = v8;
LABEL_6:

  return v16;
}

- (_UICAPackageView)initWithContentsOfURL:(id)a3 publishedObjectViewClassMap:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  _UICAPackageView *v9;

  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = a4;
  objc_msgSend(v6, "dataWithContentsOfURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UICAPackageView initWithData:publishedObjectViewClassMap:](self, "initWithData:publishedObjectViewClassMap:", v8, v7);

  return v9;
}

- (id)publishedObjectWithName:(id)a3
{
  return (id)-[CAPackage publishedObjectWithName:](self->_package, "publishedObjectWithName:", a3);
}

- (id)publishedViewWithName:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  -[CAPackage publishedObjectWithName:](self->_package, "publishedObjectWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v3, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViews, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
