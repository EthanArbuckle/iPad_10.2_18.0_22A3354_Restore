@implementation UISearchBarFieldEditor

uint64_t __41___UISearchBarFieldEditor_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_applyCorrectTextContainerSize");
  return objc_msgSend(*(id *)(a1 + 32), "_updateTokenViews");
}

void __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_textLayoutController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "characterRangeForTextRange:clippedToDocument:", *(_QWORD *)(a1 + 40), 1);
  v8 = v7;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke_2;
  v12[3] = &unk_1E16B6970;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v16 = v6;
  v12[4] = v9;
  v11 = *(_QWORD *)off_1E1678C48;
  v12[1] = 3221225472;
  v17 = v8;
  v13 = v10;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v11, v6, v8, 0, v12);

}

void __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double Width;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double MinY;
  double v50;
  double v51;
  double Height;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id obj;
  void *v66;
  CGFloat recta;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v69 = a3 + a4;
  v8 = *(_QWORD *)(a1 + 64);
  v68 = *(_QWORD *)(a1 + 72) + v8;
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "_viewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (objc_msgSend(*(id *)(a1 + 32), "_textLayoutController"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "ensureLayoutForRange:", *(_QWORD *)(a1 + 40)),
          v11,
          objc_msgSend(v9, "_viewProvider"),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = a3 == v8;
      objc_msgSend(v10, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v13, "selectionBounds");
      objc_msgSend(v14, "convertRect:fromView:", v13);
      +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentInputMode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWritingDirection:", objc_msgSend(v17, "isDefaultRightToLeft"));

      objc_msgSend(v15, "setContainsStart:", v12);
      objc_msgSend(v15, "setContainsEnd:", v69 == v68);
      objc_msgSend(v15, "_setDrawsOwnHighlight:", 1);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);

      goto LABEL_29;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v59 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
        goto LABEL_36;
      objc_msgSend(v9, "token");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v77 = v60;
      _os_log_fault_impl(&dword_185066000, v59, OS_LOG_TYPE_FAULT, "UIKit problem. Missing viewProvider for search token: %@", buf, 0xCu);
LABEL_35:

LABEL_36:
      goto LABEL_29;
    }
    v57 = _block_invoke___s_category;
    if (!_block_invoke___s_category)
    {
      v57 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v57, (unint64_t *)&_block_invoke___s_category);
    }
    v58 = *(NSObject **)(v57 + 8);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = v58;
      objc_msgSend(v9, "token");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v77 = v60;
      _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_ERROR, "UIKit problem. Missing viewProvider for search token: %@", buf, 0xCu);
      goto LABEL_35;
    }
  }
  else
  {
    v64 = v9;
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v18, "beginningOfDocument");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "positionFromPosition:offset:", v19, a3);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "positionFromPosition:offset:", v20, a4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v20;
    objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v74.receiver = *(id *)(a1 + 32);
    v74.super_class = (Class)_UISearchBarFieldEditor;
    v61 = (void *)v21;
    objc_msgSendSuper2(&v74, sel_selectionRectsForRange_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v22;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v71 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v27, "rect");
          Width = CGRectGetWidth(v79);
          if ((a3 == v8 || !objc_msgSend(v27, "containsStart") || Width != 0.0)
            && (v69 == v68 || !objc_msgSend(v27, "containsEnd") || Width != 0.0))
          {
            objc_msgSend(v27, "rect");
            v30 = v29;
            v32 = v31;
            v34 = v33;
            v36 = v35;
            if (objc_msgSend(*(id *)(a1 + 48), "count"))
            {
              objc_msgSend(*(id *)(a1 + 48), "firstObject");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "textInputView");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "bounds");
              objc_msgSend(v38, "convertRect:fromView:", v37);
              recta = v32;
              v39 = v34;
              v40 = v30;
              v42 = v41;
              v44 = v43;
              v46 = v45;
              v48 = v47;

              v80.origin.x = v42;
              v80.origin.y = v44;
              v80.size.width = v46;
              v80.size.height = v48;
              MinY = CGRectGetMinY(v80);
              v81.origin.x = v40;
              v81.origin.y = recta;
              v81.size.width = v39;
              v81.size.height = v36;
              v50 = CGRectGetMinY(v81);
              if (MinY >= v50)
                v51 = v50;
              else
                v51 = MinY;
              v82.origin.x = v42;
              v30 = v40;
              v34 = v39;
              v32 = v51;
              v82.origin.y = v44;
              v82.size.width = v46;
              v82.size.height = v48;
              Height = CGRectGetHeight(v82);
              v83.origin.x = v30;
              v83.origin.y = v32;
              v83.size.width = v34;
              v83.size.height = v36;
              v53 = CGRectGetHeight(v83);
              if (Height >= v53)
                v36 = Height;
              else
                v36 = v53;

            }
            +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(_QWORD *)(a1 + 32), v30, v32, v34, v36);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "currentInputMode");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setWritingDirection:", objc_msgSend(v56, "isDefaultRightToLeft"));

            objc_msgSend(v54, "setContainsStart:", objc_msgSend(v27, "containsStart"));
            objc_msgSend(v54, "setContainsEnd:", objc_msgSend(v27, "containsEnd"));
            objc_msgSend(v66, "addObject:", v54);

          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v24);
    }

    objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v66);
    v9 = v64;
  }
LABEL_29:

}

@end
