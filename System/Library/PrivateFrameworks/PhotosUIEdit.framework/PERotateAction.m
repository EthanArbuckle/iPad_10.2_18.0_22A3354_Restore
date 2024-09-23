@implementation PERotateAction

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PERotateAction: applyToLoadResult on asset: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v6, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustmentConstants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "PIOrientationAdjustmentKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__PERotateAction_applyToLoadResult_completion___block_invoke;
  v14[3] = &unk_24C618460;
  v14[4] = self;
  objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v13, v14);

  v7[2](v7, 1);
}

- (int64_t)actionType
{
  return 6;
}

- (int64_t)rotateDirection
{
  return self->_rotateDirection;
}

- (void)setRotateDirection:(int64_t)a3
{
  self->_rotateDirection = a3;
}

void __47__PERotateAction_applyToLoadResult_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "orientation");
  objc_msgSend(*(id *)(a1 + 32), "rotateDirection");
  objc_msgSend(v3, "setOrientation:", NUOrientationConcat());

}

@end
