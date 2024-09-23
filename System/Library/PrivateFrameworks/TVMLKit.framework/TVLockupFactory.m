@implementation TVLockupFactory

_TVStackingPosterView *__35___TVLockupFactory__registerLockup__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _TVStackingPosterView *v10;
  _TVStackingPosterView *v11;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_class layoutWithLayout:element:](+[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v6), "layoutWithLayout:element:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAcceptsFocus:", 1);
    +[_TVLockupFactory _configureCell:layout:element:](_TVLockupFactory, "_configureCell:layout:element:", v8, v9, v6);
    v10 = (_TVStackingPosterView *)v8;
    v7 = v9;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (_TVStackingPosterView *)v8;
    else
      v11 = objc_alloc_init(_TVStackingPosterView);
    v10 = v11;
    +[_TVLockupFactory _configureStackingPoster:layout:element:forMetrics:](_TVLockupFactory, "_configureStackingPoster:layout:element:forMetrics:", v11, 0, v6, 0);
  }

  return v10;
}

double __52___TVLockupFactory_cellMetricsForCollectionElement___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _OWORD *v3;
  double v4;
  double v5;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;

  v2 = *(_QWORD *)(a1[4] + 8);
  v5 = *(double *)(v2 + 32);
  v4 = *(double *)(v2 + 40);
  v3 = (_OWORD *)(v2 + 32);
  if (v5 == *MEMORY[0x24BDBF148] && v4 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    *v3 = *(_OWORD *)a2;
    v17 = *(_QWORD *)(a1[5] + 8);
    v18 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v17 + 32) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v17 + 48) = v18;
    v19 = *(_QWORD *)(a1[6] + 8);
    v20 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v19 + 32) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v19 + 48) = v20;
    v21 = *(_QWORD *)(a1[7] + 8);
    v22 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(v21 + 32) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v21 + 48) = v22;
    v23 = *(_QWORD *)(a1[8] + 8);
    v24 = *(_OWORD *)(a2 + 112);
    v25 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(v23 + 32) = v24;
    *(_OWORD *)(v23 + 48) = v25;
    return *(double *)&v24;
  }
  if (v5 != 0.0 && v5 != *(double *)a2)
  {
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 56) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = 0;
    v4 = *(double *)(*(_QWORD *)(a1[4] + 8) + 40);
  }
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(double *)(v7 + 32);
  v9 = *(double *)(a2 + 8);
  v10 = *(double *)(a2 + 16);
  v11 = v10 - v8;
  v12 = v4 - (v8 + *(double *)(v7 + 48));
  v13 = *(double *)(a2 + 32);
  v14 = v9 - (v10 + v13);
  v15 = a1[9];
  if (v15 == 3)
  {
    v16 = v14 - v12;
    goto LABEL_13;
  }
  if (v15 == 2)
  {
    v16 = floor((v14 - v12) * 0.5);
LABEL_13:
    v11 = v11 + v16;
  }
  if (v11 <= 0.0)
  {
    if (v11 < 0.0)
    {
      v9 = v9 - v11;
      *(double *)(a2 + 8) = v9;
      *(double *)(a2 + 16) = v10 - v11;
      *(double *)(a2 + 112) = fmin(v11 + *(double *)(a2 + 112), 0.0);
    }
  }
  else
  {
    *(double *)(v7 + 32) = v8 + v11;
    *(double *)(*(_QWORD *)(a1[4] + 8) + 40) = v11 + *(double *)(*(_QWORD *)(a1[4] + 8) + 40);
    *(double *)(*(_QWORD *)(a1[8] + 8) + 32) = fmin(*(double *)(*(_QWORD *)(a1[8] + 8) + 32) - v11, 0.0);
    v9 = *(double *)(a2 + 8);
  }
  v26 = *(_QWORD *)(a1[4] + 8);
  v27 = *(double *)(v26 + 40);
  v28 = v9 - v27;
  if (v9 - v27 <= 0.0)
  {
    if (v9 - v27 < 0.0)
    {
      *(double *)(a2 + 8) = v9 - v28;
      v13 = v13 - v28;
      *(double *)(a2 + 32) = v13;
      *(double *)(a2 + 128) = fmax(v28 + *(double *)(a2 + 128), 0.0);
    }
  }
  else
  {
    *(double *)(v26 + 40) = v27 + v28;
    *(double *)(*(_QWORD *)(a1[5] + 8) + 48) = v28 + *(double *)(*(_QWORD *)(a1[5] + 8) + 48);
    *(double *)(*(_QWORD *)(a1[8] + 8) + 48) = fmax(*(double *)(*(_QWORD *)(a1[8] + 8) + 48) - v28, 0.0);
    v13 = *(double *)(a2 + 32);
  }
  *(double *)(*(_QWORD *)(a1[5] + 8) + 48) = fmin(*(double *)(*(_QWORD *)(a1[5] + 8) + 48), v13);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 32) = fmin(*(double *)(*(_QWORD *)(a1[6] + 8) + 32), *(double *)(a2 + 48));
  *(double *)(*(_QWORD *)(a1[6] + 8) + 48) = fmin(*(double *)(*(_QWORD *)(a1[6] + 8) + 48), *(double *)(a2 + 64));
  *(double *)(*(_QWORD *)(a1[7] + 8) + 32) = fmin(*(double *)(*(_QWORD *)(a1[7] + 8) + 32), *(double *)(a2 + 80));
  *(double *)(*(_QWORD *)(a1[7] + 8) + 48) = fmin(*(double *)(*(_QWORD *)(a1[7] + 8) + 48), *(double *)(a2 + 96));
  *(double *)(*(_QWORD *)(a1[8] + 8) + 32) = fmax(*(double *)(*(_QWORD *)(a1[8] + 8) + 32), *(double *)(a2 + 112));
  v29 = *(_QWORD *)(a1[8] + 8);
  *(double *)&v24 = fmax(*(double *)(v29 + 48), *(double *)(a2 + 128));
  *(_QWORD *)(v29 + 48) = v24;
  return *(double *)&v24;
}

void *__71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke(uint64_t a1, void *a2)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result != a2)
    return (void *)objc_msgSend(result, "setOverlayView:", 0);
  return result;
}

void *__71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_2(uint64_t a1, void *a2)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result != a2)
    return (void *)objc_msgSend(result, "setOverlayView:", 0);
  return result;
}

void __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v12, "tv_elementType");
  if (v8 == objc_msgSend(v7, "tv_elementType"))
  {
    if (objc_msgSend(v12, "tv_elementType") == 55)
    {
      objc_msgSend(v12, "valueForTVViewStyle:", CFSTR("tv-text-highlight-style"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "style");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tv_textHighlightStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v11 && (objc_msgSend(v9, "isEqualToString:", v11) & 1) == 0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

void __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_23(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  char v25;
  id v26;

  v5 = a2;
  v26 = v5;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v26;
    v8 = (id)v6;
  }
  else
  {
    v7 = v5;
    v8 = 0;
  }
  v9 = objc_msgSend(v7, "tv_elementType");
  objc_msgSend(v8, "tv_associatedIKViewElement");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v26;
  v12 = (void *)v10;
  if (v8 && (id)v10 == v26 && (v13 = objc_msgSend(v26, "updateType"), v11 = v26, !v13))
  {
    v16 = v8;
  }
  else
  {
    +[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v11);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setAcceptsFocus:", *(unsigned __int8 *)(a1 + 80));
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_viewFromElement:layout:existingView:", v26, v14, v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "isDisabled"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(*(id *)(a1 + 40), "tv_elementType") == 24
        && objc_msgSend(v26, "tv_elementType") == 55
        && (objc_msgSend(v26, "tv_textStyle") == 1 || objc_msgSend(v26, "tv_textStyle") == 2))
      {
        v17 = v16;
        objc_msgSend(v17, "textColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setTextColor:", v19);
      }
    }

  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v22 = *(_QWORD *)(v20 + 40);
  v21 = (id *)(v20 + 40);
  if (!v22 && (v9 == 30 || v9 == 16))
    objc_storeStrong(v21, v16);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v23 + 24))
    v24 = v16 == v8;
  else
    v24 = 0;
  v25 = v24;
  *(_BYTE *)(v23 + 24) = v25;
  if (v16)
  {
    objc_msgSend(v16, "tv_setAssociatedIKViewElement:", v26);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);
  }

}

uint64_t __55___TVLockupFactory__configurationIdentifierForElement___block_invoke(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%.0f %.0f %.0f %.0f;"),
           a6,
           *(_QWORD *)&a1,
           *(_QWORD *)&a4,
           *(_QWORD *)&a3,
           *(_QWORD *)&a2);
}

uint64_t __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_2(double a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%.0f;"), a3, *(_QWORD *)&a1);
}

id __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  __CFString *v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = a2;
  v7 = -[__CFString length](v5, "length");
  v8 = CFSTR("none");
  if (v7)
    v8 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@;"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_4(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a2, "tv_imageScaleToSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", CFSTR("{"));
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_margin");
  (*(void (**)(uint64_t, const __CFString *))(v8 + 16))(v8, CFSTR("margin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v10);

  (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v11);

  (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v12);

  objc_msgSend(v7, "appendString:", CFSTR("}"));
  if (objc_msgSend(v7, "length"))
    v13 = (void *)objc_msgSend(v7, "copy");
  else
    v13 = 0;

  return v13;
}

id __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(a2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tv_maxTextLines");

  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", CFSTR("{"));
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tv_margin");
    (*(void (**)(uint64_t, const __CFString *))(v6 + 16))(v6, CFSTR("margin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v8);

    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tv_textStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, const __CFString *, void *))(v9 + 16))(v9, CFSTR("textStyle"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v12);

    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tv_fontSize");
    (*(void (**)(uint64_t, const __CFString *))(v13 + 16))(v13, CFSTR("fontSize"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v15);

    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "style");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tv_fontWeight");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, const __CFString *, void *))(v16 + 16))(v16, CFSTR("fontWeight"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v19);

    v20 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "style");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tv_fontFamily");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, const __CFString *, void *))(v20 + 16))(v20, CFSTR("fontFamily"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v23);

    objc_msgSend(v5, "appendString:", CFSTR("}"));
  }
  else
  {
    v5 = 0;
  }
  v24 = (void *)objc_msgSend(v5, "copy");

  return v24;
}

@end
