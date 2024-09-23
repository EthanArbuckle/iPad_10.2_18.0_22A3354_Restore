@implementation THNavigationViewController

- (THNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  THNavigationViewController *v7;
  objc_super v9;

  v6 = THBundle();
  v9.receiver = self;
  v9.super_class = (Class)THNavigationViewController;
  v7 = -[THNavigationViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, v6);
  if (v7)
    v7->mViewControllers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v7;
}

- (THNavigationViewController)initWithRootViewController:(id)a3
{
  THNavigationViewController *v4;
  THNavigationViewController *v5;

  v4 = -[THNavigationViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (a3 && v4)
    -[THNavigationViewController pushViewController:animated:](v4, "pushViewController:animated:", a3, 0);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THNavigationViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)THNavigationViewController;
  -[THNavigationViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3;

  -[UINavigationBar setItems:animated:](-[THNavigationViewController navigationBar](self, "navigationBar"), "setItems:animated:", 0, 0);
  -[UINavigationBar setDelegate:](-[THNavigationViewController navigationBar](self, "navigationBar"), "setDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)THNavigationViewController;
  -[THNavigationViewController viewDidLoad](&v3, "viewDidLoad");
}

- (void)releaseViews
{
  -[THNavigationViewController setContentContainerView:](self, "setContentContainerView:", 0);
  -[THNavigationViewController setFooterView:](self, "setFooterView:", 0);
  -[THNavigationViewController setNavigationBar:](self, "setNavigationBar:", 0);
}

- (UIViewController)topViewController
{
  UIViewController *result;

  result = (UIViewController *)-[NSMutableArray count](self->mViewControllers, "count");
  if (result)
    return (UIViewController *)-[NSMutableArray objectAtIndex:](self->mViewControllers, "objectAtIndex:", (char *)&result[-1].super.super.isa + 7);
  return result;
}

- (void)p_animateFromVC:(id)a3 toVC:(id)a4 transition:(int)a5 completion:(id)a6
{
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  double v32;
  double v33;
  _QWORD v34[2];
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  id v38;
  THNavigationViewController *v39;
  id v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[15];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (a3 && !objc_msgSend(objc_msgSend(a3, "view"), "superview"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationViewController p_animateFromVC:toVC:transition:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationViewController.m"), 85, CFSTR("invalid fromVC - %@"), a3);
  if (objc_msgSend(objc_msgSend(a4, "view"), "superview"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationViewController p_animateFromVC:toVC:transition:completion:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationViewController.m"), 86, CFSTR("expected nil value for '%s'"), "toVC.view.superview");
  -[THNavigationViewController addChildViewController:](self, "addChildViewController:", a4);
  objc_msgSend(a3, "willMoveToParentViewController:", 0);
  -[UIView frame](-[THNavigationViewController contentContainerView](self, "contentContainerView"), "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(objc_msgSend(a4, "view"), "frame");
  v21 = v20;
  v33 = v19;
  if (a5 == 2)
  {
    v47.origin.x = v12;
    v47.origin.y = v14;
    v47.size.width = v16;
    v47.size.height = v18;
    Width = CGRectGetWidth(v47);
  }
  else
  {
    Width = v19;
    if (a5 == 1)
    {
      v46.origin.x = v12;
      v46.origin.y = v14;
      v46.size.width = v16;
      v46.size.height = v18;
      Width = -CGRectGetWidth(v46);
    }
  }
  v32 = v21;
  objc_msgSend(objc_msgSend(a4, "view"), "setFrame:", Width, v21, v16, v18);
  objc_msgSend(objc_msgSend(a3, "view"), "frame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if (a5 == 2)
  {
    v49.origin.x = v12;
    v49.origin.y = v14;
    v49.size.width = v16;
    v49.size.height = v18;
    v23 = -CGRectGetWidth(v49);
  }
  else if (a5 == 1)
  {
    v48.origin.x = v12;
    v48.origin.y = v14;
    v48.size.width = v16;
    v48.size.height = v18;
    v23 = CGRectGetWidth(v48);
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_12B420;
  v45[3] = &unk_429E08;
  v45[4] = a4;
  v45[5] = self;
  *(double *)&v45[7] = v33;
  *(double *)&v45[8] = v32;
  *(double *)&v45[9] = v16;
  *(double *)&v45[10] = v18;
  v45[6] = a3;
  *(double *)&v45[11] = v23;
  v45[12] = v26;
  v45[13] = v28;
  v45[14] = v30;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v35 = sub_12B4C0;
  v36 = &unk_429E30;
  v41 = v24;
  v42 = v26;
  v43 = v28;
  v44 = v30;
  v37 = a3;
  v38 = a4;
  v39 = self;
  v40 = a6;
  if (a3
    && a4
    && a5
    && (v31 = objc_msgSend(a3, "parentViewController"), v31 == objc_msgSend(a4, "parentViewController")))
  {
    -[THNavigationViewController transitionFromViewController:toViewController:duration:options:animations:completion:](self, "transitionFromViewController:toViewController:duration:options:animations:completion:", a3, a4, 0, v45, v34, 0.3);
  }
  else
  {
    sub_12B420((uint64_t)v45);
    v35((uint64_t)v34, 1);
  }
}

- (void)p_pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  UIViewController *v7;
  uint64_t v8;

  if (a3
    && (v5 = a4,
        -[NSMutableArray indexOfObjectIdenticalTo:](self->mViewControllers, "indexOfObjectIdenticalTo:") == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = -[THNavigationViewController topViewController](self, "topViewController");
    -[NSMutableArray addObject:](self->mViewControllers, "addObject:", a3);
    if ((*(_BYTE *)&self->_flags & 3) == 1)
      -[UINavigationBar pushNavigationItem:animated:](-[THNavigationViewController navigationBar](self, "navigationBar"), "pushNavigationItem:animated:", objc_msgSend(a3, "navigationItem"), v5);
    if (v5)
      v8 = 2;
    else
      v8 = 0;
    -[THNavigationViewController p_animateFromVC:toVC:transition:completion:](self, "p_animateFromVC:toVC:transition:completion:", v7, a3, v8, 0);
  }
  else
  {
    *(_BYTE *)&self->_flags &= 0xFCu;
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v5;

  if (a3 && (*(_BYTE *)&self->_flags & 3) == 0)
  {
    v5 = a4;
    if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mViewControllers, "indexOfObjectIdenticalTo:") == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 1;
      -[THNavigationViewController p_pushViewController:animated:](self, "p_pushViewController:animated:", a3, v5);
    }
  }
}

- (id)p_popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  char *v6;
  id v7;
  UIViewController *v8;

  v3 = a3;
  v5 = (char *)-[NSMutableArray count](self->mViewControllers, "count");
  if (v5)
  {
    v6 = v5 - 1;
    v7 = -[NSMutableArray objectAtIndex:](self->mViewControllers, "objectAtIndex:", v5 - 1);
    -[NSMutableArray removeObjectAtIndex:](self->mViewControllers, "removeObjectAtIndex:", v6);
    v8 = -[THNavigationViewController topViewController](self, "topViewController");
    if ((*(_BYTE *)&self->_flags & 3) == 1)
      -[UINavigationBar popNavigationItemAnimated:](-[THNavigationViewController navigationBar](self, "navigationBar"), "popNavigationItemAnimated:", v3);
    -[THNavigationViewController p_animateFromVC:toVC:transition:completion:](self, "p_animateFromVC:toVC:transition:completion:", v7, v8, v3, 0);
  }
  else
  {
    v7 = 0;
    *(_BYTE *)&self->_flags &= 0xFCu;
  }
  return v7;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = -[NSMutableArray count](self->mViewControllers, "count");
  if ((*(_BYTE *)&self->_flags & 3) == 0 && v5 != 0)
  {
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 1;
    -[THNavigationViewController p_popViewControllerAnimated:](self, "p_popViewControllerAnimated:", v3);
  }
  return 0;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  char *v9;
  char *v10;
  BOOL v11;
  char *v12;
  id v14;
  char *v15;
  NSMutableArray *v16;
  NSMutableArray *mViewControllers;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  UIViewController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a4;
  v9 = (char *)-[NSMutableArray count](self->mViewControllers, "count");
  v10 = (char *)-[NSMutableArray indexOfObjectIdenticalTo:](self->mViewControllers, "indexOfObjectIdenticalTo:", a3);
  v11 = (*(_BYTE *)&self->_flags & 3) != 0 || v10 == (char *)0x7FFFFFFFFFFFFFFFLL;
  v12 = v10 + 1;
  if (!v11 && v9 > v12)
  {
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 1;
    v23 = -[THNavigationViewController topViewController](self, "topViewController");
    v15 = (char *)(v9 - v12);
    v14 = -[NSMutableArray subarrayWithRange:](self->mViewControllers, "subarrayWithRange:", v12, v9 - v12);
    -[NSMutableArray removeObjectsInRange:](self->mViewControllers, "removeObjectsInRange:", v12, v15);
    v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMutableArray count](self->mViewControllers, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    mViewControllers = self->mViewControllers;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mViewControllers, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(mViewControllers);
          -[NSMutableArray addObject:](v16, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "navigationItem"));
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mViewControllers, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }
    -[UINavigationBar setItems:animated:](-[THNavigationViewController navigationBar](self, "navigationBar"), "setItems:animated:", v16, v6);
    -[THNavigationViewController p_animateFromVC:toVC:transition:completion:](self, "p_animateFromVC:toVC:transition:completion:", v23, a3, v6, a5);
  }
  else
  {
    if (a5)
      (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
    return 0;
  }
  return v14;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  id v7;

  v5 = a3;
  if (-[NSMutableArray count](self->mViewControllers, "count"))
    v7 = -[NSMutableArray objectAtIndex:](self->mViewControllers, "objectAtIndex:", 0);
  else
    v7 = 0;
  return -[THNavigationViewController popToViewController:animated:completion:](self, "popToViewController:animated:completion:", v7, v5, a4);
}

- (THNavigationViewController)viewControllerWithNavigationItem:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  THNavigationViewController *v8;

  v5 = -[NSMutableArray count](self->mViewControllers, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  while (1)
  {
    v8 = (THNavigationViewController *)-[NSMutableArray objectAtIndex:](self->mViewControllers, "objectAtIndex:", v7);
    if (-[THNavigationViewController navigationItem](v8, "navigationItem") == a3)
      break;
    if (v6 == (id)++v7)
      return 0;
  }
  return v8;
}

- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4
{
  BOOL v4;
  THNavigationViewController *v6;

  if ((*(_BYTE *)&self->_flags & 3) != 0)
    return 1;
  v6 = -[THNavigationViewController viewControllerWithNavigationItem:](self, "viewControllerWithNavigationItem:", a4);
  if (!v6)
    return 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 2;
  v4 = 1;
  -[THNavigationViewController p_pushViewController:animated:](self, "p_pushViewController:animated:", v6, 1);
  return v4;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  BOOL v4;

  if ((*(_BYTE *)&self->_flags & 3) != 0)
    return 1;
  if (!-[THNavigationViewController viewControllerWithNavigationItem:](self, "viewControllerWithNavigationItem:", a4))
    return 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 2;
  v4 = 1;
  -[THNavigationViewController p_popViewControllerAnimated:](self, "p_popViewControllerAnimated:", 1);
  return v4;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
