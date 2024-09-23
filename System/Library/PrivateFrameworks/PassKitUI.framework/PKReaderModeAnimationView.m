@implementation PKReaderModeAnimationView

- (PKReaderModeAnimationView)initWithAssetName:(id)a3 forPhoneTarget:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  PKReaderModeAnimationView *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0DC3BF8];
  v7 = a3;
  objc_msgSend(v6, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = -[PKReaderModeAnimationView initWithFrame:assetName:forPhoneTarget:](self, "initWithFrame:assetName:forPhoneTarget:", v7, v4, 0.0, 0.0);

  return v9;
}

- (PKReaderModeAnimationView)initWithFrame:(CGRect)a3 assetName:(id)a4 forPhoneTarget:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  PKReaderModeAnimationView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  CAPackage *package;
  NSObject *v19;
  uint64_t v20;
  CALayer *phoneLayer;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  void *v28;
  uint64_t v29;
  CAStateController *stateController;
  CATransform3D v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PKReaderModeAnimationView;
  v12 = -[PKReaderModeAnimationView initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    PKPassKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLForResource:withExtension:", v11, CFSTR("caar"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0CD3070];
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v14, v15, 0, &v33);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v33;
    package = v12->_package;
    v12->_package = (CAPackage *)v16;

    if (!v12->_package)
    {
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v36 = v14;
        v37 = 2114;
        v38 = v11;
        v39 = 2114;
        v40 = v17;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Error loading mica animation archive URL: %{public}@, asset name: %{public}@, error: %{public}@", buf, 0x20u);
      }

    }
    v12->_isPhoneTarget = a5;
    -[CAPackage rootLayer](v12->_package, "rootLayer");
    v20 = objc_claimAutoreleasedReturnValue();
    phoneLayer = v12->_phoneLayer;
    v12->_phoneLayer = (CALayer *)v20;

    -[CALayer setGeometryFlipped:](v12->_phoneLayer, "setGeometryFlipped:", -[CAPackage isGeometryFlipped](v12->_package, "isGeometryFlipped"));
    -[CALayer size](v12->_phoneLayer, "size");
    v23 = width / v22;
    -[PKReaderModeAnimationView layer](v12, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v32, v23, v23, 1.0);
    objc_msgSend(v24, "setTransform:", &v32);

    -[CALayer size](v12->_phoneLayer, "size");
    v26 = v23 * v25;
    -[CALayer size](v12->_phoneLayer, "size");
    -[PKReaderModeAnimationView setFrame:](v12, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v26, v23 * v27);
    -[PKReaderModeAnimationView layer](v12, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", v12->_phoneLayer);

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", v12->_phoneLayer);
    stateController = v12->_stateController;
    v12->_stateController = (CAStateController *)v29;

  }
  return v12;
}

- (void)setPlasticCardImage:(id)a3
{
  -[PKReaderModeAnimationView setImage:forPublishedObjectWithName:](self, "setImage:forPublishedObjectWithName:", a3, CFSTR("Plastic_Card"));
}

- (void)setDigitalCardImage:(id)a3
{
  const __CFString *v3;

  if (self->_isPhoneTarget)
    v3 = CFSTR("Digital_Card_Phone");
  else
    v3 = CFSTR("Digital_Card");
  -[PKReaderModeAnimationView setImage:forPublishedObjectWithName:](self, "setImage:forPublishedObjectWithName:", a3, v3);
}

- (void)setWatchAssetImage:(id)a3
{
  -[PKReaderModeAnimationView setImage:forPublishedObjectWithName:](self, "setImage:forPublishedObjectWithName:", a3, CFSTR("Watch_Asset"));
}

- (void)setImage:(id)a3 forPublishedObjectWithName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    v6 = objc_retainAutorelease(a3);
    v7 = a4;
    v8 = objc_msgSend(v6, "CGImage");
    -[CAPackage publishedObjectWithName:](self->_package, "publishedObjectWithName:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setContents:", v8);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[CALayer size](self->_phoneLayer, "size", a3.width, a3.height);
  v6 = width * (v5 / v4);
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  -[PKReaderModeAnimationView setState:animated:](self, "setState:animated:", a3, 0);
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  self->_state = a3;
  -[PKReaderModeAnimationView _setState:animated:](self, "_setState:animated:", -[PKReaderModeAnimationView animationStateForProvisioningViewState:](self, "animationStateForProvisioningViewState:"), a4);
}

- (unint64_t)animationStateForProvisioningViewState:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return qword_19DF17C40[a3 - 1];
}

- (void)_setState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  double v9;
  CAStateController *stateController;
  CALayer *phoneLayer;
  __CFString *v12;

  v4 = a4;
  if (a3)
  {
    if (a3 == 2)
    {
      if (self->_isPhoneTarget)
        v7 = CFSTR("Done_Phone");
      else
        v7 = CFSTR("Done");
      v6 = v7;
    }
    else
    {
      if (a3 != 1)
        return;
      v6 = CFSTR("Hold");
    }
  }
  else
  {
    v6 = CFSTR("Animate On");
  }
  v12 = (__CFString *)v6;
  -[CALayer stateWithName:](self->_phoneLayer, "stateWithName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    stateController = self->_stateController;
    phoneLayer = self->_phoneLayer;
    if (v4)
    {
      LODWORD(v9) = 1.0;
      -[CAStateController setState:ofLayer:transitionSpeed:](stateController, "setState:ofLayer:transitionSpeed:", v8, phoneLayer, v9);
    }
    else
    {
      -[CAStateController setState:ofLayer:](stateController, "setState:ofLayer:", v8, phoneLayer);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_phoneLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
