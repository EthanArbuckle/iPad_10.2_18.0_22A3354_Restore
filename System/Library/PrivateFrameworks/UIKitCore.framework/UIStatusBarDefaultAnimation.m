@implementation UIStatusBarDefaultAnimation

void ___UIStatusBarDefaultAnimation_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  __int128 v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[3];

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(a2, "type");
  objc_msgSend(v7, "region");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (v9 == 2)
  {
    objc_msgSend(v7, "setAbsoluteFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
    v14 = *(double *)(a1 + 104);
LABEL_7:
    v17 = *(double *)(a1 + 112);
    goto LABEL_8;
  }
  objc_msgSend(v7, "setAlpha:", 0.0);
  v15 = *(_OWORD *)(a1 + 64);
  v26[0] = *(_OWORD *)(a1 + 48);
  v26[1] = v15;
  v26[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v7, "setTransform:", v26);
  v16 = 104;
  if (v9 == 1)
    v16 = 96;
  v14 = *(double *)(a1 + v16);
  if (v9 != 1)
    goto LABEL_7;
  v17 = 0.3;
LABEL_8:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___UIStatusBarDefaultAnimation_block_invoke_2;
  v20[3] = &unk_1E16DF530;
  v21 = v7;
  v22 = v9;
  v18 = *(_OWORD *)(a1 + 64);
  v23 = *(_OWORD *)(a1 + 48);
  v24 = v18;
  v25 = *(_OWORD *)(a1 + 80);
  v19 = v7;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v20, v8, v14, v17);

}

uint64_t ___UIStatusBarDefaultAnimation_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  _OWORD *v5;
  void *v6;
  __int128 v7;
  _OWORD v9[3];

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v4 = 0.0;
  if (*(_QWORD *)(v3 + 8) == 1)
    v4 = 1.0;
  objc_msgSend(v2, "setAlpha:", v4);
  v5 = (_OWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == 1)
    v5 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  v7 = v5[1];
  v9[0] = *v5;
  v9[1] = v7;
  v9[2] = v5[2];
  return objc_msgSend(v6, "setTransform:", v9);
}

uint64_t ___UIStatusBarDefaultAnimation_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if (objc_msgSend(a2, "type") == 2)
  {
    objc_msgSend(v5, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEnabled");

    if (v7)
    {
      objc_msgSend(v5, "absoluteFrame");
      v8 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
      v8[4] = v9;
      v8[5] = v10;
      v8[6] = v11;
      v8[7] = v12;
      v13 = 1;
      objc_msgSend(v5, "setFloating:", 1);
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

uint64_t ___UIStatusBarDefaultAnimation_block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v5;
}

@end
