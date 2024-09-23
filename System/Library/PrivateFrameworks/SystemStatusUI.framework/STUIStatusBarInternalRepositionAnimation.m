@implementation STUIStatusBarInternalRepositionAnimation

void __STUIStatusBarInternalRepositionAnimation_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  BOOL IsEmpty;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1[4];
  if (!v10 || (*(unsigned int (**)(uint64_t, id))(v10 + 16))(v10, v8))
  {
    v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "CGRectValue");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v8, "absoluteFrame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
    }
    else
    {
      v23 = *MEMORY[0x1E0C9D648];
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v21 = v29;
      v19 = v27;
      v17 = v25;
      v15 = *MEMORY[0x1E0C9D648];
    }
    v49.origin.x = v23;
    v49.origin.y = v25;
    v49.size.width = v27;
    v49.size.height = v29;
    if (CGRectIsEmpty(v49))
    {
      v50.origin.x = v23;
      v50.origin.y = v25;
      v50.size.width = v27;
      v50.size.height = v29;
      v53.origin.x = v15;
      v53.origin.y = v17;
      v53.size.width = v19;
      v53.size.height = v21;
      CGRectEqualToRect(v50, v53);
    }
    else
    {
      v51.origin.x = v15;
      v51.origin.y = v17;
      v51.size.width = v19;
      v51.size.height = v21;
      IsEmpty = CGRectIsEmpty(v51);
      v52.origin.x = v23;
      v52.origin.y = v25;
      v52.size.width = v27;
      v52.size.height = v29;
      v54.origin.x = v15;
      v54.origin.y = v17;
      v54.size.width = v19;
      v54.size.height = v21;
      if (!CGRectEqualToRect(v52, v54) && !IsEmpty && objc_msgSend(v8, "isEnabled"))
      {
        objc_msgSend(v8, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_removeAllRetargetableAnimations:", 1);

        objc_msgSend(v8, "setAbsoluteFrame:", v15, v17, v19, v21);
        v32 = a1[5];
        v33 = MEMORY[0x1E0C809B0];
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_2;
        v43[3] = &unk_1E8D62B70;
        v34 = v8;
        v44 = v34;
        v45 = v23;
        v46 = v25;
        v47 = v27;
        v48 = v29;
        v41[0] = v33;
        v41[1] = 3221225472;
        v41[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_3;
        v41[3] = &unk_1E8D63638;
        v42 = v9;
        (*(void (**)(uint64_t, _QWORD *, _QWORD *))(v32 + 16))(v32, v43, v41);
        v35[0] = v33;
        v35[1] = 3221225472;
        v35[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_4;
        v35[3] = &unk_1E8D62B70;
        v36 = v34;
        v37 = v23;
        v38 = v25;
        v39 = v27;
        v40 = v29;
        objc_msgSend(v7, "addTimeout:withHandler:", v35, 2.0);

LABEL_14:
        goto LABEL_15;
      }
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    goto LABEL_14;
  }
  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_15:

}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v33[4];
  _QWORD v34[4];
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v7, "displayItemAbsolutePresentationFrames");
    else
      objc_msgSend(v7, "displayItemAbsoluteFrames");
    v8 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v8;

  }
  else if (v6)
  {
    v9 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(v6, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      v37 = v10;
      v12 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v6, "absolutePresentationFrame");
      v34[0] = v13;
      v34[1] = v14;
      v34[2] = v15;
      v34[3] = v16;
      objc_msgSend(v12, "valueWithBytes:objCType:", v34, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v17;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = (void **)v38;
      v20 = &v37;
    }
    else
    {
      v35 = v10;
      v23 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v6, "absoluteFrame");
      v33[0] = v24;
      v33[1] = v25;
      v33[2] = v26;
      v33[3] = v27;
      objc_msgSend(v23, "valueWithBytes:objCType:", v33, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v17;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = &v36;
      v20 = &v35;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

  }
  v31 = *(_QWORD *)(a1 + 40);
  if (v31)
    (*(void (**)(uint64_t, _QWORD))(v31 + 16))(v31, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  return 1;
}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __STUIStatusBarInternalRepositionAnimation_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
