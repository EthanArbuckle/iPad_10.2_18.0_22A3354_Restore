@implementation BSDescriptionBuilder(UIKitAdditions)

- (id)ui_appendUserInterfaceIdiom:()UIKitAdditions withName:skipIfEmpty:
{
  _QWORD v7[5];

  if (a3 != -1 || (a5 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__BSDescriptionBuilder_UIKitAdditions__ui_appendUserInterfaceIdiom_withName_skipIfEmpty___block_invoke;
    v7[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v7[4] = a3;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", a4, v7);
  }
  return a1;
}

- (uint64_t)ui_appendUserInterfaceIdiom:()UIKitAdditions withName:
{
  return objc_msgSend(a1, "ui_appendUserInterfaceIdiom:withName:skipIfEmpty:", a3, a4, 0);
}

- (void)ui_appendObject:()UIKitAdditions withName:usingLightweightDescription:
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v9 = v8;
  if (v8 && a5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__BSDescriptionBuilder_UIKitAdditions__ui_appendObject_withName_usingLightweightDescription___block_invoke;
    v12[3] = &unk_1E16B8250;
    v13 = v8;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", a4, v12);

  }
  else
  {
    v10 = (id)objc_msgSend(a1, "appendObject:withName:", v8, a4);
  }

  return a1;
}

- (void)ui_appendArray:()UIKitAdditions withName:skipIfEmpty:
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count") || (a5 & 1) == 0)
    v10 = (id)objc_msgSend(a1, "appendObject:withName:", v8, v9);

  return a1;
}

- (void)ui_appendSet:()UIKitAdditions withName:skipIfEmpty:
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count") || (a5 & 1) == 0)
    v10 = (id)objc_msgSend(a1, "appendObject:withName:", v8, v9);

  return a1;
}

- (void)ui_appendFloat:()UIKitAdditions withName:
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__BSDescriptionBuilder_UIKitAdditions__ui_appendFloat_withName___block_invoke;
  v6[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
  *(double *)&v6[4] = a2;
  objc_msgSend(a1, "appendCustomFormatWithName:block:", a4, v6);
  return a1;
}

- (void)ui_appendPoint3D:()UIKitAdditions withName:
{
  id v10;
  void *v11;
  id v12;

  v10 = a6;
  _NSStringFromCAPoint3D(a2, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(a1, "appendObject:withName:", v11, v10);

  return a1;
}

- (uint64_t)ui_appendVector:()UIKitAdditions withName:
{
  return objc_msgSend(a1, "ui_appendVector:withName:decimalPrecision:", a3, -1);
}

- (void)ui_appendVector:()UIKitAdditions withName:decimalPrecision:
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[7];
  CGVector v15;

  v10 = a5;
  if (a6 == -1)
  {
    v15.dx = a2;
    v15.dy = a3;
    NSStringFromCGVector(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(a1, "appendObject:withName:", v11, v10);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__BSDescriptionBuilder_UIKitAdditions__ui_appendVector_withName_decimalPrecision___block_invoke;
    v14[3] = &__block_descriptor_56_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v14[4] = a6;
    *(CGFloat *)&v14[5] = a2;
    *(CGFloat *)&v14[6] = a3;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", v10, v14);
  }

  return a1;
}

- (void)ui_appendEdgeInsets:()UIKitAdditions withName:
{
  id v12;
  void *v13;
  UIEdgeInsets v15;

  v12 = a7;
  v15.top = a2;
  v15.left = a3;
  v15.bottom = a4;
  v15.right = a5;
  NSStringFromUIEdgeInsets(v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendString:withName:", v13, v12);

  return a1;
}

- (void)ui_appendCornerRadii:()UIKitAdditions withName:
{
  id v12;
  void *v13;

  v12 = a7;
  NSStringFromUIRectCornerRadii(a2, a3, a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendString:withName:", v13, v12);

  return a1;
}

- (void)ui_appendInteger:()UIKitAdditions withName:ifNotEqualTo:
{
  id v6;

  if (a3 != a5)
    v6 = (id)objc_msgSend(a1, "appendInteger:withName:");
  return a1;
}

- (void)ui_appendFloat:()UIKitAdditions withName:ifNotEqualTo:
{
  id v4;

  if (a2 != a3)
    v4 = (id)objc_msgSend(a1, "ui_appendFloat:withName:");
  return a1;
}

- (void)ui_appendRect:()UIKitAdditions withName:ifNotEqualTo:
{
  id v20;
  id v21;
  CGRect v23;
  CGRect v24;

  v20 = a11;
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  v24.origin.x = a6;
  v24.origin.y = a7;
  v24.size.width = a8;
  v24.size.height = a9;
  if (!CGRectEqualToRect(v23, v24))
    v21 = (id)objc_msgSend(a1, "appendRect:withName:", v20, a2, a3, a4, a5);

  return a1;
}

- (id)ui_appendTransform:()UIKitAdditions withName:
{
  __int128 v4;
  _OWORD v6[3];

  v4 = a3[1];
  v6[0] = *a3;
  v6[1] = v4;
  v6[2] = a3[2];
  objc_msgSend(a1, "ui_appendTransform:withName:skipIfIdentity:", v6, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ui_appendTransform:()UIKitAdditions withName:skipIfIdentity:
{
  id v8;
  __int128 v9;
  __int128 v10;
  id v11;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;

  v8 = a4;
  v9 = a3[1];
  *(_OWORD *)&v17.a = *a3;
  *(_OWORD *)&v17.c = v9;
  *(_OWORD *)&v17.tx = a3[2];
  if (!CGAffineTransformIsIdentity(&v17) || (a5 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__BSDescriptionBuilder_UIKitAdditions__ui_appendTransform_withName_skipIfIdentity___block_invoke;
    v13[3] = &__block_descriptor_80_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v10 = a3[1];
    v14 = *a3;
    v15 = v10;
    v16 = a3[2];
    objc_msgSend(a1, "appendCustomFormatWithName:block:", v8, v13);
  }
  v11 = a1;

  return v11;
}

- (uint64_t)ui_appendInterfaceOrientation:()UIKitAdditions withName:
{
  return objc_msgSend(a1, "ui_appendInterfaceOrientation:withName:skipIfUnknown:", a3, a4, 0);
}

- (id)ui_appendInterfaceOrientation:()UIKitAdditions withName:skipIfUnknown:
{
  _QWORD v7[5];

  if (a3 || (a5 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __93__BSDescriptionBuilder_UIKitAdditions__ui_appendInterfaceOrientation_withName_skipIfUnknown___block_invoke;
    v7[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v7[4] = a3;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", a4, v7);
  }
  return a1;
}

- (uint64_t)ui_appendInterfaceOrientationMask:()UIKitAdditions withName:
{
  return objc_msgSend(a1, "ui_appendInterfaceOrientationMask:withName:skipIfEmpty:", a3, a4, 0);
}

- (id)ui_appendInterfaceOrientationMask:()UIKitAdditions withName:skipIfEmpty:
{
  _QWORD v7[5];

  if (a3 || (a5 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__BSDescriptionBuilder_UIKitAdditions__ui_appendInterfaceOrientationMask_withName_skipIfEmpty___block_invoke;
    v7[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v7[4] = a3;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", a4, v7);
  }
  return a1;
}

- (uint64_t)ui_appendReferenceDisplayModeStatus:()UIKitAdditions withName:
{
  return objc_msgSend(a1, "ui_appendReferenceDisplayModeStatus:withName:skipIfNotSupported:", a3, a4, 0);
}

- (id)ui_appendReferenceDisplayModeStatus:()UIKitAdditions withName:skipIfNotSupported:
{
  _QWORD v7[5];

  if (a3 || (a5 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __104__BSDescriptionBuilder_UIKitAdditions__ui_appendReferenceDisplayModeStatus_withName_skipIfNotSupported___block_invoke;
    v7[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    v7[4] = a3;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", a4, v7);
  }
  return a1;
}

@end
