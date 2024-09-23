@implementation UIStatusBarInternalRepositionAnimation

void ___UIStatusBarInternalRepositionAnimation_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
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
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

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
    v48.origin.x = v23;
    v48.origin.y = v25;
    v48.size.width = v27;
    v48.size.height = v29;
    if (CGRectIsEmpty(v48))
    {
      v49.origin.x = v23;
      v49.origin.y = v25;
      v49.size.width = v27;
      v49.size.height = v29;
      v52.origin.x = v15;
      v52.origin.y = v17;
      v52.size.width = v19;
      v52.size.height = v21;
      CGRectEqualToRect(v49, v52);
    }
    else
    {
      v50.origin.x = v15;
      v50.origin.y = v17;
      v50.size.width = v19;
      v50.size.height = v21;
      IsEmpty = CGRectIsEmpty(v50);
      v51.origin.x = v23;
      v51.origin.y = v25;
      v51.size.width = v27;
      v51.size.height = v29;
      v53.origin.x = v15;
      v53.origin.y = v17;
      v53.size.width = v19;
      v53.size.height = v21;
      if (!CGRectEqualToRect(v51, v53) && !IsEmpty)
      {
        objc_msgSend(v8, "setAbsoluteFrame:", v15, v17, v19, v21);
        v31 = a1[5];
        v32 = MEMORY[0x1E0C809B0];
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = ___UIStatusBarInternalRepositionAnimation_block_invoke_2;
        v42[3] = &unk_1E16B20D8;
        v33 = v8;
        v43 = v33;
        v44 = v23;
        v45 = v25;
        v46 = v27;
        v47 = v29;
        v40[0] = v32;
        v40[1] = 3221225472;
        v40[2] = ___UIStatusBarInternalRepositionAnimation_block_invoke_3;
        v40[3] = &unk_1E16B1BA0;
        v41 = v9;
        (*(void (**)(uint64_t, _QWORD *, _QWORD *))(v31 + 16))(v31, v42, v40);
        v34[0] = v32;
        v34[1] = 3221225472;
        v34[2] = ___UIStatusBarInternalRepositionAnimation_block_invoke_4;
        v34[3] = &unk_1E16B20D8;
        v35 = v33;
        v36 = v23;
        v37 = v25;
        v38 = v27;
        v39 = v29;
        objc_msgSend(v7, "addTimeout:withHandler:", v34, 2.0);

LABEL_13:
        goto LABEL_14;
      }
    }
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    goto LABEL_13;
  }
  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_14:

}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t ___UIStatusBarInternalRepositionAnimation_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t *v22;
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
    objc_msgSend(v7, "displayItemAbsoluteFrames");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else if (v6)
  {
    v11 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(v6, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
    {
      v37 = v12;
      v14 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v6, "absolutePresentationFrame");
      v34[0] = v15;
      v34[1] = v16;
      v34[2] = v17;
      v34[3] = v18;
      objc_msgSend(v14, "valueWithBytes:objCType:", v34, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v19;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = (void **)v38;
      v22 = &v37;
    }
    else
    {
      v35 = v12;
      v23 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v6, "absoluteFrame");
      v33[0] = v24;
      v33[1] = v25;
      v33[2] = v26;
      v33[3] = v27;
      objc_msgSend(v23, "valueWithBytes:objCType:", v33, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v19;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = &v36;
      v22 = &v35;
    }
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
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

@end
