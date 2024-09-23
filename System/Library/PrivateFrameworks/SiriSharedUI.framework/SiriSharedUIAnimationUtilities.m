@implementation SiriSharedUIAnimationUtilities

+ (id)defaultTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1044401829;
  LODWORD(v3) = 991345561;
  LODWORD(v4) = 1057634019;
  LODWORD(v5) = 1064732459;
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (double)defaultAnimationDuration
{
  double v2;

  +[SiriSharedUIAnimationUtilities animationCoefficient](SiriSharedUIAnimationUtilities, "animationCoefficient");
  return v2 + v2;
}

+ (double)animationCoefficient
{
  float v2;

  UIAnimationDragCoefficient();
  return v2;
}

+ (double)animationDurationForStyle:(int64_t)a3
{
  double result;

  objc_msgSend(a1, "animationDurationForStyle:presentationType:", a3, 0);
  return result;
}

+ (double)animationDurationForStyle:(int64_t)a3 presentationType:(int64_t)a4
{
  double v4;
  double v5;
  double v6;

  switch(a3)
  {
    case 0:
    case 1:
    case 5:
      v4 = 0.5;
      if (a4 == 1)
      {
        objc_msgSend(a1, "_springDurationForInsertAnimation");
        v4 = v5;
      }
      break;
    case 2:
      v4 = 0.2;
      break;
    case 3:
      v4 = 0.5;
      break;
    case 4:
      v4 = 0.1;
      break;
    default:
      v4 = 0.0;
      break;
  }
  +[SiriSharedUIAnimationUtilities animationCoefficient](SiriSharedUIAnimationUtilities, "animationCoefficient");
  return v4 * v6;
}

+ (void)perfomAnimationBlockWithAnimationBlock:(id)a3 context:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v8, "animationDuration");
  v11 = (void *)MEMORY[0x1E0DC3F10];
  if (v10 <= 0.0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke_2;
    v15[3] = &unk_1EA89CEE0;
    v16 = v7;
    objc_msgSend(v11, "performWithoutAnimation:", v15);
    if (v9)
      v9[2](v9, 1);
    v14 = v16;
  }
  else
  {
    v12 = v10;
    v13 = objc_msgSend(v8, "animationOptions");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke;
    v17[3] = &unk_1EA89CEE0;
    v18 = v7;
    objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", v13, v17, v9, v12, 0.0);
    v14 = v18;
  }

}

uint64_t __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (double)animationBeginTimeForStyle:(int64_t)a3
{
  double result;

  objc_msgSend(a1, "animationBeginTimeForStyle:presentationType:", a3, 0);
  return result;
}

+ (id)animationForStyle:(int64_t)a3 expectedWidthForStyle:(id)a4
{
  return (id)objc_msgSend(a1, "animationForStyle:expectedWidthForStyle:presentationType:", a3, a4, 0);
}

+ (id)animationForStyle:(int64_t)a3 expectedWidthForStyle:(id)a4 presentationType:(int64_t)a5
{
  void *v5;
  _BOOL4 v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[2];
  void *v40;
  _QWORD v41[2];
  void *v42;
  _QWORD v43[2];
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = SiriSharedUIReducedMotionEnabled();
  switch(a3)
  {
    case 0:
    case 5:
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationDurationForStyle:presentationType:", a3, a5);
      objc_msgSend(v5, "setDuration:");
      +[SiriSharedUIAnimationUtilities animationBeginTimeForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationBeginTimeForStyle:presentationType:", a3, a5);
      objc_msgSend(v5, "setBeginTime:");
      objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B50]);
      +[SiriSharedUIAnimationUtilities defaultTimingFunction](SiriSharedUIAnimationUtilities, "defaultTimingFunction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTimingFunction:", v9);

      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyPath:", CFSTR("transform.translation.y"));
      objc_msgSend(v10, "setFromValue:", &unk_1EA8ADAB8);
      objc_msgSend(v10, "setToValue:", &unk_1EA8ADAC8);
      v11 = 2.5;
      if (a5 == 1)
      {
        v12 = 200.0;
      }
      else
      {
        v11 = 3.0;
        v12 = 1000.0;
      }
      if (a5 == 1)
        v13 = 300.0;
      else
        v13 = 1000.0;
      if (a5 == 1)
        v14 = 50.0;
      else
        v14 = 500.0;
      if (a5 == 1)
        v15 = 2.0;
      else
        v15 = 3.0;
      objc_msgSend(v10, "setMass:", v11);
      objc_msgSend(v10, "setStiffness:", v12);
      objc_msgSend(v10, "setDamping:", dbl_1DE135BE0[a5 == 1]);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setKeyPath:", CFSTR("opacity"));
      objc_msgSend(v16, "setFromValue:", &unk_1EA8ADAC8);
      objc_msgSend(v16, "setToValue:", &unk_1EA8ADAD8);
      objc_msgSend(v16, "setMass:", 3.0);
      objc_msgSend(v16, "setStiffness:", v13);
      objc_msgSend(v16, "setDamping:", v14);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setKeyPath:", CFSTR("transform.scale"));
      objc_msgSend(v17, "setFromValue:", &unk_1EA8ADAE8);
      objc_msgSend(v17, "setToValue:", &unk_1EA8ADAD8);
      objc_msgSend(v17, "setMass:", v15);
      objc_msgSend(v17, "setStiffness:", v13);
      objc_msgSend(v17, "setDamping:", v14);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
      objc_msgSend(v18, "setFromValue:", &unk_1EA8ADAF8);
      objc_msgSend(v18, "setToValue:", &unk_1EA8ADAC8);
      objc_msgSend(v18, "setMass:", 2.0);
      objc_msgSend(v18, "setStiffness:", 300.0);
      objc_msgSend(v18, "setDamping:", 50.0);
      if (v8)
      {
        v44[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = (void *)MEMORY[0x1E0C99DE8];
        v43[0] = v10;
        v43[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "arrayWithArray:", v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (a5 == 1)
          v32 = v18;
        else
          v32 = v17;
        objc_msgSend(v19, "addObject:", v32);
      }
      objc_msgSend(v5, "setAnimations:", v19);

      goto LABEL_36;
    case 1:
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationDurationForStyle:presentationType:", 1, a5);
      objc_msgSend(v5, "setDuration:");
      objc_msgSend(v5, "setBeginTime:", CACurrentMediaTime());
      objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B50]);
      +[SiriSharedUIAnimationUtilities defaultTimingFunction](SiriSharedUIAnimationUtilities, "defaultTimingFunction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTimingFunction:", v25);

      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyPath:", CFSTR("transform.translation.y"));
      objc_msgSend(v10, "setFromValue:", &unk_1EA8ADAC8);
      objc_msgSend(v10, "setToValue:", &unk_1EA8ADB08);
      objc_msgSend(v10, "setMass:", 3.0);
      objc_msgSend(v10, "setStiffness:", 1000.0);
      objc_msgSend(v10, "setDamping:", 500.0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setKeyPath:", CFSTR("opacity"));
      objc_msgSend(v16, "setFromValue:", &unk_1EA8ADAD8);
      objc_msgSend(v16, "setToValue:", &unk_1EA8ADAC8);
      objc_msgSend(v16, "setMass:", 3.0);
      objc_msgSend(v16, "setStiffness:", 1000.0);
      objc_msgSend(v16, "setDamping:", 500.0);
      if (v8)
      {
        v42 = v16;
        v26 = (void *)MEMORY[0x1E0C99D20];
        v27 = &v42;
        v28 = 1;
      }
      else
      {
        v41[0] = v10;
        v41[1] = v16;
        v26 = (void *)MEMORY[0x1E0C99D20];
        v27 = (void **)v41;
        v28 = 2;
      }
      objc_msgSend(v26, "arrayWithObjects:count:", v27, v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAnimations:", v36);

      goto LABEL_36;
    case 2:
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationDurationForStyle:presentationType:", 2, a5);
      objc_msgSend(v5, "setDuration:");
      +[SiriSharedUIAnimationUtilities defaultTimingFunction](SiriSharedUIAnimationUtilities, "defaultTimingFunction");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTimingFunction:", v29);

      objc_msgSend(v5, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyPath:", CFSTR("opacity"));
      objc_msgSend(v10, "setFromValue:", &unk_1EA8ADAD8);
      objc_msgSend(v10, "setToValue:", &unk_1EA8ADAC8);
      objc_msgSend(v10, "setMass:", 3.0);
      objc_msgSend(v10, "setStiffness:", 1000.0);
      objc_msgSend(v10, "setDamping:", 500.0);
      v38 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAnimations:", v16);
      goto LABEL_36;
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationDurationForStyle:presentationType:", a3, a5);
      objc_msgSend(v5, "setDuration:");
      +[SiriSharedUIAnimationUtilities animationBeginTimeForStyle:presentationType:](SiriSharedUIAnimationUtilities, "animationBeginTimeForStyle:presentationType:", a3, a5);
      objc_msgSend(v5, "setBeginTime:");
      objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B50]);
      +[SiriSharedUIAnimationUtilities defaultTimingFunction](SiriSharedUIAnimationUtilities, "defaultTimingFunction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTimingFunction:", v20);

      objc_msgSend(v5, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeyPath:", CFSTR("opacity"));
      objc_msgSend(v10, "setFromValue:", &unk_1EA8ADAC8);
      objc_msgSend(v10, "setToValue:", &unk_1EA8ADAD8);
      objc_msgSend(v10, "setMass:", 3.0);
      objc_msgSend(v10, "setStiffness:", 1000.0);
      objc_msgSend(v10, "setDamping:", 500.0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setKeyPath:", CFSTR("transform.translation.y"));
      objc_msgSend(v16, "setFromValue:", &unk_1EA8ADB18);
      objc_msgSend(v16, "setToValue:", &unk_1EA8ADAC8);
      objc_msgSend(v16, "setMass:", 3.0);
      objc_msgSend(v16, "setStiffness:", 1000.0);
      objc_msgSend(v16, "setDamping:", 500.0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setKeyPath:", CFSTR("transform.scale.xy"));
      objc_msgSend(v21, "setFromValue:", &unk_1EA8ADAE8);
      objc_msgSend(v21, "setToValue:", &unk_1EA8ADB28);
      objc_msgSend(v21, "setMass:", 3.0);
      objc_msgSend(v21, "setStiffness:", 1000.0);
      objc_msgSend(v21, "setDamping:", 500.0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
      objc_msgSend(v22, "setFromValue:", &unk_1EA8ADAF8);
      objc_msgSend(v22, "setToValue:", &unk_1EA8ADAC8);
      objc_msgSend(v22, "setMass:", 3.0);
      objc_msgSend(v22, "setStiffness:", 1000.0);
      objc_msgSend(v22, "setDamping:", 500.0);
      v23 = a3 == 4 || v8;
      if (v23 == 1)
      {
        v40 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = (void *)MEMORY[0x1E0C99DE8];
        v39[0] = v16;
        v39[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "arrayWithArray:", v34);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (a5 == 1)
          v35 = v22;
        else
          v35 = v21;
        objc_msgSend(v24, "addObject:", v35);
      }
      objc_msgSend(v5, "setAnimations:", v24);

LABEL_36:
      break;
    default:
      return v5;
  }
  return v5;
}

+ (id)_centeringAnimationForInitialScale:(double)a3 width:(double)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD2848], "animation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyPath:", CFSTR("transform.translation.x"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (1.0 - a3) * (a4 * 0.5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v7);

  objc_msgSend(v6, "setToValue:", &unk_1EA8ADAC8);
  return v6;
}

+ (double)_springDurationForInsertAnimation
{
  double result;

  objc_msgSend(a1, "_springDurationForMass:stiffness:damping:", 2.0, 300.0, 50.0);
  return result;
}

+ (double)_springDurationForMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  id v8;
  double v9;
  double v10;

  v8 = objc_alloc_init(MEMORY[0x1E0CD2848]);
  objc_msgSend(v8, "setMass:", a3);
  objc_msgSend(v8, "setStiffness:", a4);
  objc_msgSend(v8, "setDamping:", a5);
  objc_msgSend(v8, "settlingDuration");
  v10 = v9;

  return v10;
}

@end
