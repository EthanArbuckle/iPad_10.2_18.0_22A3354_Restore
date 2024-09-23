@implementation _UIDismissCurlUpTapGestureRecognizer

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  float v21;
  float v22;
  float v23;
  double v24;
  double v25;
  BOOL v26;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!_IsKindOfUIView((uint64_t)v10))
    goto LABEL_11;
  v11 = v10;
  objc_msgSend(v8, "locationInView:", v11);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "bounds");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v20 = CGRectGetHeight(v29);
  -[_UIDismissCurlUpTapGestureRecognizer _curlUpDY](self, "_curlUpDY");
  if (v13 < 0.0
    || (v22 = v21,
        v30.origin.x = x,
        v30.origin.y = y,
        v30.size.width = width,
        v30.size.height = height,
        v13 > CGRectGetWidth(v30))
    || v15 < 0.0)
  {

LABEL_11:
    v26 = 0;
    goto LABEL_12;
  }
  v23 = v20 - v22;
  v24 = v23 + v13 * -0.176326975;
  if (v24 >= 40.0)
    v25 = v24;
  else
    v25 = 40.0;

  if (v15 > v25)
    goto LABEL_11;
  v28.receiver = self;
  v28.super_class = (Class)_UIDismissCurlUpTapGestureRecognizer;
  v26 = -[UIGestureRecognizer _shouldReceiveTouch:forEvent:recognizerView:](&v28, sel__shouldReceiveTouch_forEvent_recognizerView_, v8, v9, v11);
LABEL_12:

  return v26;
}

- (float)_curlUpDY
{
  return self->_curlUpDY;
}

- (void)_setCurlUpDY:(float)a3
{
  self->_curlUpDY = a3;
}

@end
