@implementation PKApplicationMessageView

void __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (++*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= *(unsigned __int8 *)(a1 + 48))
    {
      v3 = WeakRetained;
      -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:]((uint64_t)WeakRetained, 0);
      WeakRetained = v3;
    }
  }

}

void __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (++*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= *(unsigned __int8 *)(a1 + 48))
    {
      v3 = WeakRetained;
      -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:]((uint64_t)WeakRetained, 0);
      WeakRetained = v3;
    }
  }

}

uint64_t __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

- (PKApplicationMessageView)init
{

  return 0;
}

- (PKApplicationMessageView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKApplicationMessageView)initWithConfiguration:(id)a3
{
  PKApplicationMessageView *v3;

  if (a3)
  {
    self = (PKApplicationMessageView *)(id)-[PKApplicationMessageView _initWithType:configuration:]((uint64_t)self, 2, a3);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)_initWithType:(void *)a3 configuration:
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  id location;
  objc_super v37;

  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v10 = v6 ? *((double *)v6 + 1) : 0.0;
    v37.receiver = (id)a1;
    v37.super_class = (Class)PKApplicationMessageView;
    v11 = objc_msgSendSuper2(&v37, sel_initWithFrame_, v8, v9, v10, 0.0);
    a1 = (uint64_t)v11;
    if (v11)
    {
      *((_QWORD *)v11 + 94) = a2;
      objc_storeStrong((id *)v11 + 92, a3);
      *(_BYTE *)(a1 + 536) = 1;
      *(_QWORD *)(a1 + 528) = 0x7FEFFFFFFFFFFFFFLL;
      *(_DWORD *)(a1 + 620) = 0;
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = *(void **)(a1 + 656);
      *(_QWORD *)(a1 + 656) = v12;

      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = *(void **)(a1 + 664);
      *(_QWORD *)(a1 + 664) = v14;

      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = *(void **)(a1 + 672);
      *(_QWORD *)(a1 + 672) = v16;

      *(_BYTE *)(a1 + 720) = objc_msgSend((id)a1, "isEnabled");
      *(_BYTE *)(a1 + 721) = objc_msgSend((id)a1, "isSelected");
      *(_BYTE *)(a1 + 722) = objc_msgSend((id)a1, "isHighlighted");
      *(_BYTE *)(a1 + 592) = 0;
      objc_initWeak(&location, (id)a1);
      v18 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PKApplicationMessageView__initWithType_configuration___block_invoke;
      aBlock[3] = &unk_1E3E6ACF0;
      objc_copyWeak(&v35, &location);
      v19 = _Block_copy(aBlock);
      if ((unint64_t)(a2 - 1) <= 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPreferredSymbolConfigurationForImage:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBaseForegroundColor:", v21);

        objc_msgSend(v20, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
        v22 = (void *)MEMORY[0x1E0DC3428];
        v32[0] = v18;
        v32[1] = 3221225472;
        v32[2] = __56__PKApplicationMessageView__initWithType_configuration___block_invoke_2;
        v32[3] = &unk_1E3E62BD0;
        objc_copyWeak(&v33, &location);
        objc_msgSend(v22, "actionWithHandler:", v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v20, v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 640);
        *(_QWORD *)(a1 + 640) = v24;

        v26 = *(void **)(a1 + 640);
        v29[0] = v18;
        v29[1] = 3221225472;
        v29[2] = __56__PKApplicationMessageView__initWithType_configuration___block_invoke_3;
        v29[3] = &unk_1E3E6AD18;
        v30 = v19;
        v31 = a2;
        objc_msgSend(v26, "setConfigurationUpdateHandler:", v29);
        objc_msgSend(*(id *)(a1 + 640), "setAlpha:", 0.0);
        objc_msgSend(*(id *)(a1 + 640), "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
        objc_msgSend(*(id *)(a1 + 640), "sizeToFit");
        objc_msgSend(*(id *)(a1 + 640), "setNeedsUpdateConfiguration");
        objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 640));

        objc_destroyWeak(&v33);
      }
      objc_msgSend((id)a1, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAnchorPoint:", 0.5, 0.0);
      -[PKApplicationMessageView _updateHighlightAnimated:](a1, 0);
      objc_msgSend((id)a1, "addTarget:action:forControlEvents:", a1, sel__tapped_, 64);

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

uint64_t __56__PKApplicationMessageView__initWithType_configuration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _PKFontForDesign(v2, (void *)*MEMORY[0x1E0DC1398], (void *)*MEMORY[0x1E0DC4A88], 0x8000, 0, 0);

  return v3;
}

void __56__PKApplicationMessageView__initWithType_configuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PKApplicationMessageView _dismiss]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

void __56__PKApplicationMessageView__initWithType_configuration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v6 == 2)
  {
    PKLocalizedString(CFSTR("CLEAR_ALL_APPLICATION_MESSAGES"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0DC1138];
    v17[0] = v4;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (void **)v17;
    v11 = &v16;
  }
  else
  {
    PKLocalizedString(CFSTR("CLEAR_SECTION_APPLICATION_MESSAGES"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC1138];
    v15 = v4;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v15;
    v11 = &v14;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v12);
  objc_msgSend(v5, "setAttributedTitle:", v13);

  objc_msgSend(v3, "setConfiguration:", v5);
}

- (void)_updateHighlightAnimated:(uint64_t)a1
{
  void *v4;
  CGColor *v5;
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  CGColor *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t v22;

  if (!a1)
    return;
  objc_msgSend((id)a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 704))
  {
    v5 = CGColorRetain(*(CGColorRef *)(a1 + 712));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = CGColorRetain((CGColorRef)objc_msgSend(v6, "CGColor"));

  }
  if (*(_BYTE *)(a1 + 722) || *(_BYTE *)(a1 + 721))
  {
    v7 = (void *)MEMORY[0x1E0DC3658];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC3658];
    if (*(_BYTE *)(a1 + 720))
    {
      v8 = 1.0;
      v9 = 2;
      goto LABEL_9;
    }
  }
  v8 = 0.5;
  v9 = 1030;
LABEL_9:
  objc_msgSend(v7, "colorWithWhite:alpha:", 1.0, v8);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = CGColorRetain((CGColorRef)objc_msgSend(v10, "CGColor"));

  if (!CGColorEqualToColor(v5, v11))
  {
    if (!*(_QWORD *)(a1 + 704))
    {
      v12 = objc_alloc(MEMORY[0x1E0CD2780]);
      v13 = objc_msgSend(v12, "initWithType:", *MEMORY[0x1E0CD2E60]);
      v14 = *(void **)(a1 + 704);
      *(_QWORD *)(a1 + 704) = v13;

      objc_msgSend(*(id *)(a1 + 704), "setName:", CFSTR("highlightFilter"));
      objc_msgSend(*(id *)(a1 + 704), "setValue:forKey:", v5, CFSTR("inputColor"));
      -[PKApplicationMessageView _updateFilters]((_QWORD *)a1);
    }
    CGColorRelease(*(CGColorRef *)(a1 + 712));
    *(_QWORD *)(a1 + 712) = CGColorRetain(v11);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __53__PKApplicationMessageView__updateHighlightAnimated___block_invoke;
    v20 = &unk_1E3E61388;
    v21 = v4;
    v22 = a1;
    v15 = _Block_copy(&v17);
    v16 = v15;
    if (a2)
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", v9, v15, 0, v17, v18, v19, v20);
    else
      (*((void (**)(void *))v15 + 2))(v15);

  }
  CGColorRelease(v5);
  CGColorRelease(v11);

}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_filterColor);
  -[PKApplicationMessageView _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView dealloc](&v3, sel_dealloc);
}

- (void)_invalidate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 616))
  {
    *(_BYTE *)(a1 + 616) = 1;
    *(_QWORD *)(a1 + 464) = 0;
    v2 = *(void **)(a1 + 480);
    if (v2)
    {
      objc_msgSend(v2, "context");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v3;
      if (v3)
        *(_QWORD *)(v3 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 480), "setContext:", 0);
      v5 = *(void **)(a1 + 480);
      *(_QWORD *)(a1 + 480) = 0;

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = *(id *)(a1 + 656);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "context", (_QWORD)v14);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v11 = *(_QWORD *)(v11 + 24);
          -[PKApplicationMessageView _invalidate](v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 744));
    objc_msgSend(WeakRetained, "applicationMessageViewNeedsRemoval:", a1);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -[PKApplicationMessageView _layoutWithContext:bounds:]((uint64_t)self, 0, *MEMORY[0x1E0C9D538], *(CGFloat *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_layoutWithContext:(CGFloat)a3 bounds:(CGFloat)a4
{
  double v7;
  double v8;
  CGFloat v9;
  int v12;
  unint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  int v20;
  char v21;
  uint64_t v22;
  void (**v23)(void *, _QWORD, uint64_t, double);
  _QWORD *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, double, double);
  void (**v40)(_QWORD, double, double);
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  void (*v56)(_QWORD *, uint64_t, CATransform3D *, uint64_t, double, double, double, double, double, double, double, double);
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v66;
  uint64_t v67;
  _QWORD *v68;
  void (**v69)(void *, _QWORD, uint64_t, double);
  id v70;
  void (**v71)(_QWORD);
  _QWORD *v72;
  void (**v73)(void *, _QWORD, uint64_t, double);
  id v74;
  void (**v75)(_QWORD);
  void (**v76)(_QWORD);
  double v77;
  double v78;
  double v80;
  void *v81;
  unsigned int v82;
  double v83;
  void *v84;
  double v85;
  id v86;
  CGFloat v87;
  BOOL v88;
  void *v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  uint64_t *v94;
  CATransform3D v95;
  uint64_t v96;
  BOOL v97;
  _QWORD v98[5];
  id v99;
  id v100;
  id v101;
  uint64_t *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  BOOL v111;
  BOOL v112;
  BOOL v113;
  _QWORD v114[5];
  id v115;
  id v116;
  CATransform3D slice;
  _QWORD v118[9];
  uint64_t v119;
  CGRect *v120;
  uint64_t v121;
  void *v122;
  CGFloat v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  _QWORD v127[4];
  int v128;
  int v129;
  _QWORD v130[4];
  int v131;
  int v132;
  _QWORD v133[5];
  int v134;
  int v135;
  _QWORD aBlock[4];
  int v137;
  int v138;
  CGRect v139;
  CGRect v140;

  if (!a1)
    return 0.0;
  if (*(_BYTE *)(a1 + 616))
  {
    objc_msgSend((id)a1, "bounds");
    return v7;
  }
  else
  {
    v9 = a6;
    v8 = a5;
    v12 = a2;
    v13 = HIDWORD(a2);
    if (*(_BYTE *)(a1 + 536))
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      v140.origin.x = a3;
      v140.origin.y = a4;
      v140.size.width = a5;
      v140.size.height = a6;
      v14 = !CGRectEqualToRect(*(CGRect *)(a1 + 544), v140);
    }
    objc_msgSend(*(id *)(a1 + 480), "context");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15 && (v17 = *(_QWORD *)(v15 + 32), objc_msgSend(*(id *)(v15 + 16), "numberOfChildren") + v17))
    {
      v19 = 0;
      v20 = 0;
      if (*(_BYTE *)(a1 + 504))
        v18 = 0;
      else
        v18 = *(_QWORD *)(a1 + 464) == 0;
    }
    else
    {
      v18 = 0;
      v19 = *(_QWORD *)(a1 + 464) == 0;
      v20 = 1;
    }
    if ((_DWORD)v13)
      v21 = 1;
    else
      v21 = v14;
    if ((v21 & 1) != 0)
    {
      v88 = v19;
      objc_msgSend((id)a1, "_shouldReverseLayoutDirection");
      v22 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke;
      aBlock[3] = &__block_descriptor_40_e22_v28__0__UIView_8d16B24l;
      v137 = v12;
      v138 = v13;
      v23 = (void (**)(void *, _QWORD, uint64_t, double))_Block_copy(aBlock);
      v133[0] = v22;
      v133[1] = 3221225472;
      v133[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2;
      v133[3] = &unk_1E3E6AD60;
      v134 = v12;
      v135 = v13;
      v133[4] = a1;
      v24 = _Block_copy(v133);
      v130[0] = v22;
      v130[1] = 3221225472;
      v130[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3;
      v130[3] = &__block_descriptor_40_e51____v__d_20__0__PKApplicationMessageContentView_8B16l;
      v131 = v12;
      v132 = v13;
      v89 = _Block_copy(v130);
      v127[0] = v22;
      v127[1] = 3221225472;
      v127[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_5;
      v127[3] = &__block_descriptor_40_e44____v__d_20__0__PKApplicationMessageView_8B16l;
      v128 = v12;
      v129 = v13;
      v25 = _Block_copy(v127);
      v26 = v25;
      v119 = 0;
      v120 = (CGRect *)&v119;
      v27 = 0x4010000000;
      v121 = 0x4010000000;
      v122 = &unk_19E0C78CE;
      v87 = a3;
      v123 = a3;
      v124 = a4;
      v125 = v8;
      v126 = v9;
      v28 = *(_QWORD *)(a1 + 640);
      if (v28)
      {
        v81 = v25;
        LOBYTE(v27) = *(_BYTE *)(a1 + 592);
        v23[2](v23, v28, 1, (double)v27);
        v29 = v18;
        objc_msgSend(*(id *)(a1 + 640), "sizeThatFits:", 1.79769313e308, 1.79769313e308);
        v83 = v31;
        v85 = v30;
        v80 = v9;
        objc_msgSend(*(id *)(a1 + 640), "imageView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "image");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "alignmentRectInsets");
        v35 = v34;
        v118[0] = MEMORY[0x1E0C809B0];
        v118[1] = 3221225472;
        v118[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_7;
        v118[3] = &unk_1E3E6ADF0;
        v118[5] = v36;
        v118[6] = v37;
        *(double *)&v118[7] = v34;
        v118[8] = v38;
        v118[4] = &v119;
        v39 = (void (**)(_QWORD, double, double))_Block_copy(v118);
        v40 = v39;
        if (((*(_BYTE *)(a1 + 592) == 0) & ~v20) != 0)
        {
          v39[2](v39, 8.0, 6.0);
          PKSizeAlignedInRect();
          v42 = v49;
          v44 = v50;
          v46 = v51;
          v48 = v52;
        }
        else
        {
          memset(&slice, 0, 32);
          if (*(_QWORD *)(a1 + 752) != 2 && *(_BYTE *)(a1 + 520))
            CGRectDivide(v120[1], (CGRect *)&slice, v120 + 1, 8.0, CGRectMinYEdge);
          v40[2](v40, 8.0, 0.0);
          PKSizeAlignedInRect();
          v42 = v41;
          v44 = v43;
          v46 = v45;
          v48 = v47;
          v139 = v120[1];
          CGRectDivide(v139, (CGRect *)&slice, v120 + 1, v139.size.height - v139.origin.y - v35 + 8.0, CGRectMinYEdge);
        }
        v9 = v80;
        v53 = *(_QWORD *)(a1 + 640);
        v54 = *MEMORY[0x1E0C9D538];
        v55 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        v56 = (void (*)(_QWORD *, uint64_t, CATransform3D *, uint64_t, double, double, double, double, double, double, double, double))v24[2];
        v57 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        *(_OWORD *)&slice.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        *(_OWORD *)&slice.m33 = v57;
        v58 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        *(_OWORD *)&slice.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        *(_OWORD *)&slice.m43 = v58;
        v59 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        *(_OWORD *)&slice.m11 = *MEMORY[0x1E0CD2610];
        *(_OWORD *)&slice.m13 = v59;
        v60 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        *(_OWORD *)&slice.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        *(_OWORD *)&slice.m23 = v60;
        v56(v24, v53, &slice, 1, v42, v44, v46, v48, v54, v55, v85, v83);

        v18 = v29;
        v26 = v81;
      }
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_8;
      v114[3] = &unk_1E3E6AE40;
      v114[4] = a1;
      v86 = v89;
      v115 = v86;
      v61 = v26;
      v116 = v61;
      v62 = _Block_copy(v114);
      memset(&slice, 0, sizeof(slice));
      CATransform3DMakeScale(&slice, 0.5, 0.5, 1.0);
      v84 = v61;
      v63 = objc_msgSend(*(id *)(a1 + 672), "count");
      v64 = v63;
      v107 = *(_OWORD *)&slice.m31;
      v108 = *(_OWORD *)&slice.m33;
      v109 = *(_OWORD *)&slice.m41;
      v110 = *(_OWORD *)&slice.m43;
      v103 = *(_OWORD *)&slice.m11;
      v104 = *(_OWORD *)&slice.m13;
      v105 = *(_OWORD *)&slice.m21;
      v82 = v13;
      v66 = (_DWORD)v13 == 1 && v63 != 0;
      v67 = MEMORY[0x1E0C809B0];
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_10;
      v98[3] = &unk_1E3E6AE90;
      v111 = v66;
      v98[4] = a1;
      v102 = &v119;
      v112 = v88;
      v106 = *(_OWORD *)&slice.m23;
      v68 = v24;
      v99 = v68;
      v113 = v18;
      v69 = v23;
      v100 = v69;
      v70 = v62;
      v101 = v70;
      v71 = (void (**)(_QWORD))_Block_copy(v98);
      v90[0] = v67;
      v90[1] = 3221225472;
      v90[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_12;
      v90[3] = &unk_1E3E6AF30;
      v97 = v66;
      v90[4] = a1;
      v72 = v68;
      v95 = slice;
      v96 = v64;
      v91 = v72;
      v94 = &v119;
      v73 = v69;
      v92 = v73;
      v74 = v70;
      v93 = v74;
      v75 = (void (**)(_QWORD))_Block_copy(v90);
      v76 = v75;
      if (*(_DWORD *)(a1 + 620))
      {
        v77 = ((double (*)(void *))v75[2])(v75);
        v71[2](v71);
      }
      else
      {
        v77 = ((double (*)(_QWORD))v71[2])(v71);
        v76[2](v76);
      }
      v78 = v77 + v120[1].origin.y - a4;
      if (v82 <= 1)
      {
        *(_BYTE *)(a1 + 536) = 0;
        *(CGFloat *)(a1 + 544) = v87;
        *(CGFloat *)(a1 + 552) = a4;
        *(double *)(a1 + 560) = v8;
        *(CGFloat *)(a1 + 568) = v9;
        *(double *)(a1 + 576) = v8;
        *(double *)(a1 + 584) = v78;
      }

      _Block_object_dispose(&v119, 8);
    }
    else
    {
      v8 = *(double *)(a1 + 576);
    }

  }
  return v8;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke(uint64_t a1, void *a2, char a3, double a4)
{
  id v7;
  int v8;
  id v9;

  v7 = a2;
  v8 = *(_DWORD *)(a1 + 36);
  if (v8 == 1 || v8 == 2 && (a3 & 1) == 0)
  {
    v9 = v7;
    objc_msgSend(v7, "pkui_setAlpha:animated:", *(unsigned __int8 *)(a1 + 32), a4);
    v7 = v9;
  }

}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2(uint64_t a1, void *a2, _OWORD *a3, char a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[8];

  v23 = a2;
  v24 = v23;
  v25 = *(_DWORD *)(a1 + 44);
  if (v25 == 1 || v25 == 2 && (a4 & 1) == 0)
  {
    objc_msgSend(v23, "pkui_setBounds:animated:", *(unsigned __int8 *)(a1 + 40), a9, a10, a11, a12);
    objc_msgSend(v24, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "anchorPoint");
    objc_msgSend(v24, "pkui_setPosition:animated:", *(unsigned __int8 *)(a1 + 40), a5 + v27 * a7, a6 + v28 * a8);
    v29 = *(unsigned __int8 *)(a1 + 40);
    v30 = a3[5];
    v34[4] = a3[4];
    v34[5] = v30;
    v31 = a3[7];
    v34[6] = a3[6];
    v34[7] = v31;
    v32 = a3[1];
    v34[0] = *a3;
    v34[1] = v32;
    v33 = a3[3];
    v34[2] = a3[2];
    v34[3] = v33;
    objc_msgSend(v24, "pkui_setTransform:animated:", v34, v29);
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 680))
      objc_msgSend(v24, "layoutIfNeeded");

  }
}

id __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  uint64_t v12;
  char v13;

  v5 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_4;
  aBlock[3] = &unk_1E3E6AD88;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = a3;
  v11 = v5;
  v12 = v6;
  v7 = v5;
  v8 = _Block_copy(aBlock);

  return v8;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_4(uint64_t a1, double a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 44);
  if (v2 == 1 || v2 == 2 && !*(_BYTE *)(a1 + 48))
    -[PKApplicationMessageContentView setBlurRadius:animated:withCompletion:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0, a2);
}

id __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_5(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  uint64_t v12;
  char v13;

  v5 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_6;
  aBlock[3] = &unk_1E3E6AD88;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = a3;
  v11 = v5;
  v12 = v6;
  v7 = v5;
  v8 = _Block_copy(aBlock);

  return v8;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_6(uint64_t a1, double a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 44);
  if (v2 == 1 || v2 == 2 && !*(_BYTE *)(a1 + 48))
    -[PKApplicationMessageView _setBlurRadius:animated:withCompletion:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0, a2);
}

- (void)_setBlurRadius:(void *)a3 animated:(double)a4 withCompletion:
{
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD);

  v7 = a3;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (a1)
  {
    if (*(double *)(a1 + 696) == a4)
    {
      if (v7)
        (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
    else
    {
      if (!*(_QWORD *)(a1 + 688))
      {
        v9 = objc_alloc(MEMORY[0x1E0CD2780]);
        v10 = objc_msgSend(v9, "initWithType:", *MEMORY[0x1E0CD2C88]);
        v11 = *(void **)(a1 + 688);
        *(_QWORD *)(a1 + 688) = v10;

        objc_msgSend(*(id *)(a1 + 688), "setName:", CFSTR("blur"));
        -[PKApplicationMessageView _updateFilters]((_QWORD *)a1);
      }
      objc_msgSend((id)a1, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("filters.blur.inputRadius"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", *(double *)(a1 + 696), a4);
        if (v8)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __67__PKApplicationMessageView__setBlurRadius_animated_withCompletion___block_invoke;
          v16[3] = &unk_1E3E614F0;
          v17 = v8;
          objc_msgSend(v13, "pkui_setCompletionHandler:", v16);

        }
        v14 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v13);

      }
      *(double *)(a1 + 696) = a4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKeyPath:", v15, CFSTR("filters.blur.inputRadius"));

      if (v8 && (a2 & 1) == 0)
        v8[2](v8, 1);

    }
  }

}

double __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_7(uint64_t a1, double a2)
{
  return a2 - *(double *)(a1 + 48) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_8(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, uint64_t, uint64_t, void *, double, double);
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(id, uint64_t, uint64_t, uint64_t, void *, double, double);
  _QWORD v14[5];
  void (**v15)(id, uint64_t, uint64_t, uint64_t, void *, double, double);
  id v16;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 648);
  if (v5)
  {
    v6 = *(double *)(v4 + 600);
    v7 = fmin(*(double *)(v4 + 608), *(double *)(v4 + 528));
    v8 = *(unsigned __int8 *)(v4 + 593);
    v9 = 24;
    if (*(_BYTE *)(v4 + 593))
      v9 = 4;
    v10 = *(unsigned int *)(v4 + OBJC_IVAR___PKApplicationMessageView__type[v9]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v5, v8, v10, v11, v6, v7);

    v4 = *(_QWORD *)(a1 + 32);
  }
  v12 = *(void **)(v4 + 656);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_9;
  v14[3] = &unk_1E3E6AE18;
  v14[4] = v4;
  v15 = v3;
  v16 = *(id *)(a1 + 48);
  v13 = v3;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_9(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  unsigned int *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  unsigned int *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend(a2, "context");
  v3 = objc_claimAutoreleasedReturnValue();
  v18 = (id)v3;
  if (v3)
    v4 = *(void **)(v3 + 24);
  else
    v4 = 0;
  v5 = v4;
  v6 = (unsigned int *)v5;
  v7 = *(_QWORD *)(a1[4] + 736);
  if (v7)
    v8 = *(double *)(v7 + 8);
  else
    v8 = 0.0;
  objc_msgSend(v5, "sizeThatFits:", v8, 1.79769313e308);
  v10 = v9;
  v12 = v11;
  v13 = a1[5];
  if (*((_BYTE *)v6 + 504))
    v14 = (unsigned int *)(a1[4] + 620);
  else
    v14 = v6 + 127;
  v15 = *((unsigned __int8 *)v6 + 504) != 0;
  v16 = *v14;
  (*(void (**)(void))(a1[6] + 16))();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, unsigned int *, _BOOL8, uint64_t, void *, double, double))(v13 + 16))(v13, v6, v15, v16, v17, v10, v12);

}

double __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_10(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void (*v23)(double, double, double, double, double, double, double, double);
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  _QWORD aBlock[4];
  id v31;
  id v32;
  _QWORD *v33;
  __int128 *v34;
  uint64_t v35;
  __int128 *v36;
  char v37;
  _QWORD v38[4];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 200))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 672);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (!v3)
      goto LABEL_19;
    v4 = *(_QWORD *)v56;
    while (1)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v56 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (v6)
        {
          if (*(_DWORD *)(v6 + 28))
            continue;
          v6 = *(_QWORD *)(v6 + 32);
        }
        v7 = (id)v6;
        objc_msgSend(v7, "bounds");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v16 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        PKFloatRoundToPixel();
        v18 = v17;
        if (*(_BYTE *)(a1 + 201))
        {
          v19 = *(_OWORD *)(a1 + 152);
          v51 = *(_OWORD *)(a1 + 136);
          v52 = v19;
          v20 = *(_OWORD *)(a1 + 184);
          v53 = *(_OWORD *)(a1 + 168);
          v54 = v20;
          v21 = *(_OWORD *)(a1 + 88);
          v47 = *(_OWORD *)(a1 + 72);
          v48 = v21;
          v22 = *(_OWORD *)(a1 + 120);
          v49 = *(_OWORD *)(a1 + 104);
          v50 = v22;
        }
        else
        {
          if (v7)
          {
            objc_msgSend(v7, "transform3D");
          }
          else
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v40 = 0u;
            v39 = 0u;
          }
          v51 = v43;
          v52 = v44;
          v53 = v45;
          v54 = v46;
          v47 = v39;
          v48 = v40;
          v49 = v41;
          v50 = v42;
        }
        v23 = *(void (**)(double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16);
        v44 = v52;
        v45 = v53;
        v46 = v54;
        v39 = v47;
        v40 = v48;
        v41 = v49;
        v42 = v50;
        v43 = v51;
        v23(v18, v16, v13, v15, v9, v11, v13, v15);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      if (!v3)
      {
LABEL_19:

        break;
      }
    }
  }
  *(_QWORD *)&v39 = 0;
  *((_QWORD *)&v39 + 1) = &v39;
  v40 = 0x2020000000uLL;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  *(_QWORD *)&v47 = 0;
  *((_QWORD *)&v47 + 1) = &v47;
  *(_QWORD *)&v48 = 0x4010000000;
  *((_QWORD *)&v48 + 1) = &unk_19E0C78CE;
  v49 = 0u;
  v50 = 0u;
  v24 = *(_QWORD *)(a1 + 64);
  v49 = *(_OWORD *)(*(_QWORD *)(v24 + 8) + 32);
  v50 = *(unint64_t *)(*(_QWORD *)(v24 + 8) + 48);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_11;
  aBlock[3] = &unk_1E3E6AE68;
  v33 = v38;
  v34 = &v39;
  v37 = *(_BYTE *)(a1 + 202);
  v35 = v24;
  v36 = &v47;
  v31 = *(id *)(a1 + 40);
  v32 = *(id *)(a1 + 48);
  v25 = _Block_copy(aBlock);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v26 = *(double *)(*((_QWORD *)&v47 + 1) + 40);
  v27 = *(double *)(*((_QWORD *)&v47 + 1) + 56);
  v28 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v39, 8);
  return v26 + v27 - v28;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5, double a6, double a7)
{
  id v13;
  void (**v14)(_QWORD, __n128);
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  __n128 v26;
  __n128 v27;
  double *v28;
  CATransform3D v29;

  v13 = a2;
  v14 = a5;
  if (!a4 || (_DWORD)a3)
  {
    if ((_DWORD)a3)
      v15 = *(_QWORD *)(a1 + 48);
    else
      v15 = *(_QWORD *)(a1 + 56);
    v16 = exp(fmin((double)*(unint64_t *)(*(_QWORD *)(v15 + 8) + 24) * 0.5, 1.0) * -0.0896074712);
    if (*(_BYTE *)(a1 + 80))
      v17 = v16 * 0.5;
    else
      v17 = v16;
    PKSizeRoundToPixel();
    v20 = v19;
    v21 = v18;
    if ((_DWORD)a3 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 56)
          + 8.0
          - v18;
    else
      v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    PKFloatRoundToPixel();
    v24 = v23;
    if (!a4)
    {
      memset(&v29, 0, sizeof(v29));
      CATransform3DMakeScale(&v29, v17, v17, 1.0);
      (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v24, v22, v20, v21, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a6, a7, v29.m11, v29.m12, v29.m13, v29.m14, v29.m21, v29.m22, v29.m23, v29.m24, v29.m31, v29.m32, v29.m33,
        v29.m34,
        v29.m41,
        v29.m42,
        v29.m43,
        v29.m44);
      v25 = *(_QWORD *)(a1 + 40);
      v26.n128_u64[0] = 0;
      if (!*(_BYTE *)(a1 + 80) && (_DWORD)a3)
        v26.n128_f64[0] = exp(fmin((double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) * 0.5, 1.0)* -0.693147181);
      (*(void (**)(uint64_t, id, uint64_t, __n128))(v25 + 16))(v25, v13, a3, v26);
      v27.n128_u64[0] = 0x4020AAAAAAAAAAABLL;
      if (!*(_BYTE *)(a1 + 80))
        v27.n128_f64[0] = 0.0;
      v14[2](v14, v27);
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if ((_DWORD)a3)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v28 = *(double **)(*(_QWORD *)(a1 + 72) + 8);
      v28[4] = v24;
      v28[5] = v22;
      v28[6] = v20;
      v28[7] = v21;
    }
  }

}

double __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  __int128 v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  id v12;
  __int128 v13;
  void *v14;
  double v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD aBlock[5];
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;

  PKFloatRoundToPixel();
  v3 = v2;
  v4 = (__int128 *)MEMORY[0x1E0C9D628];
  v5 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 208))
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__19;
    *(_QWORD *)&v39 = __Block_byref_object_dispose__19;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "firstObject");
    *((_QWORD *)&v39 + 1) = objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    v60 = 0;
    v61 = (double *)&v60;
    v62 = 0x4010000000;
    v63 = &unk_19E0C78CE;
    v6 = v4[1];
    v64 = *v4;
    v65 = v6;
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_81;
    aBlock[3] = &unk_1E3E6AEE0;
    v47 = &v60;
    v7 = *(id *)(a1 + 40);
    v54 = *(_OWORD *)(a1 + 136);
    v55 = *(_OWORD *)(a1 + 152);
    v56 = *(_OWORD *)(a1 + 168);
    v57 = *(_OWORD *)(a1 + 184);
    v50 = *(_OWORD *)(a1 + 72);
    v51 = *(_OWORD *)(a1 + 88);
    v52 = *(_OWORD *)(a1 + 104);
    v53 = *(_OWORD *)(a1 + 120);
    v58 = v3;
    v48 = &v35;
    v49 = &v66;
    v59 = *(_QWORD *)(a1 + 200);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v46 = v7;
    v8 = _Block_copy(aBlock);

    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v35, 8);

  }
  else
  {
    v8 = 0;
  }
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  v9 = *(_QWORD *)(a1 + 64);
  v44 = *(_QWORD *)(*(_QWORD *)(v9 + 8) + 40);
  v60 = 0;
  v61 = (double *)&v60;
  v62 = 0x4010000000;
  v63 = &unk_19E0C78CE;
  v64 = 0u;
  v65 = 0u;
  v10 = *(_QWORD *)(v9 + 8);
  v64 = *(_OWORD *)(v10 + 32);
  v65 = *(unint64_t *)(v10 + 48);
  v35 = 0;
  v36 = &v35;
  v37 = 0x4010000000;
  v38 = (uint64_t (*)(uint64_t, uint64_t))&unk_19E0C78CE;
  v11 = v4[1];
  v39 = *v4;
  v40 = v11;
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3_87;
  v17[3] = &unk_1E3E6AF08;
  v21 = &v41;
  v22 = v9;
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v23 = &v66;
  v24 = &v60;
  v25 = &v35;
  v12 = v8;
  v20 = v12;
  v26 = v3;
  v31 = *(_OWORD *)(a1 + 136);
  v32 = *(_OWORD *)(a1 + 152);
  v33 = *(_OWORD *)(a1 + 168);
  v34 = *(_OWORD *)(a1 + 184);
  v13 = *(_OWORD *)(a1 + 88);
  v27 = *(_OWORD *)(a1 + 72);
  v28 = v13;
  v29 = *(_OWORD *)(a1 + 104);
  v30 = *(_OWORD *)(a1 + 120);
  v14 = _Block_copy(v17);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (v12)
    (*((void (**)(id, uint64_t, double, double, double, double))v12 + 2))(v12, -1, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), v42[3], *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48), 0.0);
  v15 = v61[5] + v61[7] - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v66, 8);

  return v15;
}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_81(uint64_t a1, unint64_t a2)
{
  void *v2;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void (**v10)(void *, id);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t aBlock;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  aBlock = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2_82;
  v34 = &unk_1E3E6AEB8;
  v30 = *(_OWORD *)(a1 + 40);
  v5 = (id)v30;
  v6 = *(_OWORD *)(a1 + 136);
  v7 = *(_OWORD *)(a1 + 168);
  v41 = *(_OWORD *)(a1 + 152);
  v42 = v7;
  v43 = *(_OWORD *)(a1 + 184);
  v8 = *(_OWORD *)(a1 + 72);
  v35 = v30;
  v36 = v8;
  v9 = *(_OWORD *)(a1 + 104);
  v37 = *(_OWORD *)(a1 + 88);
  v38 = v9;
  v39 = *(_OWORD *)(a1 + 120);
  v40 = v6;
  v44 = *(_QWORD *)(a1 + 200);
  v10 = (void (**)(void *, id))_Block_copy(&aBlock);
  if (CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)))
  {
    PKSizeRoundToPixel();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v11 + 48) = v12;
    *(_QWORD *)(v11 + 56) = v13;
    PKFloatRoundToPixel();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v14;
    PKFloatRoundToPixel();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v15;
  }
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
  if (!v17 || (v18 = *(_QWORD *)(v17 + 48), v18 >= a2))
  {
    v19 = 0;
    goto LABEL_32;
  }
  v19 = 0;
  v20 = 0;
  do
  {
    if (*(_DWORD *)(v17 + 28) == 1)
    {
      if (!v19)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v16 = *(_QWORD *)(a1 + 56);
      }
      objc_msgSend(v19, "addObject:", *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40), v30, aBlock, v32, v33, v34);
      v20 = 1;
    }
    v21 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v22 = *(_QWORD *)(a1 + 208);
    if (v21 >= v22)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v2;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v23);
    if (v21 < v22)

    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v24)
    {
      v25 = *(_QWORD *)(v24 + 48);
      v26 = v18 == v25 || v19 == 0;
      v18 = v25;
      if (v26)
        goto LABEL_22;
    }
    else
    {
      v18 = 0;
      if (!v19)
        goto LABEL_22;
    }
    if (objc_msgSend(v19, "count", v30))
    {
      v10[2](v10, v19);
      objc_msgSend(v19, "removeAllObjects");
    }
LABEL_22:
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
  }
  while (v18 < a2 && v17 != 0);
  if ((v20 & 1) == 0)
  {
LABEL_32:
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v28 + 32) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v28 + 48) = v29;
  }

}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_2_82(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  _QWORD *v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  _QWORD *v16;
  _QWORD *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (v8)
          v8 = (_QWORD *)v8[4];
        v9 = v8;
        objc_msgSend(v9, "bounds");
        PKFloatRoundToPixel();
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = fmax(v10, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 8)+ 56));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v5);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if (v16)
          v16 = (_QWORD *)v16[4];
        v17 = v16;
        objc_msgSend(v17, "bounds");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        PKSizeRoundToPixel();
        v27 = v26;
        v29 = v28;
        PKFloatRoundToPixel();
        v31 = v30;
        PKFloatRoundToPixel();
        (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v31, v32, v27, v29, v19, v21, v23, v25, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128),
          *(double *)(a1 + 136),
          *(double *)(a1 + 144),
          *(double *)(a1 + 152),
          *(double *)(a1 + 160),
          *(double *)(a1 + 168),
          *(double *)&v33);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v13);
  }

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 56)
                                                              + *(double *)(a1 + 176);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = 0;

}

void __54__PKApplicationMessageView__layoutWithContext_bounds___block_invoke_3_87(uint64_t a1, void *a2, int a3, int a4, void *a5, double a6, double a7)
{
  id v13;
  void (**v14)(_QWORD, __n128);
  double v15;
  double v16;
  double v17;
  double *v18;
  uint64_t v19;
  __n128 v20;
  __int128 v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double *v30;

  v13 = a2;
  v14 = a5;
  if (!a3)
  {
    if (a4 != 1)
      goto LABEL_14;
    if (CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32)))
      v23 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    else
      v23 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)
          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 56)
          + *(double *)(a1 + 96);
    PKSizeRoundToPixel();
    v25 = v24;
    v27 = v26;
    PKFloatRoundToPixel();
    v29 = v28;
    (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v28, v23, v25, v27, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a6, a7, *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184),
      *(double *)(a1 + 192),
      *(double *)(a1 + 200),
      *(double *)(a1 + 208),
      *(double *)(a1 + 216),
      *(double *)(a1 + 224));
    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);
    v30 = *(double **)(*(_QWORD *)(a1 + 88) + 8);
    v30[4] = v29;
    v30[5] = v23;
    v30[6] = v25;
    v30[7] = v27;
    v20.n128_u64[0] = 0x4020AAAAAAAAAAABLL;
LABEL_13:
    v14[2](v14, v20);
    goto LABEL_14;
  }
  v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  PKFloatRoundToPixel();
  v17 = v16;
  if (a4 == 1)
  {
    (*(void (**)(double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v16, v15, a6, a7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a6, a7, *MEMORY[0x1E0CD2610], *(double *)(MEMORY[0x1E0CD2610] + 8), *(double *)(MEMORY[0x1E0CD2610] + 16), *(double *)(MEMORY[0x1E0CD2610] + 24), *(double *)(MEMORY[0x1E0CD2610] + 32), *(double *)(MEMORY[0x1E0CD2610] + 40), *(double *)(MEMORY[0x1E0CD2610] + 48), *(double *)(MEMORY[0x1E0CD2610] + 56), *(double *)(MEMORY[0x1E0CD2610] + 64), *(double *)(MEMORY[0x1E0CD2610] + 72), *(double *)(MEMORY[0x1E0CD2610] + 80),
      *(double *)(MEMORY[0x1E0CD2610] + 88),
      *(double *)(MEMORY[0x1E0CD2610] + 96),
      *(double *)(MEMORY[0x1E0CD2610] + 104),
      *(double *)(MEMORY[0x1E0CD2610] + 112),
      *(double *)(MEMORY[0x1E0CD2610] + 120));
    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(1.0);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a7
                                                              + 8.0
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  v18 = *(double **)(*(_QWORD *)(a1 + 80) + 8);
  v18[4] = v17;
  v18[5] = v15;
  v18[6] = a6;
  v18[7] = a7;
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v20 = *(__n128 *)MEMORY[0x1E0C9D628];
  v21 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v19 + 32) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v19 + 48) = v21;
  v22 = *(_QWORD *)(a1 + 48);
  if (v22)
    (*(void (**)(uint64_t, _QWORD, double, double, double, double))(v22 + 16))(v22, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v17, v15, a6, a7);
  v20.n128_u64[0] = 0;
  if (a4 == 1)
    goto LABEL_13;
LABEL_14:

}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  PKUIViewLayoutIfNeeded(self, a3, 0);
}

- (void)layoutSubviews
{
  unsigned int IsAnimated;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v8;

  self->_inLayout = 1;
  v8.receiver = self;
  v8.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView layoutSubviews](&v8, sel_layoutSubviews);
  IsAnimated = PKCATrackedLayoutIsAnimated();
  -[PKApplicationMessageView bounds](self, "bounds");
  -[PKApplicationMessageView _layoutWithContext:bounds:]((uint64_t)self, IsAnimated | 0x100000000, v4, v5, v6, v7);
  self->_inLayout = 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  PKApplicationMessageContentView *v11;
  PKApplicationMessageContentView *v12;
  PKApplicationMessageView *v13;
  PKApplicationMessage *message;
  void *v15;
  void *v16;
  PKApplicationMessageView *v17;
  objc_super v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[PKApplicationMessageView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    -[PKApplicationMessageNode context](self->_content, "context");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      if (!*(_BYTE *)(v8 + 8))
      {
        v10 = *(_QWORD *)(v8 + 32);
        if ((unint64_t)(objc_msgSend(*(id *)(v8 + 16), "numberOfChildren") + v10) >= 2)
        {
          v17 = self;
          goto LABEL_16;
        }
      }
    }
    v19.receiver = self;
    v19.super_class = (Class)PKApplicationMessageView;
    -[PKApplicationMessageView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
    v11 = (PKApplicationMessageContentView *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (v11 != (PKApplicationMessageContentView *)self)
      {
        v13 = (PKApplicationMessageView *)v11;
        if (v11 != self->_messageView)
          goto LABEL_15;
      }
      message = self->_message;
      if (message)
      {
        -[PKApplicationMessage content](message, "content");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "action");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          v13 = self;
        else
          v13 = 0;

        goto LABEL_15;
      }
    }
    v13 = 0;
LABEL_15:
    v17 = v13;

LABEL_16:
    goto LABEL_17;
  }
  v17 = 0;
LABEL_17:

  return v17;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.highlightFilter.inputColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKApplicationMessageView;
    v5 = -[PKApplicationMessageView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSComparisonResult v8;
  PKApplicationMessageView *v9;
  BOOL *p_reloadQueued;
  PKApplicationMessageView *parent;
  PKApplicationMessageView *v12;
  objc_super v13;
  _QWORD block[4];
  id v15;
  id location;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  if (!v4)
    goto LABEL_3;
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[PKApplicationMessageView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8)
  {
LABEL_3:
    if (self)
    {
      v9 = self;
      p_reloadQueued = &v9->_reloadQueued;
      if (!v9->_reloadQueued)
      {
        while (1)
        {
          *p_reloadQueued = 1;
          parent = v9->_parent;
          if (!parent)
            break;
          v12 = parent;

          p_reloadQueued = &v12->_reloadQueued;
          v9 = v12;
          if (v12->_reloadQueued)
            goto LABEL_10;
        }
        v9->_reloadQueuedIsRoot = 1;
        objc_initWeak(&location, v9);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __40__PKApplicationMessageView__queueReload__block_invoke;
        block[3] = &unk_1E3E61310;
        objc_copyWeak(&v15, &location);
        dispatch_async(MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
      v12 = v9;
LABEL_10:

    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView setEnabled:](&v5, sel_setEnabled_);
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    -[PKApplicationMessageView _updateHighlightAnimated:]((uint64_t)self, 1);
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    -[PKApplicationMessageView _updateHighlightAnimated:]((uint64_t)self, 1);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageView;
  -[PKApplicationMessageView setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    -[PKApplicationMessageView _updateHighlightAnimated:]((uint64_t)self, 1);
  }
}

- (_QWORD)_rootView
{
  id v1;
  void *v2;
  void *v3;
  _QWORD *v4;

  v1 = a1;
  v2 = v1;
  v3 = (void *)*((_QWORD *)v1 + 58);
  if (!v3)
    return v1;
  do
  {
    v4 = v3;

    v3 = (void *)v4[58];
    v2 = v4;
  }
  while (v3);
  return v4;
}

- (PKApplicationMessageNode)content
{
  return self->_content;
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  PKApplicationMessageNode *v6;
  id WeakRetained;
  PKApplicationMessageNode *v8;
  _QWORD v9[5];
  PKApplicationMessageNode *v10;

  v6 = (PKApplicationMessageNode *)a3;
  if (self->_content != v6 && !self->_invalidated)
  {
    v9[1] = 3221225472;
    v9[2] = __48__PKApplicationMessageView_setContent_animated___block_invoke;
    v9[3] = &unk_1E3E6AF58;
    v9[4] = self;
    v8 = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v6;
    -[PKApplicationMessageView _treeLayoutWithContext:block:](self, a4, v9);
    if (-[PKApplicationMessageView needsRemoval](self, "needsRemoval"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "applicationMessageViewNeedsRemoval:", self);

    }
    v6 = v8;
  }

}

void __48__PKApplicationMessageView_setContent_animated___block_invoke(uint64_t a1)
{
  -[PKApplicationMessageView _setContent:type:depth:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, 0);
}

- (void)_setContent:(unsigned int)a3 type:(uint64_t)a4 depth:
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  id v20;

  v8 = a2;
  if (a1 && !*(_BYTE *)(a1 + 616))
  {
    v20 = v8;
    v9 = (void *)MEMORY[0x1A1AE621C]();
    v10 = *(id *)(a1 + 480);
    if (v10 == v20)
    {
LABEL_24:
      -[PKApplicationMessageView _updateSubviewsWithType:depth:](a1, a3, a4);
      objc_autoreleasePoolPop(v9);
      v8 = v20;
      goto LABEL_25;
    }
    v11 = v10;
    objc_storeStrong((id *)(a1 + 480), a2);
    v12 = *(void **)(a1 + 480);
    if (v12)
    {
      v13 = objc_msgSend(v12, "type");
      v14 = *(_QWORD *)(a1 + 752);
      if (v14 != v13)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKApplicationMessageView: content type %ld does not match expected type %ld."), v13, v14);
    }
    if (*(_QWORD *)(a1 + 752) || (v16 = *(void **)(a1 + 480)) == 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v16, "message");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(a1 + 488), v15);
    if (*(_QWORD *)(a1 + 752) == 2)
    {
      if (v11)
      {
        objc_msgSend(v11, "context");
        v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContext:", 0);
        v18 = *(void **)(a1 + 480);
        if (v18)
        {
          if (v17)
          {
            -[PKApplicationMessageViewContext setNode:]((uint64_t)v17, v18);
LABEL_19:
            objc_msgSend(*(id *)(a1 + 480), "setContext:", v17);
LABEL_22:

            goto LABEL_23;
          }
LABEL_17:
          v19 = -[PKApplicationMessageViewContext initForNode:]([PKApplicationMessageViewContext alloc], *(void **)(a1 + 480));
          v17 = v19;
          if (v19)
            v19[3] = a1;
          goto LABEL_19;
        }
        if (v17)
        {
          v17[3] = 0;
          goto LABEL_22;
        }
      }
      else if (*(_QWORD *)(a1 + 480))
      {
        goto LABEL_17;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

}

- (void)_treeLayoutWithContext:(void *)a3 block:
{
  void (**v5)(id, _QWORD);
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unsigned __int8 v14;
  id WeakRetained;
  void *context;
  void (**v17)(id, _QWORD);
  id obj;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[4];
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  unsigned __int8 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    if (!v5)
      __break(1u);
    v17 = v5;
    context = (void *)MEMORY[0x1A1AE621C]();
    v6 = -[PKApplicationMessageView _rootView](a1);
    v7 = (uint64_t)v6;
    if (*((_BYTE *)v6 + 496))
    {
      v17[2](v17, a2);
    }
    else
    {
      *((_BYTE *)v6 + 496) = 1;
      if (v6[60])
      {
        -[PKApplicationMessageView _visitPostOrder:]((uint64_t)v6, &__block_literal_global_104);
      }
      else
      {
        *((_DWORD *)v6 + 127) = 0;
        *((_DWORD *)v6 + 125) = 0;
        *((_BYTE *)v6 + 504) = 0;
      }
      v17[2](v17, a2);
      -[PKApplicationMessageView _visitPostOrder:](v7, &__block_literal_global_105);
      v8 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_2;
      v29[3] = &__block_descriptor_33_e42_v32__0__PKApplicationMessageView_8_B16_B24l;
      v30 = a2;
      -[PKApplicationMessageView _visitPreOrder:](v7, v29);
      -[PKApplicationMessageView _visitPreOrder:](v7, &__block_literal_global_108);
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_4;
      v27[3] = &unk_1E3E6B0B0;
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v28 = v9;
      -[PKApplicationMessageView _visitPreOrder:](v7, v27);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      obj = v9;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            v22[0] = 0;
            v22[1] = v22;
            v22[2] = 0x2020000000;
            v22[3] = 0;
            v21[0] = 0;
            v21[1] = v21;
            v21[2] = 0x2020000000;
            v21[3] = 0;
            v20[0] = v8;
            v20[1] = 3221225472;
            v20[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_5;
            v20[3] = &unk_1E3E6B0D8;
            v20[4] = v22;
            v20[5] = v21;
            -[PKApplicationMessageView _visitPreOrder:](v13, v20);
            v19[0] = v8;
            v19[1] = 3221225472;
            v19[2] = __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_6;
            v19[3] = &unk_1E3E6B0D8;
            v19[4] = v22;
            v19[5] = v21;
            -[PKApplicationMessageView _visitPreOrder:](v13, v19);
            _Block_object_dispose(v21, 8);
            _Block_object_dispose(v22, 8);
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v10);
      }

      v14 = a2;
      if ((a2 & 1) != 0)
      {
        -[PKApplicationMessageView _visitPreOrder:](v7, &__block_literal_global_109);
        -[PKApplicationMessageView _visitPreOrder:](v7, &__block_literal_global_110);
        v14 = a2;
      }
      objc_msgSend((id)v7, "layoutIfNeededAnimated:", v14 & 1);
      *(_BYTE *)(v7 + 496) = 0;
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 744));
      objc_msgSend(WeakRetained, "applicationMessageViewNeedsSizeUpdate:", v7);

    }
    objc_autoreleasePoolPop(context);
    v5 = v17;
  }

}

- (void)collapse
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!self->_invalidated)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v3 = MEMORY[0x1E0C809B0];
    v9 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__PKApplicationMessageView_collapse__block_invoke;
    v5[3] = &unk_1E3E6AF80;
    v5[4] = &v6;
    -[PKApplicationMessageView _visitPostOrder:]((uint64_t)self, v5);
    if (*((_BYTE *)v7 + 24))
    {
      v4[0] = v3;
      v4[1] = 3221225472;
      v4[2] = __36__PKApplicationMessageView_collapse__block_invoke_2;
      v4[3] = &unk_1E3E6AFE8;
      v4[4] = self;
      -[PKApplicationMessageView _treeLayoutWithContext:block:](self, 1u, v4);
    }
    _Block_object_dispose(&v6, 8);
  }
}

void __36__PKApplicationMessageView_collapse__block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;

  objc_msgSend(*(id *)(a2 + 480), "context");
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (v3[8])
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      if (v3[8])
        v3[8] = 0;
    }
  }

}

- (void)_visitPostOrder:(uint64_t)a1
{
  void (**v3)(id, _QWORD *, char *);
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *context;
  char v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  if (!a1)
    goto LABEL_10;
  context = (void *)MEMORY[0x1A1AE621C]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  if (!objc_msgSend(v4, "count"))
    goto LABEL_9;
  while (1)
  {
    objc_msgSend(v4, "lastObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)v5;
    if (!*(_BYTE *)(v5 + 472))
    {
      *(_BYTE *)(v5 + 472) = 1;
      if (objc_msgSend(*(id *)(v5 + 656), "count"))
      {
        v7 = (void *)v6[82];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __44__PKApplicationMessageView__visitPostOrder___block_invoke;
        v10[3] = &unk_1E3E6B300;
        v11 = v4;
        objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v10);

      }
      goto LABEL_8;
    }
    objc_msgSend(v4, "removeLastObject");
    v9 = 0;
    v3[2](v3, v6, &v9);
    if (v9)
      break;
LABEL_8:

    if (!objc_msgSend(v4, "count"))
      goto LABEL_9;
  }

LABEL_9:
  -[PKApplicationMessageView _visitPreOrder:](a1, &__block_literal_global_146);

  objc_autoreleasePoolPop(context);
LABEL_10:

}

void __36__PKApplicationMessageView_collapse__block_invoke_2(uint64_t a1)
{
  -[PKApplicationMessageView _visitPostOrder:](*(_QWORD *)(a1 + 32), &__block_literal_global_81);
}

void __36__PKApplicationMessageView_collapse__block_invoke_3(uint64_t a1, uint64_t a2)
{
  -[PKApplicationMessageView _updateSubviewsWithType:depth:](a2, 2u, *(_QWORD *)(a2 + 624));
}

- (void)_updateSubviewsWithType:(uint64_t)a3 depth:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;
  id *v14;
  int v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  PKApplicationMessageContentView *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  PKApplicationMessageView_RemovedSubviewContainer *v38;
  id *v39;
  id *v40;
  uint64_t v41;
  void *v42;
  char *v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  PKApplicationMessageView_RemovedSubviewContainer *v57;
  id *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void (**v64)(_QWORD);
  void *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  BOOL v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  unint64_t v80;
  _QWORD *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  unint64_t v91;
  _QWORD *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  void (**v99)(void *, unint64_t, _QWORD);
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t i;
  void *v104;
  void *v105;
  uint64_t v106;
  _QWORD *v107;
  void *v108;
  _QWORD *v109;
  unint64_t v110;
  void *v111;
  unsigned int v112;
  unint64_t v114;
  id *v115;
  void *v116;
  void (**v117)(void *, _QWORD);
  void *v119;
  id v120;
  int v121;
  id v122;
  _QWORD v124[8];
  _QWORD v125[4];
  BOOL v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD aBlock[5];
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t *v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t v147;
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  if (!a1 || *(_BYTE *)(a1 + 616))
    return;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke;
  aBlock[3] = &unk_1E3E62EE0;
  aBlock[4] = a1;
  v117 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 480), "context");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 488);
  if (v5)
    v6 = 0;
  else
    v6 = *(_QWORD *)(a1 + 648) != 0;
  v7 = *(_DWORD *)(a1 + 620);
  v8 = v5 != 0;
  if (!v3)
  {
    v112 = 0;
    *(_QWORD *)(a1 + 624) = a3;
    goto LABEL_22;
  }
  if (*(_QWORD *)(v3 + 32) != v8)
  {
    *(_QWORD *)(v3 + 32) = v8;
    if ((unint64_t)(objc_msgSend(*(id *)(v3 + 16), "numberOfChildren") + v8) <= 1)
      *(_BYTE *)(v4 + 8) = 0;
  }
  if (*(_BYTE *)(v4 + 8))
  {
    *(_QWORD *)(a1 + 624) = a3;
  }
  else
  {
    v9 = *(_QWORD *)(v4 + 32);
    if ((unint64_t)(objc_msgSend(*(id *)(v4 + 16), "numberOfChildren") + v9) <= 1)
    {
      v12 = *(unsigned __int8 *)(v4 + 8);
    }
    else
    {
      if (*(_BYTE *)(a1 + 500))
      {
        v10 = *(_QWORD *)(v4 + 32);
        v11 = (unint64_t)(objc_msgSend(*(id *)(v4 + 16), "numberOfChildren") + v10) > 1;
      }
      else
      {
        v11 = 0;
      }
      v12 = *(unsigned __int8 *)(v4 + 8);
      if (v12 != v11)
      {
        *(_BYTE *)(v4 + 8) = v11;
        v12 = v11;
      }
    }
    *(_QWORD *)(a1 + 624) = a3;
    if (!v12)
    {
      v83 = *(_QWORD *)(v4 + 32);
      v13 = (unint64_t)(objc_msgSend(*(id *)(v4 + 16), "numberOfChildren") + v83) < 2;
      goto LABEL_21;
    }
  }
  v13 = 1;
LABEL_21:
  v112 = !v13;
LABEL_22:
  v115 = (id *)(id)v4;
  objc_opt_self();
  if (!v4)
    goto LABEL_26;
  v14 = v115;
  if (*((_BYTE *)v115 + 8))
  {
    v15 = 1;
    goto LABEL_27;
  }
  v16 = v115[4];
  if ((unint64_t)v16 + objc_msgSend(v115[2], "numberOfChildren") <= 1)
  {
    v14 = v115;
    v15 = *((unsigned __int8 *)v115 + 8);
  }
  else
  {
LABEL_26:
    v15 = 0;
    v14 = v115;
  }
LABEL_27:

  *(_DWORD *)(a1 + 620) = v15;
  if (v7)
  {
    if (v7 != 1)
    {
      v17 = a1;
      v18 = *(_DWORD *)(a1 + 620);
      goto LABEL_34;
    }
    v17 = a1;
    v121 = *(_DWORD *)(a1 + 620);
    if (!v121)
    {
LABEL_32:
      v18 = a2 == 0;
LABEL_34:
      v121 = v18;
    }
  }
  else
  {
    v17 = a1;
    v121 = *(_DWORD *)(a1 + 620);
    if (v121 == 1)
      goto LABEL_32;
  }
  objc_msgSend(*(id *)(v17 + 480), "children");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = (void *)MEMORY[0x1E0C9AA60];
  if (v19)
    v21 = (void *)v19;
  v22 = v21;

  if (*(_DWORD *)(a1 + 620))
    goto LABEL_49;
  v23 = *(_QWORD *)(a1 + 624);
  v24 = 3;
  if (v23)
    v24 = 1;
  v25 = v24 - v8;
  v26 = !v23 || v5 == 0;
  v27 = v26 ? v25 : 0;
  if (objc_msgSend(v22, "count") <= v27)
  {
LABEL_49:
    v119 = v22;
  }
  else
  {
    if (v27)
    {
      objc_msgSend(v22, "subarrayWithRange:", 0, v27);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v119 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  v120 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = a1;
  v29 = *(_QWORD *)(a1 + 648);
  if (v5)
  {
    if (!v29)
    {
      v30 = [PKApplicationMessageContentView alloc];
      v31 = *(_QWORD *)(a1 + 736);
      if (v31)
        v32 = *(double *)(v31 + 8);
      else
        v32 = 0.0;
      v33 = -[PKApplicationMessageContentView initWithWidth:](v30, v32);
      v34 = *(void **)(a1 + 648);
      *(_QWORD *)(a1 + 648) = v33;

      v35 = *(_QWORD *)(a1 + 648);
      if (v35)
      {
        objc_storeWeak((id *)(v35 + 608), (id)a1);
        v36 = *(void **)(a1 + 648);
      }
      else
      {
        v36 = 0;
      }
      objc_msgSend(v36, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAnchorPoint:", 0.5, 0.0);

      v117[2](v117, *(_QWORD *)(a1 + 648));
      v28 = a1;
      *(_BYTE *)(a1 + 593) = 0;
      *(_DWORD *)(a1 + 596) = v121;
      *(_OWORD *)(a1 + 600) = *MEMORY[0x1E0C9D820];
    }
  }
  else if (v29)
  {
    v38 = [PKApplicationMessageView_RemovedSubviewContainer alloc];
    if (v38)
      v39 = -[PKApplicationMessageView_RemovedSubviewContainer initWithView:index:layoutMode:commitAnimation:]((id *)&v38->super.isa, *(void **)(a1 + 648), 0, v121, 0);
    else
      v39 = 0;
    objc_msgSend(v120, "addObject:", v39);

    v40 = *(id **)(a1 + 648);
    if (v40)
    {
      objc_storeWeak(v40 + 76, 0);
      v41 = a1;
      v40 = *(id **)(a1 + 648);
    }
    else
    {
      v41 = a1;
    }
    *(_QWORD *)(v41 + 648) = 0;

    v28 = a1;
  }
  objc_msgSend(v119, "differenceFromArray:withOptions:usingEquivalenceTest:", *(_QWORD *)(v28 + 656), 0, &__block_literal_global_119);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (!v4 || (v43 = (char *)v115[4], !&v43[objc_msgSend(v115[2], "numberOfChildren")]))
     && *(_QWORD *)(a1 + 464) == 0;
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v122 = v42;
  v45 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v127, v148, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v128;
    v47 = v6;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v128 != v46)
          objc_enumerationMutation(v122);
        v49 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v48);
        v50 = objc_msgSend(v49, "index");
        v51 = objc_msgSend(v49, "changeType");
        if (v51 == 1)
        {
          objc_msgSend(v49, "object");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 656), "removeObjectAtIndex:", v50);
          objc_msgSend(v52, "context");
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v53;
          if (v53)
            v55 = *(void **)(v53 + 24);
          else
            v55 = 0;
          v56 = v55;
          -[PKApplicationMessageView _invalidate]((uint64_t)v56);
          v57 = [PKApplicationMessageView_RemovedSubviewContainer alloc];
          v125[0] = MEMORY[0x1E0C809B0];
          v125[1] = 3221225472;
          v125[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_3;
          v125[3] = &__block_descriptor_33_e67_v24__0__PKApplicationMessageView_RemovedSubviewContainer_8___v___16l;
          v126 = v44;
          v58 = -[PKApplicationMessageView_RemovedSubviewContainer initWithView:index:layoutMode:commitAnimation:]((id *)&v57->super.isa, v56, (void *)(v50 + v47), v121, v125);

          objc_msgSend(v120, "addObject:", v58);
        }
        else
        {
          if (v51)
            goto LABEL_79;
          objc_msgSend(v49, "object");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 656), "insertObject:atIndex:", v52, v50);
        }

LABEL_79:
        ++v48;
      }
      while (v45 != v48);
      v59 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v127, v148, 16);
      v45 = v59;
    }
    while (v59);
  }

  if (objc_msgSend(v120, "count"))
  {
    v60 = v120;
    v61 = v60;
    if (!*(_BYTE *)(a1 + 616))
    {
      v62 = v60;
      v63 = objc_msgSend(v60, "count");
      v61 = v62;
      if (v63)
      {
        v144 = 0;
        v145 = &v144;
        v146 = 0x2020000000;
        v147 = 0x7FFFFFFFFFFFFFFFLL;
        v138 = 0;
        v139 = &v138;
        v140 = 0x3032000000;
        v141 = __Block_byref_object_copy__19;
        v142 = __Block_byref_object_dispose__19;
        objc_msgSend(v62, "objectEnumerator");
        v143 = (id)objc_claimAutoreleasedReturnValue();
        v132 = MEMORY[0x1E0C809B0];
        v133 = 3221225472;
        v134 = (uint64_t)__59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke;
        v135 = &unk_1E3E6B1C8;
        v136 = &v138;
        v137 = &v144;
        v64 = (void (**)(_QWORD))_Block_copy(&v132);
        objc_msgSend(v62, "sortUsingComparator:", &__block_literal_global_125);
        v64[2](v64);
        objc_msgSend(*(id *)(a1 + 664), "objectEnumerator");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0;
        v66 = 0;
        while (1)
        {
          objc_msgSend(v116, "nextObject");
          v67 = objc_claimAutoreleasedReturnValue();

          if (!v67)
            break;
          v68 = *(_QWORD *)(v67 + 40);
          while (1)
          {
            v69 = v145[3];
            v70 = v69 == 0x7FFFFFFFFFFFFFFFLL || v69 >= v68;
            if (v70)
              break;
            ++v66;
            v64[2](v64);
          }
          v71 = *(_QWORD *)(v67 + 40);
          v65 = (void *)v67;
          if (v71)
          {
            v70 = v71 >= v66;
            v72 = v71 - v66;
            if (!v70)
              v72 = 0;
            *(_QWORD *)(v67 + 40) = v72;
            v65 = (void *)v67;
          }
        }
        v73 = objc_msgSend(v62, "count");
        v74 = objc_msgSend(*(id *)(a1 + 664), "count");
        if (v74)
        {
          v75 = 0;
          v76 = 0;
          do
          {
            objc_msgSend(*(id *)(a1 + 664), "objectAtIndexedSubscript:", v75);
            v77 = objc_claimAutoreleasedReturnValue();
            v78 = (void *)v77;
            if (v77)
              v79 = *(_QWORD *)(v77 + 40);
            else
              v79 = 0;
            if (v76 < v73)
            {
              v80 = v75 + v73 - v76;
              while (1)
              {
                objc_msgSend(v62, "objectAtIndexedSubscript:", v76);
                v81 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                v82 = v81;
                if (v81)
                {
                  if (v81[5] > v79)
                    break;
                }
                objc_msgSend(*(id *)(a1 + 664), "insertObject:atIndex:", v81, v75);

                ++v75;
                if (v73 == ++v76)
                {
                  v76 = v73;
                  v75 = v80;
                  goto LABEL_109;
                }
              }

            }
LABEL_109:

            ++v75;
          }
          while (v75 < v74);
        }
        else
        {
          v76 = 0;
        }
        if (v76 < v73)
        {
          do
          {
            objc_msgSend(v62, "objectAtIndexedSubscript:", v76);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 664), "addObject:", v84);

            ++v76;
          }
          while (v73 != v76);
        }
        objc_msgSend(v62, "sortUsingComparator:", &__block_literal_global_126_0);
        v85 = objc_msgSend(*(id *)(a1 + 672), "count");
        if (v85)
        {
          v114 = v85;
          v86 = 0;
          v87 = 0;
          do
          {
            objc_msgSend(*(id *)(a1 + 672), "objectAtIndexedSubscript:", v86);
            v88 = objc_claimAutoreleasedReturnValue();
            v89 = (void *)v88;
            if (v88)
              v90 = *(_QWORD *)(v88 + 48);
            else
              v90 = 0;
            if (v87 < v73)
            {
              v91 = v86 + v73 - v87;
              while (1)
              {
                objc_msgSend(v62, "objectAtIndexedSubscript:", v87);
                v92 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                v93 = v92;
                if (v92)
                {
                  if (v92[6] > v90)
                    break;
                }
                objc_msgSend(*(id *)(a1 + 672), "insertObject:atIndex:", v92, v86);

                ++v86;
                if (v73 == ++v87)
                {
                  v87 = v73;
                  v86 = v91;
                  goto LABEL_130;
                }
              }

            }
LABEL_130:

            ++v86;
          }
          while (v86 < v114);
        }
        else
        {
          v87 = 0;
        }
        if (v87 < v73)
        {
          do
          {
            objc_msgSend(v62, "objectAtIndexedSubscript:", v87);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 672), "addObject:", v94);

            ++v87;
          }
          while (v73 != v87);
        }
        v95 = *(void **)(a1 + 512);
        if (!v95)
        {
          v96 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v97 = *(void **)(a1 + 512);
          *(_QWORD *)(a1 + 512) = v96;

          v95 = *(void **)(a1 + 512);
        }
        objc_msgSend(v95, "addObjectsFromArray:", v62);

        _Block_object_dispose(&v138, 8);
        _Block_object_dispose(&v144, 8);
        v61 = v62;
      }
    }

  }
  v98 = objc_msgSend(*(id *)(a1 + 664), "count");
  if (v98)
  {
    v138 = 0;
    v139 = &v138;
    v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__19;
    v142 = __Block_byref_object_dispose__19;
    objc_msgSend(*(id *)(a1 + 664), "lastObject");
    v143 = (id)objc_claimAutoreleasedReturnValue();
    v132 = 0;
    v133 = (uint64_t)&v132;
    v134 = 0x2020000000;
    v135 = 0;
    v124[0] = MEMORY[0x1E0C809B0];
    v124[1] = 3221225472;
    v124[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_5;
    v124[3] = &unk_1E3E6B1A0;
    v124[4] = a1;
    v124[5] = &v138;
    v124[6] = &v132;
    v124[7] = v98;
    v99 = (void (**)(void *, unint64_t, _QWORD))_Block_copy(v124);
    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(&v138, 8);

  }
  else
  {
    v99 = 0;
  }
  v100 = objc_msgSend(v119, "count");
  v101 = objc_msgSend(*(id *)(a1 + 656), "count");
  if (v101 < v100)
    v100 = v101;
  if (v99)
  {
    if (*(_QWORD *)(a1 + 648))
      v102 = v101 + 1;
    else
      v102 = v101;
    v99[2](v99, v102, 0);
  }
  if (v100)
  {
    for (i = v100 - 1; i != -1; --i)
    {
      objc_msgSend(*(id *)(a1 + 656), "objectAtIndexedSubscript:", i);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "objectAtIndexedSubscript:", i);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "context");
      v106 = objc_claimAutoreleasedReturnValue();
      v107 = (_QWORD *)v106;
      if (v104 == v105)
      {
        if (v106)
        {
          v109 = *(id *)(v106 + 24);
          if (v109)
            goto LABEL_159;
        }
        else
        {
          v107 = -[PKApplicationMessageViewContext initForNode:]([PKApplicationMessageViewContext alloc], v104);
          objc_msgSend(v104, "setContext:", v107);
        }
      }
      else
      {
        if (v106)
          v108 = *(void **)(v106 + 24);
        else
          v108 = 0;
        v109 = v108;
        -[PKApplicationMessageViewContext setNode:]((uint64_t)v107, v105);
        objc_msgSend(v105, "setContext:", v107);
        objc_msgSend(*(id *)(a1 + 656), "replaceObjectAtIndex:withObject:", i, v105);
        if (v109)
        {
LABEL_159:
          objc_msgSend((id)a1, "bringSubviewToFront:", v109);
LABEL_163:

          goto LABEL_164;
        }
      }
      v109 = (_QWORD *)-[PKApplicationMessageView _initWithType:configuration:]((uint64_t)[PKApplicationMessageView alloc], objc_msgSend(v105, "type"), *(void **)(a1 + 736));
      v109[58] = a1;
      *((_DWORD *)v109 + 127) = v121;
      ((void (**)(void *, _QWORD *))v117)[2](v117, v109);
      if (v107)
      {
        v107[3] = v109;
        goto LABEL_163;
      }
LABEL_164:
      if (v99)
      {
        if (*(_QWORD *)(a1 + 648))
          v110 = i + 1;
        else
          v110 = i;
        ((void (**)(void *, unint64_t, _QWORD *))v99)[2](v99, v110, v109);
      }
      -[PKApplicationMessageView _setContent:type:depth:](v109, v105, a2, a3 + v112);

    }
  }
  v111 = (void *)a1;
  if (*(_QWORD *)(a1 + 648))
  {
    objc_msgSend((id)a1, "bringSubviewToFront:");
    v111 = (void *)a1;
    if (v99)
    {
      v99[2](v99, 0, *(_QWORD *)(a1 + 648));
      v111 = (void *)a1;
    }
  }
  -[PKApplicationMessageView _invalidateSize](v111);

}

void __58__PKApplicationMessageView__treeLayoutPreludeWithContext___block_invoke(uint64_t a1, void *a2)
{
  char *v2;
  void *v3;
  unsigned __int8 *v4;
  int v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)*((_QWORD *)v2 + 60);
  if (v3
    && (objc_msgSend(v3, "context"), (v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = v4[8], v4, v5))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)*((_QWORD *)v2 + 82);
    if (v7)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v6 = 0;
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "context", (_QWORD)v14);
            v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            if (v13)
              v6 |= *(_BYTE *)(v13[3] + 500) != 0;

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }
  v2[500] = v6 & 1;
  *(_DWORD *)(v2 + 501) = 0x1000000;
  *((_DWORD *)v2 + 127) = 0;

}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  unsigned __int8 *v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BYTE *v18;
  int v19;
  BOOL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)v2[60];
  if (v3 && (objc_msgSend(v3, "context"), (v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4[8];
    v6 = v4[8] != 0;

    v7 = v2[81];
    v8 = v7 != 0;
    if (v5)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
    {
LABEL_31:
      LOBYTE(v8) = 1;
      v6 = 1;
      goto LABEL_32;
    }
  }
  else
  {
    v6 = 0;
    v8 = v2[81] != 0;
  }
  v10 = (void *)v2[82];
  if (v10)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (!v12)
      goto LABEL_29;
    v13 = v12;
    v14 = *(_QWORD *)v22;
LABEL_12:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(v11);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "context", (_QWORD)v21);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        break;
LABEL_27:

      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          goto LABEL_12;
LABEL_29:

        LOBYTE(v8) = v8;
        goto LABEL_32;
      }
    }
    v18 = *(id *)(v16 + 24);
    if (v6)
    {
      v6 = 1;
      if (v8)
      {
LABEL_18:
        v19 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      v6 = v18[500] != 0;
      if (v8)
        goto LABEL_18;
    }
    if (v18[501])
      v8 = 1;
    v19 = v8;
LABEL_23:
    if (v19)
      v20 = v6;
    else
      v20 = 0;

    if (v20)
    {

      goto LABEL_31;
    }
    goto LABEL_27;
  }
LABEL_32:
  *((_BYTE *)v2 + 500) = v6;
  *((_BYTE *)v2 + 501) = v8;

}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  _QWORD *v18;
  uint64_t v19;
  _BOOL8 v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  BOOL v30;
  _BOOL8 v31;
  double *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  _BOOL8 v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id obj;
  uint64_t v59;
  _QWORD *aBlock;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  NSObject *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id location;
  _QWORD v73[5];
  BOOL v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[5];
  id v79;
  char v80;
  uint64_t block;
  uint64_t v82;
  void (*v83)(uint64_t);
  void *v84;
  _QWORD *v85;
  id v86;
  char v87;
  id from;
  _QWORD v89[3];
  char v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (uint64_t)v3;
  if (*(_BYTE *)(a1 + 32))
  {
    v5 = v3[58];
    v6 = v5;
    if (v5 && !*((_BYTE *)v5 + 503))
    {
      -[PKApplicationMessageView _markPresented](v4);
      v7 = 0;
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    -[PKApplicationMessageView _markPresented]((uint64_t)v3);
    v7 = 1;
  }
  v8 = *(_QWORD *)(v4 + 480);
  if (v8)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v8)
      v10 = 0;
    else
      v10 = v7;
  }
  else
  {
    v10 = *(_BYTE *)(v4 + 504) != 0;
  }
  *(_BYTE *)(v4 + 503) = v10;
  v11 = *(void **)(v4 + 656);
  v57 = v4;
  if (v11)
  {
    v12 = *(unsigned __int8 *)(v4 + 502);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v91, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v62;
      v16 = v12 != 0;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v62 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "context");
          v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18[3];
            *(_BYTE *)(v19 + 502) = v16 & 1;
            v16 |= *(_BYTE *)(v19 + 501) != 0;
          }

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v91, 16);
      }
      while (v14);
    }

    v4 = v57;
  }
  if (*(_BYTE *)(a1 + 32))
    v20 = v10;
  else
    v20 = 0;
  if (!*(_BYTE *)(v4 + 616))
  {
    v21 = *(unsigned __int8 *)(v4 + 500) != 0;
    objc_msgSend(*(id *)(v4 + 480), "context");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = v21;
    else
      v24 = 0;
    if (v24)
    {
      v25 = *(_QWORD *)(v22 + 32);
      v26 = (unint64_t)(objc_msgSend(*(id *)(v22 + 16), "numberOfChildren") + v25) > 1;
    }
    else
    {
      v26 = 0;
    }
    v27 = v57;
    if (*(unsigned __int8 *)(v57 + 592) != v26)
    {
      *(_BYTE *)(v57 + 592) = v26;
      if (*(_QWORD *)(v57 + 640))
      {
        -[PKApplicationMessageView _invalidateSize]((void *)v57);
        v27 = v57;
      }
    }
    v28 = *(_BYTE **)(v27 + 648);
    v29 = MEMORY[0x1E0C809B0];
    if (v28)
    {
      v30 = v20 && *(_BYTE *)(v27 + 593) != 0;
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke;
      v73[3] = &unk_1E3E64C10;
      v73[4] = v27;
      v74 = v30;
      v31 = v20 && *(_BYTE *)(v27 + 593) != 0;
      -[PKApplicationMessageContentView performBatchUpdates:animated:](v28, v73, v31);
      v32 = (double *)(v57 + 600);
      v33 = *(_QWORD *)(v57 + 736);
      v34 = v33 ? *(double *)(v33 + 8) : 0.0;
      v36 = *v32;
      v35 = *(double *)(v57 + 608);
      objc_msgSend(*(id *)(v57 + 648), "sizeThatFits:", v34, 1.79769313e308);
      *(_QWORD *)v32 = v37;
      *(_QWORD *)(v57 + 608) = v38;
      v27 = v57;
      if (v36 != *(double *)(v57 + 600) || v35 != *(double *)(v57 + 608))
      {
        -[PKApplicationMessageView _invalidateSize]((void *)v57);
        v27 = v57;
      }
    }
    if (*(_QWORD *)(v27 + 512))
    {
      if (v20)
        v39 = dispatch_group_create();
      else
        v39 = 0;
      objc_initWeak(&location, (id)v27);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = *(id *)(v57 + 512);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
      if (v40)
      {
        v59 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v69 != v59)
              objc_enumerationMutation(obj);
            v42 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
            if (v39)
              dispatch_group_enter(v39);
            v65[0] = v29;
            v65[1] = 3221225472;
            v65[2] = __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_2;
            v65[3] = &unk_1E3E6B250;
            objc_copyWeak(&v67, &location);
            v66 = v39;
            aBlock = v65;
            if (v42)
            {
              if (*(_BYTE *)(v42 + 24))
                __break(1u);
              v43 = _Block_copy(aBlock);
              v44 = *(void **)(v42 + 16);
              *(_QWORD *)(v42 + 16) = v43;

              *(_BYTE *)(v42 + 24) = 1;
              if (v20)
              {
                v89[0] = 0;
                v89[1] = v89;
                v89[2] = 0x2020000000;
                v90 = 0;
                if (*(_QWORD *)(v42 + 8))
                  v45 = 2;
                else
                  v45 = 1;
                objc_initWeak(&from, (id)v42);
                v46 = *(void **)(v42 + 32);
                block = v29;
                v82 = 3221225472;
                v83 = __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke;
                v84 = &unk_1E3E6ACA0;
                objc_copyWeak(&v86, &from);
                v85 = v89;
                v87 = v45;
                objc_msgSend(v46, "pkui_setAlpha:animated:withCompletion:", 1, &block, 0.0);
                if (*(_QWORD *)(v42 + 8))
                {
                  v78[0] = v29;
                  v78[1] = 3221225472;
                  v78[2] = __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_2;
                  v78[3] = &unk_1E3E6ACC8;
                  objc_copyWeak(&v79, &from);
                  v78[4] = v89;
                  v80 = v45;
                  v47 = _Block_copy(v78);
                  v48 = v20;
                  v49 = v23;
                  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66CA8]), "initWithBlock:", v47);
                  v51 = *(_QWORD *)(v42 + 8);
                  v75[0] = v29;
                  v75[1] = 3221225472;
                  v75[2] = __82__PKApplicationMessageView_RemovedSubviewContainer_commitAnimated_withCompletion___block_invoke_3;
                  v75[3] = &unk_1E3E61850;
                  v52 = v50;
                  v76 = v52;
                  v53 = v47;
                  v77 = v53;
                  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v51 + 16))(v51, v42, v75);
                  v54 = *(void **)(v42 + 8);
                  *(_QWORD *)(v42 + 8) = 0;

                  v23 = v49;
                  v20 = v48;

                  objc_destroyWeak(&v79);
                }
                objc_destroyWeak(&v86);
                objc_destroyWeak(&from);
                _Block_object_dispose(v89, 8);
              }
              else
              {
                v55 = *(void **)(v42 + 8);
                *(_QWORD *)(v42 + 8) = 0;

                -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:](v42, 0);
              }
            }

            objc_destroyWeak(&v67);
          }
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
        }
        while (v40);
      }

      v56 = *(void **)(v57 + 512);
      *(_QWORD *)(v57 + 512) = 0;

      if (v39)
      {
        block = v29;
        v82 = 3221225472;
        v83 = __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_3;
        v84 = &unk_1E3E61310;
        objc_copyWeak((id *)&v85, &location);
        dispatch_group_notify(v39, MEMORY[0x1E0C80D38], &block);
        objc_destroyWeak((id *)&v85);
      }
      objc_destroyWeak(&location);

    }
    v4 = v57;
  }

}

- (void)_markPresented
{
  if (a1 && !*(_BYTE *)(a1 + 616))
  {
    if (*(_QWORD *)(a1 + 648) && !*(_BYTE *)(a1 + 593))
    {
      *(_BYTE *)(a1 + 593) = 1;
      if (!*(_BYTE *)(a1 + 504))
        *(_BYTE *)(a1 + 504) = 1;
      goto LABEL_8;
    }
    if (!*(_BYTE *)(a1 + 504))
    {
      *(_BYTE *)(a1 + 504) = 1;
      a1 = *(_QWORD *)(a1 + 464);
      if (a1)
LABEL_8:
        -[PKApplicationMessageView _invalidateSize]((void *)a1);
    }
  }
}

- (void)_visitPreOrder:(uint64_t)a1
{
  void (**v3)(id, id *, char *, _BYTE *);
  void *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  char v12;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1A1AE621C]();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
    if (objc_msgSend(v5, "count"))
    {
      v6 = MEMORY[0x1E0C809B0];
      while (1)
      {
        objc_msgSend(v5, "lastObject");
        v7 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeLastObject");
        v12 = 1;
        v11 = 0;
        v3[2](v3, v7, &v12, &v11);
        if (v11)
          break;
        if (v12 && objc_msgSend(v7[82], "count"))
        {
          v8 = v7[82];
          v9[0] = v6;
          v9[1] = 3221225472;
          v9[2] = __43__PKApplicationMessageView__visitPreOrder___block_invoke;
          v9[3] = &unk_1E3E6B300;
          v10 = v5;
          objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v9);

        }
        if (!objc_msgSend(v5, "count"))
          goto LABEL_11;
      }

    }
LABEL_11:

    objc_autoreleasePoolPop(v4);
  }

}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_3(uint64_t a1, unsigned __int8 *a2)
{
  int v2;

  v2 = a2[502];
  if (a2[520] != v2)
  {
    a2[520] = v2;
    -[PKApplicationMessageView _invalidateSize](a2);
  }
}

- (void)_invalidateSize
{
  _BYTE *v1;
  _BYTE *v2;
  id *v3;

  if (a1)
  {
    v1 = a1;
    do
    {
      if (v1[536])
        break;
      v1[536] = 1;
      v3 = (id *)v1;
      objc_msgSend(v1, "setNeedsLayout");
      v2 = v3[58];

      v1 = v2;
    }
    while (v2);

  }
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id *v8;

  v8 = a2;
  objc_msgSend(v8[60], "context");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5
    && !*(_BYTE *)(v5 + 8)
    && (v7 = *(_QWORD *)(v5 + 32), (unint64_t)(objc_msgSend(*(id *)(v5 + 16), "numberOfChildren") + v7) > 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    *a3 = 0;
  }
  else if (*((double *)v8 + 66) != 1.79769313e308)
  {
    v8[66] = (id)0x7FEFFFFFFFFFFFFFLL;
    -[PKApplicationMessageView _invalidateSize](v8);
  }

}

double __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  double result;

  if (*(_QWORD *)(a2 + 648))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    result = *(double *)(a2 + 608);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_6(uint64_t a1, void *a2)
{
  double *v3;
  double v4;
  double *v5;

  v3 = a2;
  if (*(double **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == v3)
    v4 = 1.79769313e308;
  else
    v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v3[66] != v4)
  {
    v3[66] = v4;
    v5 = v3;
    -[PKApplicationMessageView _invalidateSize](v3);
    v3 = v5;
  }

}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_7(uint64_t a1, void *a2, _BYTE *a3)
{
  _BYTE *v4;
  id v5;
  _BYTE *v6;

  v4 = a2;
  v5 = v4;
  if (v4[503])
  {
    v6 = v4;
    PKCATrackedLayoutPerform();

  }
  else
  {
    objc_msgSend(v4, "layoutIfNeededAnimated:", 0, v4);
    *a3 = 0;
  }

}

double __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  unsigned int IsAnimated;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;

  v2 = *(_QWORD *)(a1 + 32);
  IsAnimated = PKCATrackedLayoutIsAnimated();
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return -[PKApplicationMessageView _layoutWithContext:bounds:](v2, IsAnimated | 0x200000000, v4, v5, v6, v7);
}

void __59__PKApplicationMessageView__treeLayoutPostludeWithContext___block_invoke_9(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 503) = 1;
  -[PKApplicationMessageView _markPresented](a2);
}

uint64_t __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", a2);
}

uint64_t __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqual:", v6);
  return v7;
}

void __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (!*(_BYTE *)(a1 + 32))
      goto LABEL_12;
    v11 = 0;
    goto LABEL_11;
  }
  v8 = *((_DWORD *)v5 + 7);
  if (v8)
    v9 = 1;
  else
    v9 = *(_BYTE *)(a1 + 32) == 0;
  if (!v9 || v8 == 1)
  {
    v11 = *((_QWORD *)v5 + 4);
LABEL_11:
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_4;
    v12[3] = &unk_1E3E614F0;
    v13 = v6;
    -[PKApplicationMessageView _setBlurRadius:animated:withCompletion:](v11, 1, v12, 8.33333333);

  }
LABEL_12:

}

uint64_t __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__PKApplicationMessageView__updateSubviewsWithType_depth___block_invoke_5(_QWORD *a1, unint64_t a2, void *a3)
{
  void *v3;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v7)
  {
    while (!a2 || *(_QWORD *)(v7 + 40) >= a2)
    {
      v8 = *(id *)(v7 + 32);
      v9 = (void *)a1[4];
      if (v6)
        objc_msgSend(v9, "insertSubview:aboveSubview:", v8, v6);
      else
        objc_msgSend(v9, "bringSubviewToFront:", v8);
      v14 = v8;

      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v10 = a1[7];
      v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (v11 >= v10)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1[4] + 664), "objectAtIndexedSubscript:", v10 + ~v11);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v3;
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v12);
      if (v11 < v10)

      v13 = v14;
      v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      v6 = v14;
      if (!v7)
        goto LABEL_15;
    }
  }
  v13 = v6;
LABEL_15:

}

void __59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "nextObject");
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3[5];
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

      v3 = 0;
    }

  }
}

uint64_t __59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  if (a2)
  {
    v5 = *(_QWORD *)(a2 + 40);
    if (v4)
    {
LABEL_3:
      v6 = v4[5];
      goto LABEL_4;
    }
  }
  else
  {
    v5 = 0;
    if (v4)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_4:
  v7 = v5 >= v6;
  v8 = v5 == v6;
  v9 = -1;
  if (v7)
    v9 = 1;
  if (v8)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

uint64_t __59__PKApplicationMessageView__stageRemovedSubviewContainers___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  if (a2)
  {
    v5 = *(_QWORD *)(a2 + 48);
    if (v4)
    {
LABEL_3:
      v6 = v4[6];
      goto LABEL_4;
    }
  }
  else
  {
    v5 = 0;
    if (v4)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_4:
  v7 = v5 >= v6;
  v8 = v5 == v6;
  v9 = -1;
  if (v7)
    v9 = 1;
  if (v8)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

void __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 648);
  objc_msgSend(*(id *)(v2 + 488), "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[PKApplicationMessageContentView setContent:animated:](v3, v4, 0);

  -[PKApplicationMessageContentView setDismissable:animated:](*(_BYTE **)(*(_QWORD *)(a1 + 32) + 648), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 624) == 0, *(unsigned __int8 *)(a1 + 40));
}

void __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = v7;
    objc_msgSend(WeakRetained[83], "removeObjectAtIndex:", objc_msgSend(WeakRetained[83], "indexOfObjectIdenticalTo:", v4));
    objc_msgSend(WeakRetained[84], "removeObjectAtIndex:", objc_msgSend(WeakRetained[84], "indexOfObjectIdenticalTo:", v4));
    if (v4)
      v5 = (void *)v4[4];
    else
      v5 = 0;
    objc_msgSend(v5, "removeFromSuperview");

  }
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
    dispatch_group_leave(v6);

}

void __69__PKApplicationMessageView__commitStagedContentAnimated_dismissable___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "needsRemoval");
    v2 = v5;
    if (v3)
    {
      v4 = objc_loadWeakRetained(v5 + 93);
      objc_msgSend(v4, "applicationMessageViewNeedsRemoval:", v5);

      v2 = v5;
    }
  }

}

void __40__PKApplicationMessageView__queueReload__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  _BYTE *v3;
  void *v4;
  NSObject *v5;
  int v6;
  _BYTE *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[633] = 0;
    v3 = -[PKApplicationMessageView _rootView](WeakRetained);
    v4 = v3;
    if (v3 == v2)
    {
      v3 = v2;
    }
    else if (v3[633])
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 134218240;
        v7 = v2;
        v8 = 2048;
        v9 = v4;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKApplicationMessageView (%p): deferring queued reload to new root view %p.", (uint8_t *)&v6, 0x16u);
      }

      goto LABEL_9;
    }
    __40__PKApplicationMessageView__queueReload__block_invoke_2(v3);
LABEL_9:

  }
}

void __40__PKApplicationMessageView__queueReload__block_invoke_2(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  __int128 buf;
  void (*v8)(uint64_t);
  void *v9;
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    __break(1u);
  v6 = v1;
  -[PKApplicationMessageView _visitPreOrder:]((uint64_t)v1, &__block_literal_global_130);
  v2 = -[PKApplicationMessageView _rootView](v6);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v2;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKApplicationMessageView (%p): reloading full graph.", (uint8_t *)&buf, 0xCu);
  }

  v4 = v6;
  v5 = (void *)v6[80];
  if (v5)
  {
    objc_msgSend(v5, "setNeedsUpdateConfiguration");
    v4 = v6;
  }
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v8 = __35__PKApplicationMessageView__reload__block_invoke;
  v9 = &unk_1E3E6AFE8;
  v10 = v4;
  -[PKApplicationMessageView _treeLayoutWithContext:block:](v2, 0, &buf);

}

void __40__PKApplicationMessageView__queueReload__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 632) = 0;
}

void __35__PKApplicationMessageView__reload__block_invoke(uint64_t a1)
{
  -[PKApplicationMessageView _visitPreOrder:](*(_QWORD *)(a1 + 32), &__block_literal_global_131);
}

void __35__PKApplicationMessageView__reload__block_invoke_2(uint64_t a1, void *a2)
{
  -[PKApplicationMessageView _invalidateSize](a2);
}

- (void)_updateFilters
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = a1[88];
  if (!a1[86])
  {
    if (!v4)
    {
      objc_msgSend(v2, "setFilters:", 0);
      goto LABEL_9;
    }
    v9 = a1[88];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v9;
    goto LABEL_7;
  }
  if (!v4)
  {
    v10 = a1[86];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v10;
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v11[0] = a1[86];
  v11[1] = v4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = v11;
  v7 = 2;
LABEL_8:
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", v8);

LABEL_9:
}

uint64_t __67__PKApplicationMessageView__setBlurRadius_animated_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__PKApplicationMessageView__updateHighlightAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 712), CFSTR("filters.highlightFilter.inputColor"));
}

void __35__PKApplicationMessageView__expand__block_invoke(uint64_t a1)
{
  unsigned int v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1;
  else
    v1 = 2;
  -[PKApplicationMessageView _updateSubviewsWithType:depth:](*(_QWORD *)(a1 + 32), v1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 624));
}

- (void)_dismiss
{
  id v2;
  id WeakRetained;
  id *v4;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 616))
    {
      v4 = (id *)-[PKApplicationMessageView _rootView]((void *)a1);
      v2 = *(id *)(a1 + 480);
      WeakRetained = objc_loadWeakRetained(v4 + 93);
      objc_msgSend(WeakRetained, "applicationMessageView:requestsContentDismissal:", v4, v2);

    }
  }
}

void __41__PKApplicationMessageView__resetVisited__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 472) = 0;
}

void __43__PKApplicationMessageView__visitPreOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "context");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = *(_QWORD *)(v3 + 24);
  else
    v4 = 0;
  objc_msgSend(v2, "addObject:", v4);

}

void __44__PKApplicationMessageView__visitPostOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "context");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = *(_QWORD *)(v3 + 24);
  else
    v4 = 0;
  objc_msgSend(v2, "addObject:", v4);

}

- (void)_tapped:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  PKApplicationMessage *message;
  unsigned __int8 *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  id *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD v30[5];
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PKApplicationMessageNode context](self->_content, "context", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && !*(_BYTE *)(v4 + 8)
    && (v5 = *(_QWORD *)(v4 + 32),
        v28 = (id)v4,
        v6 = objc_msgSend(*(id *)(v4 + 16), "numberOfChildren") + v5,
        v4 = (uint64_t)v28,
        v6 > 1))
  {
    if (!self->_invalidated)
    {
      -[PKApplicationMessageNode context](self->_content, "context");
      v18 = objc_claimAutoreleasedReturnValue();
      v8 = (unsigned __int8 *)v18;
      if (v18)
      {
        v19 = *(unsigned __int8 *)(v18 + 8);
        v20 = *(_QWORD *)(v18 + 32);
        v21 = objc_msgSend(*(id *)(v18 + 16), "numberOfChildren");
        v22 = (unint64_t)(v21 + v20) > 1;
        v23 = v8[8];
        if (v23 != v22)
        {
          v8[8] = v22;
          v23 = (unint64_t)(v21 + v20) > 1;
        }
        if ((v19 != 0) != (v23 != 0))
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __35__PKApplicationMessageView__expand__block_invoke;
          v30[3] = &unk_1E3E6B2B8;
          v30[4] = self;
          v31 = v23;
          -[PKApplicationMessageView _treeLayoutWithContext:block:](self, 1u, v30);
        }
      }
      goto LABEL_23;
    }
  }
  else if (!self->_invalidated)
  {
    message = self->_message;
    if (message)
    {
      v28 = (id)v4;
      v8 = message;
      objc_msgSend(v8, "content");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "action");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = objc_msgSend(v10, "type");
        if (v11 <= 1)
        {
          v12 = v11;
          objc_msgSend(v10, "url");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc_init(MEMORY[0x1E0CA5938]);
          objc_msgSend(v14, "setSensitive:", v12 == 1);
          v29 = *MEMORY[0x1E0D22D88];
          v30[0] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setFrontBoardOptions:", v15);

          if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
          {
            -[PKApplicationMessageView window](self, "window");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
              PKPostOpenApplicationNotification(v16, v13, v14);

          }
          else
          {
            PKOpenApplication(v13, v14);
          }

        }
        v24 = (id *)-[PKApplicationMessageView _rootView](self);
        WeakRetained = objc_loadWeakRetained(v24 + 93);
        objc_msgSend(v8, "registration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "key");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "applicationMessageView:tappedApplicationMessageWithKey:", v24, v27);

      }
LABEL_23:

      v4 = (uint64_t)v28;
    }
  }

}

- (BOOL)needsRemoval
{
  BOOL v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (self->_invalidated)
    return 1;
  if (-[NSMutableArray count](self->_removedSubviews, "count"))
    return 0;
  -[PKApplicationMessageNode context](self->_content, "context");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = *(_QWORD *)(v4 + 32);
    v2 = objc_msgSend(*(id *)(v4 + 16), "numberOfChildren") + v6 == 0;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

- (int64_t)scrollType
{
  return 1;
}

- (void)setSubheaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subheaderDelegate, a3);
}

- (PKApplicationMessageViewConfiguration)configuration
{
  return self->_configuration;
}

- (PKApplicationMessageViewDelegate)delegate
{
  return (PKApplicationMessageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_subheaderDelegate);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_removedVisualSubviews, 0);
  objc_storeStrong((id *)&self->_removedSubviews, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_stagedRemovedSubviews, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
