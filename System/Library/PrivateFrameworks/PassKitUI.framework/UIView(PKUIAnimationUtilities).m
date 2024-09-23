@implementation UIView(PKUIAnimationUtilities)

- (double)pkui_setFrame:()PKUIAnimationUtilities animated:
{
  void *v12;
  double v13;
  double v14;
  double v15;

  if ((a7 & 1) != 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", v12, 0, a2, a3, a4, a5);
    v14 = v13;

  }
  else
  {
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", 0, 0, a2, a3, a4, a5);
    return v15;
  }
  return v14;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;

  if ((a7 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0D676D0];
    v14 = a8;
    v15 = (id)objc_msgSend(v13, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", v15, v14, a2, a3, a4, a5);
    v17 = v16;

  }
  else
  {
    v15 = a8;
    objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:completion:", 0, v15, a2, a3, a4, a5);
    v17 = v18;
  }

  return v17;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v14;
  id *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;

  v14 = a8;
  v27 = 0;
  if (a7)
    v15 = &v27;
  else
    v15 = 0;
  objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:animation:", a7, v15, a2, a3, a4, a5);
  v17 = v16;
  v18 = v27;
  if (v27)
  {
    if (v14)
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __88__UIView_PKUIAnimationUtilities__pkui_setFrame_withAdditiveAnimationFactory_completion___block_invoke;
      v25 = &unk_1E3E614F0;
      v26 = v14;
      objc_msgSend(v18, "pkui_setCompletionHandler:", &v22);

    }
    objc_msgSend(a1, "layer", v22, v23, v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v27);

  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities animated:
{
  void *v12;
  double v13;
  double v14;
  double v15;

  if ((a7 & 1) != 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", v12, 0, a2, a3, a4, a5);
    v14 = v13;

  }
  else
  {
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", 0, 0, a2, a3, a4, a5);
    return v15;
  }
  return v14;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;

  if ((a7 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0D676D0];
    v14 = a8;
    v15 = (id)objc_msgSend(v13, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", v15, v14, a2, a3, a4, a5);
    v17 = v16;

  }
  else
  {
    v15 = a8;
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:completion:", 0, v15, a2, a3, a4, a5);
    v17 = v18;
  }

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v14;
  id *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;

  v14 = a8;
  v27 = 0;
  if (a7)
    v15 = &v27;
  else
    v15 = 0;
  objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:animation:", a7, v15, a2, a3, a4, a5);
  v17 = v16;
  v18 = v27;
  if (v27)
  {
    if (v14)
    {
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __89__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_completion___block_invoke;
      v25 = &unk_1E3E614F0;
      v26 = v14;
      objc_msgSend(v18, "pkui_setCompletionHandler:", &v22);

    }
    objc_msgSend(a1, "layer", v22, v23, v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v27);

  }
  else if (v14)
  {
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

  return v17;
}

- (void)pkui_setPosition:()PKUIAnimationUtilities animated:
{
  void *v8;

  if ((a5 & 1) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", v8, 0, a2, a3);

  }
  else
  {
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", 0, 0, a2, a3);
  }
}

- (double)pkui_setPosition:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;

  if ((a5 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0D676D0];
    v10 = a6;
    v11 = (id)objc_msgSend(v9, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", v11, v10, a2, a3);
    v13 = v12;

  }
  else
  {
    v11 = a6;
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:completion:", 0, v11, a2, a3);
    v13 = v14;
  }

  return v13;
}

- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v10;
  id *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;

  v10 = a6;
  v23 = 0;
  if (a5)
    v11 = &v23;
  else
    v11 = 0;
  objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  v13 = v12;
  v14 = v23;
  if (v23)
  {
    if (v10)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __91__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_completion___block_invoke;
      v21 = &unk_1E3E614F0;
      v22 = v10;
      objc_msgSend(v14, "pkui_setCompletionHandler:", &v18);

    }
    objc_msgSend(a1, "layer", v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "pkui_addAdditiveAnimation:", v23);

  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

  return v13;
}

- (void)pkui_setTransform:()PKUIAnimationUtilities animated:
{
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if ((a4 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    v7 = a3[5];
    v19 = a3[4];
    v20 = v7;
    v8 = a3[7];
    v21 = a3[6];
    v22 = v8;
    v9 = a3[1];
    v15 = *a3;
    v16 = v9;
    v10 = a3[3];
    v17 = a3[2];
    v18 = v10;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v15, v6, 0);

  }
  else
  {
    v11 = a3[5];
    v19 = a3[4];
    v20 = v11;
    v12 = a3[7];
    v21 = a3[6];
    v22 = v12;
    v13 = a3[1];
    v15 = *a3;
    v16 = v13;
    v14 = a3[3];
    v17 = a3[2];
    v18 = v14;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v15, 0, 0);
  }
}

- (void)pkui_setTransform:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  if ((a4 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0D676D0];
    v8 = a5;
    v9 = (void *)objc_msgSend(v7, "sharedDefaultFactory");
    v10 = a3[5];
    v23 = a3[4];
    v24 = v10;
    v11 = a3[7];
    v25 = a3[6];
    v26 = v11;
    v12 = a3[1];
    v19 = *a3;
    v20 = v12;
    v13 = a3[3];
    v21 = a3[2];
    v22 = v13;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v19, v9, v8);

  }
  else
  {
    v14 = a3[5];
    v23 = a3[4];
    v24 = v14;
    v15 = a3[7];
    v25 = a3[6];
    v26 = v15;
    v16 = a3[1];
    v19 = *a3;
    v20 = v16;
    v17 = a3[3];
    v21 = a3[2];
    v22 = v17;
    v18 = a5;
    objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:completion:", &v19, 0, v18);

  }
}

- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v9;
  id *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _OWORD v20[8];
  id v21;

  v9 = a4;
  v21 = 0;
  *a5 = 0u;
  a5[1] = 0u;
  a5[2] = 0u;
  a5[3] = 0u;
  a5[4] = 0u;
  a5[5] = 0u;
  a5[6] = 0u;
  a5[7] = 0u;
  if (a3)
    v10 = &v21;
  else
    v10 = 0;
  v11 = a2[5];
  v20[4] = a2[4];
  v20[5] = v11;
  v12 = a2[7];
  v20[6] = a2[6];
  v20[7] = v12;
  v13 = a2[1];
  v20[0] = *a2;
  v20[1] = v13;
  v14 = a2[3];
  v20[2] = a2[2];
  v20[3] = v14;
  objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:animation:", v20, a3, v10);
  v15 = v21;
  if (v21)
  {
    if (v9)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __92__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_completion___block_invoke;
      v18[3] = &unk_1E3E614F0;
      v19 = v9;
      objc_msgSend(v15, "pkui_setCompletionHandler:", v18);

    }
    objc_msgSend(a1, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v21);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

- (void)pkui_setAlpha:()PKUIAnimationUtilities animated:
{
  void *v6;

  if ((a4 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", v6, 0, a2);

  }
  else
  {
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", 0, 0, a2);
  }
}

- (double)pkui_setAlpha:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;

  if ((a4 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0D676D0];
    v8 = a5;
    v9 = (id)objc_msgSend(v7, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", v9, v8, a2);
    v11 = v10;

  }
  else
  {
    v9 = a5;
    objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:completion:", 0, v9, a2);
    v11 = v12;
  }

  return v11;
}

- (double)pkui_setAlpha:()PKUIAnimationUtilities withAnimationFactory:completion:
{
  id v8;
  id *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v8 = a5;
  v21 = 0;
  if (a4)
    v9 = &v21;
  else
    v9 = 0;
  objc_msgSend(a1, "pkui_setAlpha:withAnimationFactory:animation:", a4, v9, a2);
  v11 = v10;
  v12 = v21;
  if (v21)
  {
    if (v8)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __80__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_completion___block_invoke;
      v19 = &unk_1E3E614F0;
      v20 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v16);

    }
    objc_msgSend(a1, "layer", v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(v13, "addAnimation:forKey:", v21, CFSTR("opacity"));

  }
  else
  {
    if (!a4 && v10 != a2)
    {
      objc_msgSend(a1, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAnimationForKey:", CFSTR("opacity"));

    }
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v11;
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities animated:
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  if ((a4 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0D676D0];
    v6 = a3;
    v7 = (id)objc_msgSend(v5, "sharedDefaultFactory");
    v8 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v6, v7, 0);

  }
  else
  {
    v7 = a3;
    v8 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v7, 0, 0);
  }

  return v8;
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities animated:completion:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  if ((a4 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0D676D0];
    v8 = a5;
    v9 = a3;
    v10 = (id)objc_msgSend(v7, "sharedDefaultFactory");
    v11 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v9, v10, v8);

  }
  else
  {
    v9 = a5;
    v10 = a3;
    v11 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:completion:", v10, 0, v9);
  }

  return v11;
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities withAnimationFactory:completion:
{
  id v8;
  id *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v8 = a5;
  v19 = 0;
  if (a4)
    v9 = &v19;
  else
    v9 = 0;
  v10 = objc_msgSend(a1, "pkui_setBackgroundColor:withAnimationFactory:animation:", a3, a4, v9);
  v11 = v19;
  if (v19)
  {
    if (v8)
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __90__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_completion___block_invoke;
      v17 = &unk_1E3E614F0;
      v18 = v8;
      objc_msgSend(v11, "pkui_setCompletionHandler:", &v14);

    }
    objc_msgSend(a1, "layer", v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAnimationForKey:", CFSTR("backgroundColor"));
    objc_msgSend(v12, "addAnimation:forKey:", v19, CFSTR("backgroundColor"));

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v10;
}

- (void)pkui_setCornerRadius:()PKUIAnimationUtilities animated:
{
  void *v6;

  if ((a4 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", v6, 0, a2);

  }
  else
  {
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", 0, 0, a2);
  }
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;

  if ((a4 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0D676D0];
    v8 = a5;
    v9 = (id)objc_msgSend(v7, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", v9, v8, a2);
    v11 = v10;

  }
  else
  {
    v9 = a5;
    objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:completion:", 0, v9, a2);
    v11 = v12;
  }

  return v11;
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v8;
  id *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v8 = a5;
  v21 = 0;
  if (a4)
    v9 = &v21;
  else
    v9 = 0;
  objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  v11 = v10;
  v12 = v21;
  if (v21)
  {
    if (v8)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __95__UIView_PKUIAnimationUtilities__pkui_setCornerRadius_withAdditiveAnimationFactory_completion___block_invoke;
      v19 = &unk_1E3E614F0;
      v20 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v16);

    }
    objc_msgSend(a1, "layer", v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v21);

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v11;
}

- (void)pkui_setShadowOpacity:()PKUIAnimationUtilities animated:
{
  void *v6;

  if ((a4 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", v6, 0, a2);

  }
  else
  {
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", 0, 0, a2);
  }
}

- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;

  if ((a4 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0D676D0];
    v8 = a5;
    v9 = (id)objc_msgSend(v7, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", v9, v8, a2);
    v11 = v10;

  }
  else
  {
    v9 = a5;
    objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:completion:", 0, v9, a2);
    v11 = v12;
  }

  return v11;
}

- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities withAnimationFactory:completion:
{
  id v8;
  id *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v8 = a5;
  v20 = 0;
  if (a4)
    v9 = &v20;
  else
    v9 = 0;
  objc_msgSend(a1, "pkui_setShadowOpacity:withAnimationFactory:animation:", a4, v9, a2);
  v11 = v10;
  v12 = v20;
  if (v20)
  {
    if (v8)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __88__UIView_PKUIAnimationUtilities__pkui_setShadowOpacity_withAnimationFactory_completion___block_invoke;
      v18 = &unk_1E3E614F0;
      v19 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v15);

    }
    objc_msgSend(a1, "layer", v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAnimationForKey:", CFSTR("shadowOpacity"));
    objc_msgSend(v13, "addAnimation:forKey:", v20, CFSTR("shadowOpacity"));

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v11;
}

- (void)pkui_setShadowOffset:()PKUIAnimationUtilities animated:
{
  void *v8;

  if ((a5 & 1) != 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", v8, 0, a2, a3);

  }
  else
  {
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", 0, 0, a2, a3);
  }
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;

  if ((a5 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0D676D0];
    v10 = a6;
    v11 = (id)objc_msgSend(v9, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", v11, v10, a2, a3);
    v13 = v12;

  }
  else
  {
    v11 = a6;
    objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:completion:", 0, v11, a2, a3);
    v13 = v14;
  }

  return v13;
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v10;
  id *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;

  v10 = a6;
  v23 = 0;
  if (a5)
    v11 = &v23;
  else
    v11 = 0;
  objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  v13 = v12;
  v14 = v23;
  if (v23)
  {
    if (v10)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __95__UIView_PKUIAnimationUtilities__pkui_setShadowOffset_withAdditiveAnimationFactory_completion___block_invoke;
      v21 = &unk_1E3E614F0;
      v22 = v10;
      objc_msgSend(v14, "pkui_setCompletionHandler:", &v18);

    }
    objc_msgSend(a1, "layer", v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "pkui_addAdditiveAnimation:", v23);

  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

  return v13;
}

- (void)pkui_setShadowRadius:()PKUIAnimationUtilities animated:
{
  void *v6;

  if ((a4 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", v6, 0, a2);

  }
  else
  {
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", 0, 0, a2);
  }
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities animated:withCompletion:
{
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;

  if ((a4 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0D676D0];
    v8 = a5;
    v9 = (id)objc_msgSend(v7, "sharedDefaultFactory");
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", v9, v8, a2);
    v11 = v10;

  }
  else
  {
    v9 = a5;
    objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:completion:", 0, v9, a2);
    v11 = v12;
  }

  return v11;
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:completion:
{
  id v8;
  id *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v8 = a5;
  v21 = 0;
  if (a4)
    v9 = &v21;
  else
    v9 = 0;
  objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  v11 = v10;
  v12 = v21;
  if (v21)
  {
    if (v8)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __95__UIView_PKUIAnimationUtilities__pkui_setShadowRadius_withAdditiveAnimationFactory_completion___block_invoke;
      v19 = &unk_1E3E614F0;
      v20 = v8;
      objc_msgSend(v12, "pkui_setCompletionHandler:", &v16);

    }
    objc_msgSend(a1, "layer", v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v21);

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

  return v11;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;

  v14 = a7;
  if (v14)
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v15 = 0;
  objc_msgSend(a1, "pkui_setFrame:withAdditiveAnimationFactory:accumulator:", v14, v15, a2, a3, a4, a5);
  v17 = v16;
  v18 = PKGroupAnimations(v15);
  if (a8)
    objc_storeStrong(a8, v18);

  return v17;
}

- (double)pkui_setFrame:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v14 = a7;
  v15 = a8;
  objc_msgSend(a1, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v37.origin.x = a2;
  v37.origin.y = a3;
  v37.size.width = a4;
  v37.size.height = a5;
  v38 = CGRectStandardize(v37);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v38.origin.x = v17;
  v38.origin.y = v19;
  v38.size.width = v21;
  v38.size.height = v23;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  if (!CGRectEqualToRect(v38, v39))
  {
    objc_msgSend(a1, "bounds");
    v35 = v29;
    v36 = v28;
    objc_msgSend(a1, "anchorPoint");
    v31 = x + v30 * width;
    v33 = y + v32 * height;
    objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:accumulator:", v14, v15, v36, v35, width, height);
    objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:accumulator:", v14, v15, v31, v33);
  }

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;

  v14 = a7;
  if (v14)
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v15 = 0;
  objc_msgSend(a1, "pkui_setBounds:withAdditiveAnimationFactory:accumulator:", v14, v15, a2, a3, a4, a5);
  v17 = v16;
  v18 = PKGroupAnimations(v15);
  if (a8)
    objc_storeStrong(a8, v18);

  return v17;
}

- (double)pkui_setBounds:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v14;
  id v15;
  double x;
  double y;
  double width;
  double height;
  void *v20;
  void *v21;
  _QWORD v23[9];
  CGRect v24;
  CGRect v25;

  v14 = a7;
  v15 = a8;
  objc_msgSend(a1, "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  if (!CGRectEqualToRect(v24, v25))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __90__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_accumulator___block_invoke;
    v23[3] = &unk_1E3E62900;
    v23[4] = a1;
    *(CGFloat *)&v23[5] = a2;
    *(CGFloat *)&v23[6] = a3;
    *(CGFloat *)&v23[7] = a4;
    *(CGFloat *)&v23[8] = a5;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v23);
    if (v14)
    {
      if (x != a2 || y != a3)
      {
        objc_msgSend(v14, "springAnimationWithKeyPath:", CFSTR("bounds.origin"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", x, y, a2, a3);
        objc_msgSend(v15, "addObject:", v20);

      }
      if (width != a4 || height != a5)
      {
        objc_msgSend(v14, "springAnimationWithKeyPath:", CFSTR("bounds.size"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pkui_updateForAdditiveAnimationFromSize:toSize:", width, height, a4, a5);
        objc_msgSend(v15, "addObject:", v21);

      }
    }
  }

  return x;
}

- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  _QWORD v18[7];

  v10 = a5;
  objc_msgSend(a1, "center");
  v13 = v12;
  v14 = v11;
  if (v12 != a2 || v11 != a3)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_animation___block_invoke;
    v18[3] = &unk_1E3E62928;
    v18[4] = a1;
    *(double *)&v18[5] = a2;
    *(double *)&v18[6] = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18);
    if (v10)
    {
      objc_msgSend(v10, "springAnimationWithKeyPath:", CFSTR("position"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v13, v14, a2, a3);
      if (!a6)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  v16 = 0;
  if (a6)
LABEL_9:
    objc_storeStrong(a6, v16);
LABEL_10:

  return v13;
}

- (double)pkui_setPosition:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v10;
  id *v11;
  double v12;
  double v13;
  id v15;

  v10 = a6;
  v15 = 0;
  if (a5)
    v11 = &v15;
  else
    v11 = 0;
  objc_msgSend(a1, "pkui_setPosition:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  v13 = v12;
  if (v15)
  {
    objc_msgSend(v10, "addObject:");

  }
  return v13;
}

- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CATransform3D b;
  CATransform3D a;

  v9 = a3;
  *a5 = 0u;
  a5[1] = 0u;
  a5[2] = 0u;
  a5[3] = 0u;
  a5[4] = 0u;
  a5[5] = 0u;
  a5[6] = 0u;
  a5[7] = 0u;
  objc_msgSend(a1, "transform3D");
  v10 = a5[5];
  *(_OWORD *)&a.m31 = a5[4];
  *(_OWORD *)&a.m33 = v10;
  v11 = a5[7];
  *(_OWORD *)&a.m41 = a5[6];
  *(_OWORD *)&a.m43 = v11;
  v12 = a5[1];
  *(_OWORD *)&a.m11 = *a5;
  *(_OWORD *)&a.m13 = v12;
  v13 = a5[3];
  *(_OWORD *)&a.m21 = a5[2];
  *(_OWORD *)&a.m23 = v13;
  v14 = a2[5];
  *(_OWORD *)&b.m31 = a2[4];
  *(_OWORD *)&b.m33 = v14;
  v15 = a2[7];
  *(_OWORD *)&b.m41 = a2[6];
  *(_OWORD *)&b.m43 = v15;
  v16 = a2[1];
  *(_OWORD *)&b.m11 = *a2;
  *(_OWORD *)&b.m13 = v16;
  v17 = a2[3];
  *(_OWORD *)&b.m21 = a2[2];
  *(_OWORD *)&b.m23 = v17;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    v31[1] = 3221225472;
    v18 = a2[5];
    v36 = a2[4];
    v37 = v18;
    v19 = a2[7];
    v38 = a2[6];
    v39 = v19;
    v20 = a2[1];
    v32 = *a2;
    v33 = v20;
    v21 = a2[3];
    v34 = a2[2];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[2] = __91__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_animation___block_invoke;
    v31[3] = &unk_1E3E62950;
    v31[4] = a1;
    v35 = v21;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v31);
    if (v9)
    {
      objc_msgSend(v9, "springAnimationWithKeyPath:", CFSTR("transform"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = a5[5];
      *(_OWORD *)&a.m31 = a5[4];
      *(_OWORD *)&a.m33 = v23;
      v24 = a5[7];
      *(_OWORD *)&a.m41 = a5[6];
      *(_OWORD *)&a.m43 = v24;
      v25 = a5[1];
      *(_OWORD *)&a.m11 = *a5;
      *(_OWORD *)&a.m13 = v25;
      v26 = a5[3];
      *(_OWORD *)&a.m21 = a5[2];
      *(_OWORD *)&a.m23 = v26;
      v27 = a2[5];
      *(_OWORD *)&b.m31 = a2[4];
      *(_OWORD *)&b.m33 = v27;
      v28 = a2[7];
      *(_OWORD *)&b.m41 = a2[6];
      *(_OWORD *)&b.m43 = v28;
      v29 = a2[1];
      *(_OWORD *)&b.m11 = *a2;
      *(_OWORD *)&b.m13 = v29;
      v30 = a2[3];
      *(_OWORD *)&b.m21 = a2[2];
      *(_OWORD *)&b.m23 = v30;
      objc_msgSend(v22, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v22 = 0;
  if (a4)
LABEL_6:
    objc_storeStrong(a4, v22);
LABEL_7:

}

- (void)pkui_setTransform:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v9;
  id *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[8];
  id v16;

  v9 = a4;
  v16 = 0;
  *a5 = 0u;
  a5[1] = 0u;
  a5[2] = 0u;
  a5[3] = 0u;
  a5[4] = 0u;
  a5[5] = 0u;
  a5[6] = 0u;
  a5[7] = 0u;
  if (a3)
    v10 = &v16;
  else
    v10 = 0;
  v11 = a2[5];
  v15[4] = a2[4];
  v15[5] = v11;
  v12 = a2[7];
  v15[6] = a2[6];
  v15[7] = v12;
  v13 = a2[1];
  v15[0] = *a2;
  v15[1] = v13;
  v14 = a2[3];
  v15[2] = a2[2];
  v15[3] = v14;
  objc_msgSend(a1, "pkui_setTransform:withAdditiveAnimationFactory:animation:", v15, a3, v10);
  if (v16)
  {
    objc_msgSend(v9, "addObject:");

  }
}

- (double)pkui_setAlpha:()PKUIAnimationUtilities withAnimationFactory:animation:
{
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  float v17;
  void *v18;
  void *v19;
  _QWORD v21[6];

  v8 = a4;
  objc_msgSend(a1, "alpha");
  v10 = v9;
  if (v9 == a2
    || (v21[0] = MEMORY[0x1E0C809B0],
        v21[1] = 3221225472,
        v21[2] = __79__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_animation___block_invoke,
        v21[3] = &unk_1E3E62010,
        v21[4] = a1,
        *(double *)&v21[5] = a2,
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v21),
        !v8))
  {
    v11 = 0;
    if (!a5)
      goto LABEL_9;
LABEL_8:
    objc_storeStrong(a5, v11);
    goto LABEL_9;
  }
  objc_msgSend(v8, "springAnimationWithKeyPath:", CFSTR("opacity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdditive:", 0);
  objc_msgSend(a1, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = v10;
  if (v13)
  {
    objc_msgSend(v13, "opacity", v10);
    v16 = v17;
  }
  objc_msgSend(v15, "numberWithDouble:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToValue:", v19);

  if (a5)
    goto LABEL_8;
LABEL_9:

  return v10;
}

- (uint64_t)pkui_setBackgroundColor:()PKUIAnimationUtilities withAnimationFactory:animation:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD v24[6];

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "backgroundColor");
  v10 = objc_claimAutoreleasedReturnValue();
  if ((id)v10 != v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke;
    v24[3] = &unk_1E3E61388;
    v24[4] = a1;
    v24[5] = v8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v24);
    if (v9)
    {
      objc_msgSend(v9, "springAnimationWithKeyPath:", CFSTR("backgroundColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAdditive:", 0);
      objc_msgSend(a1, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentationLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke_2;
      v19[3] = &unk_1E3E62460;
      v16 = v12;
      v20 = v16;
      v21 = v14;
      v22 = v10;
      v23 = v8;
      v17 = v14;
      PKUIPerformWithEffectiveTraitCollection(v15, v19);

      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v16 = 0;
  if (a5)
LABEL_6:
    objc_storeStrong(a5, v16);
LABEL_7:

  return v10;
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v8 = a4;
  objc_msgSend(a1, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerRadius");
  v11 = v10;
  if (v10 != a2)
  {
    objc_msgSend(v9, "setCornerRadius:", a2);
    if (v8)
    {
      objc_msgSend(v8, "springAnimationWithKeyPath:", CFSTR("cornerRadius"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v11, a2);
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v12 = 0;
  if (a5)
LABEL_6:
    objc_storeStrong(a5, v12);
LABEL_7:

  return v11;
}

- (double)pkui_setCornerRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v8;
  id *v9;
  double v10;
  double v11;
  id v13;

  v8 = a5;
  v13 = 0;
  if (a4)
    v9 = &v13;
  else
    v9 = 0;
  objc_msgSend(a1, "pkui_setCornerRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  v11 = v10;
  if (v13)
  {
    objc_msgSend(v8, "addObject:");

  }
  return v11;
}

- (double)pkui_setShadowOpacity:()PKUIAnimationUtilities withAnimationFactory:animation:
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  float v18;
  void *v19;
  void *v20;

  v8 = a4;
  objc_msgSend(a1, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shadowOpacity");
  v11 = *(float *)&v10;
  if (*(float *)&v10 == a2 || (*(float *)&v10 = a2, objc_msgSend(v9, "setShadowOpacity:", v10), !v8))
  {
    v12 = 0;
    if (!a5)
      goto LABEL_9;
LABEL_8:
    objc_storeStrong(a5, v12);
    goto LABEL_9;
  }
  objc_msgSend(v8, "springAnimationWithKeyPath:", CFSTR("shadowOpacity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdditive:", 0);
  objc_msgSend(a1, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentationLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = v11;
  if (v14)
  {
    objc_msgSend(v14, "shadowOpacity", v11);
    v17 = v18;
  }
  objc_msgSend(v16, "numberWithDouble:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", v20);

  if (a5)
    goto LABEL_8;
LABEL_9:

  return v11;
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;

  v10 = a5;
  objc_msgSend(a1, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shadowOffset");
  v14 = v13;
  v15 = v12;
  if (v13 != a2 || v12 != a3)
  {
    objc_msgSend(v11, "setShadowOffset:", a2, a3);
    if (v10)
    {
      objc_msgSend(v10, "springAnimationWithKeyPath:", CFSTR("shadowOffset"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromSize:toSize:", v14, v15, a2, a3);
      if (!a6)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  v17 = 0;
  if (a6)
LABEL_9:
    objc_storeStrong(a6, v17);
LABEL_10:

  return v14;
}

- (double)pkui_setShadowOffset:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v10;
  id *v11;
  double v12;
  double v13;
  id v15;

  v10 = a6;
  v15 = 0;
  if (a5)
    v11 = &v15;
  else
    v11 = 0;
  objc_msgSend(a1, "pkui_setShadowOffset:withAdditiveAnimationFactory:animation:", a5, v11, a2, a3);
  v13 = v12;
  if (v15)
  {
    objc_msgSend(v10, "addObject:");

  }
  return v13;
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:animation:
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v8 = a4;
  objc_msgSend(a1, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shadowRadius");
  v11 = v10;
  if (v10 != a2)
  {
    objc_msgSend(v9, "setShadowRadius:", a2);
    if (v8)
    {
      objc_msgSend(v8, "springAnimationWithKeyPath:", CFSTR("shadowRadius"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v11, a2);
      if (!a5)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v12 = 0;
  if (a5)
LABEL_6:
    objc_storeStrong(a5, v12);
LABEL_7:

  return v11;
}

- (double)pkui_setShadowRadius:()PKUIAnimationUtilities withAdditiveAnimationFactory:accumulator:
{
  id v8;
  id *v9;
  double v10;
  double v11;
  id v13;

  v8 = a5;
  v13 = 0;
  if (a4)
    v9 = &v13;
  else
    v9 = 0;
  objc_msgSend(a1, "pkui_setShadowRadius:withAdditiveAnimationFactory:animation:", a4, v9, a2);
  v11 = v10;
  if (v13)
  {
    objc_msgSend(v8, "addObject:");

  }
  return v11;
}

@end
