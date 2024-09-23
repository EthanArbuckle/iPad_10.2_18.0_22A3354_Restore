@implementation CarLoadingButton

- (void)setLoading:(BOOL)a3
{
  void *v4;
  UIActivityIndicatorView **p_activityIndicator;
  id WeakRetained;
  id obja;
  id obj;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (a3)
    {
      obja = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(obja, "setAccessibilityIdentifier:", CFSTR("CarLoadingButtonActivityIndicator"));
      objc_msgSend(obja, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CarLoadingButton addSubview:](self, "addSubview:", obja);
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "_maps_constraintsForCenteringInView:", self));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);

      objc_msgSend(obja, "startAnimating");
      objc_storeWeak((id *)&self->_activityIndicator, obja);

    }
    else
    {
      p_activityIndicator = &self->_activityIndicator;
      WeakRetained = objc_loadWeakRetained((id *)&self->_activityIndicator);
      objc_msgSend(WeakRetained, "stopAnimating");

      obj = objc_loadWeakRetained((id *)p_activityIndicator);
      objc_msgSend(obj, "removeFromSuperview");

    }
  }
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_activityIndicator);
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeWeak((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityIndicator);
}

@end
