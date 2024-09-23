@implementation RPTDirectionalCrownTestParameters

- (RPTDirectionalCrownTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  RPTDirectionalCrownTestParameters *v16;
  RPTDirectionalCrownTestParameters *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = RPTDefaultScrollDirection(v9);
  objc_msgSend(v9, "contentSize");
  v13 = v12;
  v15 = v14;

  v16 = -[RPTDirectionalCrownTestParameters initWithTestName:scrollingSize:screenSpaceMultiplier:rotationDuration:direction:completionHandler:](self, "initWithTestName:scrollingSize:screenSpaceMultiplier:rotationDuration:direction:completionHandler:", v10, v11, v8, v13, v15, 1.0, 1.0);
  v17 = v16;

  return v17;
}

- (RPTDirectionalCrownTestParameters)initWithTestName:(id)a3 scrollingSize:(CGSize)a4 screenSpaceMultiplier:(double)a5 rotationDuration:(double)a6 direction:(int64_t)a7 completionHandler:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  RPTDirectionalCrownTestParameters *v17;
  RPTDirectionalCrownTestParameters *v18;
  objc_super v20;

  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)RPTDirectionalCrownTestParameters;
  v17 = -[RPTDirectionalCrownTestParameters init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[RPTDirectionalCrownTestParameters setTestName:](v17, "setTestName:", v15);
    -[RPTDirectionalCrownTestParameters setScrollingSize:](v18, "setScrollingSize:", width, height);
    -[RPTDirectionalCrownTestParameters setScreenSpaceMultiplier:](v18, "setScreenSpaceMultiplier:", a5);
    -[RPTDirectionalCrownTestParameters setRotationDuration:](v18, "setRotationDuration:", a6);
    -[RPTDirectionalCrownTestParameters setDirection:](v18, "setDirection:", a7);
    -[RPTDirectionalCrownTestParameters setCompletionHandler:](v18, "setCompletionHandler:", v16);
    -[RPTDirectionalCrownTestParameters setAdjustRotationDurationForRevolution:](v18, "setAdjustRotationDurationForRevolution:", 1);
  }

  return v18;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__RPTDirectionalCrownTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

uint64_t __50__RPTDirectionalCrownTestParameters_composerBlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "direction");
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)scrollingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scrollingSize.width;
  height = self->_scrollingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScrollingSize:(CGSize)a3
{
  self->_scrollingSize = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)screenSpaceMultiplier
{
  return self->_screenSpaceMultiplier;
}

- (void)setScreenSpaceMultiplier:(double)a3
{
  self->_screenSpaceMultiplier = a3;
}

- (double)rotationDuration
{
  return self->_rotationDuration;
}

- (void)setRotationDuration:(double)a3
{
  self->_rotationDuration = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)adjustRotationDurationForRevolution
{
  return self->_adjustRotationDurationForRevolution;
}

- (void)setAdjustRotationDurationForRevolution:(BOOL)a3
{
  self->_adjustRotationDurationForRevolution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
