@implementation _UIFocusSoundGenerator

+ (id)defaultGenerator
{
  _UIFocusSoundGenerator *v2;
  void *v3;
  _UIFocusSoundGenerator *v4;

  v2 = [_UIFocusSoundGenerator alloc];
  +[_UIDefaultFocusSoundPlayer sharedInstance](_UIDefaultFocusSoundPlayer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIFocusSoundGenerator initWithFocusSoundPlayer:](v2, "initWithFocusSoundPlayer:", v3);

  return v4;
}

- (_UIFocusSoundGenerator)initWithFocusSoundPlayer:(id)a3
{
  id v5;
  _UIFocusSoundGenerator *v6;
  _UIFocusSoundGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusSoundGenerator;
  v6 = -[_UIFocusSoundGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_focusSoundPlayer, a3);

  return v7;
}

- (void)playSoundForFocusUpdateInContext:(id)a3
{
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  CGFloat Width;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  CGRect v36;

  v35 = a3;
  objc_msgSend(v35, "_request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldPlayFocusSound");

  if (v6)
    v7 = CFSTR("UIFocusSoundIdentifierDefault");
  else
    v7 = CFSTR("UIFocusSoundIdentifierNone");
  v8 = v7;
  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", 0x1E1726180) & 1) == 0)
  {
    objc_msgSend(v35, "_focusMovement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_velocity");
    v11 = v10;
    v13 = v12;
    v14 = 1.0;
    if (objc_msgSend(v9, "_isVelocityBased"))
    {
      v15 = fmax(_UIFocusVelocityBasedInterpolationFactor(v11, v13), 0.1);
      if (v15 >= 1.0)
        v14 = 1.0;
      else
        v14 = v15 * 0.6 + 0.4;
    }

    objc_msgSend(v35, "_destinationItemInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v35, "_destinationItemInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "item");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "coordinateSpace");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v35, "_destinationItemInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "focusedRegion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_UIFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v23, v21);
        v26 = v25 + v24 * 0.5;

        objc_msgSend(v21, "bounds");
        Width = CGRectGetWidth(v36);
        v28 = (v26 - Width * 0.5) / (Width * 0.375);
      }
      else
      {
        v28 = 0.0;
      }

    }
    else
    {
      v28 = 0.0;
    }
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", 0x1E17261A0))
    {
      objc_msgSend(v35, "_destinationItemInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "item");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = _UIFocusedSoundForItem(v30);

      -[_UIFocusSoundPlayer playSoundWithFocusSound:volume:pan:](self->_focusSoundPlayer, "playSoundWithFocusSound:volume:pan:", v31, v14, v28);
    }
    else
    {
      _UIFocusSoundRegistry();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusSoundGenerator.m"), 168, CFSTR("Attempted to play sound for identifier '%@', which has not been registered."), v8);

      }
      -[_UIFocusSoundPlayer playSoundWithURL:volume:pan:](self->_focusSoundPlayer, "playSoundWithURL:volume:pan:", v33, v14, v28);

    }
  }

}

+ (void)registerURL:(id)a3 forIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (v14)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusSoundGenerator.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("soundFileURL"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusSoundGenerator.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  _UIFocusSoundRegistry();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusSoundGenerator.m"), 187, CFSTR("A URL is already registered with the identifier '%@'. Identifiers can only be registered once."), v7);

  }
  _UIFocusSoundRegistry();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v7);

}

+ (void)_uiktest_unregisterURLForIdentifier:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFocusSoundGenerator.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  _UIFocusSoundRegistry();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v7);

}

- (_UIFocusSoundPlayer)focusSoundPlayer
{
  return self->_focusSoundPlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusSoundPlayer, 0);
}

@end
