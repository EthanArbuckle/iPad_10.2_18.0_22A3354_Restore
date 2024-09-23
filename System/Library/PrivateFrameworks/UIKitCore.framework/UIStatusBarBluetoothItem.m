@implementation UIStatusBarBluetoothItem

uint64_t __67___UIStatusBarBluetoothItem_alwaysShowRegulatoryBluetoothIndicator__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _MergedGlobals_1210 = result;
  return result;
}

void __55___UIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Height;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  CGRect v34;
  CGRect v35;

  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = a2;
  objc_msgSend(v3, "drawAtPoint:", v4, v5);
  objc_msgSend(v6, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  v9 = v8 + 1.0;
  v11 = v10 + -2.0;
  v13 = v12 + 2.0;
  v15 = v14 + -3.0;

  v34.origin.x = v9;
  v34.origin.y = v13;
  v34.size.width = v11;
  v34.size.height = v15;
  Height = CGRectGetHeight(v34);
  v17 = Height * (double)objc_msgSend(*(id *)(a1 + 40), "capacity") / 100.0;
  v35.origin.x = v9;
  v35.origin.y = v13;
  v35.size.width = v11;
  v35.size.height = v15;
  v18 = v13 + CGRectGetHeight(v35) - v17;
  objc_msgSend(*(id *)(a1 + 48), "styleAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayScale");
  v22 = UIRectIntegralWithScale(v9, v18, v11, v17, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = *(void **)(a1 + 56);
  v30 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "styleAttributes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "imageTintColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_batteryFillColorForEntry:usingTintColor:", v30, v32);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setFill");
  UIRectFillUsingOperation(1, v22, v24, v26, v28);

}

@end
