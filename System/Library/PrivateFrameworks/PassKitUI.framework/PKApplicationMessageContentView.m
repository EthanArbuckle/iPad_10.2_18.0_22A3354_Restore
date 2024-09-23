@implementation PKApplicationMessageContentView

- (PKApplicationMessageContentView)initWithCoder:(id)a3
{

  return 0;
}

- (PKApplicationMessageContentView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (uint64_t)initWithWidth:(void *)a1
{
  double v3;
  double v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id Label_0;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  if (!a1)
    return 0;
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v38.receiver = a1;
  v38.super_class = (Class)PKApplicationMessageContentView;
  v5 = objc_msgSendSuper2(&v38, sel_initWithFrame_, v3, v4, a2, 0.0);
  v6 = (uint64_t)v5;
  if (v5)
  {
    objc_msgSend(v5, "pkui_setMaskType:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "setBackgroundColor:", v7);

    objc_msgSend((id)v6, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = *(void **)(v6 + 560);
    *(_QWORD *)(v6 + 560) = v8;

    v10 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    v11 = *(void **)(v6 + 496);
    *(_QWORD *)(v6 + 496) = v10;

    Label_0 = CreateLabel_0(1, 0);
    v13 = *(void **)(v6 + 504);
    *(_QWORD *)(v6 + 504) = Label_0;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CreateLabel_0(3, v14);
    v16 = *(void **)(v6 + 512);
    *(_QWORD *)(v6 + 512) = v15;

    v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v18 = *(void **)(v6 + 488);
    *(_QWORD *)(v6 + 488) = v17;

    objc_msgSend(*(id *)(v6 + 488), "addSubview:", *(_QWORD *)(v6 + 496));
    objc_msgSend(*(id *)(v6 + 488), "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMasksToBounds:", 1);
    objc_msgSend(v19, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.21);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    objc_msgSend(*(id *)(v6 + 488), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(v6 + 504), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(v6 + 512), "setAlpha:", 0.0);
    v21 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v22 = *(void **)(v6 + 440);
    *(_QWORD *)(v6 + 440) = v21;

    objc_msgSend(*(id *)(v6 + 440), "setUserInteractionEnabled:", 0);
    objc_msgSend(*(id *)(v6 + 440), "setClipsToBounds:", 1);
    objc_msgSend(*(id *)(v6 + 440), "addSubview:", *(_QWORD *)(v6 + 488));
    objc_msgSend(*(id *)(v6 + 440), "addSubview:", *(_QWORD *)(v6 + 504));
    objc_msgSend(*(id *)(v6 + 440), "addSubview:", *(_QWORD *)(v6 + 512));
    objc_msgSend((id)v6, "addSubview:", *(_QWORD *)(v6 + 440));
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPreferredSymbolConfigurationForImage:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBaseForegroundColor:", v24);

    objc_msgSend(v23, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_initWeak(&location, (id)v6);
    v25 = (void *)MEMORY[0x1E0DC3428];
    v26 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __49__PKApplicationMessageContentView_initWithWidth___block_invoke;
    v35[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v25, "actionWithHandler:", v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v23, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(void **)(v6 + 432);
    *(_QWORD *)(v6 + 432) = v28;

    v30 = *(void **)(v6 + 432);
    v33[0] = v26;
    v33[1] = 3221225472;
    v33[2] = __49__PKApplicationMessageContentView_initWithWidth___block_invoke_2;
    v33[3] = &unk_1E3E78428;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v30, "setConfigurationUpdateHandler:", v33);
    objc_msgSend(*(id *)(v6 + 432), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(v6 + 432), "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    objc_msgSend(*(id *)(v6 + 432), "sizeToFit");
    objc_msgSend((id)v6, "addSubview:", *(_QWORD *)(v6 + 432));
    objc_msgSend((id)v6, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      -[PKApplicationMessageContentView _updateForTraitCollection:](v6, v31);
    else
      -[PKApplicationMessageContentView _updateSubviewsAnimated:](v6, 0);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __49__PKApplicationMessageContentView_initWithWidth___block_invoke(uint64_t a1)
{
  id v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_loadWeakRetained(WeakRetained + 76);
    objc_msgSend(v1, "applicationMessageContentViewDismissTapped:", WeakRetained);

  }
}

void __49__PKApplicationMessageContentView_initWithWidth___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = *MEMORY[0x1E0DC4A88];
  v5 = a2;
  objc_msgSend(v3, "configurationWithTextStyle:scale:", v4, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "configurationWithTraitCollection:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v13);
  objc_msgSend(v5, "setConfiguration:", v12);

}

- (void)_updateForTraitCollection:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)*MEMORY[0x1E0DC4A88];
    v5 = (void *)*MEMORY[0x1E0DC1398];
    v13 = v3;
    v6 = _PKFontForDesign(v3, (void *)*MEMORY[0x1E0DC1398], (void *)*MEMORY[0x1E0DC4A88], 4098, 0, 0);
    v7 = *(void **)(a1 + 568);
    *(_QWORD *)(a1 + 568) = v6;

    if (!*(_QWORD *)(a1 + 576))
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = _PKFontForDesign(v8, v5, v4, 4098, 0, 0);
      v10 = *(void **)(a1 + 576);
      *(_QWORD *)(a1 + 576) = v9;

    }
    v11 = _PKFontForDesign(v13, v5, (void *)*MEMORY[0x1E0DC4B10], 0x8000, 0, 0);
    v12 = *(void **)(a1 + 584);
    *(_QWORD *)(a1 + 584) = v11;

    objc_msgSend(*(id *)(a1 + 432), "setNeedsUpdateConfiguration");
    -[PKApplicationMessageContentView _updateSubviewsAnimated:](a1, 0);
    objc_msgSend((id)a1, "setNeedsLayout");
    v3 = v13;
  }

}

- (void)_updateSubviewsAnimated:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _DWORD *v10;
  PKApplicationMessageContentView_State *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t AtrributedString;
  id v47;
  uint64_t v48;
  id v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  void *v53;
  int v54;
  uint64_t v55;
  unsigned int v56;
  id v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  __int128 v62;
  int *v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  id v70;
  _DWORD *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  __n128 v81;
  int v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  __int128 v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  __CFString *v93;
  _DWORD *v94;
  char v95;
  int v96;
  id v97;
  id v98;
  _QWORD *v99;
  _QWORD aBlock[5];
  char v101;
  objc_super v102;
  __int128 v103;
  uint64_t v104;

  if (!a1)
    return;
  if (*(_BYTE *)(a1 + 592))
  {
    *(_BYTE *)(a1 + 593) = 1;
    return;
  }
  if (a2)
    PKUIViewLayoutIfNeeded((void *)a1, 1, 0);
  objc_msgSend(*(id *)(a1 + 584), "_bodyLeading");
  PKFloatRoundToPixel();
  v5 = v4 + 8.0;
  v6 = *(double *)(a1 + 520);
  v7 = *(double *)(a1 + 528);
  v8 = *(double *)(a1 + 536);
  v9 = *(double *)(a1 + 544);
  *(double *)(a1 + 520) = v5;
  *(_QWORD *)(a1 + 528) = 0x4030000000000000;
  *(double *)(a1 + 536) = v5;
  *(_QWORD *)(a1 + 544) = 0x4030000000000000;
  v10 = *(id *)(a1 + 552);
  v11 = [PKApplicationMessageContentView_State alloc];
  v12 = *(void **)(a1 + 600);
  v13 = *(void **)(a1 + 576);
  v14 = *(void **)(a1 + 568);
  v15 = *(void **)(a1 + 584);
  v95 = *(_BYTE *)(a1 + 594);
  v16 = v12;
  v17 = v13;
  v97 = v14;
  v98 = v15;
  v96 = a2;
  if (v11)
  {
    v102.receiver = v11;
    v102.super_class = (Class)PKApplicationMessageContentView_State;
    v18 = (id *)objc_msgSendSuper2(&v102, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 1, v12);
      objc_storeStrong(v19 + 6, v14);
      objc_storeStrong(v19 + 8, v15);
      v94 = v10;
      if (objc_msgSend(v16, "type"))
      {
        v20 = 0;
        v92 = 0;
      }
      else
      {
        objc_msgSend(v16, "contentTypeDefault");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "icon");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "title");
        v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "body");
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
LABEL_12:
          objc_msgSend(v20, "image");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v19 + 3, v20);
          v24 = v23;
          v25 = v24;
          v26 = v98;
          v91 = v16;
          v93 = (__CFString *)v21;
          if (v24)
          {
            switch(objc_msgSend(v24, "tintColor"))
            {
              case 1:
                objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 2:
                objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 3:
                objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 4:
                objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 5:
                objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 6:
                objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 7:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 8:
                objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 9:
                objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 10:
                objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 11:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 12:
                objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 13:
                objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 14:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 15:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 16:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 17:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 18:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 19:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 20:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 21:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 22:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
                v27 = objc_claimAutoreleasedReturnValue();
                goto LABEL_39;
              case 23:
                objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
                v27 = objc_claimAutoreleasedReturnValue();
LABEL_39:
                v28 = v27;
                v29 = 0;
                break;
              case 24:
                goto LABEL_15;
              default:
                v29 = 0;
                v28 = 0;
                break;
            }
          }
          else
          {
LABEL_15:
            v28 = 0;
            v29 = 1;
          }
          if (v28)
            v30 = 1;
          else
            v30 = v29;

          v31 = v19[5];
          v19[5] = (id)v28;

          v32 = v25;
          v33 = v17;
          if (v25)
          {
            v34 = objc_msgSend(v32, "type");
            if (v34 == 1)
            {
              v89 = v20;
              v90 = v17;
              if (v33)
                objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v33, 3);
              else
                objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "configurationWithTraitCollection:", v40);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = (void *)MEMORY[0x1E0DC3870];
              objc_msgSend(v32, "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "_systemImageNamed:withConfiguration:", v42, v36);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v37 = 1;
              v26 = v98;
LABEL_54:

              if (v25)
              {
                v20 = v89;
                if ((v30 | v37) == 1)
                {
                  objc_msgSend(v25, "imageWithRenderingMode:", 2);
                  v43 = objc_claimAutoreleasedReturnValue();

                  v25 = (void *)v43;
                }
                v38 = v90;
                v16 = v91;
              }
              else
              {
                v38 = v90;
                v16 = v91;
                v20 = v89;
              }
              goto LABEL_59;
            }
            if (!v34)
            {
              v89 = v20;
              v90 = v17;
              v35 = (void *)MEMORY[0x1E0DC3870];
              objc_msgSend(v32, "image");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "imageWithPKImage:", v36);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 0;
              goto LABEL_54;
            }
            v38 = v17;
            v25 = 0;
          }
          else
          {
            v38 = v17;
          }
          v16 = v91;
LABEL_59:

          v44 = v19[4];
          v19[4] = v25;

          v45 = v97;
          AtrributedString = CreateAtrributedString(v93, v97);
          v47 = v19[7];
          v19[7] = (id)AtrributedString;

          v48 = CreateAtrributedString(v92, v26);
          v49 = v19[9];
          v19[9] = (id)v48;

          v50 = v19[4] != 0;
          v51 = v19[7] != 0;
          v52 = v19[9] != 0;
          *((_BYTE *)v19 + 16) = v95;
          *((_BYTE *)v19 + 17) = v50;
          *((_BYTE *)v19 + 18) = v51;
          *((_BYTE *)v19 + 19) = v52;

          v10 = v94;
          v17 = v38;
          goto LABEL_62;
        }
      }
      v21 = &stru_1E3E7D690;
      goto LABEL_12;
    }
  }
  else
  {
    v19 = 0;
  }
  v45 = v97;
  v26 = v98;
LABEL_62:

  v53 = *(void **)(a1 + 552);
  *(_QWORD *)(a1 + 552) = v19;

  if (v10)
    v54 = v10[4];
  else
    v54 = 0;
  v55 = *(_QWORD *)(a1 + 552);
  if (v55)
  {
    v56 = *(_DWORD *)(v55 + 16);
    v55 = *(_QWORD *)(v55 + 24);
  }
  else
  {
    v56 = 0;
  }
  v57 = (id)v55;
  v58 = *(_QWORD **)(a1 + 552);
  if (v58)
    v58 = (_QWORD *)v58[7];
  v59 = v58;
  v60 = *(_QWORD **)(a1 + 552);
  if (v60)
    v60 = (_QWORD *)v60[9];
  v61 = v60;
  v62 = *(_OWORD *)(a1 + 464);
  v102 = *(objc_super *)(a1 + 448);
  v103 = v62;
  v104 = *(_QWORD *)(a1 + 480);
  *(double *)(a1 + 456) = v6;
  *(double *)(a1 + 464) = v7;
  *(double *)(a1 + 472) = v8;
  *(double *)(a1 + 480) = v9;
  v63 = &OBJC_IVAR___PKPassPaymentConfirmationView__showingSuccessResolution;
  if (v96)
  {
    v64 = 0.0;
    if ((v54 & 0x100) != 0 && (PKEqualObjects() & 1) == 0)
      v64 = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](a1, *(void **)(a1 + 488), 0, v6, v7, v8, v9), 0.0);
    if ((v54 & 0x10000) != 0 && (PKEqualObjects() & 1) == 0)
      v64 = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](a1, *(void **)(a1 + 504), 1, v6, v7, v8, v9), v64);
    if ((v54 & 0x1000000) != 0 && (PKEqualObjects() & 1) == 0)
      v64 = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](a1, *(void **)(a1 + 512), 1, v6, v7, v8, v9), v64);
    *(double *)(a1 + 448) = fmax(*(double *)(a1 + 448), v64 * 0.65);
  }
  v65 = *(_QWORD *)(a1 + 552);
  if (v65)
    v66 = *(_QWORD *)(v65 + 32);
  else
    v66 = 0;
  objc_msgSend(*(id *)(a1 + 496), "setImage:", v66);
  v67 = *(_QWORD *)(a1 + 552);
  if (v67)
    v68 = *(_QWORD *)(v67 + 40);
  else
    v68 = 0;
  objc_msgSend(*(id *)(a1 + 488), "setTintColor:", v68);
  if (objc_msgSend(*(id *)(a1 + 600), "type"))
    goto LABEL_92;
  v99 = v61;
  v69 = v59;
  v70 = v57;
  v71 = v10;
  objc_msgSend(*(id *)(a1 + 600), "contentTypeDefault");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "icon");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "image");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "type");

  if (!v75)
  {
    objc_msgSend(*(id *)(a1 + 488), "setBackgroundColor:", 0);
    goto LABEL_90;
  }
  v63 = &OBJC_IVAR___PKPassPaymentConfirmationView__showingSuccessResolution;
  if (v75 == 1)
  {
    v76 = *(void **)(a1 + 488);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setBackgroundColor:", v77);

LABEL_90:
    v63 = &OBJC_IVAR___PKPassPaymentConfirmationView__showingSuccessResolution;
  }

  v10 = v71;
  v57 = v70;
  v59 = v69;
  v61 = v99;
LABEL_92:
  v78 = *(void **)(a1 + 504);
  if (v78)
    objc_msgSend(v78, "setAttributedText:", v59);
  v79 = *(void **)(a1 + v63[543]);
  if (v79)
    objc_msgSend(v79, "setAttributedText:", v61);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKApplicationMessageContentView__updateSubviewsAnimated___block_invoke_2;
  aBlock[3] = &unk_1E3E78478;
  v101 = v96;
  aBlock[4] = a1;
  v80 = _Block_copy(aBlock);
  if (v96)
  {
    v82 = objc_msgSend((id)a1, "_shouldReverseLayoutDirection");
    objc_msgSend((id)a1, "bounds");
    if (v82)
      v87 = 0x200000101;
    else
      v87 = 0x200000001;
    v81.n128_f64[0] = -[PKApplicationMessageContentView _layoutWithContext:bounds:](a1, v87, v83, v84, v85, v86);
  }
  (*((void (**)(void *, _QWORD, _QWORD, __n128))v80 + 2))(v80, *(_QWORD *)(a1 + 432), v56 & 1, v81);
  (*((void (**)(void *, _QWORD, _QWORD))v80 + 2))(v80, *(_QWORD *)(a1 + 504), HIWORD(v56) & 1);
  (*((void (**)(void *, _QWORD, _QWORD))v80 + 2))(v80, *(_QWORD *)(a1 + 512), HIBYTE(v56) & 1);
  (*((void (**)(void *, _QWORD, _QWORD))v80 + 2))(v80, *(_QWORD *)(a1 + 488), (v56 >> 8) & 1);
  objc_msgSend((id)a1, "setNeedsLayout");
  PKUIViewLayoutIfNeeded((void *)a1, 0, 0);
  v88 = v103;
  *(objc_super *)(a1 + 448) = v102;
  *(_OWORD *)(a1 + 464) = v88;
  *(_QWORD *)(a1 + 480) = v104;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKApplicationMessageContentView;
  -[PKApplicationMessageContentView dealloc](&v2, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplicationMessageContentView;
  -[PKApplicationMessageContentView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PKApplicationMessageContentView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v4, "preferredContentSizeCategory"),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "preferredContentSizeCategory"),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKApplicationMessageContentView _updateForTraitCollection:]((uint64_t)self, v5);
  }

}

- (void)layoutSubviews
{
  unsigned int IsAnimated;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKApplicationMessageContentView;
  -[PKApplicationMessageContentView layoutSubviews](&v10, sel_layoutSubviews);
  IsAnimated = PKCATrackedLayoutIsAnimated();
  v4 = -[PKApplicationMessageContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKApplicationMessageContentView bounds](self, "bounds");
  v9 = 0x100000000;
  if (v4)
    v9 = 0x100000100;
  -[PKApplicationMessageContentView _layoutWithContext:bounds:]((uint64_t)self, v9 | IsAnimated, v5, v6, v7, v8);
}

- (double)_layoutWithContext:(double)a3 bounds:(double)a4
{
  unint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double *p_x;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  _QWORD *v58;
  _QWORD *v59;
  void *v60;
  char v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  double *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  double *v77;
  double *v78;
  double *v79;
  double *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  uint64_t v97;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v103;
  double v104;
  void *v105;
  unsigned int v108;
  double v109;
  CGFloat r1;
  uint64_t v111;
  double v112;
  double rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD aBlock[13];
  int v123;
  int v124;
  uint64_t v125;
  BOOL v126;
  BOOL v127;
  uint64_t v128;
  CGRect *v129;
  uint64_t v130;
  void *v131;
  CGRect v132;
  uint64_t v133;
  CGRect *v134;
  uint64_t v135;
  void *v136;
  CGRect v137;
  uint64_t v138;
  double *v139;
  uint64_t v140;
  double v141;
  _QWORD v142[19];
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  v142[16] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v10 = a2 & 0xFFFFFFFF00000000;
  v11 = (a2 & 0xFFFFFFFF00000000) == 0x100000000;
  objc_msgSend(*(id *)(a1 + 432), "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v111 = a1;
  objc_msgSend(*(id *)(a1 + 432), "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "alignmentRectInsets");
  PKSizeAlignedInRect();
  v18 = v14;
  v103 = v17;
  v104 = v15;
  v19 = v16;
  if (v11)
    objc_msgSend(*(id *)(v111 + 432), "setFrame:", v14, v15, v16, v17);
  v20 = v111;
  v21 = *(_QWORD *)(v111 + 552);
  if (!v21 || (v22 = v103, v23 = v104, (*(_BYTE *)(v21 + 16) & 1) == 0))
  {
    v18 = *MEMORY[0x1E0C9D628];
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v24 = *(double *)(v111 + 520);
  v25 = *(double *)(v111 + 528);
  v26 = a3 + v25;
  v27 = a4 + v24;
  v28 = a5 - (v25 + *(double *)(v111 + 544));
  v29 = a6 - (v24 + *(double *)(v111 + 536));
  r1 = v29;
  if (v10 == 0x100000000)
  {
    objc_msgSend(*(id *)(v111 + 440), "pkui_setFrame:animated:", a2 & 1, v26, v27, v28, v29);
    v29 = r1;
  }
  rect = *MEMORY[0x1E0C9D538];
  v109 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v30 = v26;
  v31 = v27;
  v32 = v28;
  v146.origin.x = v18;
  v146.origin.y = v23;
  v146.size.width = v19;
  v146.size.height = v22;
  v143 = CGRectIntersection(*(CGRect *)(&v29 - 3), v146);
  v144 = CGRectOffset(v143, -v26, -v27);
  y = v144.origin.y;
  x = v144.origin.x;
  height = v144.size.height;
  width = v144.size.width;
  if ((a2 & 0x100) != 0)
    v33 = 2;
  else
    v33 = 0x200000000;
  v34 = *(_QWORD *)(v111 + 552);
  if (v34)
    v108 = *(_DWORD *)(v34 + 16);
  else
    v108 = 0;
  v138 = 0;
  v139 = (double *)&v138;
  v140 = 0x2020000000;
  v145.origin.y = v109;
  v141 = v109;
  v133 = 0;
  v134 = (CGRect *)&v133;
  v135 = 0x4010000000;
  v136 = &unk_19E0C78CE;
  v128 = 0;
  v129 = (CGRect *)&v128;
  v130 = 0x4010000000;
  v131 = &unk_19E0C78CE;
  memset(&v132, 0, sizeof(v132));
  v145.origin.x = rect;
  v137.origin.x = rect;
  v137.origin.y = v109;
  v145.size.height = r1;
  v137.size.width = v28;
  v137.size.height = r1;
  v145.size.width = v28;
  CGRectDivide(v145, &v132, &v137, 45.0, (CGRectEdge)v33);
  v35 = *(_QWORD *)(v111 + 552);
  if (v35)
  {
    v36 = *(id *)(v35 + 24);
    v37 = v36;
    if (v36)
    {
      v38 = objc_msgSend(v36, "style");
      if (v38)
      {
        v20 = v111;
        if (v38 == 1)
        {
          PKPassFrontFaceContentSize();
          PKSizeScaleAspectFit();
          v39 = 4.0;
        }
        else
        {
          v39 = 0.0;
        }
        goto LABEL_22;
      }
      v20 = v111;
    }
  }
  else
  {
    v37 = 0;
  }
  PKSizeScaleAspectFit();
  v39 = 8.0;
LABEL_22:
  PKSizeAlignedInRect();
  rect_16 = v41;
  rect_24 = v40;
  rect_8 = v42;
  v117 = v43;
  if (HIDWORD(a2) == 1)
  {
    objc_msgSend(*(id *)(v20 + 488), "pkui_setCornerRadius:animated:", a2 & ((unsigned __int16)(v108 & 0x100) >> 8), v39);
    objc_msgSend(*(id *)(v111 + 488), "pkui_setFrame:animated:", a2 & ((unsigned __int16)(v108 & 0x100) >> 8), rect_24, rect_16, rect_8, v117);
  }
  if ((v108 & 0x100) != 0)
    v139[3] = fmax(v109 + v117, v139[3]);

  CGRectDivide(v134[1], v129 + 1, v134 + 1, 14.0, (CGRectEdge)v33);
  p_x = &v134->origin.x;
  v46 = v134[1].origin.x;
  v45 = v134[1].origin.y;
  v47 = v134[1].size.width;
  v48 = v134[1].size.height;
  v49 = v111;
  if (HIDWORD(a2) == 1)
  {
    objc_msgSend(*(id *)(v111 + 488), "bounds");
    v112 = v50;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    objc_msgSend(*(id *)(v111 + 496), "image");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v58 = *(_QWORD **)(v111 + 552);
      if (v58)
        v58 = (_QWORD *)v58[3];
      v59 = v58;
      objc_msgSend(v59, "image");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "hasBackground");

      if ((v61 & 1) != 0)
        objc_msgSend(v57, "pkui_alignmentSizeThatFills:", v54, v56);
      else
        objc_msgSend(v57, "pkui_alignmentSizeThatFits:maximumScale:", v54, v56, 1.0);
      v49 = v111;
      PKRectRoundToPixel();
      v52 = v63;
      v54 = v64;
      v56 = v65;
    }
    else
    {
      v62 = v112;
    }
    objc_msgSend(*(id *)(v49 + 496), "pkui_setFrame:animated:", a2 & ((v108 & 0x100) != 0), v52, v62, v54, v56);

    p_x = &v134->origin.x;
    v49 = v111;
  }
  if ((v108 & 0x100) != 0)
    v66 = v46;
  else
    v66 = rect;
  v67 = v109;
  if ((v108 & 0x100) != 0)
    v67 = v45;
  p_x[4] = v66;
  p_x[5] = v67;
  if ((v108 & 0x100) != 0)
    v68 = v47;
  else
    v68 = v28;
  if ((v108 & 0x100) != 0)
    v69 = v48;
  else
    v69 = r1;
  p_x[6] = v68;
  p_x[7] = v69;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKApplicationMessageContentView__layoutContentViewWithContext_bounds_occludedBounds___block_invoke;
  aBlock[3] = &unk_1E3E78450;
  *(CGFloat *)&aBlock[8] = x;
  *(CGFloat *)&aBlock[9] = y;
  *(CGFloat *)&aBlock[10] = width;
  *(CGFloat *)&aBlock[11] = height;
  aBlock[12] = v33;
  v123 = v33;
  v124 = 0;
  v126 = HIDWORD(a2) == 2;
  v127 = HIDWORD(a2) == 1;
  v125 = a2;
  aBlock[4] = v49;
  aBlock[5] = &v133;
  aBlock[6] = &v128;
  aBlock[7] = &v138;
  v105 = _Block_copy(aBlock);
  (*((void (**)(void *, _QWORD, _QWORD))v105 + 2))(v105, *(_QWORD *)(v111 + 504), HIWORD(v108) & 1);
  CGRectDivide(v134[1], v129 + 1, v134 + 1, 1.0, CGRectMinYEdge);
  (*((void (**)(void *, _QWORD, _QWORD))v105 + 2))(v105, *(_QWORD *)(v111 + 512), HIBYTE(v108) & 1);
  if (HIDWORD(a2) == 1)
  {
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v70 = *(id *)(v111 + 560);
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v118, v142, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v119;
      v73 = (double *)MEMORY[0x1E0DC49E8];
      do
      {
        v74 = 0;
        do
        {
          if (*(_QWORD *)v119 != v72)
            objc_enumerationMutation(v70);
          v75 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v74);
          if (v75)
          {
            v76 = *(_DWORD *)(v75 + 8);
            v77 = v73 + 1;
            v78 = v73 + 2;
            v79 = v73 + 3;
            v80 = (double *)(v75 + 24);
            if (v76)
            {
              v80 = v73;
            }
            else
            {
              v79 = (double *)(v75 + 48);
              v78 = (double *)(v75 + 40);
              v77 = (double *)(v75 + 32);
            }
            v81 = *v80;
            v82 = *v77;
            v83 = *v78;
            v84 = *v79;
            v75 = *(_QWORD *)(v75 + 16);
          }
          else
          {
            v76 = 0;
            v84 = 0.0;
            v83 = 0.0;
            v82 = 0.0;
            v81 = 0.0;
          }
          v85 = (id)v75;
          objc_msgSend(v85, "frame");
          v89 = v88 - (v84 + v82);
          v91 = v90 - (v83 + v81);
          if (v76)
          {
            v92 = v81 + v87;
            if (v76 == 1)
              PKSizeAlignedInRect();
            else
              v93 = v82 + v86;
          }
          else
          {
            PKSizeAlignedInRect();
            v92 = v94;
            v89 = v95;
            v91 = v96;
          }
          objc_msgSend(v85, "pkui_setFrame:animated:", a2 & 1, v93 - v82, v92 - v81, v89 - (-v84 - v82), v91 - (-v83 - v81));

          ++v74;
        }
        while (v71 != v74);
        v97 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v118, v142, 16);
        v71 = v97;
      }
      while (v97);
    }

  }
  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v138, 8);
  return a5;
}

void __87__PKApplicationMessageContentView__layoutContentViewWithContext_bounds_occludedBounds___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  CGFloat v9;
  CGRect *v10;
  int v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  double v37;
  _BOOL4 v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  id v45;
  __int128 v46;
  __int128 v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v46 = *(_OWORD *)(v6 + 32);
  v47 = *(_OWORD *)(v6 + 48);
  v45 = v5;
  objc_msgSend(v5, "pkui_sizeThatFits:", *(double *)(v6 + 48), 1.79769313e308);
  v44 = v7;
  v9 = v8;
  v10 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
  v48.origin.x = v10[1].origin.x;
  v48.origin.y = v10[1].origin.y;
  ++v10;
  v48.size.width = v10->size.width;
  v48.size.height = v10->size.height;
  CGRectDivide(v48, (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v10, v9, CGRectMinYEdge);
  v11 = *(_DWORD *)(a1 + 100);
  v12 = *(double *)(a1 + 64);
  v13 = *(double *)(a1 + 72);
  v14 = *(double *)(a1 + 80);
  v15 = *(double *)(a1 + 88);
  v49 = CGRectStandardize(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  v51.origin.x = v12;
  v51.origin.y = v13;
  v51.size.width = v14;
  v51.size.height = v15;
  v50 = CGRectIntersection(v49, v51);
  v20 = v50.origin.x;
  v21 = v50.origin.y;
  v22 = v50.size.width;
  v23 = v50.size.height;
  if (CGRectIsNull(v50))
  {
    v24 = v44;
LABEL_3:
    v25 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
    v25[4] = x;
    v25[5] = y;
    v25[6] = width;
    v25[7] = height;
    v26 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
    if (v26 < v24)
      objc_msgSend(v45, "pkui_sizeThatFits:", v26, 1.79769313e308);
    PKSizeAlignedInRect();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = *(unsigned __int8 *)(a1 + 120);
    if (*(_BYTE *)(a1 + 120))
    {
      objc_msgSend(v45, "alpha");
      v36 = 0;
      v38 = v37 <= 0.0;
      if (*(_BYTE *)(a1 + 120))
      {
        if (v37 > 0.0)
        {
          objc_msgSend(v45, "frame");
          v38 = 0;
          v36 = v33 != v39;
          if (v35 != v40)
            v36 = 1;
        }
      }
    }
    else
    {
      v38 = 1;
    }
    if (*(_BYTE *)(a1 + 121))
      goto LABEL_33;
    if (!*(_BYTE *)(a1 + 120))
      v38 = 1;
    if (((v38 | v36) & 1) == 0)
    {
LABEL_33:
      if (*(_BYTE *)(a1 + 112))
        v41 = a3;
      else
        v41 = 0;
      objc_msgSend(v45, "pkui_setFrame:animated:", v41, v29, v31, v33, v35);
      if (a3)
        goto LABEL_20;
    }
    else
    {
      if (v36)
        *(double *)(*(_QWORD *)(a1 + 32) + 448) = fmax(-[PKApplicationMessageContentView _prepareViewForReuse:type:state:](*(_QWORD *)(a1 + 32), v45, 1, *(double *)(*(_QWORD *)(a1 + 32) + 456), *(double *)(*(_QWORD *)(a1 + 32) + 464), *(double *)(*(_QWORD *)(a1 + 32) + 472), *(double *)(*(_QWORD *)(a1 + 32) + 480))* 0.65, *(double *)(*(_QWORD *)(a1 + 32) + 448));
      if (a3)
      {
LABEL_20:
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = fmax(v31 + v35, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)+ 8)+ 24));
LABEL_26:

        return;
      }
    }
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_OWORD *)(v42 + 32) = v46;
    *(_OWORD *)(v42 + 48) = v47;
    goto LABEL_26;
  }
  v24 = v44;
  switch(v11)
  {
    case 0:
      v27 = x + width;
      x = fmin(v20 + v22, x + width);
      width = v27 - x;
      goto LABEL_3;
    case 1:
      v43 = y + height;
      y = fmin(v21 + v23, y + height);
      height = v43 - y;
      goto LABEL_3;
    case 2:
      width = fmax(v20 - x, 0.0);
      goto LABEL_3;
    case 3:
      height = fmax(v21 - y, 0.0);
      goto LABEL_3;
    default:
      __break(1u);
      break;
  }
}

- (double)_prepareViewForReuse:(int)a3 type:(double)a4 state:(double)a5
{
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  PKApplicationMessageContentView_SubviewSnapshot *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id *v53;
  id *v54;
  id *v55;
  id v56;
  id *v57;
  id v58;
  double v59;
  void *v60;
  double v62;
  double v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id *v69;
  objc_super v70;

  v13 = a2;
  v14 = v13;
  if (a1)
  {
    objc_msgSend(v13, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      objc_msgSend(v14, "snapshotViewAfterScreenUpdates:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v14, "frame");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(v14, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "presentationLayer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "anchorPoint");
          v30 = v29;
          v62 = v31;
          objc_msgSend(v28, "position");
          v32 = a5;
          v33 = a7;
          v35 = v34;
          v63 = a4;
          v36 = a6;
          v38 = v37;
          objc_msgSend(v28, "bounds");
          v23 = v39;
          v25 = v40;
          v19 = v35 - v30 * v39;
          a7 = v33;
          a5 = v32;
          v21 = v38 - v62 * v40;
          a6 = v36;
          a4 = v63;
        }
        objc_msgSend(v17, "setFrame:", v19, v21, v23, v25);
        objc_msgSend(v15, "addSubview:", v17);
        objc_msgSend(v17, "layer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setAllowsGroupOpacity:", objc_msgSend(v26, "allowsGroupOpacity"));
        objc_msgSend(v26, "compositingFilter");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setCompositingFilter:", v42);

        v43 = [PKApplicationMessageContentView_SubviewSnapshot alloc];
        objc_msgSend(v14, "alignmentRectInsets");
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v52 = v17;
        if (v43)
        {
          v70.receiver = v43;
          v70.super_class = (Class)PKApplicationMessageContentView_SubviewSnapshot;
          v53 = (id *)objc_msgSendSuper2(&v70, sel_init);
          v54 = v53;
          if (v53)
          {
            objc_storeStrong(v53 + 2, v17);
            v54[3] = v45;
            v54[4] = v47;
            v54[5] = v49;
            v54[6] = v51;
            *((_DWORD *)v54 + 2) = a3;
            *((double *)v54 + 7) = a4;
            *((double *)v54 + 8) = a5;
            *((double *)v54 + 9) = a6;
            *((double *)v54 + 10) = a7;
          }
          v55 = v54;
        }
        else
        {
          v55 = 0;
        }

        v56 = *(id *)(a1 + 560);
        objc_msgSend(v56, "addObject:", v55);
        v16 = MEMORY[0x1E0C809B0];
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke;
        v66[3] = &unk_1E3E62E98;
        v67 = v52;
        v68 = v56;
        v69 = v55;
        v57 = v55;
        v58 = v56;
        v70.receiver = 0;
        _PKViewSetAlphaAnimated(v67, v66, (double *)&v70, 0.0, 0.0);
        v59 = *(double *)&v70.receiver;

      }
      else
      {
        v59 = 0.0;
      }

    }
    else
    {
      v59 = 0.0;
    }
    v60 = (void *)MEMORY[0x1E0DC3F10];
    v64[0] = v16;
    v64[1] = 3221225472;
    v64[2] = __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke_2;
    v64[3] = &unk_1E3E612E8;
    v65 = v14;
    objc_msgSend(v60, "performWithoutAnimation:", v64);

  }
  else
  {
    v59 = 0.0;
  }

  return v59;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[PKApplicationMessageContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v6 = 256;
  else
    v6 = 0;
  v7 = -[PKApplicationMessageContentView _layoutWithContext:bounds:]((uint64_t)self, v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)performBatchUpdates:(uint64_t)a3 animated:
{
  void (**v5)(void);
  int v6;
  void (**v7)(void);

  v5 = a2;
  if (a1 && v5)
  {
    v7 = v5;
    if (a1[592])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKApplicationMessageContentView recursive batch updates are not supported."));
    if ((_DWORD)a3)
      objc_msgSend(a1, "layoutIfNeeded");
    a1[592] = 1;
    v7[2]();
    a1[592] = 0;
    v6 = a1[593];
    a1[593] = 0;
    if (v6)
      -[PKApplicationMessageContentView _updateSubviewsAnimated:]((uint64_t)a1, a3);
    else
      PKUIViewLayoutIfNeeded(a1, a3, 0);
    v5 = v7;
  }

}

void __59__PKApplicationMessageContentView__updateSubviewsAnimated___block_invoke_2(uint64_t a1, void *a2, unsigned int a3)
{
  double v3;
  double v4;
  uint64_t v5;

  v3 = (double)a3;
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = 0.0;
    if (a3)
      v4 = *(double *)(*(_QWORD *)(a1 + 32) + 448);
    v5 = 0;
    _PKViewSetAlphaAnimated(a2, 0, (double *)&v5, v3, v4);
  }
  else
  {
    objc_msgSend(a2, "pkui_setAlpha:animated:", 0, v3);
  }
}

uint64_t __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 48));
}

void __67__PKApplicationMessageContentView__prepareViewForReuse_type_state___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(v2, "clearHasBeenCommitted");

}

- (void)setContent:(int)a3 animated:
{
  id v6;
  id v7;

  v6 = a2;
  if (a1 && *(id *)(a1 + 600) != v6)
  {
    v7 = v6;
    if (a3 && !*(_BYTE *)(a1 + 592))
      objc_msgSend((id)a1, "layoutIfNeeded");
    objc_storeStrong((id *)(a1 + 600), a2);
    -[PKApplicationMessageContentView _updateSubviewsAnimated:](a1, a3);
    v6 = v7;
  }

}

- (void)setDismissable:(int)a3 animated:
{
  char v3;

  if (a1)
  {
    v3 = a2;
    if (a1[594] != a2)
    {
      if (a3)
      {
        if (!a1[592])
          objc_msgSend(a1, "layoutIfNeeded");
      }
      a1[594] = v3;
      -[PKApplicationMessageContentView _updateSubviewsAnimated:]((uint64_t)a1, a3);
    }
  }
}

- (void)setBlurRadius:(void *)a3 animated:(double)a4 withCompletion:
{
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD, _QWORD);
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (a1)
  {
    if (*(double *)(a1 + 424) == a4)
    {
      if (v7)
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
    else
    {
      if (!*(_QWORD *)(a1 + 416))
      {
        v9 = objc_alloc(MEMORY[0x1E0CD2780]);
        v10 = objc_msgSend(v9, "initWithType:", *MEMORY[0x1E0CD2C88]);
        v11 = *(void **)(a1 + 416);
        *(_QWORD *)(a1 + 416) = v10;

        objc_msgSend(*(id *)(a1 + 416), "setName:", CFSTR("blur"));
        objc_msgSend((id)a1, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = *(_QWORD *)(a1 + 416);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFilters:", v13);

      }
      objc_msgSend((id)a1, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("filters.blur.inputRadius"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", *(double *)(a1 + 424), a4);
        if (v8)
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __73__PKApplicationMessageContentView_setBlurRadius_animated_withCompletion___block_invoke;
          v18[3] = &unk_1E3E614F0;
          v19 = v8;
          objc_msgSend(v15, "pkui_setCompletionHandler:", v18);

        }
        v16 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v15);

      }
      *(double *)(a1 + 424) = a4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKeyPath:", v17, CFSTR("filters.blur.inputRadius"));

      if (v8 && (a2 & 1) == 0)
        v8[2](v8, 1);

    }
  }

}

uint64_t __73__PKApplicationMessageContentView_setBlurRadius_animated_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_regularFont, 0);
  objc_storeStrong((id *)&self->_fixedSignificantFont, 0);
  objc_storeStrong((id *)&self->_significantFont, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconContainer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dismiss, 0);
  objc_storeStrong((id *)&self->_blurFilter, 0);
}

@end
