@implementation MFCollectionViewPagingAnimator

- (MFCollectionViewPagingAnimator)initWithCollectionView:(id)a3
{
  id v4;
  MFCollectionViewPagingAnimator *v5;
  MFCollectionViewPagingAnimator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFCollectionViewPagingAnimator;
  v5 = -[MFCollectionViewPagingAnimator init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MFCollectionViewPagingAnimator setCollectionView:](v5, "setCollectionView:", v4);

  return v6;
}

- (void)scrollToItemAtIndexPath:(id)a3 dynamicOffset:(id)a4 shouldAdjustToShowPreviousMessage:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  id v34;
  _QWORD *v35;
  void *v36;
  _QWORD v37[5];
  void (**v38)(_QWORD);
  _QWORD v39[4];
  id v40;
  double v41;
  BOOL v42;
  CGRect v43;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(_QWORD))a7;
  -[MFCollectionViewPagingAnimator cancelAllAnimations](self, "cancelAllAnimations");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollectionViewPagingAnimator collectionView](self, "collectionView"));
  objc_msgSend(v15, "_systemContentInset");
  v17 = v16;
  objc_msgSend(v15, "contentInset");
  if (v13)
  {
    objc_msgSend(v15, "mf_contentOffsetApplyingDynamicOffset:indexPath:", v13, v12);
    v20 = v19;
  }
  else
  {
    v21 = v17 + v18;
    if (objc_msgSend(v12, "item"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollectionViewPagingAnimator collectionView](self, "collectionView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layoutAttributesForItemAtIndexPath:", v12));

      if (v23)
      {
        objc_msgSend(v23, "frame");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        if (v9)
          -[MFCollectionViewPagingAnimator autoScrollOffsetAdjustment](self, "autoScrollOffsetAdjustment");
        else
          -[MFCollectionViewPagingAnimator autoScrollOffsetAdjustmentWithoutPreviousMessage](self, "autoScrollOffsetAdjustmentWithoutPreviousMessage");
        v33 = v32;
        v43.origin.x = v25;
        v43.origin.y = v27;
        v43.size.width = v29;
        v43.size.height = v31;
        v20 = CGRectGetMinY(v43) - (v21 + v33);
      }
      else
      {
        v20 = 0.0;
      }

    }
    else
    {
      v20 = -v21;
    }
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10014E948;
  v39[3] = &unk_10051CDC8;
  v34 = v15;
  v40 = v34;
  v41 = v20;
  v42 = v8;
  v35 = objc_retainBlock(v39);
  v36 = v35;
  if (v8)
  {
    -[MFCollectionViewPagingAnimator setAnimatingScroll:](self, "setAnimatingScroll:", 1);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10014EAA4;
    v37[3] = &unk_10051D7E0;
    v37[4] = self;
    v38 = v14;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v36, v37, 0.45, 0.0, 1.0, 0.0);

  }
  else
  {
    ((void (*)(_QWORD *))v35[2])(v35);
    if (v14)
      v14[2](v14);
  }

}

- (void)bounceAlongEdge:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double Height;
  double v15;
  double v16;
  double v17;
  id v18;
  _QWORD v19[4];
  id v20;
  MFCollectionViewPagingAnimator *v21;
  double v22;
  _QWORD v23[4];
  id v24;
  double v25;
  CGRect v26;

  if (a3 != 1 && a3 != 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFCollectionViewPagingAnimator.m"), 98, CFSTR("bounceOnEdge currently only supports UIRectEdgeTop and UIRectEdgeBottom"));

  }
  -[MFCollectionViewPagingAnimator cancelAllAnimations](self, "cancelAllAnimations");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollectionViewPagingAnimator collectionView](self, "collectionView"));
  v8 = v7;
  if (a3 == 1)
  {
    objc_msgSend(v7, "contentInset");
    v10 = -v9;
    v11 = -70.0 - v9;
  }
  else
  {
    objc_msgSend(v7, "contentSize");
    v13 = v12;
    objc_msgSend(v8, "frame");
    Height = CGRectGetHeight(v26);
    objc_msgSend(v8, "contentInset");
    v16 = v15;
    objc_msgSend(v8, "contentOffset");
    if (v13 - (Height - v16) >= v17)
      v10 = v13 - (Height - v16);
    else
      v10 = v17;
    v11 = v10 + 70.0;
  }
  -[MFCollectionViewPagingAnimator setAnimatingScroll:](self, "setAnimatingScroll:", 1);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10014ECD4;
  v23[3] = &unk_10051ABD8;
  v24 = v8;
  v25 = v11;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10014ECE4;
  v19[3] = &unk_100520998;
  v18 = v24;
  v22 = v10;
  v20 = v18;
  v21 = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v23, v19, 0.2, 0.0);

}

- (void)cancelAllAnimations
{
  void *v3;
  id v4;
  id v5;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFCollectionViewPagingAnimator collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v3, "removeAllAnimations");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFCollectionViewPagingAnimator collectionView](self, "collectionView"));
  objc_msgSend(v5, "_stopScrollingAndZoomingAnimations");

}

- (double)autoScrollOffsetAdjustment
{
  return self->_autoScrollOffsetAdjustment;
}

- (void)setAutoScrollOffsetAdjustment:(double)a3
{
  self->_autoScrollOffsetAdjustment = a3;
}

- (double)autoScrollOffsetAdjustmentWithoutPreviousMessage
{
  return self->_autoScrollOffsetAdjustmentWithoutPreviousMessage;
}

- (void)setAutoScrollOffsetAdjustmentWithoutPreviousMessage:(double)a3
{
  self->_autoScrollOffsetAdjustmentWithoutPreviousMessage = a3;
}

- (BOOL)isAnimatingScroll
{
  return self->_animatingScroll;
}

- (void)setAnimatingScroll:(BOOL)a3
{
  self->_animatingScroll = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
