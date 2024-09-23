@implementation UITutorialAnimatedView

- (UITutorialAnimatedView)initWithKeyboardAppearance:(int64_t)a3
{
  UITutorialAnimatedView *v4;
  UITutorialAnimatedView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITutorialAnimatedView;
  v4 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v5->_appearance = a3;
  }
  return v5;
}

- (void)setPackage:(id)a3
{
  CAPackage *v5;

  v5 = (CAPackage *)a3;
  if (self->_package != v5)
  {
    objc_storeStrong((id *)&self->_package, a3);
    -[UITutorialAnimatedView _setPackage:](self, "_setPackage:", v5);
  }

}

- (void)_setPackage:(id)a3
{
  id v4;
  CALayer *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  CALayer *packageLayer;
  CALayer *v33;
  void *v34;
  UITutorialAnimatedView *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CALayer removeFromSuperlayer](self->_packageLayer, "removeFromSuperlayer");
  objc_msgSend(v4, "rootLayer");
  v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
  v34 = v4;
  -[CALayer setGeometryFlipped:](v5, "setGeometryFlipped:", objc_msgSend(v4, "isGeometryFlipped"));
  -[CALayer setContentsGravity:](v5, "setContentsGravity:", *MEMORY[0x1E0CD2F90]);
  -[CALayer setMasksToBounds:](v5, "setMasksToBounds:", 1);
  -[UIView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v5);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = v5;
  -[CALayer sublayers](v5, "sublayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    v11 = *(double *)off_1E167DC78;
    v39 = *(_QWORD *)off_1E1678D90;
    v37 = *MEMORY[0x1E0CD2F78];
    v38 = v7;
    v35 = self;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            _UILocalizedStringInSystemLanguage(v14, v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "localizedUppercaseString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 34.0, v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v39;
            v45 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "sizeWithAttributes:", v19);
            v21 = v20;
            objc_msgSend(v13, "setFont:", v18);
            if (-[UITutorialAnimatedView appearance](self, "appearance") != 1)
            {
              +[UIColor systemDarkGrayColor](UIColor, "systemDarkGrayColor");
              v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v13, "setForegroundColor:", objc_msgSend(v22, "CGColor"));

              v7 = v38;
            }
            if (v21 > 150.0
              && objc_msgSend(v15, "isEqualToString:", CFSTR("Undo"))
              && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
            {
              objc_msgSend(v13, "setString:", &stru_1E16EDF20);
              if (-[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft)
                v23 = CFSTR("kb-undoHUD-redo");
              else
                v23 = CFSTR("kb-undoHUD-undo");
              +[UIImage _systemImageNamed:fallback:](UIImage, "_systemImageNamed:fallback:", v23, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "imageWithRenderingMode:", 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v36 = objc_retainAutorelease(v25);
              v26 = objc_msgSend(v36, "CGImage");
              objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setContents:", v26);
              objc_msgSend(v27, "setContentsGravity:", v37);
              objc_msgSend(v13, "bounds");
              v29 = v28;
              objc_msgSend(v13, "bounds");
              objc_msgSend(v27, "setFrame:", 0.0, 0.0, v29);
              +[UIColor labelColor](UIColor, "labelColor");
              v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));

              self = v35;
              objc_msgSend(v13, "setMask:", v27);
              objc_msgSend(v13, "setContentsGravity:", v37);

              v7 = v38;
            }
            else
            {
              objc_msgSend(v13, "setString:", v17);
            }

          }
        }
        ++v12;
      }
      while (v9 != v12);
      v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      v9 = v31;
    }
    while (v31);
  }

  packageLayer = self->_packageLayer;
  self->_packageLayer = v33;

}

- (void)drawRect:(CGRect)a3
{
  double width;
  double v5;
  double v6;
  CALayer *packageLayer;
  CGAffineTransform v8;
  CGAffineTransform v9;

  width = a3.size.width;
  -[CALayer setPosition:](self->_packageLayer, "setPosition:", a3.origin.x + a3.size.width * 0.5, a3.origin.y + a3.size.height * 0.5);
  -[CALayer size](self->_packageLayer, "size");
  v6 = v5;
  packageLayer = self->_packageLayer;
  if (packageLayer)
    -[CALayer contentsTransform](packageLayer, "contentsTransform");
  else
    memset(&v8, 0, sizeof(v8));
  CGAffineTransformScale(&v9, &v8, width / v6, width / v6);
  -[CALayer setAffineTransform:](packageLayer, "setAffineTransform:", &v9);
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (CAPackage)package
{
  return self->_package;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
}

@end
