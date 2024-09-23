@implementation _TVRUIControlCenterSheetPresentationController

- (void)presentationTransitionWillBegin
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVRUIControlCenterSheetPresentationController;
  -[_TVRUIControlCenterSheetPresentationController presentationTransitionWillBegin](&v7, sel_presentationTransitionWillBegin);
  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[_TVRUIControlCenterSheetPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  CCUIExpandedModuleContinuousCornerRadius();
  objc_msgSend(v4, "_setContinuousCornerRadius:");
  objc_msgSend(v4, "setClipsToBounds:", 1);
  -[_TVRUIControlCenterSheetPresentationController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskView:", v4);

}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double Width;
  double Height;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  -[_TVRUIControlCenterSheetPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v39 = v7;
  v40 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[_TVRUIControlCenterSheetPresentationController sourceViewController](self, "sourceViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[_TVRUIControlCenterSheetPresentationController containerView](self, "containerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:fromView:", v14, v16, v18, v20, v22);
  v44 = v25;
  v45 = v24;
  v42 = v27;
  v43 = v26;

  v46.origin.x = v6;
  v46.origin.y = v8;
  v46.size.width = v10;
  v46.size.height = v12;
  v28 = CGRectGetWidth(v46) * 0.5;
  v47.origin.x = v16;
  v47.origin.y = v18;
  v47.size.width = v20;
  v47.size.height = v22;
  v41 = v28 - CGRectGetWidth(v47) * 0.5;
  v48.origin.y = v39;
  v48.origin.x = v40;
  v48.size.width = v10;
  v48.size.height = v12;
  v29 = CGRectGetHeight(v48) * 0.5;
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v20;
  v49.size.height = v22;
  v30 = v29 - CGRectGetHeight(v49) * 0.5;
  v50.origin.x = v16;
  v50.origin.y = v18;
  v50.size.width = v20;
  v50.size.height = v22;
  Width = CGRectGetWidth(v50);
  v51.origin.x = v16;
  v51.origin.y = v18;
  v51.size.width = v20;
  v51.size.height = v22;
  Height = CGRectGetHeight(v51);
  v33 = -[_TVRUIControlCenterSheetPresentationController layoutStyle](self, "layoutStyle");
  if (v33 == 2)
    v34 = v41;
  else
    v34 = v45;
  if (v33 != 2)
  {
    v30 = v44;
    Width = v43;
    Height = v42;
  }

  v35 = v34;
  v36 = v30;
  v37 = Width;
  v38 = Height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setSourceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewController, a3);
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewController, 0);
}

@end
