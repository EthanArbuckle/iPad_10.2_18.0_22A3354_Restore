@implementation UIBoundingTextRectsSolver

uint64_t __40___UIBoundingTextRectsSolver__calculate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_calculateRectsUsingLayoutManager:", a2);
}

uint64_t __68___UIBoundingTextRectsSolver__calculateRectsUsingTextLayoutManager___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, void *a7)
{
  id v12;
  int has_internal_diagnostics;
  id v14;
  void *v15;
  void *v16;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  __int16 v21[8];
  uint8_t buf[16];
  CGRect v23;
  CGRect v24;

  v12 = a7;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v14 = *(id *)(*(_QWORD *)(a1 + 32) + 152);

  if (has_internal_diagnostics)
  {
    if (v14 != v12)
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Unexpected textContainer in rect enumeration", buf, 2u);
      }

    }
  }
  else if (v14 != v12)
  {
    v19 = _block_invoke___s_category_9;
    if (!_block_invoke___s_category_9)
    {
      v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&_block_invoke___s_category_9);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 0;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Unexpected textContainer in rect enumeration", (uint8_t *)v21, 2u);
    }
  }
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  v24 = CGRectOffset(v23, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  v15 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  return 1;
}

void __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  int has_internal_diagnostics;
  id v9;
  NSRange v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  NSRange v30;
  __int128 v31;
  uint8_t buf[16];
  NSRange v33;

  v7 = a2;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  if (has_internal_diagnostics)
  {
    if (v9 != v7)
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "Unexpected textContainer in rect enumeration", buf, 2u);
      }

    }
  }
  else if (v9 != v7)
  {
    v24 = _block_invoke_2___s_category_0;
    if (!_block_invoke_2___s_category_0)
    {
      v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v24, (unint64_t *)&_block_invoke_2___s_category_0);
    }
    v25 = *(NSObject **)(v24 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Unexpected textContainer in rect enumeration", buf, 2u);
    }
  }
  v33.location = a3;
  v33.length = a4;
  v10 = NSIntersectionRange(v33, *(NSRange *)(a1 + 56));
  if (v10.length > 1 || v10.location == *(_QWORD *)(a1 + 56) && v10.length == *(_QWORD *)(a1 + 64))
    goto LABEL_8;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "characterRangeForGlyphRange:actualGlyphRange:", v10.location, v10.length, 0);
  if (!v13)
  {
LABEL_9:

    goto LABEL_10;
  }
  v14 = v12;
  v15 = v13;
  objc_msgSend(v11, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedSubstringFromRange:", v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
LABEL_8:
    v22 = *(void **)(a1 + 40);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke_5;
    v26[3] = &unk_1E16E78E8;
    v27 = v22;
    v30 = v10;
    v28 = v7;
    v31 = *(_OWORD *)(a1 + 72);
    v29 = *(id *)(a1 + 48);
    objc_msgSend(v27, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v10.location, v10.length, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v28, v26);

    v11 = v27;
    goto LABEL_9;
  }
LABEL_10:

}

void __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke_5(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat v10;
  CGFloat v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v17.origin.y = v10;
  v17.size.height = v11;
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  v17.origin.x = a2;
  v17.size.width = a4;
  v15 = CGRectUnion(v14, v17);
  v16 = CGRectOffset(v15, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  v12 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

@end
