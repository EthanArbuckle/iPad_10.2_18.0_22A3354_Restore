@implementation CACBannerViewPresenter

+ (double)durationToDisplayMessageString:(id)a3
{
  return (double)(unint64_t)objc_msgSend(a3, "length") * 0.05 + 1.0;
}

- (CACBannerViewPresenter)initWithContainingView:(id)a3
{
  id v5;
  CACBannerViewPresenter *v6;
  CACBannerViewPresenter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACBannerViewPresenter;
  v6 = -[CACBannerViewPresenter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_containingView, a3);

  return v7;
}

- (void)_hideBannerView
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  -[CACBannerViewPresenter bannerView](self, "bannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACBannerViewPresenter setBannerView:](self, "setBannerView:", 0);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BEBDB00];
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __41__CACBannerViewPresenter__hideBannerView__block_invoke;
    v8[3] = &unk_24F2AA860;
    v9 = v3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __41__CACBannerViewPresenter__hideBannerView__block_invoke_2;
    v6[3] = &unk_24F2AB328;
    v7 = v9;
    objc_msgSend(v4, "animateWithDuration:animations:completion:", v8, v6, 0.3);

  }
}

uint64_t __41__CACBannerViewPresenter__hideBannerView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __41__CACBannerViewPresenter__hideBannerView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)presentBannerViewWithText:(id)a3 type:(int64_t)a4 avoidingSystemAperature:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  id v12;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "durationToDisplayMessageString:", v12);
  -[CACBannerViewPresenter presentBannerViewWithText:type:avoidingSystemAperature:duration:](self, "presentBannerViewWithText:type:avoidingSystemAperature:duration:", v12, a4, x, y, width, height, v11);

}

- (void)presentBannerViewWithText:(id)a3 type:(int64_t)a4 avoidingSystemAperature:(CGRect)a5 duration:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CACBannerView *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  CACBannerView *v73;
  int64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  _QWORD v78[6];
  _QWORD v79[5];
  uint64_t v80;
  void *v81;
  uint8_t buf[4];
  id v83;
  _QWORD v84[5];
  CGRect v85;
  CGRect v86;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v84[3] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideBannerView, 0);
  -[CACBannerViewPresenter containingView](self, "containingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 != 3)
  {
    -[CACBannerViewPresenter bannerView](self, "bannerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = objc_alloc_init(CACBannerView);
      -[CACBannerView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CACBannerViewPresenter containingView](self, "containingView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", v18);

      v73 = v18;
      -[CACBannerViewPresenter setBannerView:](self, "setBannerView:", v18);
      v85.origin.x = x;
      v85.origin.y = y;
      v85.size.width = width;
      v85.size.height = height;
      v76 = v13;
      v74 = a4;
      if (CGRectIsEmpty(v85))
      {
        -[CACBannerViewPresenter containingView](self, "containingView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "safeAreaInsets");
        v22 = v21;

        if (v22 == 0.0
          || (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v23, "userInterfaceIdiom"),
              v23,
              v25 = 0.0,
              v24 == 1))
        {
          v25 = 10.0;
        }
        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "topAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACBannerViewPresenter containingView](self, "containingView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "safeAreaLayoutGuide");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "topAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraintEqualToAnchor:constant:", v30, v25);
        v31 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "topAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACBannerViewPresenter containingView](self, "containingView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "topAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v86.origin.x = x;
        v86.origin.y = y;
        v86.size.width = width;
        v86.size.height = height;
        objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, CGRectGetMaxY(v86) + 10.0);
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v68 = (void *)v31;

      v67 = (void *)MEMORY[0x24BDD1628];
      v84[0] = v31;
      -[CACBannerViewPresenter containingView](self, "containingView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "safeAreaLayoutGuide");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "leadingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACBannerViewPresenter bannerView](self, "bannerView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v33;
      -[CACBannerViewPresenter containingView](self, "containingView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "safeAreaLayoutGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACBannerViewPresenter bannerView](self, "bannerView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v84[2] = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "activateConstraints:", v40);

      v13 = v76;
      v17 = 0;
      a4 = v74;
    }
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "additionalLoggingForCommands");

    switch(a4)
    {
      case 0:
      case 4:
        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setText:", v13);

        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setSymbolImage:", CFSTR("info.circle.fill"));

        if (v42)
        {
          CACLogAdditionalLogging();
          v45 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            goto LABEL_27;
          *(_DWORD *)buf = 138543362;
          v83 = v13;
          v46 = "Banner - Hint: %{public}@";
          goto LABEL_20;
        }
        break;
      case 1:
        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setText:", v13);

        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setSymbolImage:", CFSTR("exclamationmark.triangle.fill"));

        if (v42)
        {
          CACLogAdditionalLogging();
          v45 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            goto LABEL_27;
          *(_DWORD *)buf = 138543362;
          v83 = v13;
          v46 = "Banner - Error: %{public}@";
          goto LABEL_20;
        }
        break;
      case 2:
        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setText:", v13);

        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setSymbolImage:", 0);

        if (v42)
        {
          CACLogAdditionalLogging();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v83 = v13;
            v46 = "Banner - Command: %{public}@";
LABEL_20:
            _os_log_impl(&dword_229A40000, v45, OS_LOG_TYPE_INFO, v46, buf, 0xCu);
          }
          goto LABEL_27;
        }
        break;
      case 3:
        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setText:", v13);

        -[CACBannerViewPresenter bannerView](self, "bannerView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setSymbolImage:", 0);

        if (v42)
        {
          CACLogAdditionalLogging();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v83 = v13;
            _os_log_impl(&dword_229A40000, v53, OS_LOG_TYPE_INFO, "Banner - Title: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("\n"));
        v45 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)-[NSObject count](v45, "count") >= 2)
        {
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v13);
          -[NSObject firstObject](v45, "firstObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "length");

          -[NSObject firstObject](v45, "firstObject");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v57, "length");
          v77 = v17;
          v58 = objc_msgSend(v13, "length");
          -[NSObject firstObject](v45, "firstObject");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v58 - objc_msgSend(v59, "length");

          v61 = objc_alloc_init(MEMORY[0x24BEBD350]);
          objc_msgSend(v61, "setAlignment:", 1);
          objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "scaledValueForValue:", 4.0);
          objc_msgSend(v61, "setLineSpacing:");

          objc_msgSend(v54, "addAttribute:value:range:", *MEMORY[0x24BEBD298], v61, 0, objc_msgSend(v13, "length"));
          v80 = *MEMORY[0x24BEBD2D8];
          v81 = &unk_24F2CEBF8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addAttributes:range:", v63, 0, v56);

          objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addAttribute:value:range:", *MEMORY[0x24BEBD270], v64, v75, v60);
          -[CACBannerViewPresenter bannerView](self, "bannerView");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setAttributedText:", v54);

          v17 = v77;
        }
LABEL_27:

        break;
      default:
        break;
    }
    if (v17)
    {
      -[CACBannerViewPresenter performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideBannerView, 0, a6);
    }
    else
    {
      -[CACBannerViewPresenter bannerView](self, "bannerView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setAlpha:", 0.0);

      v79[0] = MEMORY[0x24BDAC760];
      v79[1] = 3221225472;
      v79[2] = __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke;
      v79[3] = &unk_24F2AA860;
      v79[4] = self;
      v78[0] = MEMORY[0x24BDAC760];
      v78[1] = 3221225472;
      v78[2] = __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke_2;
      v78[3] = &unk_24F2AB350;
      v78[4] = self;
      *(double *)&v78[5] = a6;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v79, v78, 0.3);
    }
  }

}

void __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "bannerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __90__CACBannerViewPresenter_presentBannerViewWithText_type_avoidingSystemAperature_duration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__hideBannerView, 0, *(double *)(a1 + 40));
}

- (void)dismissBannerView
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideBannerView, 0);
  -[CACBannerViewPresenter _hideBannerView](self, "_hideBannerView");
}

- (UIView)containingView
{
  return self->_containingView;
}

- (CACBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
}

@end
