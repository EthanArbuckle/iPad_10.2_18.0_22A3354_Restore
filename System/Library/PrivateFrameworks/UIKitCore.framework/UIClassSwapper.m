@implementation UIClassSwapper

- (UIClassSwapper)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  Class v6;
  NSString *v7;
  Class v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  NSObject *v45;
  NSObject *v46;
  NSString *v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  unint64_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  objc_class *v55;
  id v56;
  uint64_t v57;
  UIClassSwapper *v58;
  objc_class *v60;
  NSString *v61;
  uint8_t buf[4];
  NSString *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  NSString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIClassName"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSClassFromString(v5);
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIOriginalClassName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSClassFromString(v7);

  if (!v6)
  {
    v9 = _MergedGlobals_1100;
    if (!_MergedGlobals_1100)
    {
      v9 = __UILogCategoryGetNode("Storyboard", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_MergedGlobals_1100);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v5;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unknown class %@ in Interface Builder file.\n", buf, 0xCu);
    }
  }
  objc_msgSend(v4, "_storyboardDecodingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceSegueTemplate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (const char *)objc_msgSend(v12, "prepareForChildViewControllerSelector");
  objc_msgSend(v4, "_storyboardDecodingContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "_storyboardDecodingContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "parentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_storyboardDecodingContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const char *)objc_msgSend(v17, "_customSelectorToCreateChildViewControllerAtIndex:", objc_msgSend(v18, "childViewControllerIndex"));

  }
  objc_msgSend(v12, "viewController");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_storyboardDecodingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "creator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "_storyboardDecodingContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "creator");
    v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_storyboardDecodingContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCreator:", 0);

    objc_msgSend(v4, "_storyboardDecodingContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClassSwapperTemplate:", self);

    ((void (**)(_QWORD, id))v23)[2](v23, v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_storyboardDecodingContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26)
    {
      v60 = v8;
      v61 = v5;
      objc_msgSend(v27, "classSwapperTemplate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIClassSwapper.m"), 134, CFSTR("Custom instantiated view controller must call -[super initWithCoder:]"));

      }
      objc_msgSend(v4, "_storyboardDecodingContext");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setClassSwapperTemplate:", 0);

LABEL_18:
      if (v6)
        v41 = v6;
      else
        v41 = v60;
      v5 = v61;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIClassSwapper.m"), 150, CFSTR("Custom instantiated %@ must be kind of class %@"), v26, v43);

        v5 = v61;
      }
      goto LABEL_40;
    }
    objc_msgSend(v27, "setClassSwapperTemplate:", 0);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v60 = v8;
    v61 = v5;
    objc_msgSend(v4, "_storyboardDecodingContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setClassSwapperTemplate:", self);

    objc_msgSend(v4, "_storyboardDecodingContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sender");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIClassSwapper performSelectorForObject:selector:withObject:withObject:withObject:](self, "performSelectorForObject:selector:withObject:withObject:withObject:", v19, v13, v4, v34, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_storyboardDecodingContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v26)
    {
      objc_msgSend(v36, "classSwapperTemplate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v13);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIClassSwapper.m"), 139, CFSTR("Custom instantiated view controller must call -[super initWithCoder:] when created from -[%@ %@]"), v19, v40);

      }
      objc_msgSend(v4, "_storyboardDecodingContext");
      v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setClassSwapperTemplate:", 0);
      goto LABEL_18;
    }
    objc_msgSend(v36, "setClassSwapperTemplate:", 0);

    v51 = qword_1ECD7E928;
    v8 = v60;
    if (!qword_1ECD7E928)
    {
      v51 = __UILogCategoryGetNode("Storyboard", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v51, (unint64_t *)&qword_1ECD7E928);
    }
    v52 = *(NSObject **)(v51 + 8);
    v5 = v61;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = v52;
      NSStringFromSelector(v13);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v64 = v19;
      v65 = 2112;
      v66 = v54;
      v67 = 2112;
      v68 = v61;
      _os_log_impl(&dword_185066000, v53, OS_LOG_TYPE_ERROR, "-[%@ %@] returned nil, falling back to -[%@ initWithCoder:]", buf, 0x20u);

      v8 = v60;
      v5 = v61;
    }
  }
  else if (v13)
  {
    v44 = qword_1ECD7E930;
    if (!qword_1ECD7E930)
    {
      v44 = __UILogCategoryGetNode("Storyboard", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v44, (unint64_t *)&qword_1ECD7E930);
    }
    v45 = *(NSObject **)(v44 + 8);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = v45;
      v47 = v5;
      v48 = v46;
      NSStringFromSelector(v13);
      v49 = v8;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v64 = v19;
      v65 = 2112;
      v66 = v50;
      _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_ERROR, "Unable to find method -[%@ %@]", buf, 0x16u);

      v8 = v49;
      v5 = v47;
    }
  }
  if (v6)
    v55 = v6;
  else
    v55 = v8;
  v56 = [v55 alloc];
  objc_msgSend(v4, "replaceObject:withObject:", self, v56);
  if (v8 == (Class)objc_opt_class())
    v57 = objc_msgSend(v56, "init");
  else
    v57 = objc_msgSend(v56, "initWithCoder:", v4);
  v26 = (void *)v57;
LABEL_40:
  v58 = v26;

  return v58;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->object, 0);
  objc_storeStrong((id *)&self->className, 0);
}

- (UIClassSwapper)initWithObject:(id)a3 andClassName:(id)a4
{
  id v7;
  id v8;
  UIClassSwapper *v9;
  UIClassSwapper *v10;
  uint64_t v11;
  NSString *className;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIClassSwapper;
  v9 = -[UIClassSwapper init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->object, a3);
    v11 = objc_msgSend(v8, "copy");
    className = v10->className;
    v10->className = (NSString *)v11;

  }
  return v10;
}

- (id)performSelectorForObject:(id)a3 selector:(SEL)a4 withObject:(id)a5 withObject:(id)a6 withObject:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!a4)
    -[UIClassSwapper doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", 0);
  objc_msgSend(v12, a4, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id object;
  id v5;
  objc_class *v6;
  id v7;

  object = self->object;
  v5 = a3;
  objc_msgSend(object, "encodeWithCoder:", v5);
  objc_msgSend(v5, "encodeObject:forKey:", self->className, CFSTR("UIClassName"));
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("UIOriginalClassName"));

}

+ (id)swapperForObject:(id)a3 withClassName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:andClassName:", v7, v6);

  return v8;
}

- (id)className
{
  return self->className;
}

- (id)object
{
  return self->object;
}

@end
