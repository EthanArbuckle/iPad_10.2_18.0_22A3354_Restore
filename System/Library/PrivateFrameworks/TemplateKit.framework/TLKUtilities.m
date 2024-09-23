@implementation TLKUtilities

+ (BOOL)isMacOS
{
  return 0;
}

+ (double)standardTableCellContentInset
{
  int v2;
  double result;

  v2 = objc_msgSend(a1, "isLargePhone");
  result = 16.0;
  if (v2)
    return 20.0;
  return result;
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v6 = a4;
  v7 = (void (**)(_QWORD))a3;
  v8 = (void (**)(_QWORD))a5;
  v9 = v8;
  if (v6)
  {
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__TLKUtilities_performAnimatableChanges_animated_completion___block_invoke;
    v11[3] = &unk_1E5C06ED8;
    v12 = v8;
    objc_msgSend(v10, "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v7, v11);

  }
  else
  {
    v7[2](v7);
    if (v9)
      v9[2](v9);
  }

}

+ (BOOL)isPhone
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

+ (BOOL)isIpad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

+ (double)appIconCornerRadiusRatio
{
  double result;

  if ((TLKSnippetModernizationEnabled() & 1) != 0 || !+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
    return 0.225;
  objc_msgSend(a1, "standardRoundedCornerRadiusRatio");
  return result;
}

+ (BOOL)isLargePhone
{
  void *v2;
  BOOL v3;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v3 = CGRectGetWidth(v5) >= 414.0;

  return v3;
}

uint64_t __61__TLKUtilities_performAnimatableChanges_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)dispatchMainIfNecessary:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  objc_msgSend(v3, "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainThread");

  if (v5)
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __22__TLKUtilities_isSiri__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isSiri_isSiri = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.siri"));

}

+ (BOOL)isSiri
{
  if (isSiri_onceToken != -1)
    dispatch_once(&isSiri_onceToken, &__block_literal_global_16);
  return isSiri_isSiri;
}

+ (void)dispatchAsync:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = dispatchAsync__onceToken;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&dispatchAsync__onceToken, &__block_literal_global_0);
    v5 = v6;
  }
  dispatch_async((dispatch_queue_t)dispatchAsync__queue, v5);

}

void __30__TLKUtilities_dispatchAsync___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("tlkasyncqueue", attr);
  v2 = (void *)dispatchAsync__queue;
  dispatchAsync__queue = (uint64_t)v1;

}

+ (void)dispatchAsyncIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void (**v7)(void);

  v4 = (void *)MEMORY[0x1E0CB3978];
  v7 = (void (**)(void))a3;
  objc_msgSend(v4, "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainThread");

  if (v6)
    objc_msgSend(a1, "dispatchAsync:", v7);
  else
    v7[2]();

}

+ (void)executeBlock:(id)a3 async:(BOOL)a4
{
  if (a4)
    objc_msgSend(a1, "dispatchAsyncIfNecessary:", a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

+ (BOOL)deviceSupportsRotation
{
  void *v2;
  BOOL v3;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v3 = CGRectGetHeight(v5) > 667.0;

  return v3;
}

+ (double)pixelWidthForView:(id)a3
{
  double v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "tlks_scale");
  if (v3 == 0.0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "tlks_scale");
    v6 = v5;

  }
  else
  {
    v6 = v3;
  }
  return 1.0 / v6;
}

+ (double)standardRoundedCornerRadiusRatio
{
  int v2;
  _BOOL4 v3;
  double result;
  double v5;

  v2 = TLKSnippetModernizationEnabled();
  v3 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
  result = 0.166666667;
  if (v3)
    result = 0.1;
  v5 = 0.0666666667;
  if (v3)
    v5 = 0.0454545455;
  if (!v2)
    return v5;
  return result;
}

+ (id)testImageWithSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "testImageWithSize:text:", 0, a3.width, a3.height);
}

+ (id)testImageWithSize:(CGSize)a3 color:(id)a4
{
  return (id)objc_msgSend(a1, "testImageWithSize:text:color:", 0, a4, a3.width, a3.height);
}

+ (id)testImageWithSize:(CGSize)a3 text:(id)a4
{
  return (id)objc_msgSend(a1, "testImageWithSize:text:color:", a4, 0, a3.width, a3.height);
}

+ (id)testImageWithSize:(CGSize)a3 text:(id)a4 color:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  TLKImage *v17;
  TLKImage *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __45__TLKUtilities_testImageWithSize_text_color___block_invoke;
  v23 = &unk_1E5C06EB0;
  v26 = 0;
  v27 = 0;
  v28 = width;
  v29 = height;
  v24 = v12;
  v25 = v8;
  v30 = width;
  v31 = height;
  v14 = v8;
  v15 = v12;
  objc_msgSend(v13, "imageWithActions:", &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [TLKImage alloc];
  v18 = -[TLKImage initWithImage:](v17, "initWithImage:", v16, v20, v21, v22, v23);
  -[TLKImage setIsTemplate:](v18, "setIsTemplate:", v10 == 0);

  return v18;
}

void __45__TLKUtilities_testImageWithSize_text_color___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "set");
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = *(double *)(a1 + 80) * 0.05;
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontSize");
    v6 = v5;
    v7 = *(void **)(a1 + 40);
    v34 = *MEMORY[0x1E0DC32A0];
    v8 = v34;
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeWithAttributes:", v10);
    v12 = v11;

    v13 = floor(v6 * ((*(double *)(a1 + 80) + v4 * -2.0) / v12));
    v14 = *(void **)(a1 + 40);
    v32 = v8;
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeWithAttributes:", v16);
    v18 = v17;
    v20 = v19;

    CGContextSetBlendMode((CGContextRef)objc_msgSend(v3, "CGContext"), kCGBlendModeClear);
    objc_msgSend(MEMORY[0x1E0DC33B8], "defaultParagraphStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v22, "setAlignment:", 1);
    v23 = *(void **)(a1 + 40);
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", 0, (*(double *)(a1 + 80) - v18) * 0.5);
    v25 = v24;
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", 0, (*(double *)(a1 + 88) - v20) * 0.5);
    v27 = v26;
    v30[0] = v8;
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = *MEMORY[0x1E0DC32C0];
    v31[0] = v28;
    v31[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "drawInRect:withAttributes:", v29, v25, v27, v18, v20);

  }
}

+ (BOOL)recursivelyCheckIfSubviewTapped:(id)a3 forTappedView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 == v7)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_msgSend(v6, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v6, "subviews", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v10);
            v13 |= objc_msgSend(a1, "recursivelyCheckIfSubviewTapped:forTappedView:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v7);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13 & 1;
}

+ (void)performAnimatableChanges:(id)a3
{
  objc_msgSend(a1, "performAnimatableChanges:animated:", a3, 1);
}

+ (void)performAnimatableChanges:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(a1, "performAnimatableChanges:animated:completion:", a3, a4, 0);
}

+ (void)performWithoutAnimations:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", a3);
}

+ (BOOL)isWatchOS
{
  return 0;
}

+ (BOOL)isXROS
{
  return 0;
}

+ (BOOL)isShortcutsUI
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ShortcutsUI"));

  return v4;
}

+ (BOOL)isSafari
{
  if (isSafari_onceToken != -1)
    dispatch_once(&isSafari_onceToken, &__block_literal_global_22);
  return isSafari_isSafari;
}

void __24__TLKUtilities_isSafari__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isSafari_isSafari = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

}

+ (BOOL)isHiddenView:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isHidden");
  else
    return 1;
}

@end
