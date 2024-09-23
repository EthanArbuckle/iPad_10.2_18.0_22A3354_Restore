@implementation _PGPictureInPictureConnectionExportedObject

- (_PGPictureInPictureConnectionExportedObject)initWithPictureInPictureProxy:(id)a3
{
  id v4;
  NSObject *v5;
  _PGPictureInPictureConnectionExportedObject *v6;
  _PGPictureInPictureConnectionExportedObject *v7;
  objc_super v9;

  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  v9.receiver = self;
  v9.super_class = (Class)_PGPictureInPictureConnectionExportedObject;
  v6 = -[_PGPictureInPictureConnectionExportedObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_pictureInPictureProxy, v4);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  v4.receiver = self;
  v4.super_class = (Class)_PGPictureInPictureConnectionExportedObject;
  -[_PGPictureInPictureConnectionExportedObject dealloc](&v4, sel_dealloc);
}

- (void)pictureInPictureStartRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  PGPictureInPictureProxy **p_pictureInPictureProxy;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "pictureInPictureStartRequestedAnimated:withCompletionHandler:", v4, v6);

}

- (void)pictureInPictureStopRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  PGPictureInPictureProxy **p_pictureInPictureProxy;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "pictureInPictureStopRequestedAnimated:withCompletionHandler:", v4, v6);

}

- (void)beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:(id)a3
{
  PGPictureInPictureProxy **p_pictureInPictureProxy;
  id v4;
  id WeakRetained;

  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:", v4);

}

- (void)endTwoStagePictureInPictureStopWithCompletionBlock:(id)a3
{
  PGPictureInPictureProxy **p_pictureInPictureProxy;
  id v4;
  id WeakRetained;

  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "endTwoStagePictureInPictureStopWithCompletionBlock:", v4);

}

- (void)pictureInPictureCancelRequestedAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  PGPictureInPictureProxy **p_pictureInPictureProxy;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "pictureInPictureCancelRequestedAnimated:withCompletionHandler:", v4, v6);

}

- (void)updatePictureInPicturePossible:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "updatePictureInPicturePossible:", v3);

}

- (void)pictureInPictureInvalidated
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "pictureInPictureInvalidated");

}

- (void)pagingSkipByNumberOfPages:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "pagingSkipByNumberOfPages:", a3);

}

- (void)updateHostedWindowSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5 synchronizationFence:(id)a6
{
  double height;
  double width;
  PGPictureInPictureProxy **p_pictureInPictureProxy;
  id v11;
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "updateHostedWindowSize:animationType:initialSpringVelocity:synchronizationFence:", a4, v11, width, height, a5);

}

- (void)hostedWindowSizeChangeBegan
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "hostedWindowSizeChangeBegan");

}

- (void)hostedWindowSizeChangeEnded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "hostedWindowSizeChangeEnded");

}

- (void)actionButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "actionButtonTapped");

}

- (void)setStashedOrUnderLock:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "setStashedOrUnderLock:", v3);

}

- (void)setResourcesUsageReductionReasons:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "setResourcesUsageReductionReasons:", a3);

}

- (void)handleCommand:(id)a3
{
  PGPictureInPictureProxy **p_pictureInPictureProxy;
  id v4;
  id WeakRetained;

  p_pictureInPictureProxy = &self->_pictureInPictureProxy;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pictureInPictureProxy);
  objc_msgSend(WeakRetained, "handleCommand:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pictureInPictureProxy);
}

@end
