@implementation PUDefaultTileTransitionCoordinator

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return -[PUDefaultTileTransitionCoordinator _layoutInfoWithDefaultDisappearance:](self, "_layoutInfoWithDefaultDisappearance:", a4);
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  return -[PUDefaultTileTransitionCoordinator _layoutInfoWithDefaultDisappearance:](self, "_layoutInfoWithDefaultDisappearance:", a4);
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v6 = a4;
  -[PUDefaultTileTransitionCoordinator animationDuration](self, "animationDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUDefaultTileTransitionCoordinator animationDuration](self, "animationDuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
  }
  else
  {
    +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultAnimationDuration");
  }
  v10 = v9;

  objc_msgSend(v6, "tileKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isEqualToString:", PUTileKindBackground);
  if ((_DWORD)v12)
  {
    +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transitionDuration");
    v10 = v14;

  }
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "animationDragCoefficient");
  v17 = v10 * v16;

  v18 = -[PUTileTransitionCoordinator newTileAnimationOptions](self, "newTileAnimationOptions");
  objc_msgSend(v18, "setKind:", 0);
  objc_msgSend(v18, "setDuration:", v17);
  objc_msgSend(v18, "setSynchronizedWithTransition:", v12);
  return v18;
}

- (void)configureOptions:(id)a3 forSpringAnimationsZoomingIn:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v4 = a4;
  v21 = a3;
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "useSpringAnimations"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
    {
      v7 = objc_msgSend(v6, "lemonadeUseOvershootingSpringAnimations");
      v8 = objc_msgSend(v6, "lemonadeUseSystemSpringAnimations");
    }
    else
    {
      v7 = objc_msgSend(v6, "useOvershootingSpringAnimations");
      v8 = objc_msgSend(v6, "useSystemSpringAnimations");
    }
    if (!v4 || !v7)
    {
      if (v8)
      {
        objc_msgSend(v6, "animationDragCoefficient");
        if (v12 == 1.0)
        {
          objc_msgSend(v21, "setKind:", 1001);
          goto LABEL_17;
        }
        objc_msgSend(v21, "setKind:", 1000);
        objc_msgSend(v6, "animationDragCoefficient");
        v18 = v17 * 0.5058;
      }
      else
      {
        -[PUDefaultTileTransitionCoordinator animationDuration](self, "animationDuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[PUDefaultTileTransitionCoordinator animationDuration](self, "animationDuration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

        }
        else
        {
          objc_msgSend(v6, "springAnimationDuration");
          v16 = v19;
        }

        objc_msgSend(v21, "setKind:", 1000);
        objc_msgSend(v6, "animationDragCoefficient");
        v18 = v16 * v20;
      }
      objc_msgSend(v21, "setDuration:", v18);
      objc_msgSend(v21, "setSpringDampingRatio:", 1.0);
      goto LABEL_17;
    }
    objc_msgSend(v21, "setKind:", 1002);
    objc_msgSend(v6, "animationDragCoefficient");
    v10 = v9;
    objc_msgSend(v6, "animationDragCoefficient");
    objc_msgSend(v21, "setSpringMass:", v10 * v11);
    objc_msgSend(v21, "setSpringStiffness:", 350.0);
    objc_msgSend(v21, "setSpringDampingRatio:", 0.670000017);
    objc_msgSend(v21, "setSpringNumberOfOscillations:", 1);
  }
LABEL_17:

}

- (id)_layoutInfoWithDefaultDisappearance:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v4 = a3;
  v5 = v4;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  if (v4)
    objc_msgSend(v4, "transform");
  v19[0] = v23;
  v19[1] = v24;
  v19[2] = v25;
  -[PUDefaultTileTransitionCoordinator _adjustDefaultDisappearanceTransform:](self, "_adjustDefaultDisappearanceTransform:", v19);
  v23 = v20;
  v24 = v21;
  v25 = v22;
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "zPosition");
  v15 = v14;
  objc_msgSend(v5, "coordinateSystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v23;
  v21 = v24;
  v22 = v25;
  objc_msgSend(v5, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v20, v16, v7, v9, v11, v13, 0.0, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CGAffineTransform)_adjustDefaultDisappearanceTransform:(SEL)a3
{
  __int128 v5;
  void *v6;
  int v7;
  CGAffineTransform *result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v5 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rotateDisappearingTiles");

  if (v7)
  {
    v9 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v13.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v13.c = v9;
    *(_OWORD *)&v13.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(retstr, &v13, 0.800000012, 0.800000012);
    v10 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v12.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v12.c = v10;
    *(_OWORD *)&v12.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformRotate(&v13, &v12, 0.5);
    v11 = *(_OWORD *)&v13.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v13.a;
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v13.tx;
  }
  return result;
}

- (NSNumber)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationDuration, 0);
}

@end
