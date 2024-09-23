@implementation FRGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAGradientLayer, a2);
}

- (NSArray)colors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colors"));

  return (NSArray *)v3;
}

- (void)setColors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(UIColor, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = objc_retainAutorelease(v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "CGColor", (_QWORD)v18));
          objc_msgSend(v5, "addObject:", v15);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = objc_msgSend(v5, "copy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  objc_msgSend(v17, "setColors:", v16);

}

- (NSArray)locations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locations"));

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  objc_msgSend(v5, "setLocations:", v4);

}

- (CGPoint)startPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  objc_msgSend(v2, "startPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  objc_msgSend(v5, "setStartPoint:", x, y);

}

- (CGPoint)endPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  objc_msgSend(v2, "endPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRGradientView layer](self, "layer"));
  objc_msgSend(v5, "setEndPoint:", x, y);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[FRGradientView passThroughTouches](self, "passThroughTouches"))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FRGradientView;
    v8 = -[FRGradientView pointInside:withEvent:](&v10, "pointInside:withEvent:", v7, x, y);
  }

  return v8;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FRGradientView;
  if (-[FRGradientView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("colors")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("startPoint")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("endPoint")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("locations"));
  }

  return v5;
}

- (BOOL)passThroughTouches
{
  return self->_passThroughTouches;
}

- (void)setPassThroughTouches:(BOOL)a3
{
  self->_passThroughTouches = a3;
}

@end
