@implementation SXViewControllerPresentingManager

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[SXViewControllerPresentingManager presentingViewController](self, "presentingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, v4, 0);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v11;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4;
  v35 = a3;
  v13 = a5;
  objc_msgSend(v35, "popoverPresentationController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    objc_msgSend(v35, "setModalPresentationStyle:", 7);
    -[SXViewControllerPresentingManager presentingViewController](self, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:fromView:", v13, x, y, width, height);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    -[SXViewControllerPresentingManager presentingViewController](self, "presentingViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v38.origin.x = v19;
    v38.origin.y = v21;
    v38.size.width = v23;
    v38.size.height = v25;
    v37 = CGRectIntersection(v36, v38);
    v28 = v37.origin.x;
    v29 = v37.origin.y;
    v30 = v37.size.width;
    v31 = v37.size.height;

    objc_msgSend(v15, "setSourceRect:", v28, v29, v30, v31);
    -[SXViewControllerPresentingManager presentingViewController](self, "presentingViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSourceView:", v33);

  }
  -[SXViewControllerPresentingManager presentingViewController](self, "presentingViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "presentViewController:animated:completion:", v35, v11, 0);

}

- (void)popOrDismissViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  -[SXViewControllerPresentingManager presentingViewController](self, "presentingViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v3, 0);
  }
  else
  {
    objc_msgSend(v10, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v10, "navigationController");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        do
        {
          objc_msgSend(v7, "popViewControllerAnimated:", v3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            break;
          objc_msgSend(v7, "navigationController");
          v9 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v9;
        }
        while (v9);

      }
    }
  }

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
