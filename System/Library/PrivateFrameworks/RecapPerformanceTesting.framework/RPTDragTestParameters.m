@implementation RPTDragTestParameters

- (void)prepareWithComposer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[RPTDragTestParameters window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rpt_safeVisibleFrameOfScreen");
  v6 = v5;
  v8 = v7;

  -[RPTDragTestParameters window](self, "window");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_rpt_moveToSafeTopLeftOfScreemVisibleFrameAndResize:", v6 * 0.5, v8 * 0.5);

}

- (RPTDragTestParameters)initWithTestName:(id)a3 window:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  RPTDragTestParameters *v12;
  RPTDragTestParameters *v13;
  uint64_t v14;
  id completionHandler;
  uint64_t v16;
  RPTCoordinateSpaceConverter *conversion;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RPTDragTestParameters;
  v12 = -[RPTDragTestParameters init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_testName, a3);
    objc_storeStrong((id *)&v13->_window, a4);
    v14 = MEMORY[0x1B5E1F6E0](v11);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v14;

    +[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    conversion = v13->_conversion;
    v13->_conversion = (RPTCoordinateSpaceConverter *)v16;

  }
  return v13;
}

- (void)_makeDraggableVectors:(CGVector *)a3 forWindow:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  CGFloat v23;
  double Height;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v5 = a4;
  objc_msgSend(v5, "_rpt_safeVisibleFrameOfScreen");
  v7 = v6;
  v27 = v8;
  v28 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "nsWindowFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  Width = CGRectGetWidth(v29);
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  v23 = Width - CGRectGetWidth(v30);
  v31.origin.y = v27;
  v31.origin.x = v28;
  v31.size.width = v11;
  v31.size.height = v13;
  Height = CGRectGetHeight(v31);
  v32.origin.x = v15;
  v32.origin.y = v17;
  v32.size.width = v19;
  v32.size.height = v21;
  v25 = CGRectGetHeight(v32);
  a3->dx = v23;
  v26 = Height - v25;
  a3->dy = 0.0;
  a3[1].dx = 0.0;
  a3[1].dy = v26;
  a3[2].dx = -v23;
  a3[2].dy = 0.0;
  a3[3].dx = 0.0;
  a3[3].dy = -v26;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__RPTDragTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

void __38__RPTDragTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  RPTDragInteraction *v6;
  void *v7;
  id v8;
  uint64_t i;
  void *v10;
  double v11[9];

  v11[8] = *(double *)MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_makeDraggableVectors:forWindow:", v11, v5);

  v6 = [RPTDragInteraction alloc];
  objc_msgSend(*(id *)(a1 + 32), "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RPTDragInteraction initByDraggingWindow:byDelta:](v6, "initByDraggingWindow:byDelta:", v7, v11[0], v11[1]);

  objc_msgSend(v8, "invokeWithComposer:duration:", v3, 1.25);
  for (i = 0; i != 6; i += 2)
  {
    v10 = v8;
    objc_msgSend(v8, "_andThenDragBy:", v11[i + 2], v11[i + 3]);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "invokeWithComposer:duration:", v3, 1.25);
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
