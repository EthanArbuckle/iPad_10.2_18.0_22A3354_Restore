@implementation SBIconLabelAccessoryView

+ (NSString)labelAccessorySystemImageName
{
  return (NSString *)&stru_1E8D8E958;
}

+ (int64_t)labelAccessorySystemImageScale
{
  return 0;
}

- (SBIconLabelAccessoryView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This class does not support unarchiving from a nib"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "labelAccessorySystemImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, objc_msgSend((id)objc_opt_class(), "labelAccessorySystemImageScale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    SBLogIcon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:].cold.1((uint64_t)v8, v11);

  }
  -[SBIconLabelAccessoryView setBaseImage:](self, "setBaseImage:", v10);
  -[SBIconLabelAccessoryView updateWithBaseImage:legibilitySettings:](self, "updateWithBaseImage:legibilitySettings:", v10, v7);

  -[SBIconLabelAccessoryView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBIconLabelAccessoryView baseImage](self, "baseImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)hasBaseline
{
  return 0;
}

- (double)baselineOffsetFromBottom
{
  return 0.0;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIImage)baseImage
{
  return self->_baseImage;
}

- (void)setBaseImage:(id)a3
{
  objc_storeStrong((id *)&self->_baseImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImage, 0);
}

- (void)updateWithLegibilitySettings:(uint64_t)a1 labelFont:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Failed to find system image named '%{public}@' for label accessory view!", (uint8_t *)&v2, 0xCu);
}

@end
