@implementation TSKPulseAnimationController

- (TSKPulseAnimationController)initWithDelegate:(id)a3
{
  TSKPulseAnimationController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKPulseAnimationController;
  result = -[TSKPulseAnimationController init](&v5, sel_init);
  if (result)
  {
    result->_delegate = (TSKPulseAnimationControllerProtocol *)a3;
    result->_duration = 0.1;
    result->_pulseOffset = 6.0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSKPulseAnimationController;
  -[TSKHighlightController dealloc](&v2, sel_dealloc);
}

- (void)reset
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)TSKPulseAnimationController;
  -[TSKHighlightController reset](&v2, sel_reset);
}

- (void)disconnect
{
  self->_delegate = 0;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (self->_pulsating
    && (!self->_autohide
     || objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqualToString:", CFSTR("opacity"))))
  {
    self->_pulsating = 0;
    if (self->_autohide)
    {
      -[TSKHighlightController hide](self, "hide", a3, a4);
      -[CALayer removeAllAnimations](-[TSKHighlightController layer](self, "layer"), "removeAllAnimations");
      -[TSKHighlightController setImage:](self, "setImage:", 0);
    }
    -[TSKPulseAnimationControllerProtocol pulseAnimationDidStopForPulse:](self->_delegate, "pulseAnimationDidStopForPulse:", self, a4);
  }
}

- (void)stop
{
  _BOOL4 pulsating;

  pulsating = self->_pulsating;
  self->_pulsating = 0;
  -[TSKHighlightController hide](self, "hide");
  -[CALayer removeAllAnimations](-[TSKHighlightController layer](self, "layer"), "removeAllAnimations");
  -[TSKHighlightController setImage:](self, "setImage:", 0);
  if (pulsating)
    -[TSKPulseAnimationControllerProtocol pulseAnimationDidStopForPulse:](self->_delegate, "pulseAnimationDidStopForPulse:", self);
}

- (BOOL)drawRoundedRect
{
  return 1;
}

- (void)startAnimating
{
  double v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CATransform3D v29;
  CATransform3D v30;
  CATransform3D v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  -[CALayer removeAllAnimations](-[TSKHighlightController layer](self, "layer"), "removeAllAnimations");
  if (-[TSKHighlightController path](self, "path"))
  {
    CGRectGetWidth(self->super._overallRect);
    CGRectGetHeight(self->super._overallRect);
    TSUClamp();
    *(float *)&v3 = v3;
    self->_pulsating = 1;
    v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v31.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v31.m33 = v4;
    v27 = *(_OWORD *)&v31.m31;
    v28 = v4;
    v5 = v4;
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v31.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v31.m43 = v6;
    v25 = *(_OWORD *)&v31.m41;
    v26 = v6;
    v7 = v6;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v31.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v31.m13 = v8;
    v23 = *(_OWORD *)&v31.m11;
    v24 = v8;
    v9 = v8;
    v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v31.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v31.m23 = v10;
    v21 = *(_OWORD *)&v31.m21;
    v22 = v10;
    v11 = *(float *)&v3;
    v12 = -(self->super._overallRect.origin.x * *(float *)&v3 - self->super._overallRect.origin.x);
    v13 = -(self->super._overallRect.origin.y * v11 - self->super._overallRect.origin.y);
    *(_OWORD *)&v30.m31 = *(_OWORD *)&v31.m31;
    *(_OWORD *)&v30.m33 = v5;
    *(_OWORD *)&v30.m41 = *(_OWORD *)&v31.m41;
    *(_OWORD *)&v30.m43 = v7;
    *(_OWORD *)&v30.m11 = *(_OWORD *)&v31.m11;
    *(_OWORD *)&v30.m13 = v9;
    *(_OWORD *)&v30.m21 = *(_OWORD *)&v31.m21;
    *(_OWORD *)&v30.m23 = v10;
    CATransform3DTranslate(&v31, &v30, v12, v13, 0.0);
    v14 = -(self->super._overallRect.size.width - self->super._overallRect.size.width * v11) * -0.5;
    v15 = -(self->super._overallRect.size.height - self->super._overallRect.size.height * v11) * -0.5;
    v29 = v31;
    CATransform3DTranslate(&v30, &v29, v14, v15, 0.0);
    v31 = v30;
    v29 = v30;
    CATransform3DScale(&v30, &v29, v11, v11, 1.0);
    v31 = v30;
    v16 = (void *)objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
    objc_msgSend(v16, "setKeyTimes:", &unk_24D8FA248);
    *(_OWORD *)&v30.m31 = v27;
    *(_OWORD *)&v30.m33 = v28;
    *(_OWORD *)&v30.m41 = v25;
    *(_OWORD *)&v30.m43 = v26;
    *(_OWORD *)&v30.m11 = v23;
    *(_OWORD *)&v30.m13 = v24;
    *(_OWORD *)&v30.m21 = v21;
    *(_OWORD *)&v30.m23 = v22;
    v33[0] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v30);
    v30 = v31;
    v33[1] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v30);
    *(_OWORD *)&v30.m31 = v27;
    *(_OWORD *)&v30.m33 = v28;
    *(_OWORD *)&v30.m41 = v25;
    *(_OWORD *)&v30.m43 = v26;
    *(_OWORD *)&v30.m11 = v23;
    *(_OWORD *)&v30.m13 = v24;
    *(_OWORD *)&v30.m21 = v21;
    *(_OWORD *)&v30.m23 = v22;
    v33[2] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v30);
    objc_msgSend(v16, "setValues:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3));
    v32[0] = objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
    v32[1] = objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    objc_msgSend(v16, "setTimingFunctions:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2));
    objc_msgSend(v16, "setDuration:", self->_duration);
    objc_msgSend(v16, "setDelegate:", self);
    v17 = *MEMORY[0x24BDE5978];
    objc_msgSend(v16, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v16, "setRemovedOnCompletion:", 0);
    -[CALayer addAnimation:forKey:](-[TSKHighlightController layer](self, "layer"), "addAnimation:forKey:", v16, CFSTR("PulseAnimation"));
    if (self->_autohide)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
      LODWORD(v19) = 1.0;
      objc_msgSend(v18, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19));
      LODWORD(v20) = 0;
      objc_msgSend(v18, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20));
      objc_msgSend(v18, "setDelegate:", self);
      objc_msgSend(v18, "setBeginTime:", CACurrentMediaTime() + self->_duration * 2.0);
      objc_msgSend(v18, "setDuration:", self->_duration + self->_duration);
      objc_msgSend(v18, "setRemovedOnCompletion:", 0);
      objc_msgSend(v18, "setFillMode:", v17);
      -[CALayer addAnimation:forKey:](-[TSKHighlightController layer](self, "layer"), "addAnimation:forKey:", v18, CFSTR("PulseAnimationFade"));
    }
  }
}

- (BOOL)pulsating
{
  return self->_pulsating;
}

- (void)setPulsating:(BOOL)a3
{
  self->_pulsating = a3;
}

- (BOOL)autohide
{
  return self->_autohide;
}

- (void)setAutohide:(BOOL)a3
{
  self->_autohide = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)pulseOffset
{
  return self->_pulseOffset;
}

- (void)setPulseOffset:(double)a3
{
  self->_pulseOffset = a3;
}

@end
