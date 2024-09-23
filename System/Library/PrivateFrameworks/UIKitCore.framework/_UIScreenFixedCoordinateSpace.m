@implementation _UIScreenFixedCoordinateSpace

- (void)_setScreen:(id)a3
{
  self->_screen = (UIScreen *)a3;
}

- (CGRect)bounds
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

  -[_UIScreenFixedCoordinateSpace _screen](self, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
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

- (UIScreen)_screen
{
  return self->_screen;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[_UIScreenFixedCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[_UIScreenFixedCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    v9 = a4;
    -[_UIScreenFixedCoordinateSpace _screen](self, "_screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_referenceBounds");
    v12 = v11;
    v14 = v13;
    -[_UIScreenFixedCoordinateSpace _screen](self, "_screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(objc_msgSend(v15, "_interfaceOrientation"), x, y, width, height, v12, v14);
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[_UIScreenFixedCoordinateSpace _screen](self, "_screen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v23, v16, v18, v20, v22);
    x = v24;
    y = v25;
    width = v26;
    height = v27;

  }
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    v9 = a4;
    -[_UIScreenFixedCoordinateSpace _screen](self, "_screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:toCoordinateSpace:", v10, x, y, width, height);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[_UIScreenFixedCoordinateSpace _screen](self, "_screen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_referenceBounds");
    v21 = v20;
    v23 = v22;
    -[_UIScreenFixedCoordinateSpace _screen](self, "_screen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    x = _UIWindowConvertRectFromSceneSpaceToSceneReferenceSpace(objc_msgSend(v24, "_interfaceOrientation"), v12, v14, v16, v18, v21, v23);
    y = v25;
    width = v26;
    height = v27;

  }
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

@end
