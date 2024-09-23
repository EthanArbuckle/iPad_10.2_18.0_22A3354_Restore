@implementation RPTResizeTestParameters

- (void)prepareWithComposer:(id)a3
{
  id v4;

  -[RPTResizeTestParameters window](self, "window", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RPTResizeTestParameters minimumWindowSize](self, "minimumWindowSize");
  objc_msgSend(v4, "_rpt_moveToSafeTopLeftOfScreemVisibleFrameAndResize:");

}

- (RPTResizeTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  RPTResizeTestParameters *v12;
  RPTResizeTestParameters *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id completionHandler;
  uint64_t v20;
  RPTCoordinateSpaceConverter *conversion;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RPTResizeTestParameters;
  v12 = -[RPTResizeTestParameters init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_testName, a3);
    objc_storeStrong((id *)&v13->_window, a4);
    objc_msgSend(v10, "_rpt_safeVisibleFrameOfScreen");
    v13->_minimumWindowSize = (CGSize)xmmword_1B17832F0;
    v16 = 1200.0;
    if (v14 <= 1200.0)
      v16 = v14;
    v17 = 800.0;
    if (v15 <= 800.0)
      v17 = v15;
    v13->_maximumWindowSize.width = v16;
    v13->_maximumWindowSize.height = v17;
    v18 = MEMORY[0x1B5E1F6E0](v11);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v18;

    +[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v10);
    v20 = objc_claimAutoreleasedReturnValue();
    conversion = v13->_conversion;
    v13->_conversion = (RPTCoordinateSpaceConverter *)v20;

  }
  return v13;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__RPTResizeTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D1C0;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

void __40__RPTResizeTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  RPTResizeInteraction *v3;
  void *v4;
  RPTResizeInteraction *v5;
  void *v6;
  _OWORD *v7;
  uint64_t v8;
  void *v9;
  RPTResizeInteraction *v10;
  id v11;

  v11 = a2;
  v3 = [RPTResizeInteraction alloc];
  objc_msgSend(*(id *)(a1 + 32), "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "maximumWindowSize");
  v5 = -[RPTResizeInteraction initWithWindow:destinationSize:](v3, "initWithWindow:destinationSize:", v4);

  objc_msgSend(*(id *)(a1 + 32), "conversion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTResizeInteraction setConversion:](v5, "setConversion:", v6);

  -[RPTResizeInteraction setShouldLift:](v5, "setShouldLift:", 0);
  -[RPTResizeInteraction invokeWithComposer:duration:](v5, "invokeWithComposer:duration:", v11, 1.0);
  v7 = operator new(0x50uLL);
  v8 = 0;
  v7[2] = xmmword_1B1783328;
  v7[3] = unk_1B1783338;
  v7[4] = xmmword_1B1783348;
  *v7 = xmmword_1B1783308;
  v7[1] = unk_1B1783318;
  do
  {
    -[RPTResizeInteraction reversedInteraction](v5, "reversedInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "interactionByScalingBy:", fabs(*(double *)((char *)v7 + v8)));
    v10 = (RPTResizeInteraction *)objc_claimAutoreleasedReturnValue();

    -[RPTResizeInteraction setShouldPress:](v10, "setShouldPress:", 0);
    -[RPTResizeInteraction setShouldLift:](v10, "setShouldLift:", 0);
    if (*(double *)((char *)v7 + v8) < 0.0)
      -[RPTResizeInteraction setShouldLift:](v10, "setShouldLift:", 1);
    -[RPTResizeInteraction invokeWithComposer:duration:](v10, "invokeWithComposer:duration:", v11, 1.0);
    v8 += 8;
    v5 = v10;
  }
  while (v8 != 80);
  operator delete(v7);

}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (CGSize)minimumWindowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumWindowSize.width;
  height = self->_minimumWindowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumWindowSize:(CGSize)a3
{
  self->_minimumWindowSize = a3;
}

- (CGSize)maximumWindowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumWindowSize.width;
  height = self->_maximumWindowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumWindowSize:(CGSize)a3
{
  self->_maximumWindowSize = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
}

@end
