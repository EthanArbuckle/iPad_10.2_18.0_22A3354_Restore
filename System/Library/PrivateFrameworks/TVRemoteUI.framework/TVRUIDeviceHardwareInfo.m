@implementation TVRUIDeviceHardwareInfo

- (double)initWithUserIntentButton:(double)a3 volumeUpButton:(double)a4 volumeDownButton:(double)a5 volumeTotalHeight:(double)a6
{
  double *result;
  objc_super v30;

  v30.receiver = a1;
  v30.super_class = (Class)TVRUIDeviceHardwareInfo;
  result = (double *)objc_msgSendSuper2(&v30, sel_init);
  if (result)
  {
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((_QWORD *)result + 10) = a17;
    *((_QWORD *)result + 11) = a18;
    *((_QWORD *)result + 12) = a19;
    *((_QWORD *)result + 13) = a20;
    *((_QWORD *)result + 1) = a21;
    result[2] = a2;
  }
  return result;
}

- (CGPoint)volumeButtonsCenterPoint
{
  double MaxX;
  double v4;
  double v5;
  double MaxY;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  MaxX = CGRectGetMaxX(self->_volumeDownButtonRect);
  v4 = (MaxX - CGRectGetMinX(self->_volumeUpButtonRect)) * 0.5;
  v5 = v4 + CGRectGetMinX(self->_volumeUpButtonRect);
  MaxY = CGRectGetMaxY(self->_volumeDownButtonRect);
  v7 = (MaxY - CGRectGetMinY(self->_volumeUpButtonRect)) * 0.5;
  v8 = v7 + CGRectGetMinY(self->_volumeUpButtonRect);
  v9 = v5;
  result.y = v8;
  result.x = v9;
  return result;
}

- (double)totalHeight
{
  return self->_volumeTotalHeight;
}

- (unsigned)volumeButtonsEdge
{
  if (CGRectGetWidth(self->_volumeUpButtonRect) <= 0.0)
    return CGRectGetMinX(self->_volumeUpButtonRect) > 0.0;
  else
    return 2;
}

- (unsigned)userIntentButtonEdge
{
  if (CGRectGetMinX(self->_userIntentButtonRect) <= 0.0)
    return 0;
  if (CGRectGetMinY(self->_userIntentButtonRect) <= 0.0)
    return 1;
  return 2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSNSStringFromCGRect();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("userIntentButtonRect"));

  BSNSStringFromCGRect();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("volumeUpButtonRect"));

  BSNSStringFromCGRect();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("volumeDownButtonRect"));

  v7 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("totalVolumeHeight"), self->_volumeTotalHeight);
  -[TVRUIDeviceHardwareInfo volumeButtonsCenterPoint](self, "volumeButtonsCenterPoint");
  v8 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("volumeButtonsCenterPoint"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)userIntentButtonRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_userIntentButtonRect.origin.x;
  y = self->_userIntentButtonRect.origin.y;
  width = self->_userIntentButtonRect.size.width;
  height = self->_userIntentButtonRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUserIntentButtonRect:(CGRect)a3
{
  self->_userIntentButtonRect = a3;
}

- (CGRect)volumeUpButtonRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_volumeUpButtonRect.origin.x;
  y = self->_volumeUpButtonRect.origin.y;
  width = self->_volumeUpButtonRect.size.width;
  height = self->_volumeUpButtonRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVolumeUpButtonRect:(CGRect)a3
{
  self->_volumeUpButtonRect = a3;
}

- (CGRect)volumeDownButtonRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_volumeDownButtonRect.origin.x;
  y = self->_volumeDownButtonRect.origin.y;
  width = self->_volumeDownButtonRect.size.width;
  height = self->_volumeDownButtonRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVolumeDownButtonRect:(CGRect)a3
{
  self->_volumeDownButtonRect = a3;
}

- (double)volumeTotalHeight
{
  return self->_volumeTotalHeight;
}

- (void)setVolumeTotalHeight:(double)a3
{
  self->_volumeTotalHeight = a3;
}

@end
