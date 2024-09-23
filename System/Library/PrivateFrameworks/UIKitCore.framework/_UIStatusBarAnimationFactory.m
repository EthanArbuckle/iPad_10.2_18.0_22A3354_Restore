@implementation _UIStatusBarAnimationFactory

+ (id)noAnimation
{
  if (qword_1ECD80370 != -1)
    dispatch_once(&qword_1ECD80370, &__block_literal_global_492);
  return (id)_MergedGlobals_1218;
}

+ (id)fadeAnimationWithDuration:(double)a3
{
  return (id)objc_msgSend(a1, "fadeAnimationWithDuration:scale:", a3, 1.0);
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4
{
  return (id)objc_msgSend(a1, "fadeAnimationWithDuration:scale:offset:", a3, a4, 0.0, 0.0);
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4 offset:(UIOffset)a5
{
  double vertical;
  double horizontal;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  CGAffineTransform v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  _QWORD v23[5];
  id v24;

  vertical = a5.vertical;
  horizontal = a5.horizontal;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__180;
  v23[4] = __Block_byref_object_dispose__180;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v22.c = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v22.tx = v11;
  if (horizontal != 0.0 || vertical != 0.0)
  {
    *(_OWORD *)&v21.a = v9;
    *(_OWORD *)&v21.c = v10;
    *(_OWORD *)&v21.tx = v11;
    CGAffineTransformTranslate(&v22, &v21, horizontal, vertical);
  }
  if (a4 != 1.0)
  {
    v20 = v22;
    CGAffineTransformScale(&v21, &v20, a4, a4);
    v22 = v21;
  }
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v18 = v22;
  v17[1] = 3221225472;
  v17[2] = __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke;
  v17[3] = &unk_1E16E2538;
  v17[4] = v23;
  v19 = a3;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3;
  v16[3] = &unk_1E16DC538;
  v16[4] = v23;
  objc_msgSend(v13, "setPrepareBlock:", v16);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fadeAnimation[%.2f]"), *(_QWORD *)&a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIdentifier:", v14);

  _Block_object_dispose(v23, 8);
  return v13;
}

+ (id)pulseAnimationWithDuration:(double)a3 scale:(double)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e69_v32__0___UIStatusBarAnimation_8___UIStatusBarDisplayItem_16___v__B_24l;
  *(double *)&v5[4] = a3;
  *(double *)&v5[5] = a4;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
