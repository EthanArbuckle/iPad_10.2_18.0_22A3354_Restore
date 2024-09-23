@implementation _UIScreenRectangularBoundingPathUtilities

- (id)boundingPathForWindow:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  -[_UIScreenBoundingPathUtilities _screen](self, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIScreenRectangularBoundingPathUtilities.m"), 21, CFSTR("Cannot provide the bounding path for a window associated with a different screen."));

  }
  objc_msgSend(v6, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:inScreenCoordinateSpace:](_UIScreenRectangularBoundingPathUtilities, "boundingPathForWindow:inScreenCoordinateSpace:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)boundingPathForWindow:(id)a3 inScreenCoordinateSpace:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _UIRectangularBoundingPath *v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v5);
  v35.origin.x = v15;
  v35.origin.y = v16;
  v35.size.width = v17;
  v35.size.height = v18;
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  v34 = CGRectIntersection(v33, v35);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  if (CGRectIsNull(v34))
  {
    v23 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5, x, y, width, height);
    v23 = v27;
    v24 = v28;
    v25 = v29;
    v26 = v30;
  }
  v31 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:]([_UIRectangularBoundingPath alloc], "initWithCoordinateSpace:boundingRect:", v5, v23, v24, v25, v26);

  return v31;
}

@end
