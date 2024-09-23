@implementation WAAQIViewStyler

+ (id)textColorWithLightLabel:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id v5;

  v3 = a3;
  if (textColorWithLightLabel__onceToken != -1)
    dispatch_once(&textColorWithLightLabel__onceToken, &__block_literal_global_19);
  v4 = (id)textColorWithLightLabel____solid;
  if (v3)
  {
    v5 = (id)textColorWithLightLabel____light;

    v4 = v5;
  }
  return v4;
}

void __43__WAAQIViewStyler_textColorWithLightLabel___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.600000024);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)textColorWithLightLabel____light;
  textColorWithLightLabel____light = v0;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)textColorWithLightLabel____solid;
  textColorWithLightLabel____solid = v2;

}

+ (id)shadowColor
{
  if (shadowColor_onceToken != -1)
    dispatch_once(&shadowColor_onceToken, &__block_literal_global_1_0);
  return (id)shadowColor___shadowColor;
}

void __30__WAAQIViewStyler_shadowColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shadowColor___shadowColor;
  shadowColor___shadowColor = v0;

}

- (id)styledAQIText:(id)a3 mode:(id)a4
{
  void *v4;
  unint64_t var1;
  unint64_t var0;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[3];

  var1 = a4.var1;
  var0 = a4.var0;
  v48[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (var1 == 1)
  {
    switch(var0)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x24BDF6600];
        v37[0] = *MEMORY[0x24BDF65F8];
        v37[1] = v14;
        v38[0] = v8;
        v38[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v38;
        v13 = v37;
        goto LABEL_15;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x24BDF6600];
        v35[0] = *MEMORY[0x24BDF65F8];
        v35[1] = v21;
        v36[0] = v8;
        v36[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v36;
        v13 = v35;
        goto LABEL_15;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x24BDF6600];
        v33[0] = *MEMORY[0x24BDF65F8];
        v33[1] = v22;
        v34[0] = v8;
        v34[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v34;
        v13 = v33;
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "wa_bold");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *MEMORY[0x24BDF6600];
        v31[0] = *MEMORY[0x24BDF65F8];
        v31[1] = v24;
        v32[0] = v8;
        v32[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v32;
        v13 = v31;
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "wa_bold");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *MEMORY[0x24BDF6600];
        v29[0] = *MEMORY[0x24BDF65F8];
        v29[1] = v26;
        v30[0] = v8;
        v30[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v30;
        v13 = v29;
LABEL_15:
        objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v27);

        break;
      default:
        break;
    }
  }
  else if (!var1)
  {
    switch(var0)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *MEMORY[0x24BDF6600];
        v47[0] = *MEMORY[0x24BDF65F8];
        v47[1] = v10;
        v48[0] = v8;
        v48[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v48;
        v13 = v47;
        goto LABEL_15;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x24BDF6600];
        v45[0] = *MEMORY[0x24BDF65F8];
        v45[1] = v15;
        v46[0] = v8;
        v46[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v46;
        v13 = v45;
        goto LABEL_15;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x24BDF6600];
        v43[0] = *MEMORY[0x24BDF65F8];
        v43[1] = v16;
        v44[0] = v8;
        v44[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v44;
        v13 = v43;
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "wa_bold");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x24BDF6600];
        v41[0] = *MEMORY[0x24BDF65F8];
        v41[1] = v18;
        v42[0] = v8;
        v42[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v42;
        v13 = v41;
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "wa_bold");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BDF6600];
        v39[0] = *MEMORY[0x24BDF65F8];
        v39[1] = v20;
        v40[0] = v8;
        v40[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v40;
        v13 = v39;
        goto LABEL_15;
      default:
        break;
    }
  }

  return v4;
}

- (id)styledAQILocalizedIndexText:(id)a3 mode:(id)a4
{
  void *v4;
  unint64_t var1;
  unint64_t var0;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];

  var1 = a4.var1;
  var0 = a4.var0;
  v44[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (var1 == 1)
  {
    switch(var0)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x24BDF6600];
        v33[0] = *MEMORY[0x24BDF65F8];
        v33[1] = v14;
        v34[0] = v8;
        v34[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v34;
        v13 = v33;
        goto LABEL_15;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7858]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x24BDF6600];
        v31[0] = *MEMORY[0x24BDF65F8];
        v31[1] = v19;
        v32[0] = v8;
        v32[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v32;
        v13 = v31;
        goto LABEL_15;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BDF6600];
        v29[0] = *MEMORY[0x24BDF65F8];
        v29[1] = v20;
        v30[0] = v8;
        v30[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v30;
        v13 = v29;
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x24BDF6600];
        v27[0] = *MEMORY[0x24BDF65F8];
        v27[1] = v21;
        v28[0] = v8;
        v28[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v28;
        v13 = v27;
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x24BDF6600];
        v25[0] = *MEMORY[0x24BDF65F8];
        v25[1] = v22;
        v26[0] = v8;
        v26[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v26;
        v13 = v25;
LABEL_15:
        objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v23);

        break;
      default:
        break;
    }
  }
  else if (!var1)
  {
    switch(var0)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *MEMORY[0x24BDF6600];
        v43[0] = *MEMORY[0x24BDF65F8];
        v43[1] = v10;
        v44[0] = v8;
        v44[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v44;
        v13 = v43;
        goto LABEL_15;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x24BDF6600];
        v41[0] = *MEMORY[0x24BDF65F8];
        v41[1] = v15;
        v42[0] = v8;
        v42[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v42;
        v13 = v41;
        goto LABEL_15;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x24BDF6600];
        v39[0] = *MEMORY[0x24BDF65F8];
        v39[1] = v16;
        v40[0] = v8;
        v40[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v40;
        v13 = v39;
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x24BDF6600];
        v37[0] = *MEMORY[0x24BDF65F8];
        v37[1] = v17;
        v38[0] = v8;
        v38[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v38;
        v13 = v37;
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x24BDF6600];
        v35[0] = *MEMORY[0x24BDF65F8];
        v35[1] = v18;
        v36[0] = v8;
        v36[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v36;
        v13 = v35;
        goto LABEL_15;
      default:
        break;
    }
  }

  return v4;
}

- (id)styledAQICategoryText:(id)a3 mode:(id)a4
{
  void *v4;
  unint64_t var1;
  unint64_t var0;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];

  var1 = a4.var1;
  var0 = a4.var0;
  v44[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (var1 == 1)
  {
    switch(var0)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x24BDF6600];
        v33[0] = *MEMORY[0x24BDF65F8];
        v33[1] = v14;
        v34[0] = v8;
        v34[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v34;
        v13 = v33;
        goto LABEL_15;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7858]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x24BDF6600];
        v31[0] = *MEMORY[0x24BDF65F8];
        v31[1] = v19;
        v32[0] = v8;
        v32[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v32;
        v13 = v31;
        goto LABEL_15;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BDF6600];
        v29[0] = *MEMORY[0x24BDF65F8];
        v29[1] = v20;
        v30[0] = v8;
        v30[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v30;
        v13 = v29;
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x24BDF6600];
        v27[0] = *MEMORY[0x24BDF65F8];
        v27[1] = v21;
        v28[0] = v8;
        v28[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v28;
        v13 = v27;
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *MEMORY[0x24BDF6600];
        v25[0] = *MEMORY[0x24BDF65F8];
        v25[1] = v22;
        v26[0] = v8;
        v26[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v26;
        v13 = v25;
LABEL_15:
        objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v23);

        break;
      default:
        break;
    }
  }
  else if (!var1)
  {
    switch(var0)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *MEMORY[0x24BDF6600];
        v43[0] = *MEMORY[0x24BDF65F8];
        v43[1] = v10;
        v44[0] = v8;
        v44[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v44;
        v13 = v43;
        goto LABEL_15;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x24BDF6600];
        v41[0] = *MEMORY[0x24BDF65F8];
        v41[1] = v15;
        v42[0] = v8;
        v42[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v42;
        v13 = v41;
        goto LABEL_15;
      case 2uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x24BDF6600];
        v39[0] = *MEMORY[0x24BDF65F8];
        v39[1] = v16;
        v40[0] = v8;
        v40[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v40;
        v13 = v39;
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x24BDF6600];
        v37[0] = *MEMORY[0x24BDF65F8];
        v37[1] = v17;
        v38[0] = v8;
        v38[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v38;
        v13 = v37;
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x24BDF6600];
        v35[0] = *MEMORY[0x24BDF65F8];
        v35[1] = v18;
        v36[0] = v8;
        v36[1] = v9;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v36;
        v13 = v35;
        goto LABEL_15;
      default:
        break;
    }
  }

  return v4;
}

- (id)styledDashWithLabelColor:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  else
    +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDF6600];
  v10[0] = *MEMORY[0x24BDF65F8];
  v10[1] = v6;
  v11[0] = v4;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("—"), v7);

  return v8;
}

- (id)styledAQIMetadataSourceText:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = *MEMORY[0x24BDF77C0];
  v5 = a3;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF6600];
  v12[0] = *MEMORY[0x24BDF65F8];
  v12[1] = v8;
  v13[0] = v6;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v9);

  return v10;
}

- (id)styledAQIMetadataGradeText:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = *MEMORY[0x24BDF7848];
  v5 = a3;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v8, "setLineSpacing:", 0.0);
  v9 = *MEMORY[0x24BDF6600];
  v13[0] = *MEMORY[0x24BDF65F8];
  v13[1] = v9;
  v14[0] = v6;
  v14[1] = v7;
  v13[2] = *MEMORY[0x24BDF6628];
  v14[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v10);

  return v11;
}

- (id)styledAQIMetadataRecommendationText:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF6A70];
  v4 = *MEMORY[0x24BDF77B0];
  v5 = a3;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v7, "setLineSpacing:", 0.0);
  +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDF6600];
  v13[0] = *MEMORY[0x24BDF65F8];
  v13[1] = v9;
  v14[0] = v6;
  v14[1] = v8;
  v13[2] = *MEMORY[0x24BDF6628];
  v14[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v10);

  return v11;
}

- (id)styledAQIMetadataCitationText:(id)a3 attribution:(id)a4 shouldInsertGlyph:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[4];

  v5 = a5;
  v22[3] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void *)MEMORY[0x24BDF6A70];
  v10 = *MEMORY[0x24BDF77C0];
  v11 = a3;
  objc_msgSend(v9, "preferredFontForTextStyle:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WAAQIViewStyler textColorWithLightLabel:](WAAQIViewStyler, "textColorWithLightLabel:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v14, "setLineSpacing:", 0.0);
  v15 = *MEMORY[0x24BDF6600];
  v21[0] = *MEMORY[0x24BDF65F8];
  v21[1] = v15;
  v22[0] = v12;
  v22[1] = v13;
  v21[2] = *MEMORY[0x24BDF6628];
  v22[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v11, v16);

  if (v8 && v5)
  {
    -[WAAQIViewStyler stringWithLogoImageFromText:attribution:attr:](self, "stringWithLogoImageFromText:attribution:attr:", v17, v8, v16);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v17;
  }
  v19 = v18;

  return v19;
}

- (id)stringWithLogoImageFromText:(id)a3 attribution:(id)a4 attr:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (void *)MEMORY[0x24BDF6AE0];
  v7 = *MEMORY[0x24BDF77C0];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v6, "configurationWithTextStyle:scale:", v7, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6768], "textAttachmentWithImage:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v9);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "addAttributes:range:", v8, 0, objc_msgSend(v15, "length"));
  objc_msgSend(v13, "appendAttributedString:", v15);

  return v13;
}

@end
