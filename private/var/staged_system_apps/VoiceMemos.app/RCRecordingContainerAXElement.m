@implementation RCRecordingContainerAXElement

- (RCRecordingContainerAXElement)initWithAccessibilityContainer:(id)a3 recordingContainerView:(id)a4
{
  id v6;
  RCRecordingContainerAXElement *v7;
  RCRecordingContainerAXElement *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RCRecordingContainerAXElement;
  v7 = -[RCRecordingContainerAXElement initWithAccessibilityContainer:](&v10, "initWithAccessibilityContainer:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_recordingContainerView, v6);

  return v8;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingContainerAXElement recordingContainerView](self, "recordingContainerView"));
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGPoint result;

  -[RCRecordingContainerAXElement accessibilityFrame](self, "accessibilityFrame");
  v3 = v2 + 4.0;
  v5 = v4 + 4.0;
  result.y = v5;
  result.x = v3;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (UIView)recordingContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_recordingContainerView);
}

- (void)setRecordingContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_recordingContainerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordingContainerView);
}

@end
