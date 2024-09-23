@implementation UISelectionTapRecognizer

- (BOOL)isCloseToSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  BOOL v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t i;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;

  v72 = *MEMORY[0x1E0C80C00];
  -[UISelectionTapRecognizer textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "selectedRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEmpty");

    if (v8)
    {
      objc_msgSend(v5, "caretRect");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[UISelectionTapRecognizer textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_proxyTextInput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textInputView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureRecognizer view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "convertRect:toView:", v20, v10, v12, v14, v16);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      -[UITapGestureRecognizer centroid](self, "centroid");
      v31 = sqrt((v22 + v26 * 0.5 - v29) * (v22 + v26 * 0.5 - v29) + (v24 + v28 * 0.5 - v30) * (v24 + v28 * 0.5 - v30)) < 50.0;
    }
    else
    {
      objc_msgSend(v5, "selectionRects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "count"))
      {
        v33 = *MEMORY[0x1E0C9D648];
        v34 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v35 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v36 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v37 = v32;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        if (v38)
        {
          v39 = v38;
          v40 = 0;
          v41 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v68 != v41)
                objc_enumerationMutation(v37);
              objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "rect", (_QWORD)v67);
              v47 = v43;
              v48 = v44;
              v49 = v45;
              v50 = v46;
              if (-v40 != (_DWORD)i)
              {
                v73.origin.x = v33;
                v73.origin.y = v34;
                v73.size.width = v35;
                v73.size.height = v36;
                *(CGRect *)&v43 = CGRectUnion(v73, *(CGRect *)&v47);
              }
              v33 = v43;
              v34 = v44;
              v35 = v45;
              v36 = v46;
            }
            v40 += v39;
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
          }
          while (v39);
        }

        -[UISelectionTapRecognizer textView](self, "textView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "_proxyTextInput");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "textInputView");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIGestureRecognizer view](self, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "convertRect:toView:", v54, v33, v34, v35, v36);
        v56 = v55;
        v58 = v57;
        v60 = v59;
        v62 = v61;

        -[UITapGestureRecognizer centroid](self, "centroid");
        UIDistanceBetweenPointAndRect(v63, v64, v56, v58, v60, v62);
        v31 = v65 < 20.0;
      }
      else
      {
        v31 = 0;
      }

    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)setState:(int64_t)a3
{
  int64_t v3;
  BOOL v5;
  objc_super v6;

  v3 = a3;
  if (self)
    v5 = (unint64_t)(self->super.super.super._state - 1) < 3;
  else
    v5 = 0;
  if ((unint64_t)(a3 - 4) >= 0xFFFFFFFFFFFFFFFDLL
    && !v5
    && !-[UISelectionTapRecognizer isCloseToSelection](self, "isCloseToSelection"))
  {
    v3 = 5;
  }
  v6.receiver = self;
  v6.super_class = (Class)UISelectionTapRecognizer;
  -[UIGestureRecognizer setState:](&v6, sel_setState_, v3);
}

- (UITextInput)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  self->_textView = (UITextInput *)a3;
}

@end
