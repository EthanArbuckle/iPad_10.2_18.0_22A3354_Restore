@implementation UIApplication

void __104__UIApplication_UIAccessibilityElementTraversal___accessibilityAddKeyboardWindowToArray_forModalWindow___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  char v17;
  id v18;

  v18 = a2;
  if (!v18)
    goto LABEL_18;
  if ((objc_msgSend(*(id *)(a1 + 32), "_accessibilityIsModalWithKeyboard") & 1) == 0)
  {
    objc_msgSend(v18, "windowLevel");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "windowLevel");
    if (vabdd_f64(v4, v5) >= 3.0)
    {
      objc_msgSend(v18, "windowLevel");
      if (v6 != *MEMORY[0x1E0CEBB18])
        goto LABEL_18;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "windowLevel");
  v8 = v7;
  objc_msgSend(v18, "windowLevel");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isOnScreen") & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_currentInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_9:
    v14 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySoftwareKeyboardActive") ^ 1;
    goto LABEL_10;
  }
  LOBYTE(v14) = 0;
LABEL_10:
  if ((objc_msgSend(v18, "isHidden") & 1) == 0)
  {
    v15 = *(id *)(a1 + 32);
    if (v15 != v18)
    {
      v16 = objc_msgSend(v15, "_accessibilityIsModalWithKeyboard");
      if (v8 > v10)
        v17 = 1;
      else
        v17 = v14;
      if (v16 || (v17 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "axSafelyAddObject:", v18);
    }
  }
LABEL_18:

}

void __106__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityAllWindowsOnlyVisibleWindows:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v3 = a2;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;

  v18 = *(void **)(a1 + 32);
  v26[0] = v15;
  v26[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v26, "{CGPoint=dd}");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "windowScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "activationState");

  if (!v22)
    objc_msgSend(v20, "addObject:", v3);
  v23 = *(void **)(a1 + 32);
  v25[0] = v15;
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v25, "{CGPoint=dd}");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v24);

}

BOOL __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = a2;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;

  objc_msgSend(*(id *)(a1 + 32), "CGPointValue");
  return v17 == v19 && v15 == v18;
}

uint64_t __79__UIApplication_UIAccessibilityInitialization___accessibilityIsSystemAppServer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityUpdateIsSystemAppServer");
}

uint64_t __68__UIApplication_UIAccessibility___accessibilityIsAppReadyToBeProbed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("_isActivating"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

@end
