@implementation TVViewLayout

- (TVViewLayout)init
{
  TVViewLayout *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVViewLayout;
  result = -[TVViewLayout init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x24BDBD8B8];
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&result->_focusTransform.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&result->_focusTransform.c = v4;
    *(_OWORD *)&result->_focusTransform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (id)tv_layoutPropertySetterForStyle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (tv_layoutPropertySetterForStyle__onceToken != -1)
    dispatch_once(&tv_layoutPropertySetterForStyle__onceToken, &__block_literal_global_1);
  objc_msgSend((id)tv_layoutPropertySetterForStyle__map, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, TVViewLayout *))(v5 + 16))(v5, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x22767F470]();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[22];
  _QWORD v3[23];

  v3[22] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("margin");
  v2[1] = CFSTR("tv-focus-margin");
  v3[0] = &__block_literal_global_7;
  v3[1] = &__block_literal_global_9;
  v2[2] = CFSTR("padding");
  v2[3] = CFSTR("tv-interitem-spacing");
  v3[2] = &__block_literal_global_10;
  v3[3] = &__block_literal_global_11;
  v2[4] = CFSTR("tv-line-spacing");
  v2[5] = CFSTR("tv-align");
  v3[4] = &__block_literal_global_12;
  v3[5] = &__block_literal_global_13;
  v2[6] = CFSTR("tv-content-align");
  v2[7] = CFSTR("tv-position");
  v3[6] = &__block_literal_global_14_0;
  v3[7] = &__block_literal_global_15;
  v2[8] = CFSTR("width");
  v2[9] = CFSTR("height");
  v3[8] = &__block_literal_global_16;
  v3[9] = &__block_literal_global_17_0;
  v2[10] = CFSTR("max-height");
  v2[11] = CFSTR("max-width");
  v3[10] = &__block_literal_global_18;
  v3[11] = &__block_literal_global_19;
  v2[12] = CFSTR("min-height");
  v2[13] = CFSTR("min-width");
  v3[12] = &__block_literal_global_20_0;
  v3[13] = &__block_literal_global_21_0;
  v2[14] = CFSTR("background-color");
  v2[15] = CFSTR("tv-highlight-color");
  v3[14] = &__block_literal_global_22;
  v3[15] = &__block_literal_global_23;
  v2[16] = CFSTR("tv-focus-align");
  v2[17] = CFSTR("tv-focus-size-increase");
  v3[16] = &__block_literal_global_24;
  v3[17] = &__block_literal_global_25;
  v2[18] = CFSTR("tv-progress-style");
  v2[19] = CFSTR("tv-group");
  v3[18] = &__block_literal_global_26;
  v3[19] = &__block_literal_global_27;
  v2[20] = CFSTR("tv-text-highlight-style");
  v2[21] = CFSTR("tv-highlight-style");
  v3[20] = &__block_literal_global_28;
  v3[21] = &__block_literal_global_29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tv_layoutPropertySetterForStyle__map;
  tv_layoutPropertySetterForStyle__map = v0;

}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_3;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UIEdgeInsetsValue");
  return objc_msgSend(v2, "setMargin:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_5;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UIEdgeInsetsValue");
  return objc_msgSend(v2, "setFocusMargin:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_7;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UIEdgeInsetsValue");
  return objc_msgSend(v2, "setPadding:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_9;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setInteritemSpacing:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_11;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setLineSpacing:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_13;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlignment:", objc_msgSend(a2, "integerValue"));
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_15;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentAlignment:", objc_msgSend(a2, "integerValue"));
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_17;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPosition:", objc_msgSend(a2, "integerValue"));
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_19;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setWidth:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_21;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setHeight:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_23;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setMaxHeight:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_25;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_25(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setMaxWidth:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_27;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_27(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setMinHeight:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_29;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setMinWidth:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_31;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_31(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", a2);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_33;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_33(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlightColor:", a2);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_35;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_35(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFocusAlign:", a2);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_36(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_37;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_37(uint64_t a1, void *a2)
{
  void *v2;
  float v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "floatValue");
  return objc_msgSend(v2, "setFocusSizeIncrease:", v3);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_38(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_39;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_39(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProgressStyle:", a2);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_40(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_41;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_41(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setGroup:", a2);
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_42(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_43;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

void __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setTextHighlightStyle:", v3);

}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_44(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_45;
  v6[3] = &unk_24EB849D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertySetterForStyle___block_invoke_45(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlightStyle:", a2);
}

- (id)tv_layoutPropertyGetterForStyle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (tv_layoutPropertyGetterForStyle__onceToken != -1)
    dispatch_once(&tv_layoutPropertyGetterForStyle__onceToken, &__block_literal_global_31);
  objc_msgSend((id)tv_layoutPropertyGetterForStyle__map, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, TVViewLayout *))(v5 + 16))(v5, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x22767F470]();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[22];
  _QWORD v3[23];

  v3[22] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("margin");
  v2[1] = CFSTR("tv-focus-margin");
  v3[0] = &__block_literal_global_33;
  v3[1] = &__block_literal_global_36;
  v2[2] = CFSTR("padding");
  v2[3] = CFSTR("tv-interitem-spacing");
  v3[2] = &__block_literal_global_37;
  v3[3] = &__block_literal_global_39;
  v2[4] = CFSTR("tv-line-spacing");
  v2[5] = CFSTR("tv-align");
  v3[4] = &__block_literal_global_42;
  v3[5] = &__block_literal_global_43;
  v2[6] = CFSTR("tv-content-align");
  v2[7] = CFSTR("tv-position");
  v3[6] = &__block_literal_global_44;
  v3[7] = &__block_literal_global_45;
  v2[8] = CFSTR("width");
  v2[9] = CFSTR("height");
  v3[8] = &__block_literal_global_46;
  v3[9] = &__block_literal_global_47;
  v2[10] = CFSTR("max-height");
  v2[11] = CFSTR("max-width");
  v3[10] = &__block_literal_global_48;
  v3[11] = &__block_literal_global_49;
  v2[12] = CFSTR("min-height");
  v2[13] = CFSTR("min-width");
  v3[12] = &__block_literal_global_50;
  v3[13] = &__block_literal_global_51;
  v2[14] = CFSTR("background-color");
  v2[15] = CFSTR("tv-highlight-color");
  v3[14] = &__block_literal_global_53;
  v3[15] = &__block_literal_global_55;
  v2[16] = CFSTR("tv-focus-align");
  v2[17] = CFSTR("tv-focus-size-increase");
  v3[16] = &__block_literal_global_57;
  v3[17] = &__block_literal_global_59;
  v2[18] = CFSTR("tv-progress-style");
  v2[19] = CFSTR("tv-group");
  v3[18] = &__block_literal_global_60;
  v3[19] = &__block_literal_global_61;
  v2[20] = CFSTR("tv-text-highlight-style");
  v2[21] = CFSTR("tv-highlight-style");
  v3[20] = &__block_literal_global_62;
  v3[21] = &__block_literal_global_63;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tv_layoutPropertyGetterForStyle__map;
  tv_layoutPropertyGetterForStyle__map = v0;

}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_3;
  v6[3] = &unk_24EB84CF8;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_3(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(*(id *)(a1 + 32), "margin");
  return objc_msgSend(v1, "valueWithUIEdgeInsets:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_5;
  v6[3] = &unk_24EB84CF8;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_5(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(*(id *)(a1 + 32), "focusMargin");
  return objc_msgSend(v1, "valueWithUIEdgeInsets:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_7;
  v6[3] = &unk_24EB84CF8;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_7(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(*(id *)(a1 + 32), "padding");
  return objc_msgSend(v1, "valueWithUIEdgeInsets:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_9;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_9(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "interitemSpacing");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_11;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_11(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "lineSpacing");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_13;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "alignment"));
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_15;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "contentAlignment"));
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_17;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "position"));
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_19;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_19(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "width");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_21;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_21(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "height");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_23;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_23(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "maxHeight");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_25;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_25(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "maxWidth");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_27;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_27(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "minHeight");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_29;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_29(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "minWidth");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_31;
  v6[3] = &unk_24EB84F48;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_33;
  v6[3] = &unk_24EB84F48;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "highlightColor");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_35;
  v6[3] = &unk_24EB84FD0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "focusAlign");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_36(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_37;
  v6[3] = &unk_24EB84DA0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_37(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "focusSizeIncrease");
  return objc_msgSend(v1, "numberWithDouble:");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_38(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_39;
  v6[3] = &unk_24EB84FD0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "progressStyle");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_40(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_41;
  v6[3] = &unk_24EB84FD0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "group");
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_42(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_43;
  v6[3] = &unk_24EB84FD0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_43(uint64_t a1)
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "textHighlightStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_44(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_45;
  v6[3] = &unk_24EB84FD0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x22767F470](v6);

  return v4;
}

uint64_t __70__TVViewLayout_LayoutStyleAdditions__tv_layoutPropertyGetterForStyle___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "highlightStyle");
}

+ (Class)layoutClassForElement:(id)a3
{
  objc_msgSend(a3, "tv_elementType");
  return (Class)(id)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMargin:", self->_margin.top, self->_margin.left, self->_margin.bottom, self->_margin.right);
  objc_msgSend(v4, "setPadding:", self->_padding.top, self->_padding.left, self->_padding.bottom, self->_padding.right);
  objc_msgSend(v4, "setTintColor:", self->_tintColor);
  objc_msgSend(v4, "setDarkTintColor:", self->_darkTintColor);
  objc_msgSend(v4, "setBackgroundColor:", self->_backgroundColor);
  objc_msgSend(v4, "setDarkBackgroundColor:", self->_darkBackgroundColor);
  objc_msgSend(v4, "setHeight:", self->_height);
  objc_msgSend(v4, "setFocusMargin:", self->_focusMargin.top, self->_focusMargin.left, self->_focusMargin.bottom, self->_focusMargin.right);
  objc_msgSend(v4, "setMaxHeight:", self->_maxHeight);
  objc_msgSend(v4, "setMaxWidth:", self->_maxWidth);
  objc_msgSend(v4, "setMinHeight:", self->_minHeight);
  objc_msgSend(v4, "setMinWidth:", self->_minWidth);
  objc_msgSend(v4, "setWidth:", self->_width);
  objc_msgSend(v4, "setFocusSizeIncrease:", self->_focusSizeIncrease);
  objc_msgSend(v4, "setFocusAlign:", self->_focusAlign);
  objc_msgSend(v4, "setLineSpacing:", self->_lineSpacing);
  objc_msgSend(v4, "setAlignment:", self->_alignment);
  objc_msgSend(v4, "setContentAlignment:", self->_contentAlignment);
  objc_msgSend(v4, "setHighlightColor:", self->_highlightColor);
  objc_msgSend(v4, "setPosition:", self->_position);
  objc_msgSend(v4, "setAcceptsFocus:", self->_acceptsFocus);
  objc_msgSend(v4, "setCenterGrowth:", self->_centerGrowth);
  objc_msgSend(v4, "setHighlightStyle:", self->_highlightStyle);
  v5 = *(_OWORD *)&self->_focusTransform.c;
  v7[0] = *(_OWORD *)&self->_focusTransform.a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_focusTransform.tx;
  objc_msgSend(v4, "setFocusTransform:", v7);
  return v4;
}

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v5 = a3;
  v6 = a4;
  if (!v5)
    v5 = (id)objc_opt_new();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-tint-color"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "tv_tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setTintColor:", v10);
    objc_msgSend(v5, "setDarkTintColor:", v10);

  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-dark-tint-color"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "tv_darkTintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setDarkTintColor:", v13);
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("background-color"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "tv_backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setBackgroundColor:", v16);
    objc_msgSend(v5, "setDarkBackgroundColor:", v16);

  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("margin"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "tv_margin");
    objc_msgSend(v5, "setMargin:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-focus-margin"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v7, "tv_focusMargin");
    objc_msgSend(v5, "setFocusMargin:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("padding"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v7, "tv_padding");
    objc_msgSend(v5, "setPadding:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-interitem-spacing"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v7, "tv_interitemSpacing");
    objc_msgSend(v5, "setInteritemSpacing:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-line-spacing"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "tv_lineSpacing");
    objc_msgSend(v5, "setLineSpacing:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-align"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v5, "setAlignment:", objc_msgSend(v7, "tv_alignment"));
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-content-align"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v5, "setContentAlignment:", objc_msgSend(v7, "tv_contentAlignment"));
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-position"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v5, "setPosition:", objc_msgSend(v7, "tv_position"));
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("width"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v7, "tv_width");
    objc_msgSend(v5, "setWidth:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("height"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v7, "tv_height");
    objc_msgSend(v5, "setHeight:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("max-width"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v7, "tv_maxWidth");
    objc_msgSend(v5, "setMaxWidth:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("max-height"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v7, "tv_maxHeight");
    objc_msgSend(v5, "setMaxHeight:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("min-width"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v7, "tv_minWidth");
    objc_msgSend(v5, "setMinWidth:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("min-height"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v7, "tv_minHeight");
    objc_msgSend(v5, "setMinHeight:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-highlight-color"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v7, "tv_highlightColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "color");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightColor:", v33);

  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-focus-align"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v7, "tv_focusAlign");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFocusAlign:", v35);

  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-focus-size-increase"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v7, "tv_focusSizeIncrease");
    objc_msgSend(v5, "setFocusSizeIncrease:");
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-progress-style"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v7, "tv_progressStyle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProgressStyle:", v38);

  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-accepts-focus"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    objc_msgSend(v5, "setAcceptsFocus:", objc_msgSend(v7, "tv_acceptsFocus"));
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-highlight-style"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v7, "tv_highlightStyle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightStyle:", v41);

  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-focus-transform"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    if (v7)
    {
      objc_msgSend(v7, "tv_focusTransform");
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      v46 = 0u;
    }
    objc_msgSend(v5, "setFocusTransform:", &v46);
  }
  objc_msgSend(v7, "tv_valueForStyle:", CFSTR("tv-group"), v46, v47, v48);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v7, "tv_group");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGroup:", v44);

  }
  return v5;
}

- (double)focusSizeIncrease
{
  _BOOL4 v3;
  double result;

  v3 = -[TVViewLayout acceptsFocus](self, "acceptsFocus");
  result = 0.0;
  if (v3)
  {
    result = self->_focusSizeIncrease;
    if (result == 0.0)
      -[TVViewLayout defaultFocusSizeIncrease](self, "defaultFocusSizeIncrease");
  }
  return result;
}

- (UIEdgeInsets)margin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margin.top;
  left = self->_margin.left;
  bottom = self->_margin.bottom;
  right = self->_margin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIColor)darkTintColor
{
  return self->_darkTintColor;
}

- (void)setDarkTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkTintColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)darkBackgroundColor
{
  return self->_darkBackgroundColor;
}

- (void)setDarkBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_darkBackgroundColor, a3);
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UIEdgeInsets)focusMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_focusMargin.top;
  left = self->_focusMargin.left;
  bottom = self->_focusMargin.bottom;
  right = self->_focusMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFocusMargin:(UIEdgeInsets)a3
{
  self->_focusMargin = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)minWidth
{
  return self->_minWidth;
}

- (void)setMinWidth:(double)a3
{
  self->_minWidth = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (NSString)focusAlign
{
  return self->_focusAlign;
}

- (void)setFocusAlign:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (void)setContentAlignment:(int64_t)a3
{
  self->_contentAlignment = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (BOOL)acceptsFocus
{
  return self->_acceptsFocus;
}

- (void)setAcceptsFocus:(BOOL)a3
{
  self->_acceptsFocus = a3;
}

- (BOOL)centerGrowth
{
  return self->_centerGrowth;
}

- (void)setCenterGrowth:(BOOL)a3
{
  self->_centerGrowth = a3;
}

- (NSString)highlightStyle
{
  return self->_highlightStyle;
}

- (void)setHighlightStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (CGAffineTransform)focusTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].d;
  return self;
}

- (void)setFocusTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_focusTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_focusTransform.tx = v4;
  *(_OWORD *)&self->_focusTransform.a = v3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (NSString)progressStyle
{
  return self->_progressStyle;
}

- (void)setProgressStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_progressStyle, 0);
  objc_storeStrong((id *)&self->_highlightStyle, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_focusAlign, 0);
  objc_storeStrong((id *)&self->_darkBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_darkTintColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (double)defaultFocusSizeIncrease
{
  return 0.0;
}

@end
