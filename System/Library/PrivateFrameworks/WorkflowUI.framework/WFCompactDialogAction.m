@implementation WFCompactDialogAction

+ (id)actionForButton:(id)a3 handler:(id)a4
{
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCompactDialogAction.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dialogButton"));

  }
  v10 = objc_opt_new();
  v11 = (_QWORD *)v10;
  if (v10)
  {
    objc_storeStrong((id *)(v10 + 16), a3);
    v12 = objc_msgSend(v9, "copy");
    v13 = (void *)v11[5];
    v11[5] = v12;

  }
  return v11;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = a3;
  self->_enabled = a3;
  -[WFCompactDialogAction uiButton](self, "uiButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  if (v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __36__WFCompactDialogAction_setEnabled___block_invoke;
    v7[3] = &unk_24E604D88;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, 0, 0.2);
  }
  else
  {
    -[WFCompactDialogAction uiButton](self, "uiButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.5);

  }
}

- (UIButton)uiButton
{
  UIButton *uiButton;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  UIButton *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  UIButton *v41;
  void *v42;
  void *v43;
  id v44;
  UIButton *v45;
  void *v46;
  void *v47;
  UIButton *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  UIButton *v57;
  void *v58;
  void *v59;
  UIButton *v60;
  void *v61;
  void *v62;
  UIButton *v63;
  void *v64;
  UIButton *v65;
  UIButton *v66;
  UIButton *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[4];
  UIButton *v72;
  _QWORD v73[4];
  UIButton *v74;
  _QWORD v75[4];
  UIButton *v76;
  _QWORD v77[4];
  id v78;
  UIButton *v79;
  _QWORD v80[4];
  id v81;
  UIButton *v82;
  _QWORD v83[4];
  id v84;
  UIButton *v85;
  _QWORD v86[6];

  uiButton = self->_uiButton;
  if (uiButton)
    return uiButton;
  -[WFCompactDialogAction appearanceProvider](self, "appearanceProvider");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[WFCompactDialogAction appearanceProvider](self, "appearanceProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[WFCompactDialogAction appearanceProvider](self, "appearanceProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "buttonForWFCompactDialogAction:", self);
      v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v11 = self->_uiButton;
      self->_uiButton = v10;

      uiButton = self->_uiButton;
      return uiButton;
    }
  }
  v12 = (void *)MEMORY[0x24BEBD430];
  v86[0] = MEMORY[0x24BDAC760];
  v86[1] = 3221225472;
  v86[2] = __33__WFCompactDialogAction_uiButton__block_invoke;
  v86[3] = &unk_24E604660;
  v86[4] = self;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithHandler:", v86);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "buttonWithType:primaryAction:", 0, v13);
  v14 = (UIButton *)objc_claimAutoreleasedReturnValue();

  -[WFCompactDialogAction dialogButton](self, "dialogButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v14, "setTitle:forState:", v16, 0);

  -[WFCompactDialogAction dialogButton](self, "dialogButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "style");

  -[WFCompactDialogAction dialogButton](self, "dialogButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "style") == 1)
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v21, "pointSize");
  objc_msgSend(v22, "systemFontOfSize:weight:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scaledFontForFont:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](v14, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v24);

  -[UIButton titleLabel](v14, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAdjustsFontForContentSizeCategory:", 1);

  v27 = *MEMORY[0x24BEBE0B8];
  -[UIButton titleLabel](v14, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setMaximumContentSizeCategory:", v27);

  -[UIButton setTitleColor:forState:](v14, "setTitleColor:forState:", v19, 0);
  v29 = *MEMORY[0x24BDE58E8];
  -[UIButton layer](v14, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCornerCurve:", v29);

  -[UIButton layer](v14, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCornerRadius:", 25.0);

  -[UIButton layer](v14, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMasksToBounds:", 1);

  -[UIButton setPointerStyleProvider:](v14, "setPointerStyleProvider:", &__block_literal_global_15283);
  -[WFCompactDialogAction dialogButton](self, "dialogButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "style");

  v70 = (void *)v19;
  if (v34 == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1200);
    v69 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v69, 6);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v68);
    -[UIButton bounds](v14, "bounds");
    objc_msgSend(v35, "setFrame:");
    objc_msgSend(v35, "setAutoresizingMask:", 18);
    objc_msgSend(v35, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBackgroundColor:", v36);

    -[UIButton insertSubview:atIndex:](v14, "insertSubview:atIndex:", v35, 0);
    -[UIButton setPointerInteractionEnabled:](v14, "setPointerInteractionEnabled:", 0);
    v38 = (void *)MEMORY[0x24BEBD388];
    v39 = MEMORY[0x24BDAC760];
    v83[0] = MEMORY[0x24BDAC760];
    v83[1] = 3221225472;
    v83[2] = __33__WFCompactDialogAction_uiButton__block_invoke_3;
    v83[3] = &unk_24E6046C8;
    v40 = v35;
    v84 = v40;
    v41 = v14;
    v85 = v41;
    objc_msgSend(v38, "actionWithHandler:", v83);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v41, "addAction:forControlEvents:", v42, 1);

    v43 = (void *)MEMORY[0x24BEBD388];
    v80[0] = v39;
    v80[1] = 3221225472;
    v80[2] = __33__WFCompactDialogAction_uiButton__block_invoke_5;
    v80[3] = &unk_24E6046C8;
    v44 = v40;
    v81 = v44;
    v45 = v41;
    v82 = v45;
    objc_msgSend(v43, "actionWithHandler:", v80);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v45, "addAction:forControlEvents:", v46, 16);

    v47 = (void *)MEMORY[0x24BEBD388];
    v77[0] = v39;
    v77[1] = 3221225472;
    v77[2] = __33__WFCompactDialogAction_uiButton__block_invoke_7;
    v77[3] = &unk_24E6046C8;
    v78 = v44;
    v48 = v45;
    v79 = v48;
    v49 = v44;
    objc_msgSend(v47, "actionWithHandler:", v77);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v48, "addAction:forControlEvents:", v50, 352);

    v51 = (void *)v69;
  }
  else
  {
    -[WFCompactDialogAction dialogButton](self, "dialogButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "style");

    if (v53 == 2)
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    else
      -[UIButton tintColor](v14, "tintColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v14, "setBackgroundColor:", v54);

    v55 = (void *)MEMORY[0x24BEBD388];
    v56 = MEMORY[0x24BDAC760];
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __33__WFCompactDialogAction_uiButton__block_invoke_9;
    v75[3] = &unk_24E604660;
    v57 = v14;
    v76 = v57;
    objc_msgSend(v55, "actionWithHandler:", v75);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v57, "addAction:forControlEvents:", v58, 1);

    v59 = (void *)MEMORY[0x24BEBD388];
    v73[0] = v56;
    v73[1] = 3221225472;
    v73[2] = __33__WFCompactDialogAction_uiButton__block_invoke_11;
    v73[3] = &unk_24E604660;
    v60 = v57;
    v74 = v60;
    objc_msgSend(v59, "actionWithHandler:", v73);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v60, "addAction:forControlEvents:", v61, 16);

    v62 = (void *)MEMORY[0x24BEBD388];
    v71[0] = v56;
    v71[1] = 3221225472;
    v71[2] = __33__WFCompactDialogAction_uiButton__block_invoke_13;
    v71[3] = &unk_24E604660;
    v63 = v60;
    v72 = v63;
    objc_msgSend(v62, "actionWithHandler:", v71);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v63, "addAction:forControlEvents:", v64, 352);

    v51 = v76;
  }

  v65 = self->_uiButton;
  self->_uiButton = v14;
  v66 = v14;

  v67 = self->_uiButton;
  return v67;
}

- (void)invokeHandler
{
  void (**v2)(void);
  void (**v3)(void);

  -[WFCompactDialogAction handler](self, "handler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)setAppearanceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProvider, a3);
}

- (WFDialogButton)dialogButton
{
  return self->_dialogButton;
}

- (void)setUiButton:(id)a3
{
  objc_storeStrong((id *)&self->_uiButton, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_uiButton, 0);
  objc_storeStrong((id *)&self->_dialogButton, 0);
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeHandler");
}

void __33__WFCompactDialogAction_uiButton__block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__WFCompactDialogAction_uiButton__block_invoke_4;
  v3[3] = &unk_24E604E80;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v3, 0, 0.07);

}

void __33__WFCompactDialogAction_uiButton__block_invoke_5(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__WFCompactDialogAction_uiButton__block_invoke_6;
  v3[3] = &unk_24E604E80;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v3, 0, 0.25);

}

void __33__WFCompactDialogAction_uiButton__block_invoke_7(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__WFCompactDialogAction_uiButton__block_invoke_8;
  v3[3] = &unk_24E604E80;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v3, 0, 0.25);

}

void __33__WFCompactDialogAction_uiButton__block_invoke_9(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __33__WFCompactDialogAction_uiButton__block_invoke_10;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.07);

}

void __33__WFCompactDialogAction_uiButton__block_invoke_11(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __33__WFCompactDialogAction_uiButton__block_invoke_12;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.25);

}

void __33__WFCompactDialogAction_uiButton__block_invoke_13(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __33__WFCompactDialogAction_uiButton__block_invoke_14;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.25);

}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.699999988);
}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.699999988);
}

void __33__WFCompactDialogAction_uiButton__block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __33__WFCompactDialogAction_uiButton__block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.5);

  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.5);

}

void __33__WFCompactDialogAction_uiButton__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.5);

  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.5);

}

uint64_t __33__WFCompactDialogAction_uiButton__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BEBD848], "styleWithEffect:shape:", a3, 0);
}

void __36__WFCompactDialogAction_setEnabled___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "uiButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

@end
