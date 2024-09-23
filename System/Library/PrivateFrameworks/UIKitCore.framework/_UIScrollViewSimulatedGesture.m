@implementation _UIScrollViewSimulatedGesture

- (_UIScrollViewSimulatedGesture)initWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6
{
  id v10;
  id v11;
  id v12;
  _UIScrollViewSimulatedGesture *v13;
  _UIScrollViewSimulatedGesture *v14;
  void *v15;
  id beginBlock;
  void *v17;
  id updateBlock;
  void *v19;
  id endBlock;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UIScrollViewSimulatedGesture;
  v13 = -[_UIScrollViewSimulatedGesture init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_simulationDuration = a3;
    v15 = _Block_copy(v10);
    beginBlock = v14->_beginBlock;
    v14->_beginBlock = v15;

    v17 = _Block_copy(v11);
    updateBlock = v14->_updateBlock;
    v14->_updateBlock = v17;

    v19 = _Block_copy(v12);
    endBlock = v14->_endBlock;
    v14->_endBlock = v19;

  }
  return v14;
}

- (BOOL)updateSimulation
{
  double beginTime;
  CFTimeInterval v4;
  BOOL v5;
  uint64_t v6;
  double simulationDuration;
  double v8;

  beginTime = self->_beginTime;
  v4 = CACurrentMediaTime();
  if (beginTime == 0.0)
  {
    v5 = 0;
    self->_beginTime = v4;
    v6 = 24;
  }
  else
  {
    simulationDuration = self->_simulationDuration;
    v8 = v4 - self->_beginTime;
    v5 = v8 >= simulationDuration;
    v6 = 32;
    if (v8 >= simulationDuration)
      v6 = 40;
  }
  (*(void (***)(void))((char *)&self->super.isa + v6))[2]();
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong(&self->_beginBlock, 0);
}

@end
