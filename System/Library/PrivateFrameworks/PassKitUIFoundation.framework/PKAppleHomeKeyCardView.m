@implementation PKAppleHomeKeyCardView

- (PKAppleHomeKeyCardView)initWithStyle:(int64_t)a3 text:(id)a4 font:(id)a5 textColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSURL *v14;
  NSURL *v15;
  int v16;
  NSURL *v17;
  NSURL *v18;
  BOOL v19;
  CGImage *v21;
  NSObject *v22;
  CGImage *v23;
  NSObject *v24;
  uint64_t v25;
  CGImage *v26;
  id *v27;
  PKAppleHomeKeyCardView *v28;
  NSObject *v29;
  id v30;
  id v31;
  CGImage *v33;
  id v34;
  _QWORD v35[7];
  int v36;
  uint8_t buf[16];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForResource:withExtension:", CFSTR("homekey-metalness"), CFSTR("png"));
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForResource:withExtension:", CFSTR("homekey-normal"), CFSTR("png"));
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 3)
  {
    v18 = 0;
LABEL_22:
    v28 = 0;
    goto LABEL_30;
  }
  v16 = dword_213A5D870[a3];
  objc_msgSend(v13, "URLForResource:withExtension:", off_24D0A0D80[a3], CFSTR("png"));
  v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    v19 = v14 == 0;
  else
    v19 = 1;
  if (v19 || v15 == 0)
    goto LABEL_22;
  v21 = (CGImage *)PKCreateCGImage(v17);
  if (!v21)
  {
    PKLogFacilityTypeGetObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A36000, v22, OS_LOG_TYPE_DEFAULT, "PKAppleHomeKeyCardView: could not load diffuse image.", buf, 2u);
    }

  }
  v34 = v10;
  v23 = (CGImage *)PKCreateCGImage(v14);
  if (!v23)
  {
    PKLogFacilityTypeGetObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A36000, v24, OS_LOG_TYPE_DEFAULT, "PKAppleHomeKeyCardView: could not load metalness image.", buf, 2u);
    }

  }
  v25 = PKCreateCGImage(v15);
  v26 = (CGImage *)v25;
  if (!v25)
  {
    v33 = v21;
    PKLogFacilityTypeGetObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A36000, v29, OS_LOG_TYPE_DEFAULT, "PKAppleHomeKeyCardView: could not load normal image.", buf, 2u);
    }

    v21 = v33;
    goto LABEL_26;
  }
  if (!v21 || !v23)
  {
LABEL_26:

    v27 = 0;
    goto LABEL_27;
  }
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __60__PKAppleHomeKeyCardView_initWithStyle_text_font_textColor___block_invoke;
  v35[3] = &__block_descriptor_60_e51___PKTexturedCardRenderer_16__0__PKMetalRenderLoop_8l;
  v35[4] = v21;
  v35[5] = v23;
  v35[6] = v25;
  v36 = v16;
  v27 = -[PKTexturedCardView _initWithPixelFormat:renderer:]((id *)&self->super.super.super.super.isa, 80, v35);
LABEL_27:
  CGImageRelease(v21);
  CGImageRelease(v23);
  CGImageRelease(v26);
  v10 = v34;
  if (v27)
  {
    v30 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    v31 = v27[59];
    v27[59] = v30;

    objc_msgSend(v27[59], "setNumberOfLines:", 1);
    objc_msgSend(v27[59], "setFont:", v11);
    objc_msgSend(v27[59], "setText:", v34);
    objc_msgSend(v27[59], "setTextColor:", v12);
    objc_msgSend(v27[59], "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v27[59], "setMinimumScaleFactor:", 0.8);
    objc_msgSend(v27, "addSubview:", v27[59]);
  }
  self = v27;
  v28 = self;
LABEL_30:

  return v28;
}

id *__60__PKAppleHomeKeyCardView_initWithStyle_text_font_textColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;

  v3 = a2;
  objc_msgSend(v3, "setColorSpace:", PKColorSpaceStandardRGB());
  v4 = -[PKTexturedCardRenderer initWithStyle:renderLoop:diffuse:metalness:normal:]((id *)[PKTexturedCardRenderer alloc], 1uLL, v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  -[PKTexturedCardRenderer setLightIntensity:]((uint64_t)v4, *(float *)(a1 + 56));
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double (**v12)(double);
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[5];
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)PKAppleHomeKeyCardView;
  -[PKTexturedCardView layoutSubviews](&v25, sel_layoutSubviews);
  -[PKAppleHomeKeyCardView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  PKPaymentPassScaleFactor();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __40__PKAppleHomeKeyCardView_layoutSubviews__block_invoke;
  v24[3] = &__block_descriptor_40_e8_d16__0d8l;
  v24[4] = v11;
  v12 = (double (**)(double))MEMORY[0x2199BB0CC](v24);
  v13 = v12[2](14.0);
  v14 = ((double (*)(double (**)(double), double))v12[2])(v12, 20.0);
  v15 = ((double (*)(double (**)(double), double))v12[2])(v12, 14.0);
  v16 = v4 + v14;
  v17 = v6 + v13;
  v18 = v8 - (v14 + ((double (*)(double (**)(double), double))v12[2])(v12, 20.0));
  v19 = v10 - (v13 + v15);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v18, v19);
  v22 = v21;
  if (v20 >= v18)
    v23 = v18;
  else
    v23 = v20;
  v26.origin.x = v16;
  v26.origin.y = v17;
  v26.size.width = v18;
  v26.size.height = v19;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", CGRectGetMaxX(v26) - v23, v17, v23, v22);

}

uint64_t __40__PKAppleHomeKeyCardView_layoutSubviews__block_invoke()
{
  return PKFloatRoundToPixelWithScale();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
