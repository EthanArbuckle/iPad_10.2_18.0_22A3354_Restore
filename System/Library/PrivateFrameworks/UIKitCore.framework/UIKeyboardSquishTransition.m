@implementation UIKeyboardSquishTransition

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_opacityAnimationDisplayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardSquishTransition;
  -[UIKeyboardKeyplaneTransition dealloc](&v3, sel_dealloc);
}

- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)UIKeyboardSquishTransition;
  -[UIKeyboardKeyplaneTransition rebuildWithStartKeyplane:startView:endKeyplane:endView:](&v38, sel_rebuildWithStartKeyplane_startView_endKeyplane_endView_, v10, a4, v11, a6);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v10, "keys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v18, "shape");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "shape");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v15);
    }

    -[UIKeyboardSquishTransition setStartGeometries:](self, "setStartGeometries:", v12);
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v11, "keys", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v27, "shape");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v27, "shape");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v29);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v24);
    }

    -[UIKeyboardSquishTransition setEndGeometries:](self, "setEndGeometries:", v21);
  }

}

- (void)commitTransitionRebuild
{
  double v3;
  double v4;
  void *v5;
  _BOOL4 v6;
  double v7;

  -[UIKBTree primaryKeylayoutWidthRatio](self->super._end, "primaryKeylayoutWidthRatio");
  self->_widthRatio = v3;
  -[UIKBTree primaryKeylayoutOffset](self->super._end, "primaryKeylayoutOffset");
  self->_offsetX = v4;
  -[UIKeyboardSquishTransition sortedCommonVisibleKeys](self, "sortedCommonVisibleKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSquishTransition setCommonVisibleKeys:](self, "setCommonVisibleKeys:", v5);

  v6 = -[UIKeyboardKeyplaneTransition initiallyAtEnd](self, "initiallyAtEnd");
  v7 = 0.0;
  if (v6)
    v7 = 1.0;
  -[UIKeyboardSquishTransition setPreviousProgress:](self, "setPreviousProgress:", v7);
  -[UIKeyboardSquishTransition _updateTransition](self, "_updateTransition");
}

- (id)_animationsForStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  __int128 v19;
  double widthRatio;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardSquishTransition useInteractiveOpacity](self, "useInteractiveOpacity"))
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A99288, &unk_1E1A992A0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "_kbTimingFunction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v5);

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("start opacity interpolation"));
  }
  if (-[UIKeyboardSquishTransition animationType](self, "animationType") == 1)
  {
    -[UIView layer](self->super._startView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "position");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "bounds");
    v12 = v11;
    v13 = 1.0 - self->_widthRatio;
    v14 = v11 * v13;
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("position"), 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v8, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFromValue:", v16);

    if (self->_offsetX <= 7.0)
      v17 = -(v12 * v13);
    else
      v17 = v14;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v8 + v17, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToValue:", v18);

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("start position interpolation"));
    v19 = 0uLL;
    memset(&v29, 0, sizeof(v29));
    if (v6)
    {
      objc_msgSend(v6, "transform");
      v19 = 0uLL;
    }
    *(_OWORD *)&v28.m41 = v19;
    *(_OWORD *)&v28.m43 = v19;
    *(_OWORD *)&v28.m31 = v19;
    *(_OWORD *)&v28.m33 = v19;
    *(_OWORD *)&v28.m21 = v19;
    *(_OWORD *)&v28.m23 = v19;
    *(_OWORD *)&v28.m11 = v19;
    *(_OWORD *)&v28.m13 = v19;
    widthRatio = self->_widthRatio;
    v27 = v29;
    CATransform3DScale(&v28, &v27, widthRatio, 1.0, 1.0);
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform"), 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v29;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFromValue:", v22);

    v27 = v28;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setToValue:", v23);

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("start transform interpolation"));
    goto LABEL_12;
  }
  if (-[UIKeyboardSquishTransition animationType](self, "animationType") == 2)
  {
    -[UIKeyboardSquishTransition meshTransformForKeyplane:toKeyplane:](self, "meshTransformForKeyplane:toKeyplane:", self->super._start, self->super._start);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSquishTransition meshTransformForKeyplane:toKeyplane:](self, "meshTransformForKeyplane:toKeyplane:", self->super._start, self->super._end);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v6, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("start transform interpolation"));

LABEL_12:
  }
  return v3;
}

- (id)_animationsForEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v19;
  double widthRatio;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardSquishTransition useInteractiveOpacity](self, "useInteractiveOpacity"))
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("opacity"), &unk_1E1A992A0, &unk_1E1A99288);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "_kbTimingFunction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v5);

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("end opacity interpolation"));
  }
  if (-[UIKeyboardSquishTransition animationType](self, "animationType") == 1)
  {
    -[UIView layer](self->super._endView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "position");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "bounds");
    v12 = v11;
    v13 = 1.0 - self->_widthRatio;
    v14 = v11 * v13;
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("position"), 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_offsetX <= 7.0)
      v16 = v14;
    else
      v16 = -(v12 * v13);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v8 + v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFromValue:", v17);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v8, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToValue:", v18);

    objc_msgSend(v6, "addAnimation:forKey:", v15, CFSTR("end position interpolation"));
    v19 = 0uLL;
    memset(&v29, 0, sizeof(v29));
    if (v6)
    {
      objc_msgSend(v6, "transform");
      v19 = 0uLL;
    }
    *(_OWORD *)&v28.m41 = v19;
    *(_OWORD *)&v28.m43 = v19;
    *(_OWORD *)&v28.m31 = v19;
    *(_OWORD *)&v28.m33 = v19;
    *(_OWORD *)&v28.m21 = v19;
    *(_OWORD *)&v28.m23 = v19;
    widthRatio = self->_widthRatio;
    *(_OWORD *)&v28.m11 = v19;
    *(_OWORD *)&v28.m13 = v19;
    v27 = v29;
    CATransform3DScale(&v28, &v27, 1.0 / widthRatio, 1.0, 1.0);
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("transform"), 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v28;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFromValue:", v22);

    v27 = v29;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setToValue:", v23);

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("end transform interpolation"));
    goto LABEL_12;
  }
  if (-[UIKeyboardSquishTransition animationType](self, "animationType") == 2)
  {
    -[UIKeyboardSquishTransition meshTransformForKeyplane:toKeyplane:](self, "meshTransformForKeyplane:toKeyplane:", self->super._end, self->super._start);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSquishTransition meshTransformForKeyplane:toKeyplane:](self, "meshTransformForKeyplane:toKeyplane:", self->super._end, self->super._end);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2710], "normalizedAnimationWithKeyPath:fromValue:toValue:", CFSTR("meshTransform"), v6, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("end transform interpolation"));

LABEL_12:
  }
  return v3;
}

- (void)_updateTransition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  -[UIView layer](self->super._startView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->super._endView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView contentScaleFactor](self->super._startView, "contentScaleFactor");
  objc_msgSend(v3, "setRasterizationScale:");
  -[UIView contentScaleFactor](self->super._endView, "contentScaleFactor");
  objc_msgSend(v4, "setRasterizationScale:");
  -[UIKeyboardSquishTransition _animationsForStart](self, "_animationsForStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__UIKeyboardSquishTransition__updateTransition__block_invoke;
  v12[3] = &unk_1E16D8C00;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[UIKeyboardSquishTransition _animationsForEnd](self, "_animationsForEnd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __47__UIKeyboardSquishTransition__updateTransition__block_invoke_2;
  v10[3] = &unk_1E16D8C00;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

}

uint64_t __47__UIKeyboardSquishTransition__updateTransition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", a3, a2);
}

uint64_t __47__UIKeyboardSquishTransition__updateTransition__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", a3, a2);
}

- (void)removeAllAnimations
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIKeyboardSquishTransition opacityAnimationDisplayLink](self, "opacityAnimationDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIKeyboardSquishTransition setOpacityAnimationDisplayLink:](self, "setOpacityAnimationDisplayLink:", 0);
  -[UIView layer](self->super._startView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->super._endView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("start opacity interpolation"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("end opacity interpolation"));
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("start position interpolation"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("end position interpolation"));
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("start transform interpolation"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("end transform interpolation"));
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSquishTransition;
  -[UIKeyboardKeyplaneTransition removeAllAnimations](&v6, sel_removeAllAnimations);

}

- (void)updateWithProgress:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  -[UIView setHidden:](self->super._startView, "setHidden:", 0);
  -[UIView setHidden:](self->super._endView, "setHidden:", 0);
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardSquishTransition;
  -[UIKeyboardKeyplaneTransition updateWithProgress:](&v13, sel_updateWithProgress_, a3);
  -[UIKeyboardSquishTransition previousProgress](self, "previousProgress");
  v6 = v5;
  if (!-[UIKeyboardSquishTransition useInteractiveOpacity](self, "useInteractiveOpacity") && a3 >= 0.5 == v6 < 0.5)
  {
    -[UIKeyboardSquishTransition setOpacityAnimationDirectionForward:](self, "setOpacityAnimationDirectionForward:", a3 >= 0.5);
    -[UIKeyboardSquishTransition opacityAnimationDisplayLink](self, "opacityAnimationDisplayLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UIKeyboardSquishTransition setOpacityAnimationBeginTime:](self, "setOpacityAnimationBeginTime:", CACurrentMediaTime());
      -[UIView window](self->super._startView, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayLinkWithTarget:selector:", self, sel_updateOpacityAnimation_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSquishTransition setOpacityAnimationDisplayLink:](self, "setOpacityAnimationDisplayLink:", v10);

      -[UIKeyboardSquishTransition opacityAnimationDisplayLink](self, "opacityAnimationDisplayLink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

    }
  }
  -[UIKeyboardSquishTransition setPreviousProgress:](self, "setPreviousProgress:", a3);
}

- (void)updateOpacityAnimation:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  void *v11;
  double v12;
  float v13;
  float v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v20;

  objc_msgSend(a3, "timestamp");
  v5 = v4;
  -[UIKeyboardSquishTransition opacityAnimationBeginTime](self, "opacityAnimationBeginTime");
  v7 = v5 - v6;
  v8 = (v5 - v6) * 4.0;
  if (-[UIKeyboardSquishTransition opacityAnimationDirectionForward](self, "opacityAnimationDirectionForward"))
  {
    v9 = 1.0 - v8;
    -[UIView layer](self->super._startView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1.0 - v8;
    *(float *)&v12 = v10;
    objc_msgSend(v11, "setOpacity:", v12);

    v13 = v8;
  }
  else
  {
    -[UIView layer](self->super._startView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    *(float *)&v16 = v14;
    objc_msgSend(v15, "setOpacity:", v16);

    v9 = 1.0 - v8;
    v13 = 1.0 - v8;
  }
  -[UIView layer](self->super._endView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = v13;
  objc_msgSend(v17, "setOpacity:", v18);

  if (fabs(v9) < 0.01 || v7 >= 1.0)
  {
    -[UIKeyboardSquishTransition opacityAnimationDisplayLink](self, "opacityAnimationDisplayLink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "invalidate");

    -[UIKeyboardSquishTransition setOpacityAnimationDisplayLink:](self, "setOpacityAnimationDisplayLink:", 0);
  }
}

- (id)sortedCommonVisibleKeys
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree keys](self->super._end, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree keysOrderedByPosition](self->super._start, "keysOrderedByPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__UIKeyboardSquishTransition_sortedCommonVisibleKeys__block_invoke;
  v11[3] = &unk_1E16D3F68;
  v12 = v4;
  v6 = v3;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

void __53__UIKeyboardSquishTransition_sortedCommonVisibleKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "visible") && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)geometriesForKeyplane:(id)a3
{
  if (self->super._start == a3)
    -[UIKeyboardSquishTransition startGeometries](self, "startGeometries");
  else
    -[UIKeyboardSquishTransition endGeometries](self, "endGeometries");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_allowFacesToAdjoinToAdjacentFaces
{
  void *v2;
  double v3;
  BOOL v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = fabs(v3 + -3.0) < 0.00000011920929;

  return v4;
}

- (id)symmetricMeshTransformForKeyplane:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _BOOL4 IsNull;
  uint64_t v50;
  _QWORD *v51;
  double *v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double *v63;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double *v73;
  CGFloat MinX;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  CGFloat v85;
  _QWORD *v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  __int128 v91;
  _QWORD *v92;
  __int128 v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat MinY;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  int32x4_t *v104;
  __int32 v105;
  __int32 v106;
  _QWORD *v107;
  __int128 v108;
  _QWORD *v109;
  __int128 v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  CGFloat MaxY;
  int32x4_t *v119;
  __int32 v120;
  _QWORD *v121;
  __int128 v122;
  _QWORD *v123;
  __int128 v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  double v130;
  CGFloat v131;
  double v132;
  CGFloat v133;
  int32x4_t *v134;
  _QWORD *v135;
  __int128 v136;
  _QWORD *v137;
  __int128 v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  CGFloat v148;
  double v149;
  int32x4_t *v150;
  CGFloat v151;
  CGFloat v152;
  CGFloat v153;
  uint64_t v154;
  CGFloat v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  CGFloat v159;
  CGFloat v160;
  double v161;
  double v162;
  double v163;
  CGFloat MaxX;
  double v165;
  CGFloat v166;
  CGFloat v167;
  double v168;
  CGFloat v169;
  double v170;
  _QWORD *v171;
  CGFloat *v172;
  double v173;
  double *v174;
  double v175;
  CGFloat v176;
  double v177;
  double v178;
  double v179;
  CGFloat v180;
  double v181;
  double v182;
  CGFloat v183;
  double v184;
  double v185;
  CGFloat v186;
  double *v187;
  double v188;
  double v189;
  CGFloat v190;
  int32x4_t *v191;
  __int32 v192;
  __int32 v193;
  __int32 v194;
  __int32 v195;
  int32x4_t v196;
  __int32 v197;
  CGFloat v198;
  _QWORD *v199;
  double *v200;
  CGFloat v201;
  double v202;
  double v203;
  CGFloat v204;
  double v205;
  CGFloat v206;
  int32x4_t *v207;
  __int32 v208;
  void *v209;
  _QWORD v211[2];
  double v212;
  double v213;
  CGFloat v214;
  CGFloat v215;
  id v216;
  uint64_t v217;
  UIKeyboardSquishTransition *v218;
  id v219;
  id v220;
  uint64_t v221;
  _QWORD *v222;
  _QWORD *v223;
  double v224;
  double v225;
  CGFloat v226;
  CGFloat v227;
  double v228;
  double v229;
  uint64_t v230;
  double v231;
  id v232;
  uint64_t v233;
  int32x4_t v234;
  CGFloat v235;
  double v236;
  CGFloat v237;
  CGFloat v238;
  CGFloat v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  char v244[8];
  uint64_t v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;

  v245 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardSquishTransition commonVisibleKeys](self, "commonVisibleKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardSquishTransition disableMeshOptimization](self, "disableMeshOptimization"))
    v6 = 35;
  else
    v6 = 20;
  v7 = 5 * objc_msgSend(v5, "count") + v6;
  v8 = objc_msgSend(v5, "count");
  v211[1] = v211;
  MEMORY[0x1E0C80A78](v8);
  v9 = &v211[-4 * v7];
  *(_QWORD *)&v11 = MEMORY[0x1E0C80A78](v10).n128_u64[0];
  v223 = &v211[-v12];
  v13 = *MEMORY[0x1E0C9D628];
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend(v4, "frame", v11);
  v18 = v17;
  v236 = 1.0 / v19;
  objc_msgSend(v4, "primaryKeylayoutOffset");
  v21 = v20;
  objc_msgSend(v4, "primaryKeylayoutWidthRatio");
  v23 = v22;
  v218 = self;
  v220 = v4;
  -[UIKeyboardSquishTransition geometriesForKeyplane:](self, "geometriesForKeyplane:", v4);
  v219 = (id)objc_claimAutoreleasedReturnValue();
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  v243 = 0u;
  v216 = v5;
  v221 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v240, v244, 16);
  v24 = 0;
  v25 = 0.0;
  if (!v221)
  {
    LODWORD(v26) = -1;
    v230 = 0xFFFFFFFFLL;
    goto LABEL_29;
  }
  v217 = *(_QWORD *)v241;
  v214 = v21 + v23 * v18;
  v212 = 1.0 / v18 * v214;
  v215 = v21;
  v224 = 1.0 / v18;
  v213 = v21 * (1.0 / v18);
  *(double *)&v230 = NAN;
  v26 = -1;
  v222 = &v211[-4 * v7];
  do
  {
    v235 = v13;
    v27 = 0;
    do
    {
      v28 = v235;
      v238 = v14;
      v239 = v16;
      v29 = v15;
      if (*(_QWORD *)v241 != v217)
        objc_enumerationMutation(v216);
      v233 = v27;
      v30 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * v27);
      objc_msgSend(v220, "keys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "indexOfObject:", v30);
      objc_msgSend(v219, "objectAtIndex:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "frame");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v232 = v33;
      objc_msgSend(v33, "paddedFrame");
      v43 = v42;
      v45 = v44;
      v231 = v46;
      v237 = v47;
      v226 = v28;
      v246.origin.x = v28;
      v48 = v238;
      v246.origin.y = v238;
      v246.size.width = v239;
      v227 = v29;
      v246.size.height = v29;
      IsNull = CGRectIsNull(v246);
      v50 = *(_QWORD *)&v25 + 1;
      v234 = vdupq_n_s32(0x7F7FFFFFu);
      v51 = v223;
      v235 = v35;
      if (IsNull || v48 != v37)
      {
        v228 = v43;
        v229 = v45;
        v73 = (double *)&v223[5 * *(_QWORD *)&v25];
        v255.origin.x = v35;
        v255.origin.y = v37;
        v255.size.width = v39;
        v255.size.height = v41;
        MinX = CGRectGetMinX(v255);
        v75 = v224;
        v76 = v224 * MinX;
        v256.origin.x = v35;
        v256.origin.y = v37;
        v256.size.width = v39;
        v256.size.height = v41;
        v77 = v236 * CGRectGetMinY(v256);
        v257.origin.x = v35;
        v257.origin.y = v37;
        v257.size.width = v39;
        v257.size.height = v41;
        v78 = v75 * CGRectGetMinX(v257);
        v258.origin.x = v35;
        v258.origin.y = v37;
        v258.size.width = v39;
        v258.size.height = v41;
        v79 = v236 * CGRectGetMinY(v258);
        *v73 = v76;
        v73[1] = v77;
        v73[2] = v78;
        v73[3] = v79;
        v73[4] = 0.5;
        v80 = (double *)&v51[5 * v50];
        v259.origin.x = v35;
        v259.origin.y = v37;
        v259.size.width = v39;
        v259.size.height = v41;
        v81 = v75 * CGRectGetMinX(v259);
        v260.origin.x = v35;
        v260.origin.y = v37;
        v260.size.width = v39;
        v260.size.height = v41;
        v82 = v236 * CGRectGetMaxY(v260);
        v261.origin.x = v35;
        v261.origin.y = v37;
        v261.size.width = v39;
        v261.size.height = v41;
        v83 = v75 * CGRectGetMinX(v261);
        v262.origin.x = v35;
        v262.origin.y = v37;
        v262.size.width = v39;
        v262.size.height = v41;
        v84 = v236 * CGRectGetMaxY(v262);
        *v80 = v81;
        v80[1] = v82;
        v80[2] = v83;
        v80[3] = v84;
        v80[4] = 0.5;
        if (((IsNull | !-[UIKeyboardSquishTransition _allowFacesToAdjoinToAdjacentFaces](v218, "_allowFacesToAdjoinToAdjacentFaces")) & 1) != 0)
        {
          v85 = v235;
          v86 = v9;
          v45 = v229;
        }
        else
        {
          v87 = v226;
          v263.origin.x = v226;
          v88 = v238;
          v263.origin.y = v238;
          v89 = v239;
          v263.size.width = v239;
          v90 = v227;
          v263.size.height = v227;
          if (CGRectGetMaxX(v263) >= v214)
          {
            v106 = v26;
          }
          else
          {
            v91 = *((_OWORD *)v73 + 1);
            v92 = &v51[5 * *(_QWORD *)&v25];
            *((_OWORD *)v92 + 5) = *(_OWORD *)v73;
            *((_OWORD *)v92 + 6) = v91;
            v93 = *((_OWORD *)v80 + 1);
            *(_OWORD *)(v92 + 15) = *(_OWORD *)v80;
            v92[14] = *((_QWORD *)v73 + 4);
            *(_OWORD *)(v92 + 17) = v93;
            v92[19] = *((_QWORD *)v80 + 4);
            v94 = v87;
            *(CGFloat *)&v93 = v88;
            v95 = v89;
            v96 = v90;
            MinY = CGRectGetMinY(*(CGRect *)((char *)&v93 - 8));
            v98 = v236;
            v225 = v236 * MinY;
            v264.origin.x = v87;
            v264.origin.y = v88;
            v264.size.width = v89;
            v264.size.height = v90;
            v99 = v98 * CGRectGetMinY(v264);
            v100 = v212;
            v101 = v225;
            *v73 = v212;
            v73[1] = v101;
            v73[2] = v100;
            v73[3] = v99;
            v73[4] = 0.5;
            v265.origin.x = v87;
            v265.origin.y = v88;
            v265.size.width = v89;
            v265.size.height = v90;
            v225 = v236 * CGRectGetMaxY(v265);
            v266.origin.x = v87;
            v266.origin.y = v88;
            v266.size.width = v89;
            v266.size.height = v90;
            v102 = v236 * CGRectGetMaxY(v266);
            v103 = v225;
            *v80 = v100;
            v80[1] = v103;
            v80[2] = v100;
            v80[3] = v102;
            v80[4] = 0.5;
            v104 = (int32x4_t *)&v9[4 * v24];
            v105 = v230;
            v104->i32[0] = v26;
            v104->i32[1] = v105;
            ++v24;
            v104->i32[2] = v50;
            v104->i32[3] = LODWORD(v25);
            v104[1] = v234;
            v230 = *(_QWORD *)&v25 + 1;
            v106 = LODWORD(v25);
            v50 = *(_QWORD *)&v25 + 3;
            v51 = v223;
            *(_QWORD *)&v25 += 2;
          }
          *(_QWORD *)&v239 = *(_QWORD *)&v25 + 2;
          v107 = &v51[5 * *(_QWORD *)&v25];
          v108 = *((_OWORD *)v107 + 1);
          *((_OWORD *)v107 + 5) = *(_OWORD *)v107;
          *((_OWORD *)v107 + 6) = v108;
          v107[14] = v107[4];
          v109 = &v51[5 * v50];
          v110 = *((_OWORD *)v109 + 1);
          *((_OWORD *)v109 + 5) = *(_OWORD *)v109;
          *((_OWORD *)v109 + 6) = v110;
          v109[14] = v109[4];
          v111 = v87;
          v112 = v88;
          v113 = v89;
          v114 = v227;
          *(CGFloat *)&v110 = v227;
          v115 = CGRectGetMinY(*(CGRect *)((char *)&v110 - 24));
          v116 = v236;
          v238 = v236 * v115;
          v267.origin.x = v87;
          v267.origin.y = v88;
          v267.size.width = v89;
          v267.size.height = v114;
          v117 = CGRectGetMinY(v267);
          *v107 = 0x3FF0000000000000;
          *((CGFloat *)v107 + 1) = v238;
          v107[2] = 0x3FF0000000000000;
          *((double *)v107 + 3) = v116 * v117;
          v107[4] = 0x3FE0000000000000;
          v268.origin.x = v87;
          v268.origin.y = v88;
          v268.size.width = v89;
          v268.size.height = v114;
          v238 = v116 * CGRectGetMaxY(v268);
          v269.origin.x = v87;
          v269.origin.y = v88;
          v269.size.width = v89;
          v269.size.height = v114;
          MaxY = CGRectGetMaxY(v269);
          *v109 = 0x3FF0000000000000;
          *((CGFloat *)v109 + 1) = v238;
          v109[2] = 0x3FF0000000000000;
          *((double *)v109 + 3) = v116 * MaxY;
          v109[4] = 0x3FE0000000000000;
          v86 = v9;
          v119 = (int32x4_t *)&v9[4 * v24];
          v120 = v230;
          v119->i32[0] = v106;
          v119->i32[1] = v120;
          v119->i32[2] = v50;
          v119->i32[3] = LODWORD(v25);
          v119[1] = v234;
          ++v24;
          v50 = *(_QWORD *)&v25 + 3;
          v25 = v239;
          v45 = v229;
          v85 = v235;
        }
        v26 = *(_QWORD *)&v25 + 2;
        v121 = &v51[5 * *(_QWORD *)&v25];
        v122 = *((_OWORD *)v121 + 1);
        *((_OWORD *)v121 + 5) = *(_OWORD *)v121;
        *((_OWORD *)v121 + 6) = v122;
        v121[14] = v121[4];
        v123 = &v51[5 * v50];
        v124 = *((_OWORD *)v123 + 1);
        *((_OWORD *)v123 + 5) = *(_OWORD *)v123;
        *((_OWORD *)v123 + 6) = v124;
        v123[14] = v123[4];
        v125 = v85;
        *(double *)&v124 = v37;
        v126 = v39;
        v127 = v41;
        v128 = CGRectGetMinY(*(CGRect *)((char *)&v124 - 8));
        v129 = v236;
        v130 = v236 * v128;
        v270.origin.x = v85;
        v270.origin.y = v37;
        v270.size.width = v39;
        v270.size.height = v41;
        v131 = CGRectGetMinY(v270);
        *v121 = 0;
        *((double *)v121 + 1) = v130;
        v121[2] = 0;
        *((double *)v121 + 3) = v129 * v131;
        v121[4] = 0x3FE0000000000000;
        v271.origin.x = v85;
        v271.origin.y = v37;
        v271.size.width = v39;
        v271.size.height = v41;
        v132 = v129 * CGRectGetMaxY(v271);
        v272.origin.x = v85;
        v272.origin.y = v37;
        v272.size.width = v39;
        v272.size.height = v41;
        v133 = CGRectGetMaxY(v272);
        *v123 = 0;
        *((double *)v123 + 1) = v132;
        v123[2] = 0;
        *((double *)v123 + 3) = v129 * v133;
        v123[4] = 0x3FE0000000000000;
        v134 = (int32x4_t *)&v86[4 * v24];
        v134->i32[0] = LODWORD(v25);
        v134->i32[1] = v50;
        v134->i32[2] = v50 + 2;
        v134->i32[3] = LODWORD(v25) + 2;
        v134[1] = v234;
        v71 = *(_QWORD *)&v25 + 3;
        v273.origin.x = v85;
        v273.origin.y = v37;
        v273.size.width = v39;
        v273.size.height = v41;
        if (CGRectGetMinX(v273) <= v215)
        {
          v70 = 0;
          ++v24;
          *(_QWORD *)&v25 += 2;
        }
        else
        {
          v135 = &v51[5 * *(_QWORD *)&v25];
          v136 = *((_OWORD *)v121 + 6);
          *((_OWORD *)v135 + 10) = *((_OWORD *)v121 + 5);
          *((_OWORD *)v135 + 11) = v136;
          v137 = &v223[5 * v71];
          v138 = *((_OWORD *)v137 + 1);
          *(_OWORD *)(v135 + 25) = *(_OWORD *)v137;
          v135[24] = v121[14];
          *(_OWORD *)(v135 + 27) = v138;
          v135[29] = v137[4];
          v139 = v85;
          *(double *)&v138 = v37;
          v140 = v39;
          v141 = v41;
          v142 = CGRectGetMinY(*(CGRect *)((char *)&v138 - 8));
          v143 = v236;
          v144 = v236 * v142;
          v274.origin.x = v85;
          v274.origin.y = v37;
          v274.size.width = v39;
          v274.size.height = v41;
          v145 = v143 * CGRectGetMinY(v274);
          v146 = v213;
          *((double *)v121 + 10) = v213;
          *((double *)v121 + 11) = v144;
          *((double *)v121 + 12) = v146;
          *((double *)v121 + 13) = v145;
          v121[14] = 0x3FE0000000000000;
          v275.origin.x = v85;
          v275.origin.y = v37;
          v275.size.width = v39;
          v275.size.height = v41;
          v147 = v236 * CGRectGetMaxY(v275);
          v276.origin.x = v85;
          v276.origin.y = v37;
          v276.size.width = v39;
          v276.size.height = v41;
          v148 = CGRectGetMaxY(v276);
          v70 = 0;
          v149 = v236;
          *(double *)v137 = v146;
          *((double *)v137 + 1) = v147;
          *((double *)v137 + 2) = v146;
          *((double *)v137 + 3) = v149 * v148;
          v137[4] = 0x3FE0000000000000;
          v51 = v223;
          v150 = (int32x4_t *)&v222[4 * v24 + 4];
          v150->i32[0] = v26;
          v150->i32[1] = v71;
          v150->i32[2] = LODWORD(v25) + 5;
          v150->i32[3] = LODWORD(v25) + 4;
          v150[1] = v234;
          v24 += 2;
          v71 = *(_QWORD *)&v25 + 5;
          v26 = *(_QWORD *)&v25 + 4;
          *(_QWORD *)&v25 += 4;
        }
        v43 = v228;
      }
      else
      {
        if (-[UIKeyboardSquishTransition disableMeshOptimization](v218, "disableMeshOptimization"))
        {
          v52 = (double *)&v51[5 * *(_QWORD *)&v25];
          v247.origin.x = v35;
          v247.origin.y = v37;
          v247.size.width = v39;
          v247.size.height = v41;
          v53 = CGRectGetMinX(v247);
          v54 = v224;
          v228 = v43;
          v239 = v224 * v53;
          v248.origin.x = v35;
          v248.origin.y = v37;
          v248.size.width = v39;
          v248.size.height = v41;
          v55 = CGRectGetMinY(v248);
          v56 = v41;
          v57 = v35;
          v58 = v236;
          v59 = v236 * v55;
          v249.origin.x = v57;
          v249.origin.y = v37;
          v249.size.width = v39;
          v249.size.height = v56;
          v60 = CGRectGetMinX(v249);
          v229 = v45;
          v61 = v54 * v60;
          v250.origin.x = v57;
          v250.origin.y = v37;
          v250.size.width = v39;
          v250.size.height = v56;
          v62 = CGRectGetMinY(v250);
          *v52 = v239;
          v52[1] = v59;
          v52[2] = v61;
          v52[3] = v58 * v62;
          v52[4] = 0.5;
          v63 = (double *)&v51[5 * v50];
          v251.origin.x = v57;
          v251.origin.y = v37;
          v251.size.width = v39;
          v251.size.height = v56;
          v64 = v54 * CGRectGetMinX(v251);
          v252.origin.x = v57;
          v252.origin.y = v37;
          v252.size.width = v39;
          v252.size.height = v56;
          v65 = v58 * CGRectGetMaxY(v252);
          v253.origin.x = v57;
          v253.origin.y = v37;
          v253.size.width = v39;
          v253.size.height = v56;
          v66 = v54 * CGRectGetMinX(v253);
          v254.origin.x = v57;
          v254.origin.y = v37;
          v254.size.width = v39;
          v254.size.height = v56;
          v67 = CGRectGetMaxY(v254);
          v68 = v39;
          v69 = v56;
          v70 = 0;
          *v63 = v64;
          v63[1] = v65;
          v43 = v228;
          v63[2] = v66;
          v63[3] = v58 * v67;
          v45 = v229;
          v63[4] = 0.5;
          v71 = *(_QWORD *)&v25 + 1;
          v26 = *(_QWORD *)&v25;
          v72 = v231;
          goto LABEL_25;
        }
        v70 = 2;
        v71 = v230;
      }
      v72 = v231;
      v68 = v39;
      v69 = v41;
LABEL_25:
      v230 = v26;
      v231 = *(double *)&v71;
      v151 = v43 + 4.0;
      v152 = v72 + -8.0;
      v153 = v45 + 4.0;
      v154 = *(_QWORD *)&v25 - v70;
      v155 = v237 + -8.0;
      v156 = *(_QWORD *)&v25 - v70 + 2;
      v157 = *(_QWORD *)&v25 + (v70 ^ 3);
      LODWORD(v228) = LODWORD(v25) - v70 + 4;
      LODWORD(v227) = LODWORD(v25) - v70 + 5;
      LODWORD(v229) = LODWORD(v25) - v70 + 6;
      v158 = *(_QWORD *)&v25 + (v70 ^ 7);
      v159 = v235;
      v160 = v235;
      v161 = v37;
      v162 = v68;
      v163 = v69;
      MaxX = CGRectGetMaxX(*(CGRect *)(&v68 - 2));
      v239 = v37;
      v165 = v224;
      v226 = v224 * MaxX;
      v277.origin.x = v159;
      v277.origin.y = v239;
      v277.size.width = v162;
      v277.size.height = v69;
      v166 = CGRectGetMinY(v277);
      v238 = v69;
      v225 = v236 * v166;
      v278.origin.x = v159;
      v278.origin.y = v239;
      v278.size.width = v162;
      v278.size.height = v69;
      v167 = CGRectGetMaxX(v278);
      v237 = v162;
      v168 = v165 * v167;
      v279.origin.x = v159;
      v279.origin.y = v239;
      v279.size.width = v162;
      v279.size.height = v238;
      v169 = CGRectGetMinY(v279);
      v170 = v236;
      v171 = v51;
      v172 = (CGFloat *)&v51[5 * v154];
      v173 = v225;
      v172[10] = v226;
      v172[11] = v173;
      v172[12] = v168;
      v172[13] = v170 * v169;
      v172[14] = 0.5;
      v174 = (double *)&v171[5 * v157];
      v280.origin.x = v159;
      v280.origin.y = v239;
      v280.size.width = v237;
      v280.size.height = v238;
      v226 = v165 * CGRectGetMaxX(v280);
      v281.origin.x = v159;
      v281.origin.y = v239;
      v281.size.width = v237;
      v281.size.height = v238;
      v225 = v170 * CGRectGetMaxY(v281);
      v282.origin.x = v159;
      v282.origin.y = v239;
      v282.size.width = v237;
      v282.size.height = v238;
      v175 = v165 * CGRectGetMaxX(v282);
      v283.origin.x = v159;
      v283.origin.y = v239;
      v283.size.width = v237;
      v283.size.height = v238;
      v176 = CGRectGetMaxY(v283);
      v177 = v225;
      *v174 = v226;
      v174[1] = v177;
      v174[2] = v175;
      v174[3] = v170 * v176;
      v174[4] = 0.5;
      v284.origin.x = v151;
      v284.origin.y = v153;
      v284.size.width = v152;
      v284.size.height = v155;
      v226 = v165 * CGRectGetMinX(v284);
      v285.origin.x = v151;
      v285.origin.y = v153;
      v285.size.width = v152;
      v285.size.height = v155;
      v178 = v170 * CGRectGetMinY(v285);
      v286.origin.x = v151;
      v286.origin.y = v153;
      v286.size.width = v152;
      v286.size.height = v155;
      v179 = v165 * CGRectGetMinX(v286);
      v287.origin.x = v151;
      v287.origin.y = v153;
      v287.size.width = v152;
      v287.size.height = v155;
      v180 = CGRectGetMinY(v287);
      v172[20] = v226;
      v172[21] = v178;
      v172[22] = v179;
      v172[23] = v170 * v180;
      v172[24] = 0.5;
      v288.origin.x = v151;
      v288.origin.y = v153;
      v288.size.width = v152;
      v288.size.height = v155;
      v226 = v165 * CGRectGetMinX(v288);
      v289.origin.x = v151;
      v289.origin.y = v153;
      v289.size.width = v152;
      v289.size.height = v155;
      v181 = v170 * CGRectGetMaxY(v289);
      v290.origin.x = v151;
      v290.origin.y = v153;
      v290.size.width = v152;
      v290.size.height = v155;
      v182 = v165 * CGRectGetMinX(v290);
      v291.origin.x = v151;
      v291.origin.y = v153;
      v291.size.width = v152;
      v291.size.height = v155;
      v183 = CGRectGetMaxY(v291);
      v172[25] = v226;
      v172[26] = v181;
      v172[27] = v182;
      v172[28] = v170 * v183;
      v172[29] = 0.5;
      v292.origin.x = v151;
      v292.origin.y = v153;
      v292.size.width = v152;
      v292.size.height = v155;
      v226 = v165 * CGRectGetMaxX(v292);
      v293.origin.x = v151;
      v293.origin.y = v153;
      v293.size.width = v152;
      v293.size.height = v155;
      v184 = v170 * CGRectGetMinY(v293);
      v294.origin.x = v151;
      v294.origin.y = v153;
      v294.size.width = v152;
      v294.size.height = v155;
      v185 = v165 * CGRectGetMaxX(v294);
      v295.origin.x = v151;
      v295.origin.y = v153;
      v295.size.width = v152;
      v295.size.height = v155;
      v186 = CGRectGetMinY(v295);
      v172[30] = v226;
      v172[31] = v184;
      v172[32] = v185;
      v172[33] = v170 * v186;
      v172[34] = 0.5;
      v187 = (double *)&v171[5 * v158];
      v296.origin.x = v151;
      v296.origin.y = v153;
      v296.size.width = v152;
      v296.size.height = v155;
      v226 = v165 * CGRectGetMaxX(v296);
      v297.origin.x = v151;
      v297.origin.y = v153;
      v297.size.width = v152;
      v297.size.height = v155;
      v188 = v170 * CGRectGetMaxY(v297);
      v298.origin.x = v151;
      v298.origin.y = v153;
      v298.size.width = v152;
      v298.size.height = v155;
      v189 = v165 * CGRectGetMaxX(v298);
      v299.origin.x = v151;
      v299.origin.y = v153;
      v299.size.width = v152;
      v299.size.height = v155;
      v190 = CGRectGetMaxY(v299);
      *v187 = v226;
      v187[1] = v188;
      v14 = v239;
      v15 = v238;
      v187[2] = v189;
      v187[3] = v170 * v190;
      v16 = v237;
      v187[4] = 0.5;
      v9 = v222;
      v191 = (int32x4_t *)&v222[4 * v24];
      v192 = v230;
      v193 = LODWORD(v231);
      v191->i32[0] = v230;
      v191->i32[1] = v193;
      v194 = LODWORD(v227);
      v195 = LODWORD(v228);
      v191->i32[2] = LODWORD(v227);
      v191->i32[3] = v195;
      v196 = v234;
      v191[1] = v234;
      v191[2].i32[0] = v192;
      v191[2].i32[1] = v156;
      v197 = LODWORD(v229);
      v191[2].i32[2] = LODWORD(v229);
      v191[2].i32[3] = v195;
      v191[3] = v196;
      v26 = v156;
      v191[4].i32[0] = v156;
      v191[4].i32[1] = v157;
      v191[4].i32[2] = v158;
      v191[4].i32[3] = v197;
      v191[5] = v196;
      v191[6].i32[0] = v193;
      v191[6].i32[1] = v194;
      v191[6].i32[2] = v158;
      v191[6].i32[3] = v157;
      v230 = v157;
      v191[7] = v196;
      v191[8].i32[0] = v195;
      v191[8].i32[1] = v197;
      v191[8].i32[2] = v158;
      v191[8].i32[3] = v194;
      v24 += 5;
      *(_QWORD *)&v25 = v154 + 8;
      v191[9] = v196;

      v27 = v233 + 1;
    }
    while (v221 != v233 + 1);
    v13 = v235;
    v221 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v240, v244, 16);
  }
  while (v221);
LABEL_29:

  v198 = v13;
  v300.origin.x = v13;
  v300.origin.y = v14;
  v300.size.width = v16;
  v300.size.height = v15;
  if (CGRectIsNull(v300))
  {
    v199 = v223;
  }
  else
  {
    v199 = v223;
    v200 = (double *)&v223[5 * *(_QWORD *)&v25];
    v301.origin.x = v13;
    v301.origin.y = v14;
    v301.size.width = v16;
    v301.size.height = v15;
    v201 = CGRectGetMinY(v301);
    v202 = v236;
    v203 = v236 * v201;
    v302.origin.x = v198;
    v302.origin.y = v14;
    v302.size.width = v16;
    v302.size.height = v15;
    v204 = CGRectGetMinY(v302);
    *v200 = 1.0;
    v200[1] = v203;
    v200[2] = 1.0;
    v200[3] = v202 * v204;
    v200[4] = 0.5;
    v303.origin.x = v198;
    v303.origin.y = v14;
    v303.size.width = v16;
    v303.size.height = v15;
    v205 = v202 * CGRectGetMaxY(v303);
    v304.origin.x = v198;
    v304.origin.y = v14;
    v304.size.width = v16;
    v304.size.height = v15;
    v206 = CGRectGetMaxY(v304);
    v200[5] = 1.0;
    v200[6] = v205;
    v200[7] = 1.0;
    v200[8] = v202 * v206;
    v200[9] = 0.5;
    v207 = (int32x4_t *)&v9[4 * v24];
    v208 = v230;
    v207->i32[0] = v26;
    v207->i32[1] = v208;
    v207->i32[2] = LODWORD(v25) + 1;
    v207->i32[3] = LODWORD(v25);
    v207[1] = vdupq_n_s32(0x7F7FFFFFu);
    ++v24;
    *(_QWORD *)&v25 += 2;
  }
  objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", *(_QWORD *)&v25, v199, v24, v9, *MEMORY[0x1E0CD2A90]);
  v209 = (void *)objc_claimAutoreleasedReturnValue();

  return v209;
}

- (id)meshTransformForKeyplane:(id)a3 toKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  _BOOL4 IsNull;
  uint64_t v73;
  BOOL v74;
  _QWORD *v75;
  CGFloat *v76;
  CGFloat MinX;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  CGFloat *v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double v91;
  CGFloat v92;
  double v93;
  uint64_t v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double *v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  double v104;
  double *v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  _QWORD *v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  __int128 v118;
  _QWORD *v119;
  __int128 v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat MinY;
  double v131;
  double v132;
  double v133;
  double v134;
  int32x4_t *v135;
  __int32 v136;
  __int32 v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  _QWORD *v144;
  __int128 v145;
  _QWORD *v146;
  __int128 v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  double v152;
  CGFloat v153;
  double v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  double v158;
  double v159;
  CGFloat MaxY;
  int32x4_t *v161;
  __int32 v162;
  CGFloat v163;
  _QWORD *v164;
  __int128 v165;
  _QWORD *v166;
  __int128 v167;
  CGFloat v168;
  CGFloat v169;
  CGFloat v170;
  double v171;
  double v172;
  CGFloat v173;
  CGFloat v174;
  CGFloat v175;
  double v176;
  double v177;
  double v178;
  CGFloat v179;
  CGFloat v180;
  CGFloat v181;
  CGFloat v182;
  int32x4_t *v183;
  _QWORD *v184;
  double *v185;
  __int128 v186;
  __int128 v187;
  int v188;
  _QWORD *v189;
  __int128 v190;
  double v191;
  double v192;
  CGFloat v193;
  CGFloat v194;
  CGFloat v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  CGFloat v199;
  double v200;
  CGFloat v201;
  CGFloat v202;
  CGFloat v203;
  double v204;
  double v205;
  double v206;
  CGFloat height;
  CGFloat v208;
  double v209;
  double v210;
  CGFloat v211;
  int32x4_t *v212;
  double v213;
  uint64_t v214;
  double v215;
  double v216;
  __int32 v217;
  uint64_t v218;
  CGFloat v219;
  CGFloat v220;
  CGFloat v221;
  CGFloat v222;
  CGFloat v223;
  CGFloat v224;
  CGFloat v225;
  CGFloat MaxX;
  double v227;
  double v228;
  double v229;
  CGFloat v230;
  CGFloat v231;
  CGFloat v232;
  CGFloat v233;
  CGFloat v234;
  double v235;
  double v236;
  double *v237;
  _QWORD *v238;
  double *v239;
  CGFloat v240;
  CGFloat v241;
  double v242;
  CGFloat v243;
  double v244;
  double v245;
  CGFloat v246;
  double v247;
  CGFloat v248;
  double v249;
  CGFloat v250;
  CGFloat v251;
  CGFloat v252;
  CGFloat v253;
  double v254;
  CGFloat v255;
  CGFloat v256;
  CGFloat v257;
  CGFloat v258;
  CGFloat v259;
  double v260;
  CGFloat v261;
  double v262;
  CGFloat v263;
  CGFloat v264;
  CGFloat v265;
  CGFloat v266;
  double v267;
  CGFloat v268;
  CGFloat v269;
  double v270;
  CGFloat v271;
  CGFloat v272;
  CGFloat v273;
  CGFloat v274;
  double v275;
  CGFloat v276;
  double v277;
  double v278;
  CGFloat v279;
  CGFloat v280;
  CGFloat v281;
  double v282;
  CGFloat v283;
  CGFloat v284;
  CGFloat v285;
  double v286;
  double v287;
  double *v288;
  CGFloat v289;
  CGFloat v290;
  CGFloat v291;
  double v292;
  double v293;
  double v294;
  int32x4_t *v295;
  __int32 v296;
  __int32 v297;
  __int32 v298;
  __int32 v299;
  int32x4_t v300;
  void *v301;
  _QWORD *v302;
  double *v303;
  CGFloat v304;
  double v305;
  double v306;
  CGFloat v307;
  double v308;
  double v309;
  CGFloat v310;
  int32x4_t *v311;
  __int32 v312;
  _QWORD v314[2];
  double v315;
  double v316;
  double v317;
  double v318;
  CGFloat v319;
  CGFloat v320;
  id v321;
  double v322;
  double v323;
  double v324;
  uint64_t v325;
  UIKeyboardSquishTransition *v326;
  id v327;
  id v328;
  id v329;
  id v330;
  _QWORD *v331;
  uint64_t v332;
  CGFloat v333;
  CGFloat v334;
  _QWORD *v335;
  CGFloat v336;
  double v337;
  double v338;
  double v339;
  double v340;
  CGFloat v341;
  double v342;
  double v343;
  id v344;
  id v345;
  uint64_t v346;
  CGFloat v347;
  CGFloat v348;
  CGFloat v349;
  CGFloat v350;
  int32x4_t v351;
  CGFloat v352;
  CGFloat v353;
  CGFloat v354;
  CGFloat v355;
  CGFloat v356;
  CGFloat v357;
  CGFloat v358;
  CGFloat v359;
  CGFloat v360;
  CGFloat v361;
  CGFloat v362;
  CGFloat v363;
  double v364;
  double v365;
  double v366;
  double v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  char v372[8];
  uint64_t v373;
  CGRect v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;
  CGRect v385;
  CGRect v386;
  CGRect v387;
  CGRect v388;
  CGRect v389;
  CGRect v390;
  CGRect v391;
  CGRect v392;
  CGRect v393;
  CGRect v394;
  CGRect v395;
  CGRect v396;
  CGRect v397;
  CGRect v398;
  CGRect v399;
  CGRect v400;
  CGRect v401;
  CGRect v402;
  CGRect v403;
  CGRect v404;
  CGRect v405;
  CGRect v406;
  CGRect v407;
  CGRect v408;
  CGRect v409;
  CGRect v410;
  CGRect v411;
  CGRect v412;
  CGRect v413;
  CGRect v414;
  CGRect v415;
  CGRect v416;
  CGRect v417;
  CGRect v418;
  CGRect v419;
  CGRect v420;
  CGRect v421;
  CGRect v422;
  CGRect v423;
  CGRect v424;
  CGRect v425;
  CGRect v426;
  CGRect v427;
  CGRect v428;
  CGRect v429;
  CGRect v430;
  CGRect v431;
  CGRect v432;

  v373 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 == v7)
  {
    -[UIKeyboardSquishTransition symmetricMeshTransformForKeyplane:](self, "symmetricMeshTransformForKeyplane:", v6);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKeyboardSquishTransition commonVisibleKeys](self, "commonVisibleKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKeyboardSquishTransition disableMeshOptimization](self, "disableMeshOptimization"))
      v9 = 35;
    else
      v9 = 20;
    v10 = 5 * objc_msgSend(v8, "count") + v9;
    v11 = objc_msgSend(v8, "count");
    v314[1] = v314;
    MEMORY[0x1E0C80A78](v11);
    v12 = &v314[-4 * v10];
    MEMORY[0x1E0C80A78](v13);
    v331 = &v314[-v14];
    v15 = *MEMORY[0x1E0C9D628];
    v359 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v358 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v357 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    objc_msgSend(v6, "frame");
    v17 = v16;
    v366 = 1.0 / v18;
    objc_msgSend(v7, "frame");
    v20 = v19;
    v367 = 1.0 / v21;
    objc_msgSend(v6, "primaryKeylayoutOffset");
    v23 = v22;
    objc_msgSend(v6, "primaryKeylayoutWidthRatio");
    v25 = v24;
    objc_msgSend(v7, "primaryKeylayoutOffset");
    v27 = v26;
    objc_msgSend(v7, "primaryKeylayoutWidthRatio");
    v29 = v28;
    -[UIKeyboardSquishTransition geometriesForKeyplane:](self, "geometriesForKeyplane:", v6);
    v330 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSquishTransition geometriesForKeyplane:](self, "geometriesForKeyplane:", v7);
    v329 = (id)objc_claimAutoreleasedReturnValue();
    v368 = 0u;
    v369 = 0u;
    v370 = 0u;
    v371 = 0u;
    v321 = v8;
    v332 = objc_msgSend(v321, "countByEnumeratingWithState:objects:count:", &v368, v372, 16);
    if (v332)
    {
      v30 = 0;
      v31 = 0.0;
      v325 = *(_QWORD *)v369;
      v319 = v23 + v17 * v25;
      v316 = 1.0 / v17 * v319;
      v315 = 1.0 / v20 * (v27 + v20 * v29);
      v320 = v23;
      v364 = 1.0 / v17;
      v318 = v23 * (1.0 / v17);
      v339 = NAN;
      v365 = 1.0 / v20;
      v317 = v27 * (1.0 / v20);
      v32 = v357;
      v33 = v357;
      v34 = v358;
      v35 = v358;
      v36 = v359;
      v37 = v359;
      v38 = v15;
      v338 = NAN;
      v328 = v6;
      v327 = v7;
      v39 = v12;
      v335 = v12;
      v326 = self;
      do
      {
        v40 = 0;
        do
        {
          v360 = v38;
          v355 = v37;
          v354 = v35;
          v361 = v33;
          v333 = v15;
          v334 = v36;
          v341 = v34;
          v336 = v32;
          if (*(_QWORD *)v369 != v325)
            objc_enumerationMutation(v321);
          v346 = v40;
          v41 = *(_QWORD *)(*((_QWORD *)&v368 + 1) + 8 * v40);
          objc_msgSend(v6, "keys");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "indexOfObject:", v41);
          objc_msgSend(v330, "objectAtIndex:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "keys");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "indexOfObject:", v41);
          objc_msgSend(v329, "objectAtIndex:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v44, "frame");
          v49 = v48;
          v51 = v50;
          v53 = v52;
          v55 = v54;
          v345 = v44;
          objc_msgSend(v44, "paddedFrame");
          v57 = v56;
          v59 = v58;
          v349 = v60;
          v350 = v61;
          objc_msgSend(v47, "frame");
          v63 = v62;
          v359 = v64;
          v358 = v65;
          v357 = v66;
          v344 = v47;
          objc_msgSend(v47, "paddedFrame");
          v343 = v67;
          v347 = v68;
          v342 = v69;
          v348 = v70;
          v374.origin.x = v360;
          v71 = v355;
          v374.origin.y = v355;
          v374.size.width = v354;
          v374.size.height = v361;
          IsNull = CGRectIsNull(v374);
          v73 = *(_QWORD *)&v31 + 1;
          v351 = vdupq_n_s32(0x7F7FFFFFu);
          v352 = v53;
          v363 = v51;
          v356 = v49;
          v362 = v63;
          v353 = v55;
          if (IsNull || v71 != v51)
          {
            v337 = v57;
            v340 = v59;
            v75 = v331;
            v99 = (double *)&v331[5 * *(_QWORD *)&v31];
            v383.origin.x = v49;
            v383.origin.y = v51;
            v383.size.width = v53;
            v383.size.height = v55;
            v324 = v364 * CGRectGetMinX(v383);
            v384.origin.x = v49;
            v384.origin.y = v51;
            v384.size.width = v53;
            v384.size.height = v55;
            v323 = v366 * CGRectGetMinY(v384);
            v385.origin.x = v63;
            v100 = v359;
            v385.origin.y = v359;
            v101 = v358;
            v385.size.width = v358;
            v102 = v357;
            v385.size.height = v357;
            v322 = v365 * CGRectGetMinX(v385);
            v386.origin.x = v63;
            v386.origin.y = v100;
            v386.size.width = v101;
            v386.size.height = v102;
            v103 = v367 * CGRectGetMinY(v386);
            v104 = v323;
            *v99 = v324;
            v99[1] = v104;
            v99[2] = v322;
            v99[3] = v103;
            v99[4] = 0.5;
            v105 = (double *)&v75[5 * v73];
            v387.origin.x = v49;
            v387.origin.y = v51;
            v387.size.width = v53;
            v387.size.height = v55;
            v324 = v364 * CGRectGetMinX(v387);
            v388.origin.x = v49;
            v388.origin.y = v51;
            v388.size.width = v53;
            v388.size.height = v55;
            v106 = v366 * CGRectGetMaxY(v388);
            v389.origin.x = v63;
            v389.origin.y = v100;
            v389.size.width = v101;
            v389.size.height = v102;
            v107 = v365 * CGRectGetMinX(v389);
            v390.origin.x = v63;
            v390.origin.y = v100;
            v390.size.width = v101;
            v390.size.height = v102;
            v108 = v367 * CGRectGetMaxY(v390);
            *v105 = v324;
            v105[1] = v106;
            v105[2] = v107;
            v105[3] = v108;
            v105[4] = 0.5;
            if (((IsNull | !-[UIKeyboardSquishTransition _allowFacesToAdjoinToAdjacentFaces](self, "_allowFacesToAdjoinToAdjacentFaces")) & 1) != 0)
            {
              v109 = v353;
              v110 = v352;
              v111 = v363;
              v112 = v39;
              v113 = v358;
            }
            else
            {
              v114 = v360;
              v391.origin.x = v360;
              v115 = v355;
              v391.origin.y = v355;
              v116 = v354;
              v391.size.width = v354;
              v117 = v361;
              v391.size.height = v361;
              v112 = v39;
              if (CGRectGetMaxX(v391) >= v319)
              {
                v137 = LODWORD(v338);
                v127 = v341;
                v126 = v334;
                v125 = v333;
              }
              else
              {
                v118 = *((_OWORD *)v99 + 1);
                v119 = &v75[5 * *(_QWORD *)&v31];
                *((_OWORD *)v119 + 5) = *(_OWORD *)v99;
                *((_OWORD *)v119 + 6) = v118;
                v120 = *((_OWORD *)v105 + 1);
                *(_OWORD *)(v119 + 15) = *(_OWORD *)v105;
                v119[14] = *((_QWORD *)v99 + 4);
                *(_OWORD *)(v119 + 17) = v120;
                v119[19] = *((_QWORD *)v105 + 4);
                v121 = v114;
                *(CGFloat *)&v120 = v115;
                v122 = v116;
                v123 = v117;
                v124 = v366 * CGRectGetMinY(*(CGRect *)((char *)&v120 - 8));
                v125 = v333;
                v392.origin.x = v333;
                v126 = v334;
                v392.origin.y = v334;
                v127 = v341;
                v392.size.width = v341;
                v128 = v116;
                v129 = v336;
                v392.size.height = v336;
                MinY = CGRectGetMinY(v392);
                v131 = v367;
                v132 = v316;
                *v99 = v316;
                v99[1] = v124;
                v133 = v315;
                v99[2] = v315;
                v99[3] = v131 * MinY;
                v99[4] = 0.5;
                v393.origin.x = v360;
                v393.origin.y = v355;
                v393.size.width = v128;
                v393.size.height = v361;
                v324 = v366 * CGRectGetMaxY(v393);
                v394.origin.x = v125;
                v394.origin.y = v126;
                v394.size.width = v127;
                v394.size.height = v129;
                v116 = v128;
                v134 = v131 * CGRectGetMaxY(v394);
                v115 = v355;
                *v105 = v132;
                v114 = v360;
                v105[1] = v324;
                v105[2] = v133;
                v117 = v361;
                v105[3] = v134;
                v105[4] = 0.5;
                v135 = (int32x4_t *)&v39[4 * v30];
                v136 = LODWORD(v339);
                v135->i32[0] = LODWORD(v338);
                v135->i32[1] = v136;
                ++v30;
                v135->i32[2] = v73;
                v135->i32[3] = LODWORD(v31);
                v135[1] = v351;
                *(_QWORD *)&v339 = *(_QWORD *)&v31 + 1;
                v137 = LODWORD(v31);
                v73 = *(_QWORD *)&v31 + 3;
                *(_QWORD *)&v31 += 2;
              }
              v341 = v127;
              *(_QWORD *)&v360 = *(_QWORD *)&v31 + 2;
              v144 = &v75[5 * *(_QWORD *)&v31];
              v145 = *((_OWORD *)v144 + 1);
              *((_OWORD *)v144 + 5) = *(_OWORD *)v144;
              *((_OWORD *)v144 + 6) = v145;
              v144[14] = v144[4];
              v146 = &v75[5 * v73];
              v147 = *((_OWORD *)v146 + 1);
              *((_OWORD *)v146 + 5) = *(_OWORD *)v146;
              *((_OWORD *)v146 + 6) = v147;
              v146[14] = v146[4];
              v148 = v114;
              *(CGFloat *)&v147 = v115;
              v149 = v116;
              v150 = v117;
              v151 = CGRectGetMinY(*(CGRect *)((char *)&v147 - 8));
              v152 = v366;
              v153 = v114;
              v154 = v366 * v151;
              v395.origin.x = v125;
              v395.origin.y = v126;
              v395.size.width = v127;
              v155 = v336;
              v395.size.height = v336;
              v156 = CGRectGetMinY(v395);
              *v144 = 0x3FF0000000000000;
              v396.origin.y = v115;
              v157 = v126;
              v158 = v367;
              *((double *)v144 + 1) = v154;
              v144[2] = 0x3FF0000000000000;
              *((double *)v144 + 3) = v158 * v156;
              v144[4] = 0x3FE0000000000000;
              v396.origin.x = v153;
              v396.size.width = v116;
              v396.size.height = v361;
              v159 = v152 * CGRectGetMaxY(v396);
              v397.origin.x = v125;
              v397.origin.y = v157;
              v397.size.width = v341;
              v397.size.height = v155;
              MaxY = CGRectGetMaxY(v397);
              *v146 = 0x3FF0000000000000;
              *((double *)v146 + 1) = v159;
              v146[2] = 0x3FF0000000000000;
              *((double *)v146 + 3) = v158 * MaxY;
              v146[4] = 0x3FE0000000000000;
              v161 = (int32x4_t *)&v112[4 * v30];
              v162 = LODWORD(v339);
              v161->i32[0] = v137;
              v161->i32[1] = v162;
              v161->i32[2] = v73;
              v161->i32[3] = LODWORD(v31);
              v161[1] = v351;
              ++v30;
              v73 = *(_QWORD *)&v31 + 3;
              v31 = v360;
              v111 = v363;
              v109 = v353;
              v113 = v358;
              v110 = v352;
            }
            v163 = v362;
            *(_QWORD *)&v97 = *(_QWORD *)&v31 + 2;
            v164 = &v75[5 * *(_QWORD *)&v31];
            v165 = *((_OWORD *)v164 + 1);
            *((_OWORD *)v164 + 5) = *(_OWORD *)v164;
            *((_OWORD *)v164 + 6) = v165;
            v164[14] = v164[4];
            v166 = &v75[5 * v73];
            v167 = *((_OWORD *)v166 + 1);
            *((_OWORD *)v166 + 5) = *(_OWORD *)v166;
            *((_OWORD *)v166 + 6) = v167;
            v166[14] = v166[4];
            v168 = v356;
            v169 = v356;
            *(CGFloat *)&v167 = v110;
            v170 = CGRectGetMinY(*(CGRect *)(&v111 - 1));
            v171 = v366;
            v172 = v366 * v170;
            v398.origin.x = v163;
            v173 = v359;
            v398.origin.y = v359;
            v398.size.width = v113;
            v174 = v357;
            v398.size.height = v357;
            v175 = CGRectGetMinY(v398);
            *v164 = 0;
            v176 = v367;
            *((double *)v164 + 1) = v172;
            v164[2] = 0;
            *((double *)v164 + 3) = v176 * v175;
            v164[4] = 0x3FE0000000000000;
            v399.origin.x = v168;
            v399.origin.y = v363;
            v399.size.width = v110;
            v399.size.height = v353;
            v177 = v171 * CGRectGetMaxY(v399);
            v178 = v362;
            v400.origin.x = v362;
            v400.origin.y = v173;
            v400.size.width = v113;
            v400.size.height = v174;
            v179 = CGRectGetMaxY(v400);
            *v166 = 0;
            *((double *)v166 + 1) = v177;
            v180 = v110;
            v181 = v353;
            v182 = v363;
            v166[2] = 0;
            *((double *)v166 + 3) = v176 * v179;
            v166[4] = 0x3FE0000000000000;
            v183 = (int32x4_t *)&v112[4 * v30];
            v183->i32[0] = LODWORD(v31);
            v183->i32[1] = v73;
            v183->i32[2] = v73 + 2;
            v183->i32[3] = LODWORD(v31) + 2;
            v183[1] = v351;
            *(_QWORD *)&v96 = *(_QWORD *)&v31 + 3;
            v401.origin.x = v168;
            v401.origin.y = v182;
            v401.size.width = v180;
            v401.size.height = v181;
            if (CGRectGetMinX(v401) <= v320)
            {
              v94 = 0;
              ++v30;
              *(_QWORD *)&v31 += 2;
              v98 = v366;
              v93 = v181;
            }
            else
            {
              v184 = &v75[5 * *(_QWORD *)&v31];
              v186 = *((_OWORD *)v164 + 5);
              v187 = *((_OWORD *)v164 + 6);
              v185 = (double *)(v164 + 10);
              *((_OWORD *)v184 + 10) = v186;
              *((_OWORD *)v184 + 11) = v187;
              v188 = LODWORD(v31) + 3;
              v189 = &v75[5 * *(_QWORD *)&v96];
              v190 = *((_OWORD *)v189 + 1);
              *(_OWORD *)(v184 + 25) = *(_OWORD *)v189;
              *(_QWORD *)&v191 = *(_QWORD *)&v31 + 4;
              v184[24] = *((_QWORD *)v185 + 4);
              *(_QWORD *)&v192 = *(_QWORD *)&v31 + 5;
              *(_OWORD *)(v184 + 27) = v190;
              v184[29] = v189[4];
              *(CGFloat *)&v186 = v168;
              *(CGFloat *)&v190 = v182;
              v193 = v180;
              v194 = v181;
              v195 = CGRectGetMinY(*(CGRect *)&v186);
              v196 = v178;
              v197 = v181;
              v198 = v180;
              v402.size.height = v174;
              v199 = v168;
              v200 = v366 * v195;
              v402.origin.x = v196;
              v201 = v359;
              v402.origin.y = v359;
              v202 = v358;
              v402.size.width = v358;
              v203 = CGRectGetMinY(v402);
              v204 = v367;
              v403.size.width = v198;
              v403.size.height = v197;
              v205 = v318;
              *v185 = v318;
              v185[1] = v200;
              v206 = v317;
              v185[2] = v317;
              v185[3] = v204 * v203;
              v185[4] = 0.5;
              v403.origin.x = v199;
              v403.origin.y = v182;
              height = v403.size.height;
              v208 = CGRectGetMaxY(v403);
              v209 = v366;
              v210 = v366 * v208;
              v404.origin.x = v362;
              v404.origin.y = v201;
              v404.size.width = v202;
              v404.size.height = v357;
              v211 = CGRectGetMaxY(v404);
              v94 = 0;
              *(double *)v189 = v205;
              *((double *)v189 + 1) = v210;
              *((double *)v189 + 2) = v206;
              *((double *)v189 + 3) = v204 * v211;
              v189[4] = 0x3FE0000000000000;
              v212 = (int32x4_t *)&v335[4 * v30 + 4];
              v212->i32[0] = LODWORD(v97);
              v212->i32[1] = v188;
              v212->i32[2] = LODWORD(v192);
              v212->i32[3] = LODWORD(v191);
              v212[1] = v351;
              v30 += 2;
              v96 = v192;
              v97 = v191;
              v31 = v191;
              v98 = v209;
              v93 = height;
            }
            v59 = v340;
            v57 = v337;
            v138 = v350;
            v139 = v349;
            v140 = v348;
            v141 = v347;
            v142 = v343;
            v143 = v342;
          }
          else
          {
            v74 = -[UIKeyboardSquishTransition disableMeshOptimization](self, "disableMeshOptimization");
            v75 = v331;
            if (v74)
            {
              v76 = (CGFloat *)&v331[5 * *(_QWORD *)&v31];
              v375.origin.x = v49;
              v375.origin.y = v51;
              v375.size.width = v53;
              v375.size.height = v55;
              MinX = CGRectGetMinX(v375);
              v340 = v59;
              v361 = v364 * MinX;
              v376.origin.x = v49;
              v376.origin.y = v51;
              v376.size.width = v53;
              v376.size.height = v55;
              v78 = CGRectGetMinY(v376);
              v337 = v57;
              v360 = v366 * v78;
              v377.origin.x = v63;
              v79 = v359;
              v377.origin.y = v359;
              v80 = v358;
              v377.size.width = v358;
              v81 = v357;
              v377.size.height = v357;
              v82 = v365 * CGRectGetMinX(v377);
              v378.origin.x = v63;
              v378.origin.y = v79;
              v378.size.width = v80;
              v378.size.height = v81;
              v83 = CGRectGetMinY(v378);
              v84 = v367;
              v85 = v360;
              *v76 = v361;
              v76[1] = v85;
              v76[2] = v82;
              v76[3] = v84 * v83;
              v76[4] = 0.5;
              v86 = (CGFloat *)&v75[5 * v73];
              v379.origin.x = v49;
              v379.origin.y = v51;
              v379.size.width = v53;
              v87 = v353;
              v379.size.height = v353;
              v361 = v364 * CGRectGetMinX(v379);
              v380.origin.x = v49;
              v380.origin.y = v51;
              v380.size.width = v53;
              v88 = v362;
              v380.size.height = v87;
              v89 = CGRectGetMaxY(v380);
              v90 = v366;
              v360 = v366 * v89;
              v381.origin.x = v88;
              v381.origin.y = v79;
              v381.size.width = v80;
              v381.size.height = v81;
              v91 = v365 * CGRectGetMinX(v381);
              v382.origin.x = v88;
              v382.origin.y = v79;
              v382.size.width = v80;
              v382.size.height = v81;
              v92 = CGRectGetMaxY(v382);
              v93 = v87;
              v94 = 0;
              v59 = v340;
              v95 = v360;
              *v86 = v361;
              v86[1] = v95;
              v57 = v337;
              v86[2] = v91;
              v86[3] = v84 * v92;
              v86[4] = 0.5;
              *(_QWORD *)&v96 = *(_QWORD *)&v31 + 1;
              v97 = v31;
              v98 = v90;
            }
            else
            {
              v94 = 2;
              v98 = v366;
              v93 = v55;
              v97 = v338;
              v96 = v339;
            }
            v138 = v350;
            v139 = v349;
            v140 = v348;
            v141 = v347;
            v142 = v343;
            v143 = v342;
          }
          v342 = v97;
          v343 = v96;
          v213 = v98;
          v360 = v57 + 4.0;
          v361 = v139 + -8.0;
          v354 = v59 + 4.0;
          v347 = v138 + -8.0;
          v349 = v142 + 4.0;
          v350 = v143 + -8.0;
          v214 = *(_QWORD *)&v31 - v94;
          *(_QWORD *)&v215 = *(_QWORD *)&v31 - v94 + 2;
          *(_QWORD *)&v216 = *(_QWORD *)&v31 + (v94 ^ 3);
          v355 = v141 + 4.0;
          LODWORD(v341) = LODWORD(v31) - v94 + 4;
          v348 = v140 + -8.0;
          LODWORD(v340) = LODWORD(v31) - v94 + 5;
          v217 = LODWORD(v31) - v94 + 6;
          v218 = *(_QWORD *)&v31 + (v94 ^ 7);
          v219 = v356;
          v220 = v356;
          v221 = v363;
          v222 = v363;
          v223 = v352;
          v224 = v352;
          v225 = v93;
          MaxX = CGRectGetMaxX(*(CGRect *)(&v93 - 3));
          v227 = v364;
          v339 = v364 * MaxX;
          v405.origin.x = v219;
          v405.origin.y = v221;
          v405.size.width = v223;
          v405.size.height = v225;
          v228 = v213 * CGRectGetMinY(v405);
          v229 = v362;
          v406.origin.x = v362;
          v230 = v359;
          v406.origin.y = v359;
          v231 = v358;
          v406.size.width = v358;
          v232 = v357;
          v406.size.height = v357;
          v233 = CGRectGetMaxX(v406);
          v234 = v229;
          v235 = v365 * v233;
          v407.origin.x = v234;
          v407.origin.y = v230;
          v407.size.width = v231;
          v407.size.height = v232;
          v236 = v367 * CGRectGetMinY(v407);
          v237 = (double *)&v75[5 * v214];
          v237[10] = v339;
          v237[11] = v228;
          v237[12] = v235;
          v237[13] = v236;
          v237[14] = 0.5;
          v238 = v75;
          v239 = (double *)&v75[5 * *(_QWORD *)&v216];
          v240 = v356;
          v408.origin.x = v356;
          v241 = v363;
          v408.origin.y = v363;
          v408.size.width = v223;
          v408.size.height = v225;
          v242 = v227 * CGRectGetMaxX(v408);
          v409.origin.x = v240;
          v409.origin.y = v241;
          v409.size.width = v223;
          v409.size.height = v225;
          v243 = CGRectGetMaxY(v409);
          v244 = v366;
          v245 = v366 * v243;
          v246 = v362;
          v410.origin.x = v362;
          v410.origin.y = v230;
          v410.size.width = v231;
          v410.size.height = v232;
          v247 = v365 * CGRectGetMaxX(v410);
          v411.origin.x = v246;
          v411.origin.y = v230;
          v411.size.width = v231;
          v411.size.height = v232;
          v248 = CGRectGetMaxY(v411);
          v249 = v367;
          *v239 = v242;
          v239[1] = v245;
          v239[2] = v247;
          v239[3] = v249 * v248;
          v239[4] = 0.5;
          v250 = v360;
          v412.origin.x = v360;
          v251 = v354;
          v412.origin.y = v354;
          v252 = v361;
          v412.size.width = v361;
          v253 = v347;
          v412.size.height = v347;
          v254 = v364 * CGRectGetMinX(v412);
          v413.origin.x = v250;
          v413.origin.y = v251;
          v413.size.width = v252;
          v413.size.height = v253;
          v255 = v253;
          v339 = v244 * CGRectGetMinY(v413);
          v256 = v349;
          v414.origin.x = v349;
          v257 = v355;
          v414.origin.y = v355;
          v258 = v350;
          v414.size.width = v350;
          v259 = v348;
          v414.size.height = v348;
          v260 = v365 * CGRectGetMinX(v414);
          v415.origin.x = v256;
          v415.origin.y = v257;
          v415.size.width = v258;
          v415.size.height = v259;
          v261 = CGRectGetMinY(v415);
          v262 = v339;
          v237[20] = v254;
          v237[21] = v262;
          v237[22] = v260;
          v237[23] = v249 * v261;
          v237[24] = 0.5;
          v263 = v360;
          v416.origin.x = v360;
          v264 = v354;
          v416.origin.y = v354;
          v265 = v361;
          v416.size.width = v361;
          v416.size.height = v255;
          v266 = CGRectGetMinX(v416);
          v267 = v364;
          v339 = v364 * v266;
          v417.origin.x = v263;
          v417.origin.y = v264;
          v417.size.width = v265;
          v268 = v255;
          v417.size.height = v255;
          v269 = CGRectGetMaxY(v417);
          v270 = v366;
          v338 = v366 * v269;
          v418.origin.x = v256;
          v271 = v355;
          v418.origin.y = v355;
          v272 = v258;
          v418.size.width = v258;
          v273 = v348;
          v418.size.height = v348;
          v274 = CGRectGetMinX(v418);
          v275 = v365;
          v337 = v365 * v274;
          v419.origin.x = v256;
          v419.origin.y = v271;
          v419.size.width = v272;
          v419.size.height = v273;
          v276 = v273;
          v277 = v367 * CGRectGetMaxY(v419);
          v278 = v338;
          v237[25] = v339;
          v237[26] = v278;
          v237[27] = v337;
          v237[28] = v277;
          v237[29] = 0.5;
          v279 = v360;
          v420.origin.x = v360;
          v280 = v354;
          v420.origin.y = v354;
          v281 = v361;
          v420.size.width = v361;
          v420.size.height = v268;
          v339 = v267 * CGRectGetMaxX(v420);
          v421.origin.x = v279;
          v421.origin.y = v280;
          v421.size.width = v281;
          v421.size.height = v268;
          v282 = v270 * CGRectGetMinY(v421);
          v283 = v349;
          v422.origin.x = v349;
          v284 = v355;
          v422.origin.y = v355;
          v285 = v350;
          v422.size.width = v350;
          v422.size.height = v276;
          v286 = v275 * CGRectGetMaxX(v422);
          v423.origin.x = v283;
          v423.origin.y = v284;
          v423.size.width = v285;
          v423.size.height = v276;
          v287 = v367 * CGRectGetMinY(v423);
          v237[30] = v339;
          v237[31] = v282;
          v237[32] = v286;
          v237[33] = v287;
          v237[34] = 0.5;
          v288 = (double *)&v238[5 * v218];
          v289 = v360;
          v424.origin.x = v360;
          v424.origin.y = v280;
          v290 = v361;
          v424.size.width = v361;
          v291 = v347;
          v424.size.height = v347;
          v339 = v364 * CGRectGetMaxX(v424);
          v425.origin.x = v289;
          v425.origin.y = v280;
          v425.size.width = v290;
          v425.size.height = v291;
          v292 = v366 * CGRectGetMaxY(v425);
          v426.origin.x = v283;
          v426.origin.y = v284;
          v426.size.width = v285;
          v426.size.height = v276;
          v293 = v365 * CGRectGetMaxX(v426);
          v427.origin.x = v283;
          v427.origin.y = v284;
          v427.size.width = v285;
          v427.size.height = v276;
          v294 = v367 * CGRectGetMaxY(v427);
          *v288 = v339;
          v288[1] = v292;
          v288[2] = v293;
          v288[3] = v294;
          v288[4] = 0.5;
          v39 = v335;
          v295 = (int32x4_t *)&v335[4 * v30];
          v296 = LODWORD(v342);
          v297 = LODWORD(v343);
          v295->i32[0] = LODWORD(v342);
          v295->i32[1] = v297;
          v298 = LODWORD(v340);
          v299 = LODWORD(v341);
          v295->i32[2] = LODWORD(v340);
          v295->i32[3] = v299;
          v300 = v351;
          v295[1] = v351;
          v295[2].i32[0] = v296;
          v295[2].i32[1] = LODWORD(v215);
          v295[2].i32[2] = v217;
          v295[2].i32[3] = v299;
          v295[3] = v300;
          v338 = v215;
          v295[4].i32[0] = LODWORD(v215);
          v295[4].i32[1] = LODWORD(v216);
          v295[4].i32[2] = v218;
          v295[4].i32[3] = v217;
          v295[5] = v300;
          v295[6].i32[0] = v297;
          v295[6].i32[1] = v298;
          v295[6].i32[2] = v218;
          v295[6].i32[3] = LODWORD(v216);
          v339 = v216;
          v295[7] = v300;
          v295[8].i32[0] = v299;
          v295[8].i32[1] = v217;
          v295[8].i32[2] = v218;
          v295[8].i32[3] = v298;
          v30 += 5;
          *(_QWORD *)&v31 = v214 + 8;
          v295[9] = v300;

          v40 = v346 + 1;
          v6 = v328;
          v7 = v327;
          self = v326;
          v32 = v357;
          v34 = v358;
          v36 = v359;
          v15 = v362;
          v33 = v353;
          v35 = v352;
          v37 = v363;
          v38 = v356;
        }
        while (v332 != v346 + 1);
        v332 = objc_msgSend(v321, "countByEnumeratingWithState:objects:count:", &v368, v372, 16);
      }
      while (v332);
    }
    else
    {
      v39 = v12;
      v30 = 0;
      v31 = 0.0;
      v38 = v15;
      v36 = v359;
      v37 = v359;
      v34 = v358;
      v35 = v358;
      v32 = v357;
      v33 = v357;
      *(_QWORD *)&v339 = 0xFFFFFFFFLL;
      *(_QWORD *)&v338 = 0xFFFFFFFFLL;
    }

    v428.origin.x = v38;
    v428.origin.y = v37;
    v428.size.width = v35;
    v428.size.height = v33;
    if (CGRectIsNull(v428))
    {
      v302 = v331;
    }
    else
    {
      v302 = v331;
      v303 = (double *)&v331[5 * *(_QWORD *)&v31];
      v429.origin.x = v38;
      v429.origin.y = v37;
      v429.size.width = v35;
      v429.size.height = v33;
      v304 = CGRectGetMinY(v429);
      v352 = v35;
      v356 = v38;
      v305 = v366;
      v306 = v366 * v304;
      v430.origin.x = v15;
      v430.origin.y = v36;
      v430.size.width = v34;
      v430.size.height = v32;
      v307 = CGRectGetMinY(v430);
      *v303 = 1.0;
      v431.origin.y = v37;
      v308 = v367;
      v303[1] = v306;
      v303[2] = 1.0;
      v303[3] = v308 * v307;
      v303[4] = 0.5;
      v431.origin.x = v356;
      v431.size.width = v352;
      v431.size.height = v33;
      v309 = v305 * CGRectGetMaxY(v431);
      v432.origin.x = v15;
      v432.origin.y = v36;
      v432.size.width = v34;
      v432.size.height = v32;
      v310 = CGRectGetMaxY(v432);
      v303[5] = 1.0;
      v303[6] = v309;
      v303[7] = 1.0;
      v303[8] = v308 * v310;
      v303[9] = 0.5;
      v311 = (int32x4_t *)&v39[4 * v30];
      v312 = LODWORD(v339);
      v311->i32[0] = LODWORD(v338);
      v311->i32[1] = v312;
      v311->i32[2] = LODWORD(v31) + 1;
      v311->i32[3] = LODWORD(v31);
      v311[1] = vdupq_n_s32(0x7F7FFFFFu);
      ++v30;
      *(_QWORD *)&v31 += 2;
    }
    objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", *(_QWORD *)&v31, v302, v30, v39, *MEMORY[0x1E0CD2A90]);
    v301 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v301;
}

- (BOOL)useInteractiveOpacity
{
  return self->_useInteractiveOpacity;
}

- (void)setUseInteractiveOpacity:(BOOL)a3
{
  self->_useInteractiveOpacity = a3;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(unint64_t)a3
{
  self->_animationType = a3;
}

- (BOOL)disableMeshOptimization
{
  return self->_disableMeshOptimization;
}

- (void)setDisableMeshOptimization:(BOOL)a3
{
  self->_disableMeshOptimization = a3;
}

- (NSArray)startGeometries
{
  return self->_startGeometries;
}

- (void)setStartGeometries:(id)a3
{
  objc_storeStrong((id *)&self->_startGeometries, a3);
}

- (NSArray)endGeometries
{
  return self->_endGeometries;
}

- (void)setEndGeometries:(id)a3
{
  objc_storeStrong((id *)&self->_endGeometries, a3);
}

- (NSArray)commonVisibleKeys
{
  return self->_commonVisibleKeys;
}

- (void)setCommonVisibleKeys:(id)a3
{
  objc_storeStrong((id *)&self->_commonVisibleKeys, a3);
}

- (CADisplayLink)opacityAnimationDisplayLink
{
  return self->_opacityAnimationDisplayLink;
}

- (void)setOpacityAnimationDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_opacityAnimationDisplayLink, a3);
}

- (double)opacityAnimationBeginTime
{
  return self->_opacityAnimationBeginTime;
}

- (void)setOpacityAnimationBeginTime:(double)a3
{
  self->_opacityAnimationBeginTime = a3;
}

- (BOOL)opacityAnimationDirectionForward
{
  return self->_opacityAnimationDirectionForward;
}

- (void)setOpacityAnimationDirectionForward:(BOOL)a3
{
  self->_opacityAnimationDirectionForward = a3;
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacityAnimationDisplayLink, 0);
  objc_storeStrong((id *)&self->_commonVisibleKeys, 0);
  objc_storeStrong((id *)&self->_endGeometries, 0);
  objc_storeStrong((id *)&self->_startGeometries, 0);
}

@end
