@implementation UIAccessibilityElementSuperCategory

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAccessibilityElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAccessibilityElement"), CFSTR("initWithAccessibilityContainer:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAccessibilityElement"), CFSTR("_destroyFocusLayer"), "v", 0);

}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (UIAccessibilityElementSuperCategory)init
{
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Use initWithAccessibilityContainer:"));
  v4.receiver = self;
  v4.super_class = (Class)UIAccessibilityElementSuperCategory;

  return 0;
}

- (UIAccessibilityElementSuperCategory)initWithAccessibilityContainer:(id)a3
{
  UIAccessibilityElementSuperCategory *v4;
  UIAccessibilityElementSuperCategory *v5;
  UIAccessibilityElementSuperCategory *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityElementSuperCategory;
  v4 = -[UIAccessibilityElementSuperCategory initWithAccessibilityContainer:](&v9, sel_initWithAccessibilityContainer_);
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("ERROR: UIAccessibilityElement initialized with nil container: \n%@"), v7);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("ERROR: UIAccessibilityElement initialized with nil container"));
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = v4;
LABEL_6:

  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  UIAccessibilityElementSuperCategory *v8;

  -[NSObject _accessibilityUnregister](self, "_accessibilityUnregister");
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __46__UIAccessibilityElementSuperCategory_dealloc__block_invoke;
  v7 = &unk_1E3DFE9F8;
  v8 = self;
  AXPerformSafeBlock();
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElementSuperCategory;
  -[UIAccessibilityElementSuperCategory dealloc](&v3, sel_dealloc);
}

uint64_t __46__UIAccessibilityElementSuperCategory_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_destroyFocusLayer");
}

- (void)_accessibilitySetValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_accessibilitySetValue:", v4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[NSObject _accessibilitySetValue:](&v7, sel__accessibilitySetValue_, v4);
  }

}

- (void)accessibilityElementDidBecomeFocused
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityElementDidBecomeFocused");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[NSObject accessibilityElementDidBecomeFocused](&v5, sel_accessibilityElementDidBecomeFocused);
  }

}

- (void)accessibilityElementDidLoseFocus
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityElementDidLoseFocus");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[NSObject accessibilityElementDidLoseFocus](&v5, sel_accessibilityElementDidLoseFocus);
  }

}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "accessibilityActivate");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIAccessibilityElementSuperCategory;
    v5 = -[UIAccessibilityElementSuperCategory accessibilityActivate](&v8, sel_accessibilityActivate);
  }
  v6 = v5;

  return v6;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v3;
  void *v4;
  char v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_accessibilitySupportsActivateAction");
  }
  else
  {
    if (!_accessibilitySupportsActivateAction_BaseActivateAction)
    {
      v6 = (objc_class *)objc_opt_class();
      _accessibilitySupportsActivateAction_BaseActivateAction = (uint64_t)class_getInstanceMethod(v6, sel_accessibilityActivate);
    }
    v7 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v7, sel_accessibilityActivate) == (Method)_accessibilitySupportsActivateAction_BaseActivateAction)
    {
      -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8 != 0;

    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (float)_accessibilityActivationDelay
{
  void *v3;
  float v4;
  float v5;
  objc_super v7;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_accessibilityActivationDelay:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[NSObject _accessibilityActivationDelay](&v7, sel__accessibilityActivationDelay);
  }
  v5 = v4;

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "accessibilityActivationPoint:", self);
    else
      objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[UIAccessibilityElementSuperCategory accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)isAccessibilityElement
{
  unsigned __int8 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityElementSuperCategory;
  v3 = -[UIAccessibilityElementSuperCategory isAccessibilityElement](&v6, sel_isAccessibilityElement);
  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v4, "isAccessibilityElement:", self);

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessibilityLabel:", self);
  else
    objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[UIAccessibilityElementSuperCategory accessibilityLabel](&v6, sel_accessibilityLabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessibilityHint:", self);
  else
    objc_msgSend(v3, "accessibilityHint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[UIAccessibilityElementSuperCategory accessibilityHint](&v6, sel_accessibilityHint);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)accessibilityLanguage
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessibilityLanguage:", self);
  else
    objc_msgSend(v3, "accessibilityLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[UIAccessibilityElementSuperCategory accessibilityLanguage](&v6, sel_accessibilityLanguage);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessibilityPath:", self);
  else
    objc_msgSend(v3, "accessibilityPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[UIAccessibilityElementSuperCategory accessibilityPath](&v6, sel_accessibilityPath);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)_accessibilityUsesFrameInContainerSpace
{
  CGRect v3;

  -[UIAccessibilityElementSuperCategory accessibilityFrameInContainerSpace](self, "accessibilityFrameInContainerSpace");
  return !CGRectIsNull(v3);
}

- (CGRect)accessibilityFrame
{
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  char v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  id v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  objc_super v71;
  id v72;
  SEL aSelector;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect result;
  CGRect v80;

  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[UIAccessibilityElementSuperCategory bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v74.origin.x = x;
  v74.origin.y = y;
  v74.size.width = width;
  v74.size.height = height;
  v80.origin.x = v8;
  v80.origin.y = v10;
  v80.size.width = v12;
  v80.size.height = v14;
  if (!CGRectEqualToRect(v74, v80))
  {
    -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = UIAccessibilityFrameForBounds(v17, v8, v10, v12, v14);
LABEL_10:
      x = v18;
      y = v19;
      width = v20;
      height = v21;

      goto LABEL_18;
    }
  }
  -[UIAccessibilityElementSuperCategory accessibilityFrameInContainerSpace](self, "accessibilityFrameInContainerSpace");
  if (CGRectIsNull(v75))
  {
    -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v22, "accessibilityFrame:", self);
      else
        objc_msgSend(v22, "accessibilityFrame");
      x = v23;
      y = v24;
      width = v25;
      height = v26;
    }
    v72 = v22;
    aSelector = 0;
    -[UIAccessibilityElementSuperCategory delegateSpecificsForAttribute:delegate:selector:](self, "delegateSpecificsForAttribute:delegate:selector:", 2003, &v72, &aSelector);
    v51 = v72;

    if (v51 && aSelector)
    {
      NSStringFromSelector(aSelector);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "safeValueForKey:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "rectValue");
      x = v54;
      y = v55;
      width = v56;
      height = v57;

    }
  }
  else
  {
    -[UIAccessibilityElementSuperCategory accessibilityFrameInContainerSpace](self, "accessibilityFrameInContainerSpace");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = objc_opt_isKindOfClass();

    if ((v36 & 1) != 0)
    {
      -[NSObject _accessibilityWindow](self, "_accessibilityWindow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "convertRect:toView:", 0, v28, v30, v32, v34);
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;

      objc_msgSend(v17, "convertRect:toWindow:", 0, v39, v41, v43, v45);
      goto LABEL_10;
    }
    -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "accessibilityFrame");
    v48 = v47;
    v50 = v49;

    v76.origin.x = v28;
    v76.origin.y = v30;
    v76.size.width = v32;
    v76.size.height = v34;
    v77 = CGRectOffset(v76, v48, v50);
    x = v77.origin.x;
    y = v77.origin.y;
    width = v77.size.width;
    height = v77.size.height;
  }
LABEL_18:
  v78.origin.x = x;
  v78.origin.y = y;
  v78.size.width = width;
  v78.size.height = height;
  if (CGRectIsEmpty(v78))
  {
    -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 6);
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = (void *)v58;
      x = (*(double (**)(void))(v58 + 16))();
      y = v60;
      width = v61;
      height = v62;

    }
    else
    {
      v71.receiver = self;
      v71.super_class = (Class)UIAccessibilityElementSuperCategory;
      -[UIAccessibilityElementSuperCategory accessibilityFrame](&v71, sel_accessibilityFrame);
      x = v63;
      y = v64;
      width = v65;
      height = v66;
    }
  }
  v67 = x;
  v68 = y;
  v69 = width;
  v70 = height;
  result.size.height = v70;
  result.size.width = v69;
  result.origin.y = v68;
  result.origin.x = v67;
  return result;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessibilityValue:", self);
  else
    objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[UIAccessibilityElementSuperCategory accessibilityValue](&v6, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIAccessibilityElementSuperCategory;
  v3 = -[UIAccessibilityElementSuperCategory accessibilityTraits](&v7, sel_accessibilityTraits);
  -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v4, "accessibilityTraits:", self);
    else
      v5 = objc_msgSend(v4, "accessibilityTraits");
    v3 |= v5;
  }

  return v3;
}

- (void)accessibilityIncrement
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 18);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "accessibilityIncrement:", self);
      else
        objc_msgSend(v5, "accessibilityIncrement");
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)UIAccessibilityElementSuperCategory;
      -[UIAccessibilityElementSuperCategory accessibilityIncrement](&v6, sel_accessibilityIncrement);
    }

  }
}

- (void)accessibilityDecrement
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[NSObject _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 19);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    -[UIAccessibilityElementSuperCategory accessibilityDelegate](self, "accessibilityDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "accessibilityDecrement:", self);
      else
        objc_msgSend(v5, "accessibilityDecrement");
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)UIAccessibilityElementSuperCategory;
      -[UIAccessibilityElementSuperCategory accessibilityDecrement](&v6, sel_accessibilityDecrement);
    }

  }
}

- (BOOL)_accessibilityProvidesOwnFrame
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGRect v8;

  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementSuperCategory accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityElementSuperCategory accessibilityFrame](self, "accessibilityFrame");
  NSStringFromCGRect(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [%p] %@ %@"), v3, self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityZoomInAtPoint:", x, y);

  return v6;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityZoomOutAtPoint:", x, y);

  return v6;
}

- (id)_accessibilityAutomaticIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = 0;
  }
  else
  {
    -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityAutomaticIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfAccessibilityElement:", self);

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v5, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)_accessibilitySetNativeFocus
{
  void *v4;
  char v5;
  objc_super v6;

  if (-[UIAccessibilityElementSuperCategory _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem")&& -[UIAccessibilityElementSuperCategory safeBoolForKey:](self, "safeBoolForKey:", CFSTR("canBecomeFocused")))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    return -[NSObject _accessibilitySetNativeFocus](&v6, sel__accessibilitySetNativeFocus);
  }
  else
  {
    -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilitySetNativeFocus");

    return v5;
  }
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  void *v2;
  char v3;

  -[UIAccessibilityElementSuperCategory accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewHierarchyHasNativeFocus");

  return v3;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 0;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  void *v2;
  char v3;

  -[NSObject _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsFKARunningForFocusItem");

  return v3;
}

- (id)focusGroupIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[NSObject _accessibilityParentView](self, "_accessibilityParentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_containingScrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementSuperCategory;
    -[NSObject focusGroupIdentifier](&v7, sel_focusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSObject _accessibilityDefaultFocusGroupIdentifier](self, "_accessibilityDefaultFocusGroupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
