@implementation _UIDirectionalRotationLayer

- (void)setCounterTransformLayer:(BOOL)a3
{
  self->_counterTransformLayer = a3;
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
  _OWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  p_previousTransform = &self->_previousTransform;
  -[_UIDirectionalRotationLayer transform](self, "transform");
  v6 = v25;
  *(_OWORD *)&p_previousTransform->m31 = v24;
  *(_OWORD *)&p_previousTransform->m33 = v6;
  v7 = v27;
  *(_OWORD *)&p_previousTransform->m41 = v26;
  *(_OWORD *)&p_previousTransform->m43 = v7;
  v8 = v21;
  *(_OWORD *)&p_previousTransform->m11 = v20;
  *(_OWORD *)&p_previousTransform->m13 = v8;
  v9 = v23;
  *(_OWORD *)&p_previousTransform->m21 = v22;
  *(_OWORD *)&p_previousTransform->m23 = v9;
  v19.receiver = self;
  v19.super_class = (Class)_UIDirectionalRotationLayer;
  v10 = *(_OWORD *)&a3->m33;
  v24 = *(_OWORD *)&a3->m31;
  v25 = v10;
  v11 = *(_OWORD *)&a3->m43;
  v26 = *(_OWORD *)&a3->m41;
  v27 = v11;
  v12 = *(_OWORD *)&a3->m13;
  v20 = *(_OWORD *)&a3->m11;
  v21 = v12;
  v13 = *(_OWORD *)&a3->m23;
  v22 = *(_OWORD *)&a3->m21;
  v23 = v13;
  -[_UIDirectionalRotationLayer setTransform:](&v19, sel_setTransform_, &v20);
  v14 = (_OWORD *)MEMORY[0x1E0CD2610];
  v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&p_previousTransform->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&p_previousTransform->m33 = v15;
  v16 = v14[7];
  *(_OWORD *)&p_previousTransform->m41 = v14[6];
  *(_OWORD *)&p_previousTransform->m43 = v16;
  v17 = v14[1];
  *(_OWORD *)&p_previousTransform->m11 = *v14;
  *(_OWORD *)&p_previousTransform->m13 = v17;
  v18 = v14[3];
  *(_OWORD *)&p_previousTransform->m21 = v14[2];
  *(_OWORD *)&p_previousTransform->m23 = v18;
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isEqualToString:", CFSTR("transform")))
  {
    -[_UIDirectionalRotationLayer presentationLayer](self, "presentationLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    if (v8)
    {
      objc_msgSend(v8, "transform");
    }
    else
    {
      v10 = *(_OWORD *)&self->_previousTransform.m33;
      v37 = *(_OWORD *)&self->_previousTransform.m31;
      v38 = v10;
      v11 = *(_OWORD *)&self->_previousTransform.m43;
      v39 = *(_OWORD *)&self->_previousTransform.m41;
      v40 = v11;
      v12 = *(_OWORD *)&self->_previousTransform.m13;
      v33 = *(_OWORD *)&self->_previousTransform.m11;
      v34 = v12;
      v13 = *(_OWORD *)&self->_previousTransform.m23;
      v35 = *(_OWORD *)&self->_previousTransform.m21;
      v36 = v13;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[_UIDirectionalRotationLayer transform](self, "transform");
    v21 = v29;
    v22 = v30;
    v23 = v31;
    v24 = v32;
    v17 = v25;
    v18 = v26;
    v19 = v27;
    v20 = v28;
    v14 = _UIInterfaceOrientationFromCATransform3D(&v17);
    v21 = v37;
    v22 = v38;
    v23 = v39;
    v24 = v40;
    v17 = v33;
    v18 = v34;
    v19 = v35;
    v20 = v36;
    v15 = _UIInterfaceOrientationFromCATransform3D(&v17);
    _UIMakeBasicTransformAnimationUnambiguousWithOrientations(v6, v15, v14, -[_UIDirectionalRotationLayer isCounterTransformLayer](self, "isCounterTransformLayer"), -[_UIDirectionalRotationLayer isInverseTransformLayer](self, "isInverseTransformLayer"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_UIDirectionalRotationLayer;
  -[_UIDirectionalRotationLayer addAnimation:forKey:](&v16, sel_addAnimation_forKey_, v6, v7);

}

- (BOOL)isCounterTransformLayer
{
  return self->_counterTransformLayer;
}

- (BOOL)isInverseTransformLayer
{
  return self->_inverseTransformLayer;
}

- (void)setInverseTransformLayer:(BOOL)a3
{
  self->_inverseTransformLayer = a3;
}

@end
