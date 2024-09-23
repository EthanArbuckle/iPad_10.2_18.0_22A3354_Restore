@implementation PXPhotosDetailsFloatingCardLayout

- (PXPhotosDetailsFloatingCardLayout)initWithPhotosDetailsUIViewController:(id)a3 widgetComposition:(id)a4
{
  id v6;
  id v7;
  PXPhotosDetailsFloatingCardLayout *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosDetailsFloatingCardLayout;
  v8 = -[PXPhotosDetailsFloatingCardLayout init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaLayoutGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutFrame");
    v8->__containerBounds.origin.x = v12;
    v8->__containerBounds.origin.y = v13;
    v8->__containerBounds.size.width = v14;
    v8->__containerBounds.size.height = v15;

    -[PXPhotosDetailsFloatingCardLayout _configureForPhotosDetailsViewController:composition:](v8, "_configureForPhotosDetailsViewController:composition:", v6, v7);
  }

  return v8;
}

- (double)width
{
  return 375.0;
}

- (double)initialHeight
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  float v13;

  -[PXPhotosDetailsFloatingCardLayout snappableHeights](self, "snappableHeights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0.0;
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoPanelLastSnappedWidgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[PXPhotosDetailsFloatingCardLayout heightsForIdentifier](self, "heightsForIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    objc_msgSend(v8, "floatValue");
    v10 = v9;
  }
  else
  {
    -[PXPhotosDetailsFloatingCardLayout snappableHeights](self, "snappableHeights");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v10 = v13;

  }
  v11 = v10;

  return v11;
}

- (UIEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 20.0;
  v3 = 20.0;
  v4 = 20.0;
  v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)canDrag
{
  void *v2;
  char v3;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "draggableInfoPanelEnabled");

  return v3;
}

- (unint64_t)initialPosition
{
  void *v2;
  void *v3;
  unint64_t v4;

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoPanelLastSnappedPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 2;

  return v4;
}

- (void)_configureForPhotosDetailsViewController:(id)a3 composition:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int IsNull;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSOrderedSet *v25;
  NSDictionary *v26;
  NSDictionary *v27;
  NSOrderedSet *snappableHeights;
  NSOrderedSet *v29;
  NSDictionary *identifiersForHeight;
  NSDictionary *v31;
  NSDictionary *heightsForIdentifier;
  NSDictionary *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  NSOrderedSet *v37;
  NSDictionary *v38;
  NSDictionary *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;
  double v45;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contentEdgeInsets");
  v9 = v8;
  objc_msgSend(v7, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widgetSpec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  v42 = 0;
  v43 = (double *)&v42;
  v44 = 0x2020000000;
  v45 = 0.0;
  IsNull = PXEdgeInsetsIsNull();
  v16 = 0.0;
  if (!IsNull)
    v16 = v9;
  v45 = v16;
  objc_msgSend(v6, "additionalSafeAreaInsets");
  v43[3] = v17 + v43[3];
  objc_msgSend(v6, "additionalSafeAreaInsets");
  v43[3] = v18 + v43[3];
  v19 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "widgets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __90__PXPhotosDetailsFloatingCardLayout__configureForPhotosDetailsViewController_composition___block_invoke;
  v34[3] = &unk_1E5120BB8;
  v41 = v14;
  v40 = &v42;
  v23 = v7;
  v35 = v23;
  v24 = v11;
  v36 = v24;
  v25 = (NSOrderedSet *)v19;
  v37 = v25;
  v26 = (NSDictionary *)v20;
  v38 = v26;
  v27 = (NSDictionary *)v21;
  v39 = v27;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v34);

  snappableHeights = self->_snappableHeights;
  self->_snappableHeights = v25;
  v29 = v25;

  identifiersForHeight = self->_identifiersForHeight;
  self->_identifiersForHeight = v26;
  v31 = v26;

  heightsForIdentifier = self->_heightsForIdentifier;
  self->_heightsForIdentifier = v27;
  v33 = v27;

  _Block_object_dispose(&v42, 8);
}

- (void)didUpdateCardHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsFloatingCardLayout identifiersForHeight](self, "identifiersForHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInfoPanelLastSnappedWidgetIdentifier:", v5);

  }
}

- (void)didUpdateCardPosition:(unint64_t)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInfoPanelLastSnappedPosition:", v4);

}

- (NSOrderedSet)snappableHeights
{
  return self->_snappableHeights;
}

- (CGRect)_containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__containerBounds.origin.x;
  y = self->__containerBounds.origin.y;
  width = self->__containerBounds.size.width;
  height = self->__containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDictionary)identifiersForHeight
{
  return self->_identifiersForHeight;
}

- (NSDictionary)heightsForIdentifier
{
  return self->_heightsForIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightsForIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersForHeight, 0);
  objc_storeStrong((id *)&self->_snappableHeights, 0);
}

void __90__PXPhotosDetailsFloatingCardLayout__configureForPhotosDetailsViewController_composition___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  v20 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v20, "preferredContentHeightForWidth:", *(double *)(a1 + 80));
    v4 = v3;
  }
  else
  {
    v4 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v20, "contentTilingController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "targetLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
        v7 = v6;
      objc_msgSend(v7, "contentBounds");
      v4 = v9;

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v20, "snappableWidgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (v4 > 0.0)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24);
    objc_msgSend(*(id *)(a1 + 32), "widgets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "widgets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v20;
    if (v12 == v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "distanceBetweenTopAndHeaderlessWidgetContentTop");
      v15 = v20;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v16
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
    }
    v17 = *(void **)(a1 + 40);
    if (v14 == v15)
      objc_msgSend(v17, "distanceBetweenFooterlessWidgetContentBottomAndBottom");
    else
      objc_msgSend(v17, "distanceBetweenFooterlessWidgetContentBottomAndNextHeaderlessWidgetContentTop");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v18
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v10, v19);
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v19, v10);

    }
  }

}

@end
