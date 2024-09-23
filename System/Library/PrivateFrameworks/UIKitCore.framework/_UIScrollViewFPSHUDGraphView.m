@implementation _UIScrollViewFPSHUDGraphView

- (_UIScrollViewFPSHUDGraphView)init
{
  _UIScrollViewFPSHUDGraphView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIScrollViewFPSHUDGraphView;
  v2 = -[UIView init](&v5, sel_init);
  if (v2)
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2, "setBackgroundColor:", v3);

  }
  return v2;
}

- (uint64_t)addValue:(uint64_t)result
{
  void *v3;
  _DWORD *v4;

  if (result)
  {
    v3 = (void *)result;
    v4 = (_DWORD *)(result + 416);
    memmove((void *)(result + 420), (const void *)(result + 416), 0x254uLL);
    *v4 = a2;
    return objc_msgSend(v3, "setNeedsDisplay");
  }
  return result;
}

- (void)setColorForFramerate:(unsigned int)a3 context:(CGContext *)a4
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  if (a3 > 0x1E)
  {
    if (a3 > 0x30)
    {
      if (a3 > 0x3C)
      {
        if (a3 > 0x50)
        {
          if (a3 > 0x78)
          {
            if (a3 == 301)
            {
              v4 = 1.0;
              v5 = 1.0;
              v6 = 1.0;
            }
            else
            {
              if (a3 != 300)
                return;
              v4 = 0.9;
              v6 = 0.05;
              v5 = 0.0;
            }
          }
          else
          {
            v5 = 0.78;
            v6 = 0.4;
            v4 = 0.0;
          }
        }
        else
        {
          v4 = 0.48;
          v5 = 0.32;
          v6 = 0.58;
        }
      }
      else
      {
        v5 = 0.65;
        v4 = 1.0;
        v6 = 0.0;
      }
    }
    else
    {
      v4 = 0.94;
      v5 = 0.33;
      v6 = 0.45;
    }
  }
  else
  {
    v4 = 0.23;
    v5 = 0.65;
    v6 = 0.82;
  }
  CGContextSetRGBFillColor(a4, v4, v5, v6, 1.0);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  _QWORD *ContextStack;
  CGContext *v7;
  uint64_t v8;
  int v9;
  unsigned int *arr;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  float v15;
  uint64_t v16;
  float v17;
  float v18;
  CGRect v19;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v7 = 0;
  else
    v7 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextTranslateCTM(v7, 0.0, v5);
  CGContextScaleCTM(v7, 1.0, -1.0);
  -[UIView bounds](self, "bounds");
  v8 = 0;
  v9 = 0;
  arr = self->arr;
  v11 = v5 * 0.25;
  v13 = v12 / 150.0;
  do
  {
    v14 = arr[v8];
    v15 = (float)v14;
    if (v8 == 149 || (v16 = v8 + 1, v15 != (float)arr[v8 + 1]))
    {
      -[_UIScrollViewFPSHUDGraphView setColorForFramerate:context:](self, "setColorForFramerate:context:", arr[v8], v7);
      v17 = v15 / 48.0;
      if (v14 >= 0x31)
        v17 = (float)(-240.0 / v15) + 6.0;
      v18 = v11 * v17;
      v19.origin.x = v13 * (double)v9;
      v19.size.width = v13 * (double)((int)v8 - v9);
      v19.size.height = v18;
      v19.origin.y = 0.0;
      CGContextFillRect(v7, v19);
      v16 = v8 + 1;
      v9 = v8;
    }
    v8 = v16;
  }
  while (v16 != 150);
}

@end
