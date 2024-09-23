@implementation PKPassGroupViewVerticalPanAnimator

- (PKPassGroupViewVerticalPanAnimator)init
{

  return 0;
}

- (id)initWithGroupView:(void *)a3 gestureRecognizer:
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  id *v10;
  id *v11;
  objc_super v13;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a1 && v6 && v7)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKPassGroupViewVerticalPanAnimator;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 8, a2);
      objc_storeStrong(v11 + 9, a3);
      v11[11] = (id)0x3FF0000000000000;
      objc_msgSend(v11[8], "addGestureRecognizer:", v11[9]);
    }
    a1 = v11;
    v9 = a1;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[PKPassGroupViewVerticalPanAnimator invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKPassGroupViewVerticalPanAnimator;
  -[PKPassGroupViewVerticalPanAnimator dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v2;

  if (a1 && !*(_BYTE *)(a1 + 60))
  {
    *(_BYTE *)(a1 + 60) = 1;
    objc_msgSend(*(id *)(a1 + 72), "setEnabled:", 0);
    objc_msgSend(*(id *)(a1 + 64), "removeGestureRecognizer:", *(_QWORD *)(a1 + 72));
    v2 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:](a1, 0);
    if (*(_BYTE *)(a1 + 61))
    {
      *(_BYTE *)(a1 + 61) = 0;
      _UIUpdateRequestDeactivate();
    }
  }
}

- (void)setDismissAnimation:(uint64_t)a1
{
  id v4;
  id v5;
  id v6;

  v4 = a2;
  if (a1)
  {
    v5 = *(id *)(a1 + 16);
    if (v5 != v4)
    {
      v6 = v4;
      if (v5)
      {
        objc_msgSend(v5, "stop");
        objc_storeStrong((id *)(a1 + 16), a2);
        if (!*(_QWORD *)(a1 + 16))
          objc_msgSend(*(id *)(a1 + 64), "clearPageControlAlphaOverride");
      }
      else
      {
        objc_storeStrong((id *)(a1 + 16), a2);
      }
      -[PKPassGroupViewVerticalPanAnimator updateUpdating](a1);
      v4 = v6;
    }
  }

}

- (uint64_t)updateRecognizingWithAllowed:(uint64_t)result
{
  uint64_t v2;
  int v3;

  if (result)
  {
    v2 = result;
    if (a2)
    {
      result = objc_msgSend(*(id *)(result + 72), "state");
      v3 = (unint64_t)(result - 1) < 2;
    }
    else
    {
      v3 = 0;
    }
    if (*(unsigned __int8 *)(v2 + 8) != v3)
    {
      *(_BYTE *)(v2 + 8) = v3;
      return -[PKPassGroupViewVerticalPanAnimator updateUpdating](v2);
    }
  }
  return result;
}

- (uint64_t)updateUpdating
{
  int v1;
  uint64_t v2;

  if (result)
  {
    if (*(_BYTE *)(result + 8) || *(_QWORD *)(result + 16))
    {
      v1 = *(unsigned __int8 *)(result + 60);
      if (*(unsigned __int8 *)(result + 61) == (v1 ^ 1))
        return result;
      *(_BYTE *)(result + 61) = v1 ^ 1;
      if (!v1)
      {
        *(_OWORD *)(result + 24) = xmmword_19DF159C0;
        v2 = result + 24;
        *(_QWORD *)(v2 + 16) = 0;
        *(_QWORD *)(v2 + 24) = 0;
        *(_DWORD *)(v2 + 32) = 2162689;
        return _UIUpdateRequestActivate();
      }
      return _UIUpdateRequestDeactivate();
    }
    if (*(_BYTE *)(result + 61))
    {
      *(_BYTE *)(result + 61) = 0;
      return _UIUpdateRequestDeactivate();
    }
  }
  return result;
}

- (void)layoutViewsWithY:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  long double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, CATransform3D *, double, double);
  CATransform3D v25;
  CATransform3D v26;

  if (a1)
  {
    v4 = *(double *)(a1 + 104);
    v5 = a2 - v4;
    v6 = *(double *)(a1 + 120) - v4;
    v7 = v5 / v6;
    v8 = v5 / v6 / -0.05 + 1.0;
    v9 = v8 <= 0.0;
    v10 = v8 < 1.0 || v8 <= 0.0;
    if (v8 >= 1.0)
      v9 = 1;
    if (v10)
      v11 = 0.0;
    else
      v11 = 1.0;
    if (v9)
      v12 = v11;
    else
      v12 = v5 / v6 / -0.05 + 1.0;
    if (v4 >= a2
      || (v13 = fmin(fmax(v5 / (v6 * 0.35), 0.0), 1.0),
          v14 = log(*(long double *)(a1 + 88)),
          v15 = exp(v13 * v14),
          memset(&v26, 0, sizeof(v26)),
          v15 == 1.0))
    {
      v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v26.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v26.m33 = v16;
      v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v26.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v26.m43 = v17;
      v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v26.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v26.m13 = v18;
      v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v26.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v26.m23 = v19;
    }
    else
    {
      CATransform3DMakeScale(&v26, v15, v15, 1.0);
    }
    objc_msgSend(*(id *)(a1 + 64), "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "position");
    v22 = v21;
    v25 = v26;
    objc_msgSend(v20, "setTransform:", &v25);
    objc_msgSend(v20, "setPosition:", v22, a2);
    if ((objc_msgSend(*(id *)(a1 + 64), "overridePageControlAlpha:", v12) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 64), "updatePageControlFrameAnimated:", 0);
    objc_msgSend(*(id *)(a1 + 64), "updateToStackWithProgress:originalPosition:timingFunction:", &__block_literal_global_129, v7, *(double *)(a1 + 96), *(double *)(a1 + 104));
    v23 = *(_QWORD *)(a1 + 80);
    if (v23)
    {
      v24 = *(void (**)(uint64_t, uint64_t, CATransform3D *, double, double))(v23 + 16);
      v25 = v26;
      v24(v23, a1, &v25, v22, a2);
    }

  }
}

- (void)dismissWithStartVelocity:(double)a3 completion:
{
  id v5;
  void *v6;
  double *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id from;
  id location;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (a1[60])
    {
      if (v5)
        (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    }
    else
    {
      v7 = -[PKPassGroupViewVerticalPanAnimator createAnimationWithInitialVelocity:]((uint64_t)a1, a3);
      -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:]((uint64_t)a1, v7);
      objc_initWeak(&location, a1);
      objc_initWeak(&from, v7);
      v8 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke;
      v13[3] = &unk_1E3E6FFC8;
      objc_copyWeak(&v14, &location);
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke_2;
      v9[3] = &unk_1E3E6FFF0;
      objc_copyWeak(&v11, &location);
      objc_copyWeak(&v12, &from);
      v10 = v6;
      objc_msgSend(v7, "runWithValueApplier:completion:", v13, v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }

}

- (double)createAnimationWithInitialVelocity:(uint64_t)a1
{
  double *v2;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;

  v2 = (double *)a1;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "position");
    v6 = v5;

    v7 = v2[15];
    v8 = objc_alloc(MEMORY[0x1E0DC4130]);
    v2 = (double *)objc_msgSend(v8, "initWithValue:velocity:unitSize:", v6, a2, *MEMORY[0x1E0DC5810]);
    objc_msgSend(MEMORY[0x1E0DC4120], "upperBoundary:ofType:", 2, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addActiveValue:", v9);
    objc_msgSend(MEMORY[0x1E0DC4120], "activeValue:ofType:", 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setBoundaryPull:", 0.06);
    objc_msgSend(v2, "addActiveValue:", v10);
    objc_msgSend(v2, "setFriction:", 0.200000003);

  }
  return v2;
}

void __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  id v6;
  id v7;
  id to;

  v5 = (void *)MEMORY[0x1A1AE621C]();
  objc_copyWeak(&to, (id *)(a1 + 32));
  v6 = objc_loadWeakRetained(&to);

  if (v6)
  {
    v7 = objc_loadWeakRetained(&to);
    -[PKPassGroupViewVerticalPanAnimator layoutViewsWithY:]((uint64_t)v7, a3);

  }
  objc_destroyWeak(&to);
  objc_autoreleasePoolPop(v5);
}

void __74__PKPassGroupViewVerticalPanAnimator_dismissWithStartVelocity_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (id)WeakRetained[2] == v4)
    -[PKPassGroupViewVerticalPanAnimator setDismissAnimation:]((uint64_t)WeakRetained, 0);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updater, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_groupView, 0);
  objc_storeStrong((id *)&self->_dismissAnimation, 0);
}

@end
