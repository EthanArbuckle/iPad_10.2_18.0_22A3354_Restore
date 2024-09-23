@implementation CarSlideUpTransition

- (double)transitionDuration:(id)a3
{
  int64_t v3;
  double result;

  v3 = -[CarSlideUpTransition operation](self, "operation", a3);
  result = 0.3;
  if (v3 != 1)
    result = 0.0;
  if (v3 == 2)
    return 0.2;
  return result;
}

- (void)animateTransition:(id)a3
{
  int64_t v4;
  id v5;

  v5 = a3;
  -[CarSlideUpTransition _sendNavigationBarToBack:](self, "_sendNavigationBarToBack:");
  v4 = -[CarSlideUpTransition operation](self, "operation");
  if (v4 == 1)
  {
    -[CarSlideUpTransition _animateTransitionForPush:](self, "_animateTransitionForPush:", v5);
  }
  else if (v4 == 2)
  {
    -[CarSlideUpTransition _animateTransitionForPop:](self, "_animateTransitionForPop:", v5);
  }

}

- (void)_sendNavigationBarToBack:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  UINavigationBar **p_navigationBar;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "containerView"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  if (v5)
  {
    v6 = (void *)v5;
    p_navigationBar = &self->_navigationBar;
    do
    {
      WeakRetained = objc_loadWeakRetained((id *)p_navigationBar);

      if (WeakRetained)
        break;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews", 0));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            v15 = objc_opt_class(UINavigationBar);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            {
              v16 = objc_storeWeak((id *)p_navigationBar, v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));
              v18 = objc_loadWeakRetained((id *)p_navigationBar);
              objc_msgSend(v17, "sendSubviewToBack:", v18);

              goto LABEL_14;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_14:

      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
      v6 = (void *)v19;
    }
    while (v19);

  }
}

- (void)_bringNavigationBarToFront:(id)a3
{
  UINavigationBar **p_navigationBar;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  p_navigationBar = &self->_navigationBar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_navigationBar);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
    v6 = objc_loadWeakRetained((id *)p_navigationBar);
    objc_msgSend(v5, "bringSubviewToFront:", v6);

  }
}

- (void)_animateTransitionForPush:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  CarSlideUpTransition *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  CGRect v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v5, "addSubview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v5, "addSubview:", v9);
  objc_msgSend(v4, "finalFrameForViewController:", v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "bounds");
  objc_msgSend(v9, "setFrame:", v11, CGRectGetHeight(v34), v15, v17);
  -[CarSlideUpTransition transitionDuration:](self, "transitionDuration:", v4);
  v19 = v18;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100A8E2C4;
  v27[3] = &unk_1011B5388;
  v28 = v7;
  v29 = v9;
  v30 = v11;
  v31 = v13;
  v32 = v15;
  v33 = v17;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A8E2F8;
  v23[3] = &unk_1011E0110;
  v24 = v28;
  v25 = self;
  v26 = v4;
  v20 = v4;
  v21 = v28;
  v22 = v9;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v27, v23, v19, 0.0);

}

- (void)_animateTransitionForPop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat Height;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  CGFloat v28;
  uint64_t v29;
  uint64_t v30;
  CGRect v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v5, "addSubview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v5, "addSubview:", v9);
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setAlpha:", 0.0);
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v31);
  -[CarSlideUpTransition transitionDuration:](self, "transitionDuration:", v4);
  v18 = v17;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100A8E520;
  v24[3] = &unk_1011B5388;
  v25 = v7;
  v26 = v9;
  v27 = v11;
  v28 = Height;
  v29 = v13;
  v30 = v15;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100A8E554;
  v22[3] = &unk_1011ACCB8;
  v22[4] = self;
  v23 = v4;
  v19 = v4;
  v20 = v9;
  v21 = v7;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v24, v22, v18, 0.0);

}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationBar);
}

@end
