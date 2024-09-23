@implementation _BCCardStackTransitionCoverController

- (void)setupWithCoverSource:(id)a3 cardCoverSource:(id)a4 coverView:(id)a5 isDismiss:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v6 = a6;
  v20 = a3;
  v10 = a4;
  objc_storeStrong((id *)&self->_coverView, a5);
  v11 = a5;
  if (v6)
    v12 = v10;
  else
    v12 = v20;
  if (v6)
    v13 = v20;
  else
    v13 = v10;
  v14 = v12;
  v15 = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardStackTransitioningCoverSourceImage"));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardStackTransitioningCoverSourceImage"));
  v19 = v18;

  objc_msgSend(v11, "setImage:", v19);
  -[_BCCardStackTransitionCoverController _observeImageChangeForCoverSource:](self, "_observeImageChangeForCoverSource:", v15);

}

- (void)setupWithCoverSource:(id)a3 coverView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_storeStrong((id *)&self->_coverView, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardStackTransitioningCoverSourceImage"));
  if (!v7)
    -[_BCCardStackTransitionCoverController _observeImageChangeForCoverSource:](self, "_observeImageChangeForCoverSource:", v8);
  objc_msgSend(v6, "setImage:", v7);

}

- (void)dealloc
{
  objc_super v3;

  -[BCCardStackTransitioningCoverSource setCardStackTransitioningCoverSourceImageChangeObserverBlock:](self->_observedCoverSource, "setCardStackTransitioningCoverSourceImageChangeObserverBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_BCCardStackTransitionCoverController;
  -[_BCCardStackTransitionCoverController dealloc](&v3, "dealloc");
}

- (void)_observeImageChangeForCoverSource:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "setCardStackTransitioningCoverSourceImageChangeObserverBlock:") & 1) != 0)
  {
    -[_BCCardStackTransitionCoverController setObservedCoverSource:](self, "setObservedCoverSource:", v4);
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_A2400;
    v5[3] = &unk_28DD08;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "setCardStackTransitioningCoverSourceImageChangeObserverBlock:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (BCCardStackTransitionCoverView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_coverView, a3);
}

- (BCViewPropertyAnimatorCounter)counter
{
  return self->_counter;
}

- (void)setCounter:(id)a3
{
  objc_storeStrong((id *)&self->_counter, a3);
}

- (BCCardStackTransitioningCoverSource)observedCoverSource
{
  return self->_observedCoverSource;
}

- (void)setObservedCoverSource:(id)a3
{
  objc_storeStrong((id *)&self->_observedCoverSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedCoverSource, 0);
  objc_storeStrong((id *)&self->_counter, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
}

@end
