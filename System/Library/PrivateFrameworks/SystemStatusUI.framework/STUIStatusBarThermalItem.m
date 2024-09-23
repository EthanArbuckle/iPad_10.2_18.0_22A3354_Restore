@implementation STUIStatusBarThermalItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D68];
}

- (id)imageForUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thermalEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "color");
  objc_msgSend(v4, "styleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageTintColor");
  v9 = objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarThermalItem _colorForThermalColor:imageTintColor:](self, "_colorForThermalColor:imageTintColor:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "styleAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageNamePrefixes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v12, "containsObject:", CFSTR("SystemUpdate_"));

  v13 = 15.0;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "styleAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageNamePrefixes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", CFSTR("Large_"));

    if (v16)
      v13 = 12.0;
    else
      v13 = 10.0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v13, v13);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __43__STUIStatusBarThermalItem_imageForUpdate___block_invoke;
  v22[3] = &unk_1E8D63FD0;
  v23 = v10;
  v24 = v6;
  v18 = v6;
  v19 = v10;
  objc_msgSend(v17, "imageWithActions:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __43__STUIStatusBarThermalItem_imageForUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  CGContext *CurrentContext;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "set");
  if (objc_msgSend(*(id *)(a1 + 40), "sunlightMode"))
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(CurrentContext, 3.0);
    objc_msgSend(v4, "format");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v4, "strokeRect:");
  }
  else
  {
    objc_msgSend(v4, "format");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v4, "fillRect:");
  }

}

- (id)_colorForThermalColor:(int64_t)a3 imageTintColor:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_colorBlendedWithColor:compositingFilter:", v8, *MEMORY[0x1E0CD2ED8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
