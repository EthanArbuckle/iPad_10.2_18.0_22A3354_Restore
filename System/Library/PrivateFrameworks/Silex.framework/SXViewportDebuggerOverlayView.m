@implementation SXViewportDebuggerOverlayView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setBorderColor:(id *)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "setBorderWidth:", 1.0);

      objc_msgSend(a1, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBorderColor:", objc_msgSend(objc_retainAutorelease(v5), "CGColor"));
    }
    else
    {
      objc_msgSend(v4, "setBorderWidth:", 0.0);
    }

    objc_storeStrong(a1 + 52, a2);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
