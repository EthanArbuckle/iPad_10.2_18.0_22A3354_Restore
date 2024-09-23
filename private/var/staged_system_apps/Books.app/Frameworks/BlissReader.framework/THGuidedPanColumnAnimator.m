@implementation THGuidedPanColumnAnimator

- (THGuidedPanColumnAnimator)initWithLocation:(id)a3 velocity:(CGPoint)a4 min:(CGPoint)a5 max:(CGPoint)a6 targetViewScale:(double)a7 controller:(id)a8
{
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  double v14;
  THGuidedPanColumnAnimator *v16;
  id v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  _QWORD v24[5];
  _QWORD v25[5];
  __int128 v26;
  double v27;
  objc_super v28;

  y = a6.y;
  x = a6.x;
  v12 = a5.y;
  v13 = a5.x;
  v14 = a4.y;
  v28.receiver = self;
  v28.super_class = (Class)THGuidedPanColumnAnimator;
  v16 = -[THGuidedPanColumnAnimator init](&v28, "init", a4.x);
  if (v16)
  {
    v17 = +[TSDContinuousContentPathAnimation animation](TSDContinuousContentPathAnimation, "animation");
    v16->_verticalBounceEnabled = 1;
    v16->_accuracy = 1.0;
    *(_OWORD *)&v16->_fastScrollCount = xmmword_314F60;
    v16->_minCenter.x = v13;
    v16->_minCenter.y = v12;
    v16->_maxCenter.x = x;
    v16->_maxCenter.y = y;
    objc_msgSend(a3, "viewScale");
    v16->_currentViewScale = v18;
    objc_msgSend(objc_msgSend(a8, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", 0.0, v14 / -1000.0);
    v16->_unscaledVelocity.x = v19;
    v16->_unscaledVelocity.y = v20;
    objc_msgSend(a3, "unscaledPoint");
    v16->_unscaledPosition.x = v21;
    v16->_unscaledPosition.y = v22;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_160C00;
    v25[3] = &unk_42A330;
    v25[4] = v16;
    v26 = xmmword_314F70;
    v27 = a7;
    objc_msgSend(v17, "setTick:", v25);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_160CCC;
    v24[3] = &unk_42A358;
    v24[4] = v16;
    objc_msgSend(v17, "setIsFinished:", v24);
    v16->_animation = (TSDContentAnimation *)v17;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanColumnAnimator;
  -[THGuidedPanColumnAnimator dealloc](&v3, "dealloc");
}

- (BOOL)_getBouncingDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 lastUpdateOffset:(double)a5 min:(double)a6 max:(double)a7 decelerationFactor:(double)a8 decelerationLnFactor:(double)a9 velocity:(double *)a10
{
  double v10;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  double accuracy;
  double v40;
  double v41;
  BOOL v42;

  if (a6 >= a7)
    v10 = a6;
  else
    v10 = a7;
  if (!a10)
    return 0;
  if (a5 < a6 || v10 < a5)
  {
    v20 = a4;
  }
  else
  {
    v21 = *a10;
    if (*a10 == 0.0)
      goto LABEL_42;
    v22 = a4 * a9;
    if (a4 * a9 >= -0.5)
      v23 = v22 * (v22 * 0.5 + 1.0) + 1.0;
    else
      v23 = exp(v22);
    v24 = (1.0 - v23) / (1.0 - a8) * a8;
    v25 = *a3 + v21 * v24 * self->_fastScrollMultiplier;
    *a3 = v25;
    v20 = 0.0;
    v26 = v25 < a6 || v25 > v10;
    v27 = a4;
    if (v26)
    {
      if (v25 >= a6)
      {
        v28 = (v10 - a5) * a4;
        v29 = v25 - a5;
      }
      else
      {
        v28 = (a5 - a6) * a4;
        v29 = a5 - v25;
      }
      v27 = v28 / v29;
      v20 = a4 - v27;
    }
    if (v27 > 0.0)
    {
      if (v27 != a4)
      {
        v30 = v27 * a9;
        if (v27 * a9 >= -0.5)
          v23 = v30 * (v30 * 0.5 + 1.0) + 1.0;
        else
          v23 = exp(v30);
        v24 = (1.0 - v23) / (1.0 - a8) * a8;
      }
      *a3 = a5 + v24 * *a10 * self->_fastScrollMultiplier;
      *a10 = v23 * *a10;
    }
  }
  if (v20 > 0.0)
  {
    v31 = v20 * a9;
    if (v20 * a9 >= -0.5)
      v32 = v31 * (v31 * 0.5 + 1.0) + 1.0;
    else
      v32 = exp(v31);
    v33 = v20 * -0.01005;
    if (v20 * -0.01005 >= -0.5)
      v34 = v33 * (v33 * 0.5 + 1.0) + 1.0;
    else
      v34 = exp(v33);
    if (*a3 >= a6)
      v35 = v10 + (*a3 - v10) * v34;
    else
      v35 = a6 + (*a3 - a6) * v34;
    *a3 = v35;
    *a3 = v35 + (1.0 - v32) * (v34 * a8 * *a10) / (1.0 - a8);
    *a10 = v32 * v34 * *a10;
    *(_OWORD *)&self->_fastScrollCount = xmmword_314F60;
  }
LABEL_42:
  v36 = *a3;
  v37 = v10 + 0.5;
  v38 = v10 > 0.0 || v36 < v37;
  if (!v38
    && ((accuracy = self->_accuracy, accuracy == 1.0)
      ? (v41 = round(v36))
      : (v40 = floor(v36), v41 = v40 + round((v36 - v40) * accuracy) / accuracy),
        v41 != 0.0)
    || (v36 > a6 + -0.5 ? (v42 = v36 < v37) : (v42 = 0), !v42))
  {
    *(_OWORD *)&self->_fastScrollCount = xmmword_314F60;
    return 1;
  }
  return 0;
}

- (void)_getStandardDecelerationOffset:(double *)a3 forTimeInterval:(double)a4 min:(double)a5 max:(double)a6 decelerationFactor:(double)a7 decelerationLnFactor:(double)a8 velocity:(double *)a9
{
  double v11;
  double v14;
  double v15;
  double v16;

  v11 = a5;
  if (a5 >= a6)
    v14 = a5;
  else
    v14 = a6;
  v15 = a4 * a8;
  if (v15 >= -0.5)
    v16 = v15 * (v15 * 0.5 + 1.0) + 1.0;
  else
    v16 = exp(v15);
  *a3 = *a3 + *a9 * ((1.0 - v16) / (1.0 - a7) * a7) * self->_fastScrollMultiplier;
  *a9 = v16 * *a9;
  if (*a3 < v11 || (v11 = v14, *a3 > v14))
  {
    *a3 = v11;
    *a9 = 0.0;
  }
}

- (TSDContentAnimation)animation
{
  return self->_animation;
}

- (BOOL)verticalBounceEnabled
{
  return self->_verticalBounceEnabled;
}

- (void)setVerticalBounceEnabled:(BOOL)a3
{
  self->_verticalBounceEnabled = a3;
}

@end
