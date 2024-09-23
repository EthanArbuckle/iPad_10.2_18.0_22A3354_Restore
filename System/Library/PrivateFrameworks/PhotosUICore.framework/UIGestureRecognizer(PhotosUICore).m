@implementation UIGestureRecognizer(PhotosUICore)

- (uint64_t)px_cancel
{
  uint64_t result;

  result = objc_msgSend(a1, "isEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "setEnabled:", 0);
    return objc_msgSend(a1, "setEnabled:", 1);
  }
  return result;
}

- (double)px_locationInCoordinateSpace:()PhotosUICore
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationInView:", v5);
  objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v5);
  v7 = v6;

  return v7;
}

- (uint64_t)px_isPanGestureRecognizerOfScrollView:()PhotosUICore
{
  void *v5;
  uint64_t v6;

  NSStringFromSelector(sel_panGestureRecognizer);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_px_isGestureRecognizerForKey:ofScrollView:", v5, a3);

  return v6;
}

- (uint64_t)px_isPinchGestureRecognizerOfScrollView:()PhotosUICore
{
  void *v5;
  uint64_t v6;

  NSStringFromSelector(sel_pinchGestureRecognizer);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_px_isGestureRecognizerForKey:ofScrollView:", v5, a3);

  return v6;
}

- (BOOL)_px_isGestureRecognizerForKey:()PhotosUICore ofScrollView:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL8 v10;

  v6 = a3;
  objc_msgSend(a1, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "valueForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == a1;

    if (a4 && v9 == a1)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }

  return v10;
}

@end
