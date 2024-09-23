@implementation BSDescriptionBuilder

void __89__BSDescriptionBuilder_UIKitAdditions__ui_appendUserInterfaceIdiom_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  _NSStringFromUIUserInterfaceIdiom(v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

}

void __93__BSDescriptionBuilder_UIKitAdditions__ui_appendObject_withName_usingLightweightDescription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  id v9;

  v9 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  objc_msgSend(v9, "appendString:", v8);

}

uint64_t __64__BSDescriptionBuilder_UIKitAdditions__ui_appendFloat_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("%g"), *(_QWORD *)(a1 + 32));
}

uint64_t __82__BSDescriptionBuilder_UIKitAdditions__ui_appendVector_withName_decimalPrecision___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", CFSTR("{%.*g, %.*g}"), a1[4], a1[5], a1[4], a1[6]);
}

void __83__BSDescriptionBuilder_UIKitAdditions__ui_appendTransform_withName_skipIfIdentity___block_invoke(_OWORD *a1, void *a2)
{
  id v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  CGAffineTransform v7;

  v3 = a2;
  v4 = a1[3];
  *(_OWORD *)&v7.a = a1[2];
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = a1[4];
  if (CGAffineTransformIsIdentity(&v7))
  {
    objc_msgSend(v3, "appendString:", CFSTR("<CGAffineTransformIdentity>"));
  }
  else
  {
    v5 = a1[3];
    *(_OWORD *)&v7.a = a1[2];
    *(_OWORD *)&v7.c = v5;
    *(_OWORD *)&v7.tx = a1[4];
    NSStringFromCGAffineTransform(&v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

  }
}

void __93__BSDescriptionBuilder_UIKitAdditions__ui_appendInterfaceOrientation_withName_skipIfUnknown___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  BSInterfaceOrientationDescription();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

void __95__BSDescriptionBuilder_UIKitAdditions__ui_appendInterfaceOrientationMask_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  BSInterfaceOrientationMaskDescription();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

uint64_t __104__BSDescriptionBuilder_UIKitAdditions__ui_appendReferenceDisplayModeStatus_withName_skipIfNotSupported___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;
  const __CFString *v3;

  v2 = *(_QWORD *)(a1 + 32) - 1;
  if (v2 > 2)
    v3 = CFSTR("notSupported");
  else
    v3 = off_1E16C6A10[v2];
  return objc_msgSend(a2, "appendString:", v3);
}

void __107__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebugDescription_withName_skipIfNil___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "activeMultilinePrefix");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_orientationDebugDescriptionWithMultilinePrefix:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

}

id __114__BSDescriptionBuilder_UIKitOrientationDebugging__ui_appendOrientationDebuggingArraySection_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("    "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_orientationDebugDescriptionWithMultilinePrefix:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
