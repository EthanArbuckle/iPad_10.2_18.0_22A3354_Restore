@implementation _TVRemoteAlertVisualStyle_Pad

- (double)remoteWidth
{
  return 375.0;
}

- (double)remoteHeight
{
  return 812.0;
}

- (double)minimizedCornerRadius
{
  return 10.0;
}

- (double)maximizedCornerRadius
{
  return 40.0;
}

- (CGRect)frameForParentView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v5 = CGRectGetHeight(v27) + -27.0 + -27.0;
  -[_TVRemoteAlertVisualStyle_Pad remoteHeight](self, "remoteHeight");
  if (v5 > v6)
  {
    -[_TVRemoteAlertVisualStyle_Pad remoteHeight](self, "remoteHeight");
    v5 = v7;
  }
  objc_msgSend(v4, "bounds");
  v8 = CGRectGetWidth(v28) * 0.5;
  -[_TVRemoteAlertVisualStyle_Pad remoteWidth](self, "remoteWidth");
  v10 = v8 - v9 * 0.5;
  objc_msgSend(v4, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  v19 = CGRectGetHeight(v29) * 0.5;
  -[_TVRemoteAlertVisualStyle_Pad remoteHeight](self, "remoteHeight");
  v21 = v19 - v20 * 0.5;
  -[_TVRemoteAlertVisualStyle_Pad remoteWidth](self, "remoteWidth");
  v23 = v22;
  v24 = v10;
  v25 = v21;
  v26 = v5;
  result.size.height = v26;
  result.size.width = v23;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)foregroundVisualEffect
{
  return (id)objc_msgSend(MEMORY[0x24BEBD428], "effectWithBlurRadius:", 20.0);
}

- (id)backgroundMaterialView
{
  return +[TVRMaterialView backgroundMaterialViewWithWeighting:](TVRMaterialView, "backgroundMaterialViewWithWeighting:", 0.0);
}

- (BOOL)allowsTapToDismiss
{
  return 1;
}

- (BOOL)allowsSwipeToDismiss
{
  return 0;
}

- (double)crossfadeDuration
{
  return 0.2;
}

@end
