@implementation _LookAroundViewState

- (_LookAroundViewState)initWithLookAroundView:(id)a3
{
  id v5;
  _LookAroundViewState *v6;
  _LookAroundViewState *v7;
  uint64_t v8;
  UIView *superview;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LookAroundViewState;
  v6 = -[_LookAroundViewState init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lookAroundView, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
    superview = v7->_superview;
    v7->_superview = (UIView *)v8;

    v7->_compassHidden = objc_msgSend(v5, "isCompassHidden");
    v7->_navigatingEnabled = objc_msgSend(v5, "navigatingEnabled");
    v7->_panningEnabled = objc_msgSend(v5, "panningEnabled");
    v7->_zoomingEnabled = objc_msgSend(v5, "zoomingEnabled");
    v7->_showsPointLabels = objc_msgSend(v5, "showsPointLabels");
    v7->_showsRoadLabels = objc_msgSend(v5, "showsRoadLabels");
  }

  return v7;
}

- (void)restoreStateToLookAroundView:(id)a3
{
  UIView *superview;
  id v5;

  superview = self->_superview;
  v5 = a3;
  -[UIView insertSubview:atIndex:](superview, "insertSubview:atIndex:", v5, 0);
  objc_msgSend(v5, "setCompassHidden:", self->_compassHidden);
  objc_msgSend(v5, "setNavigatingEnabled:", self->_navigatingEnabled);
  objc_msgSend(v5, "setPanningEnabled:", self->_panningEnabled);
  objc_msgSend(v5, "setZoomingEnabled:", self->_zoomingEnabled);
  objc_msgSend(v5, "setShowsRoadLabels:", self->_showsRoadLabels);
  objc_msgSend(v5, "setShowsPointLabels:", self->_showsPointLabels);

}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (UIView)superview
{
  return self->_superview;
}

- (BOOL)compassHidden
{
  return self->_compassHidden;
}

- (BOOL)navigatingEnabled
{
  return self->_navigatingEnabled;
}

- (BOOL)panningEnabled
{
  return self->_panningEnabled;
}

- (BOOL)zoomingEnabled
{
  return self->_zoomingEnabled;
}

- (BOOL)showsPointLabels
{
  return self->_showsPointLabels;
}

- (BOOL)showsRoadLabels
{
  return self->_showsRoadLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superview, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
}

@end
