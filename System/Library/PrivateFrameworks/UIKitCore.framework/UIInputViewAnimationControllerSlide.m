@implementation UIInputViewAnimationControllerSlide

- (UIInputViewAnimationControllerSlide)initWithSlide:(int)a3
{
  UIInputViewAnimationControllerSlide *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIInputViewAnimationControllerSlide;
  result = -[UIInputViewAnimationControllerSlide init](&v5, sel_init);
  if (result)
    result->_slide = a3;
  return result;
}

- (id)placementForSlideStart:(BOOL)a3
{
  int slide;
  void *v4;

  slide = self->_slide;
  if (slide == 5 || slide == 4)
    v4 = (void *)objc_opt_class();
  else
    v4 = 0;
  return (id)objc_msgSend(v4, "placement");
}

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIInputViewAnimationControllerSlideContext *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(UIInputViewAnimationControllerSlideContext);
  objc_msgSend(v10, "updateToPlacement:withNormalAnimationsAndNotifications:", v9, 0);

  objc_msgSend(v10, "transitioningView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshotViewAfterScreenUpdates:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewAnimationControllerSlideContext setSnapshot:](v11, "setSnapshot:", v13);

  objc_msgSend(v10, "transitioningFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[UIInputViewAnimationControllerSlide placementForSlideStart:](self, "placementForSlideStart:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateToPlacement:withNormalAnimationsAndNotifications:", v22, 0);

  objc_msgSend(v10, "transitioningFrame");
  -[UIInputViewAnimationControllerSlideContext setSnapshotEndFrame:](v11, "setSnapshotEndFrame:");
  -[UIInputViewAnimationControllerSlide placementForSlideStart:](self, "placementForSlideStart:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateToPlacement:withNormalAnimationsAndNotifications:", v23, 0);

  -[UIInputViewAnimationControllerSlideContext snapshot](v11, "snapshot");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v15, v17, v19, v21);

  -[UIInputViewAnimationControllerSlideContext setEndPlacement:](v11, "setEndPlacement:", v8);
  return v11;
}

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v5 = a3;
  objc_msgSend(v16, "snapshotEndFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v16, "snapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  objc_msgSend(v16, "endPlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateToPlacement:withNormalAnimationsAndNotifications:", v15, 1);

}

- (void)completeAnimationWithHost:(id)a3 context:(id)a4
{
  id v4;

  objc_msgSend(a4, "snapshot", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

@end
