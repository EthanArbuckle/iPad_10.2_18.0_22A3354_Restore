@implementation UIFrameAnimation

- (UIFrameAnimation)initWithTarget:(id)a3
{
  UIFrameAnimation *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIFrameAnimation;
  result = -[UIAnimation initWithTarget:](&v4, sel_initWithTarget_, a3);
  if (result)
    result->_fieldsToChange = 255;
  return result;
}

- (void)setStartFrame:(CGRect)a3
{
  self->_startFrame = a3;
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (CGRect)endFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endFrame.origin.x;
  y = self->_endFrame.origin.y;
  width = self->_endFrame.size.width;
  height = self->_endFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSignificantRectFields:(int)a3
{
  self->_fieldsToChange = a3;
}

- (void)setProgress:(float)a3
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  int fieldsToChange;
  double v13;
  float v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat rect2;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  objc_msgSend(self->super._target, "frame");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v31 = CGRectIntegral(v30);
  rect2 = v31.origin.x;
  v9 = v31.origin.y;
  v10 = v31.size.width;
  v11 = v31.size.height;
  fieldsToChange = self->_fieldsToChange;
  if ((fieldsToChange & 1) == 0)
  {
    if ((fieldsToChange & 2) == 0)
      goto LABEL_3;
LABEL_10:
    v16 = self->_startFrame.origin.y;
    v17 = self->_endFrame.origin.y - v16;
    v18 = v16 + (float)(v17 * a3);
    if (v17 >= 0.0)
    {
      y = ceil(v18);
      if ((fieldsToChange & 4) != 0)
        goto LABEL_14;
    }
    else
    {
      y = floor(v18);
      if ((fieldsToChange & 4) != 0)
        goto LABEL_14;
    }
LABEL_4:
    if ((fieldsToChange & 8) == 0)
      goto LABEL_21;
LABEL_18:
    v22 = self->_startFrame.size.height;
    v23 = self->_endFrame.size.height - v22;
    v24 = v22 + (float)(v23 * a3);
    if (v23 >= 0.0)
      height = ceil(v24);
    else
      height = floor(v24);
    goto LABEL_21;
  }
  v13 = self->_startFrame.origin.x;
  v14 = self->_endFrame.origin.x - v13;
  v15 = v13 + (float)(v14 * a3);
  if (v14 >= 0.0)
  {
    x = ceil(v15);
    if ((fieldsToChange & 2) != 0)
      goto LABEL_10;
  }
  else
  {
    x = floor(v15);
    if ((fieldsToChange & 2) != 0)
      goto LABEL_10;
  }
LABEL_3:
  if ((fieldsToChange & 4) == 0)
    goto LABEL_4;
LABEL_14:
  v19 = self->_startFrame.size.width;
  v20 = self->_endFrame.size.width - v19;
  v21 = v19 + (float)(v20 * a3);
  if (v20 >= 0.0)
  {
    width = ceil(v21);
    if ((fieldsToChange & 8) == 0)
      goto LABEL_21;
    goto LABEL_18;
  }
  width = floor(v21);
  if ((fieldsToChange & 8) != 0)
    goto LABEL_18;
LABEL_21:
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectIntegral(v32);
  v25 = v33.origin.x;
  v26 = v33.origin.y;
  v27 = v33.size.width;
  v28 = v33.size.height;
  v34.origin.x = rect2;
  v34.origin.y = v9;
  v34.size.width = v10;
  v34.size.height = v11;
  if (!CGRectEqualToRect(v33, v34))
    objc_msgSend(self->super._target, "setFrame:", v25, v26, v27, v28);
}

@end
