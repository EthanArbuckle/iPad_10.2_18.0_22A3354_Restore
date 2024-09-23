@implementation SCNNode

- (void)p_removeAnimationForKey:(id)a3 shouldPreserveTransform:(BOOL)a4
{
  SCNNode *v6;
  _OWORD v7[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a4)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = -[SCNNode presentationNode](self, "presentationNode");
    if (v6)
    {
      -[SCNNode transform](v6, "transform");
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
    }
    -[SCNNode removeAnimationForKey:](self, "removeAnimationForKey:", a3);
    +[SCNTransaction begin](SCNTransaction, "begin");
    +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
    v7[0] = v8;
    v7[1] = v9;
    v7[2] = v10;
    v7[3] = v11;
    -[SCNNode setTransform:](self, "setTransform:", v7);
    +[SCNTransaction commit](SCNTransaction, "commit");
  }
  else
  {
    -[SCNNode removeAnimationForKey:](self, "removeAnimationForKey:", a3);
  }
}

- (NSArray)childNodesWithGeometry
{
  return (NSArray *)-[SCNNode childNodesPassingTest:recursively:](self, "childNodesPassingTest:recursively:", &stru_427D00, 0);
}

- (NSArray)childNodesWithLight
{
  return (NSArray *)-[SCNNode childNodesPassingTest:recursively:](self, "childNodesPassingTest:recursively:", &stru_427D20, 0);
}

- (NSArray)childNodesWithCamera
{
  return (NSArray *)-[SCNNode childNodesPassingTest:recursively:](self, "childNodesPassingTest:recursively:", &stru_427D40, 0);
}

- (BOOL)isAnimating
{
  return objc_msgSend(-[SCNNode animationKeys](self, "animationKeys"), "count") != 0;
}

- (void)addContinuousRotationWithEaseIn
{
  CABasicAnimation *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  +[SCNTransaction begin](SCNTransaction, "begin");
  v3 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("rotation"));
  -[CABasicAnimation setDelegate:](v3, "setDelegate:", self);
  -[CABasicAnimation setDuration:](v3, "setDuration:", 7.5);
  -[CABasicAnimation setTimingFunction:](v3, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn));
  -[CABasicAnimation setRemovedOnCompletion:](v3, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v3, "setFillMode:", kCAFillModeBoth);
  LODWORD(v4) = 1070141403;
  LODWORD(v5) = 0;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 0;
  -[CABasicAnimation setToValue:](v3, "setToValue:", +[NSValue valueWithSCNVector4:](NSValue, "valueWithSCNVector4:", v5, v6, v7, v4));
  -[CABasicAnimation setValue:forKey:](v3, "setValue:forKey:", CFSTR("THEaseInRotation"), CFSTR("THAnimationIdentifier"));
  -[SCNNode addAnimation:forKey:](self, "addAnimation:forKey:", v3, CFSTR("THEaseInRotation"));
  +[SCNTransaction commit](SCNTransaction, "commit");
}

- (void)addContinuousRotationWithInitialRotation:(SCNVector4)a3
{
  float w;
  float z;
  float y;
  float x;
  CABasicAnimation *v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  w = a3.w;
  z = a3.z;
  y = a3.y;
  x = a3.x;
  +[SCNTransaction begin](SCNTransaction, "begin");
  v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("rotation"));
  -[CABasicAnimation setDuration:](v8, "setDuration:", 15.0);
  -[CABasicAnimation setTimingFunction:](v8, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  LODWORD(v9) = 2139095040;
  -[CABasicAnimation setRepeatCount:](v8, "setRepeatCount:", v9);
  v10 = w + 0.013962634;
  v11 = v10;
  *(float *)&v10 = x;
  *(float *)&v12 = z;
  *(float *)&v13 = v11;
  -[CABasicAnimation setFromValue:](v8, "setFromValue:", +[NSValue valueWithSCNVector4:](NSValue, "valueWithSCNVector4:", v10, COERCE_DOUBLE(LODWORD(y) | 0x3F8C987100000000), v12, v13));
  v14 = v11 + 6.28318531;
  *(float *)&v15 = v14;
  *(float *)&v14 = x;
  *(float *)&v16 = z;
  -[CABasicAnimation setToValue:](v8, "setToValue:", +[NSValue valueWithSCNVector4:](NSValue, "valueWithSCNVector4:", v14, COERCE_DOUBLE(LODWORD(y) | 0x401921FB00000000), v16, v15));
  -[CABasicAnimation setValue:forKey:](v8, "setValue:forKey:", CFSTR("THContinuousRotation"), CFSTR("THAnimationIdentifier"));
  -[SCNNode addAnimation:forKey:](self, "addAnimation:forKey:", v8, CFSTR("THContinuousRotation"));
  +[SCNTransaction commit](SCNTransaction, "commit");
}

- (BOOL)hasContinuousRotationAnimation
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5A35C;
  v4[3] = &unk_427C78;
  v4[4] = &v5;
  objc_msgSend(-[SCNNode animationKeys](self, "animationKeys"), "enumerateObjectsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)removeContinuousRotationAnimations
{
  const __CFString *v3;

  v3 = CFSTR("THContinuousRotation");
  if (-[SCNNode animationForKey:](self, "animationForKey:", CFSTR("THContinuousRotation"))
    || (v3 = CFSTR("THEaseInRotation"), -[SCNNode animationForKey:](self, "animationForKey:", CFSTR("THEaseInRotation"))))
  {
    -[SCNNode p_removeAnimationForKey:shouldPreserveTransform:](self, "p_removeAnimationForKey:shouldPreserveTransform:", v3, 1);
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a4;
  v7 = objc_msgSend(a3, "valueForKey:", CFSTR("THAnimationIdentifier"));
  if (v4)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("THEaseInRotation")))
    {
      -[SCNNode rotation](-[SCNNode presentationNode](self, "presentationNode"), "rotation");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[SCNNode removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("THEaseInRotation"));
      LODWORD(v16) = v9;
      LODWORD(v17) = v11;
      LODWORD(v18) = v13;
      LODWORD(v19) = v15;
      -[SCNNode addContinuousRotationWithInitialRotation:](self, "addContinuousRotationWithInitialRotation:", v16, v17, v18, v19);
      objc_msgSend(a3, "setDelegate:", 0);
    }
  }
}

@end
