@implementation UIFocusEffectManager

void __41___UIFocusEffectManager_moveFocusToItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  double v19;
  double v20;
  double v21;
  _BOOL8 v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  BOOL v27;
  BOOL v28;
  _BOOL8 v29;
  double width;
  double v31;
  double v32;
  double height;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  objc_msgSend(*(id *)(a1 + 32), "haloView");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "position");
  switch(v2)
  {
    case 2:
      v29 = 1;
      goto LABEL_32;
    case 1:
      v29 = 0;
      goto LABEL_32;
    case 0:
      v3 = *(void **)(a1 + 48);
      v4 = *(void **)(a1 + 56);
      objc_msgSend(v42, "totalConsumedSpace");
      v6 = v5;
      v7 = v3;
      v8 = v4;
      v9 = v8;
      if (!v8)
        goto LABEL_30;
      v10 = v8;
      while (1)
      {
        v11 = _UIFocusItemFrameInCoordinateSpace(v7, v10);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v18 = v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (!objc_msgSend(v18, "clipsToBounds"))
          goto LABEL_15;
        objc_msgSend(v18, "bounds");
        v48 = CGRectInset(v47, v6, v6);
        v50.origin.x = v11;
        v50.origin.y = v13;
        v50.size.width = v15;
        v50.size.height = v17;
        v28 = CGRectContainsRect(v48, v50);

        if (!v28)
        {
          v10 = v18;
          goto LABEL_31;
        }
LABEL_16:
        objc_msgSend(v18, "superview");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_31;
      }
      v10 = v18;
      objc_msgSend(v10, "contentSize");
      v20 = v19;
      objc_msgSend(v10, "frame");
      v22 = v20 > v21;
      objc_msgSend(v10, "contentSize");
      v24 = v23;
      objc_msgSend(v10, "frame");
      v26 = (v24 > v25) | (unint64_t)(2 * v22);
      v43.origin.x = v11;
      v43.origin.y = v13;
      v43.size.width = v15;
      v43.size.height = v17;
      v44 = CGRectInset(v43, -v6, -v6);
      if (v26)
      {
        if (v26 != 1)
        {
          if (v26 != 3)
          {
            width = v44.size.width;
            if (objc_msgSend(v10, "clipsToBounds", v44.origin.x, v44.origin.y))
            {
              objc_msgSend(v10, "frame");
              v32 = v31;

              if (width >= v32)
                goto LABEL_31;
LABEL_29:

LABEL_30:
              v10 = 0;
              goto LABEL_31;
            }
          }
LABEL_28:

          goto LABEL_29;
        }
        height = v44.size.height;
        if (!objc_msgSend(v10, "clipsToBounds", v44.origin.x, v44.origin.y, v44.size.width))
          goto LABEL_28;
        objc_msgSend(v10, "frame");
        v35 = v34;

        if (height < v35)
          goto LABEL_29;
LABEL_31:
        v29 = v10 != 0;

LABEL_32:
        objc_msgSend(v42, "setPosition:", v29);
        break;
      }
      if ((objc_msgSend(v10, "clipsToBounds", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height) & 1) != 0)
      {
        objc_msgSend(v10, "bounds");
        v46 = CGRectInset(v45, v6, v6);
        v49.origin.x = v11;
        v49.origin.y = v13;
        v49.size.width = v15;
        v49.size.height = v17;
        v27 = CGRectContainsRect(v46, v49);

        if (!v27)
          goto LABEL_31;
        goto LABEL_16;
      }

LABEL_15:
      goto LABEL_16;
  }
  if (dyld_program_sdk_at_least()
    && (objc_msgSend(*(id *)(a1 + 40), "referenceView"), (v36 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v37 = (void *)v36;
    while (1)
    {
      objc_msgSend(v37, "superview");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *(void **)(a1 + 56);

      if (v38 == v39)
        break;
      objc_msgSend(v37, "superview");
      v40 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v40;
      if (!v40)
        goto LABEL_38;
    }
    objc_msgSend(*(id *)(a1 + 56), "insertSubview:above:", v42, v37);

  }
  else
  {
LABEL_38:
    objc_msgSend(*(id *)(a1 + 56), "addSubview:", v42);
  }
  objc_msgSend(v42, "setGeometryFrozen:", 0);
  objc_msgSend(*(id *)(a1 + 64), "bounds");
  objc_msgSend(v42, "setFrame:");
  objc_msgSend(*(id *)(a1 + 64), "zeroOriginShape");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setShape:", v41);

  objc_msgSend(v42, "setGeometryFrozen:", 1);
}

@end
