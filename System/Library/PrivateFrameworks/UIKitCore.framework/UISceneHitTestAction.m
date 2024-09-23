@implementation UISceneHitTestAction

- (UISceneHitTestAction)initWithTouchLocation:(CGPoint)a3 responseHandler:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  id v10;
  UISceneHitTestAction *v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);

  v14[1] = 3221225472;
  v14[2] = __62__UISceneHitTestAction_initWithTouchLocation_responseHandler___block_invoke;
  v14[3] = &unk_1E16C6A58;
  v15 = v7;
  v13.receiver = self;
  v13.super_class = (Class)UISceneHitTestAction;
  v14[0] = MEMORY[0x1E0C809B0];
  v10 = v7;
  v11 = -[UISceneHitTestAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v13, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v8, 0, v14, 0.0);

  return v11;
}

uint64_t __62__UISceneHitTestAction_initWithTouchLocation_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGPoint)touchLocation
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UISceneHitTestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGPointValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)sendResponse:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISceneHitTestAction.m"), 42, CFSTR("you sent back the wrong response class -> %@"), v5);

  }
  v7.receiver = self;
  v7.super_class = (Class)UISceneHitTestAction;
  -[UISceneHitTestAction sendResponse:](&v7, sel_sendResponse_, v5);

}

- (int64_t)UIActionType
{
  return 22;
}

@end
