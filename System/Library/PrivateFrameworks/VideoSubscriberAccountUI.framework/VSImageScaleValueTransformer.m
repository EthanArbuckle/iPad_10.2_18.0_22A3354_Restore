@implementation VSImageScaleValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MidX;
  CGFloat v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;

  v4 = a3;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[VSImageScaleValueTransformer preferredSize](self, "preferredSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "size");
  v13 = fmin(v8 / v11, v10 / v12);
  v14 = v11 * v13;
  v15 = v12 * v13;
  v29.origin.x = v5;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = v5;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v17 = CGRectGetMidY(v30) + v15 * -0.5;
  v18 = objc_alloc(MEMORY[0x24BDF6A98]);
  -[VSImageScaleValueTransformer preferredSize](self, "preferredSize");
  v19 = (void *)objc_msgSend(v18, "initWithSize:");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __49__VSImageScaleValueTransformer_transformedValue___block_invoke;
  v23[3] = &unk_24FE196B0;
  v24 = v4;
  v25 = MidX + v14 * -0.5;
  v26 = v17;
  v27 = v14;
  v28 = v15;
  v20 = v4;
  objc_msgSend(v19, "imageWithActions:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __49__VSImageScaleValueTransformer_transformedValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

@end
