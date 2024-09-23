@implementation RPTFluidSplitViewTestParameters

- (RPTFluidSplitViewTestParameters)initWithTestName:(id)a3 splitViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  RPTFluidSplitViewTestParameters *v10;
  RPTFluidSplitViewTestParameters *v11;
  uint64_t v12;
  UIViewController *primaryController;
  uint64_t v14;
  UIViewController *supplementalController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  RPTCoordinateSpaceConverter *conversion;
  uint64_t v23;
  id completionHandler;
  objc_super v26;

  v8 = a4;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)RPTFluidSplitViewTestParameters;
  v10 = -[RPTFluidSplitViewTestParameters init](&v26, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_splitViewController, a4);
    objc_msgSend(v8, "viewControllerForColumn:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    primaryController = v11->_primaryController;
    v11->_primaryController = (UIViewController *)v12;

    objc_msgSend(v8, "viewControllerForColumn:", 1);
    v14 = objc_claimAutoreleasedReturnValue();
    supplementalController = v11->_supplementalController;
    v11->_supplementalController = (UIViewController *)v14;

    objc_msgSend(v8, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "screen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[RPTCoordinateSpaceConverter converterFromWindow:toScreen:](RPTCoordinateSpaceConverter, "converterFromWindow:toScreen:", v17, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    conversion = v11->_conversion;
    v11->_conversion = (RPTCoordinateSpaceConverter *)v21;

    v23 = MEMORY[0x1B5E1F6E0](v9);
    completionHandler = v11->_completionHandler;
    v11->_completionHandler = (id)v23;

  }
  return v11;
}

- (id)composerBlock
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[8];

  -[UIViewController view](self->_supplementalController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = RPTGetBoundsForView(v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[RPTFluidSplitViewTestParameters conversion](self, "conversion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:", RPTCGRectGetMidpointAlongSide(0, v4, v6, v8, v10));
  v13 = v12;
  v15 = v14;

  -[RPTFluidSplitViewTestParameters conversion](self, "conversion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:", RPTCGRectGetMidpointAlongSide(2, v4, v6, v8, v10));
  v18 = v17;
  v20 = v19;

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48__RPTFluidSplitViewTestParameters_composerBlock__block_invoke;
  v22[3] = &__block_descriptor_64_e23_v16__0___RPTComposer__8l;
  v22[4] = v13;
  v22[5] = v15;
  v22[6] = v18;
  v22[7] = v20;
  return (id)MEMORY[0x1B5E1F6E0](v22);
}

void __48__RPTFluidSplitViewTestParameters_composerBlock__block_invoke(double *a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "pointerOrFingerTapDown:", a1[4], a1[5]);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[6], a1[7], 1.0);
  objc_msgSend(v5, "advanceTime:", 0.2);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[4], a1[5], 1.0);
  objc_msgSend(v5, "advanceTime:", 0.2);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[6], a1[7], 0.6);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[4], a1[5], 0.6);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[6], a1[7], 0.3);
  objc_msgSend(v5, "pointerOrFingerMoveToPoint:duration:", a1[4], a1[5], 0.3);
  objc_msgSend(v5, "pointerOrFingerTapUp:", a1[4], a1[5]);
  objc_msgSend(v5, "interactionOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersPointer");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v5, "advanceTime:", 0.5);
    objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.6);
    objc_msgSend(v5, "advanceTime:", 2.0);
    objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[6], a1[7], a1[4], a1[5], 0.6);
  }

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong((id *)&self->_primaryController, 0);
  objc_storeStrong((id *)&self->_supplementalController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
}

@end
