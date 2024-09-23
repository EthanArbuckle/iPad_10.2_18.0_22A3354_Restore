@implementation _UIMotionEffectApplicator

+ (void)applyMotionEffect:(id)a3 toViews:(id)a4 usingPose:(id)a5 transformedForTargetInterfaceOrientation:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t i;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int j;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  id obj;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGAffineTransform v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v35 = 0.0;
  v34 = 0.0;
  if (a6 != 1)
  {
    objc_msgSend(v10, "viewerOffset");
    v34 = v12;
    v35 = v13;
    if (a6 == 3)
    {
      v14 = 1.57079633;
    }
    else if (a6 == 4)
    {
      v14 = -1.57079633;
    }
    else
    {
      v14 = 3.14159265;
      if (a6 != 2)
        v14 = 0.0;
    }
    CGAffineTransformMakeRotation(&v44, -v14);
    objc_msgSend(v11, "setViewerOffset:", vaddq_f64(*(float64x2_t *)&v44.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v44.a, v34), vmulq_n_f64(*(float64x2_t *)&v44.c, v35))));
  }
  v33 = v11;
  v15 = v36;
  objc_msgSend(v36, "_keyPathsAndRelativeValuesForPose:", v11, a6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIViewKeyValueAnimationFactory animationForKeyPathsAndRelativeValues:](_UIViewKeyValueAnimationFactory, "animationForKeyPathsAndRelativeValues:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_animationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v9;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    v39 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v39)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((v20 & 1) == 0)
        {
          if (_UIInternalPreferencesRevisionOnce != -1)
            dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
          v24 = _UIInternalPreferencesRevisionVar;
          if (_UIInternalPreferencesRevisionVar >= 1)
          {
            for (j = _UIInternalPreference_UIParallaxIsPixelAligned;
                  v24 != j;
                  j = _UIInternalPreference_UIParallaxIsPixelAligned)
            {
              if (v24 < j)
              {
                if (byte_1EDDA81CC)
                  break;
                v20 = 0;
                if ((v21 & 1) != 0)
                  goto LABEL_23;
                goto LABEL_31;
              }
              _UIInternalPreferenceSync(v24, &_UIInternalPreference_UIParallaxIsPixelAligned, (uint64_t)CFSTR("UIParallaxIsPixelAligned"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
            }
          }
          +[_UICAAnimationPositionQuantizer quantizePositionsInAnimation:givenView:](_UICAAnimationPositionQuantizer, "quantizePositionsInAnimation:givenView:", v16, v23);
          objc_msgSend(v23, "layer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "animationForKey:", v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26 && (_fromValuesAreEqual(v16, v26) & 1) != 0)
          {
            v20 = 1;
            v21 = 1;
LABEL_34:

            continue;
          }

        }
        v20 = 1;
        if ((v21 & 1) != 0)
        {
LABEL_23:
          objc_msgSend(v23, "layer");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "animationForKey:", v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v21 = 1;
            continue;
          }
        }
LABEL_31:
        if ((objc_msgSend(v23, "_applyKeyPathsAndRelativeValues:forMotionEffect:", v38, v15) & 1) == 0)
        {
          _applyTransitionAnimationToView(v23, v17, v16);
          if (v16)
          {
            v30 = v16;
            v31 = v17;
            objc_msgSend(v23, "layer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeAnimationForKey:", v31);
            objc_msgSend(v26, "addAnimation:forKey:", v30, v31);

            v15 = v36;
            goto LABEL_34;
          }
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v19);
  }

  if (v32 != 1)
    objc_msgSend(v33, "setViewerOffset:", v34, v35);

}

+ (void)unapplyMotionEffect:(id)a3 toViews:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v5, "_animationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "_unapplyMotionEffect:", v5) & 1) == 0)
        {
          _applyTransitionAnimationToView(v11, v12, 0);
          objc_msgSend(v11, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeAnimationForKey:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

@end
