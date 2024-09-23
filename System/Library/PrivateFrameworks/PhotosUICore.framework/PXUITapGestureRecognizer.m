@implementation PXUITapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSNumber *v9;
  NSNumber *initialEventType;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_initialEventType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "type"));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    initialEventType = self->_initialEventType;
    self->_initialEventType = v9;

  }
  v11.receiver = self;
  v11.super_class = (Class)PXUITapGestureRecognizer;
  -[PXUITapGestureRecognizer touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, v6, v8);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSNumber *v9;
  NSNumber *initialEventType;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_initialEventType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "type"));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    initialEventType = self->_initialEventType;
    self->_initialEventType = v9;

  }
  v11.receiver = self;
  v11.super_class = (Class)PXUITapGestureRecognizer;
  -[PXUITapGestureRecognizer pressesBegan:withEvent:](&v11, sel_pressesBegan_withEvent_, v6, v8);

}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGPoint result;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXUITapGestureRecognizer;
  -[PXUITapGestureRecognizer locationInView:](&v18, sel_locationInView_, v4);
  v6 = v5;
  v8 = v7;
  if (-[NSNumber integerValue](self->_initialEventType, "integerValue") == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "focusedItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "parentFocusEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusItemContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v10, "frame");
      PXRectGetCenter();
      objc_msgSend(v4, "convertPoint:fromCoordinateSpace:", v13);
      v6 = v14;
      v8 = v15;
    }

  }
  v16 = v6;
  v17 = v8;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)reset
{
  NSNumber *initialEventType;
  objc_super v4;

  initialEventType = self->_initialEventType;
  self->_initialEventType = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXUITapGestureRecognizer;
  -[PXUITapGestureRecognizer reset](&v4, sel_reset);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialEventType, 0);
}

@end
