@implementation SBFluidSwitcherItemContainerLayer

- (void)setTransformAnimationsAreLegacyCounterRotations:(BOOL)a3
{
  self->_transformAnimationsAreLegacyCounterRotations = a3;
}

- (void)setPositionAnimationsBeginFromModelState:(BOOL)a3
{
  self->_positionAnimationsBeginFromModelState = a3;
}

- (void)setTransform:(CATransform3D *)a3
{
  CATransform3D *p_previousTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28[9];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  p_previousTransform = &self->_previousTransform;
  -[SBFluidSwitcherItemContainerLayer transform](self, "transform");
  v6 = v34;
  *(_OWORD *)&p_previousTransform->m31 = v33;
  *(_OWORD *)&p_previousTransform->m33 = v6;
  v7 = v36;
  *(_OWORD *)&p_previousTransform->m41 = v35;
  *(_OWORD *)&p_previousTransform->m43 = v7;
  v8 = v30;
  *(_OWORD *)&p_previousTransform->m11 = v29;
  *(_OWORD *)&p_previousTransform->m13 = v8;
  v9 = v32;
  *(_OWORD *)&p_previousTransform->m21 = v31;
  *(_OWORD *)&p_previousTransform->m23 = v9;
  v10 = *(_OWORD *)&p_previousTransform->m33;
  v33 = *(_OWORD *)&p_previousTransform->m31;
  v34 = v10;
  v11 = *(_OWORD *)&p_previousTransform->m43;
  v35 = *(_OWORD *)&p_previousTransform->m41;
  v36 = v11;
  v12 = *(_OWORD *)&p_previousTransform->m13;
  v29 = *(_OWORD *)&p_previousTransform->m11;
  v30 = v12;
  v13 = *(_OWORD *)&p_previousTransform->m23;
  v31 = *(_OWORD *)&p_previousTransform->m21;
  v32 = v13;
  v14 = *(objc_super *)&a3->m33;
  v28[5] = *(objc_super *)&a3->m31;
  v28[6] = v14;
  v15 = *(objc_super *)&a3->m43;
  v28[7] = *(objc_super *)&a3->m41;
  v28[8] = v15;
  v16 = *(objc_super *)&a3->m13;
  v28[1] = *(objc_super *)&a3->m11;
  v28[2] = v16;
  v17 = *(objc_super *)&a3->m23;
  v28[3] = *(objc_super *)&a3->m21;
  v28[4] = v17;
  if (BSFloatEqualToFloat())
  {
    v18 = 1;
    while (v18 != 16)
    {
      ++v18;
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        if ((unint64_t)(v18 - 2) > 0xE)
          break;
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    v28[0].receiver = self;
    v28[0].super_class = (Class)SBFluidSwitcherItemContainerLayer;
    v19 = *(_OWORD *)&a3->m33;
    v33 = *(_OWORD *)&a3->m31;
    v34 = v19;
    v20 = *(_OWORD *)&a3->m43;
    v35 = *(_OWORD *)&a3->m41;
    v36 = v20;
    v21 = *(_OWORD *)&a3->m13;
    v29 = *(_OWORD *)&a3->m11;
    v30 = v21;
    v22 = *(_OWORD *)&a3->m23;
    v31 = *(_OWORD *)&a3->m21;
    v32 = v22;
    -[objc_super setTransform:](v28, sel_setTransform_, &v29);
  }
  v23 = (_OWORD *)MEMORY[0x1E0CD2610];
  v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&p_previousTransform->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&p_previousTransform->m33 = v24;
  v25 = v23[7];
  *(_OWORD *)&p_previousTransform->m41 = v23[6];
  *(_OWORD *)&p_previousTransform->m43 = v25;
  v26 = v23[1];
  *(_OWORD *)&p_previousTransform->m11 = *v23;
  *(_OWORD *)&p_previousTransform->m13 = v26;
  v27 = v23[3];
  *(_OWORD *)&p_previousTransform->m21 = v23[2];
  *(_OWORD *)&p_previousTransform->m23 = v27;
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  double x;
  CGPoint *p_previousPosition;
  CGFloat v7;
  CGFloat v8;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  p_previousPosition = &self->_previousPosition;
  -[SBFluidSwitcherItemContainerLayer position](self, "position");
  p_previousPosition->x = v7;
  p_previousPosition->y = v8;
  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherItemContainerLayer;
  -[SBFluidSwitcherItemContainerLayer setPosition:](&v9, sel_setPosition_, x, y);
}

- (SBFluidSwitcherItemContainerLayer)init
{
  SBFluidSwitcherItemContainerLayer *result;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherItemContainerLayer;
  result = -[SBFluidSwitcherItemContainerLayer init](&v8, sel_init);
  if (result)
  {
    result->_previousPosition = (CGPoint)SBInvalidPoint;
    v3 = (_OWORD *)MEMORY[0x1E0CD2610];
    v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&result->_previousTransform.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&result->_previousTransform.m33 = v4;
    v5 = v3[7];
    *(_OWORD *)&result->_previousTransform.m41 = v3[6];
    *(_OWORD *)&result->_previousTransform.m43 = v5;
    v6 = v3[1];
    *(_OWORD *)&result->_previousTransform.m11 = *v3;
    *(_OWORD *)&result->_previousTransform.m13 = v6;
    v7 = v3[3];
    *(_OWORD *)&result->_previousTransform.m21 = v3[2];
    *(_OWORD *)&result->_previousTransform.m23 = v7;
  }
  return result;
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_super v29;
  _OWORD v30[8];
  _OWORD v31[8];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _QWORD v41[2];
  CGPoint previousPosition;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_positionAnimationsBeginFromModelState
    && objc_msgSend(v7, "isEqualToString:", CFSTR("position"))
    && (self->_previousPosition.x == 1.79769313e308 ? (v9 = self->_previousPosition.y == 1.79769313e308) : (v9 = 0), !v9))
  {
    v10 = objc_opt_class();
    SBSafeCast(v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "fromValue");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v12, "toValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

        }
        else
        {
          objc_msgSend(v12, "byValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            previousPosition = self->_previousPosition;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &previousPosition, "{CGPoint=dd}");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setFromValue:", v23);

            v24 = (void *)objc_msgSend(v12, "copy");
            objc_msgSend(v24, "setKeyPath:", CFSTR("anchorPoint"));
            v25 = (void *)MEMORY[0x1E0CB3B18];
            -[SBFluidSwitcherItemContainerLayer anchorPoint](self, "anchorPoint");
            v41[0] = v26;
            v41[1] = v27;
            objc_msgSend(v25, "valueWithBytes:objCType:", v41, "{CGPoint=dd}");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setFromValue:", v28);

            v40.receiver = self;
            v40.super_class = (Class)SBFluidSwitcherItemContainerLayer;
            -[SBFluidSwitcherItemContainerLayer addAnimation:forKey:](&v40, sel_addAnimation_forKey_, v24, CFSTR("anchorPoint"));

          }
        }
      }
    }

  }
  else if (self->_transformAnimationsAreLegacyCounterRotations)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("transform")))
      {
        v16 = *(_OWORD *)&self->_previousTransform.m33;
        v30[4] = *(_OWORD *)&self->_previousTransform.m31;
        v30[5] = v16;
        v17 = *(_OWORD *)&self->_previousTransform.m43;
        v30[6] = *(_OWORD *)&self->_previousTransform.m41;
        v30[7] = v17;
        v18 = *(_OWORD *)&self->_previousTransform.m13;
        v30[0] = *(_OWORD *)&self->_previousTransform.m11;
        v30[1] = v18;
        v19 = *(_OWORD *)&self->_previousTransform.m23;
        v30[2] = *(_OWORD *)&self->_previousTransform.m21;
        v30[3] = v19;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[SBFluidSwitcherItemContainerLayer transform](self, "transform");
        v31[4] = v36;
        v31[5] = v37;
        v31[6] = v38;
        v31[7] = v39;
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        v31[3] = v35;
        v20 = _UIInterfaceOrientationFromCATransform3D(v31);
        v21 = _UIInterfaceOrientationFromCATransform3D(v30);
        _UIMakeBasicTransformAnimationUnambiguous(v6, v21, v20, 1, 0);
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SBFluidSwitcherItemContainerLayer;
  -[SBFluidSwitcherItemContainerLayer addAnimation:forKey:](&v29, sel_addAnimation_forKey_, v6, v8);

}

- (BOOL)positionAnimationsBeginFromModelState
{
  return self->_positionAnimationsBeginFromModelState;
}

- (BOOL)transformAnimationsAreLegacyCounterRotations
{
  return self->_transformAnimationsAreLegacyCounterRotations;
}

@end
