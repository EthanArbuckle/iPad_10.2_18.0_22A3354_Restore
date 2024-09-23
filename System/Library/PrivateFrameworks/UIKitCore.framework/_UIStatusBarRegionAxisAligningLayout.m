@implementation _UIStatusBarRegionAxisAligningLayout

+ (id)aligningLayoutWithAlignment:(int64_t)a3
{
  _UIStatusBarRegionAxisAligningLayout *v4;

  v4 = objc_alloc_init(_UIStatusBarRegionAxisAligningLayout);
  -[_UIStatusBarRegionAxisAligningLayout setAlignment:](v4, "setAlignment:", a3);
  return v4;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  int64_t v21;

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a3;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101___UIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v18[3] = &unk_1E16E0608;
  v21 = a6;
  v18[4] = self;
  v13 = v12;
  v19 = v13;
  v20 = v9;
  v14 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

- (BOOL)canOverflowItems
{
  return 0;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

@end
