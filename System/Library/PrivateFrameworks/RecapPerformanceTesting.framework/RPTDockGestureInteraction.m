@implementation RPTDockGestureInteraction

- (RPTDockGestureInteraction)initWithGestureStyle:(unint64_t)a3
{
  RPTDockGestureInteraction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPTDockGestureInteraction;
  result = -[RPTDockGestureInteraction init](&v5, sel_init);
  if (result)
  {
    result->_gestureStyle = a3;
    result->_amplitude = 1.0;
  }
  return result;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[7];

  v6 = a3;
  v7 = -[RPTDockGestureInteraction gestureStyle](self, "gestureStyle") - 1;
  v8 = 1.0;
  if (v7 <= 4)
    v8 = dbl_1B1783378[v7];
  v9 = -[RPTDockGestureInteraction gestureStyle](self, "gestureStyle") & 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(v6, "interactionOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pointerFrequency");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__RPTDockGestureInteraction_invokeWithComposer_duration___block_invoke;
  v13[3] = &unk_1E635D240;
  v13[4] = self;
  *(double *)&v13[5] = v8;
  *(double *)&v13[6] = a4;
  if (v9 == 4)
    v12 = 3;
  else
    v12 = 2;
  objc_msgSend(v6, "composeDockGestureInMotion:frequency:actionBlock:", v12, v11, v13);

}

void __57__RPTDockGestureInteraction_invokeWithComposer_duration___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  double v5;
  id v6;

  v3 = *(double *)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v4, "amplitude");
  objc_msgSend(v6, "updateProgressTo:duration:", v3 * v5, *(double *)(a1 + 48));

}

- (id)reversedInteraction
{
  RPTDockGestureInteraction *v3;
  unint64_t gestureStyle;
  uint64_t v5;

  v3 = [RPTDockGestureInteraction alloc];
  gestureStyle = self->_gestureStyle;
  if (gestureStyle > 5)
    v5 = 0;
  else
    v5 = qword_1B17833A0[gestureStyle];
  return -[RPTDockGestureInteraction initWithGestureStyle:](v3, "initWithGestureStyle:", v5);
}

- (id)interactionByScalingBy:(double)a3
{
  RPTDockGestureInteraction *v5;
  double v6;

  v5 = -[RPTDockGestureInteraction initWithGestureStyle:]([RPTDockGestureInteraction alloc], "initWithGestureStyle:", self->_gestureStyle);
  -[RPTDockGestureInteraction amplitude](self, "amplitude");
  -[RPTDockGestureInteraction setAmplitude:](v5, "setAmplitude:", v6 * a3);
  return v5;
}

- (unint64_t)gestureStyle
{
  return self->_gestureStyle;
}

- (void)setGestureStyle:(unint64_t)a3
{
  self->_gestureStyle = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

@end
