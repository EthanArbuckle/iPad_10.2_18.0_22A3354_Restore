@implementation PRComplicationDragPreviewView

- (PRComplicationDragPreviewView)initWithWidgetHostView:(id)a3
{
  id v4;
  PRComplicationDragPreviewView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double MidX;
  void *v26;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PRComplicationDragPreviewView;
  v5 = -[PRComplicationDragPreviewView init](&v28, sel_init);
  if (v5)
  {
    PRFindLUTFilterView(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredArrayUsingPredicate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v13);

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D1BC88], "complicationEdgeInset");
    v16 = v15;
    v17 = v15 + v15;
    objc_msgSend(v4, "bounds");
    v19 = v17 + v18;
    objc_msgSend(v4, "bounds");
    -[PRComplicationDragPreviewView setFrame:](v5, "setFrame:", 0.0, 0.0, v19, v17 + v20);
    -[PRComplicationDragPreviewView bounds](v5, "bounds");
    v30 = CGRectInset(v29, v16, v16);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorWithAlphaComponent:", 0.6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v23);

    objc_msgSend(v21, "_setContinuousCornerRadius:", PRWidgetPlatterCornerRadius());
    -[PRComplicationDragPreviewView addSubview:](v5, "addSubview:", v21);
    if (v7)
      objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 1);
    else
      objc_msgSend(v4, "snapshotView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationDragPreviewView addSubview:](v5, "addSubview:", v24);
    -[PRComplicationDragPreviewView bounds](v5, "bounds");
    MidX = CGRectGetMidX(v31);
    -[PRComplicationDragPreviewView bounds](v5, "bounds");
    objc_msgSend(v24, "setCenter:", MidX, CGRectGetMidY(v32));
    if (v7 && v9)
    {
      objc_msgSend(v7, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFilters:", v9);

    }
  }

  return v5;
}

uint64_t __56__PRComplicationDragPreviewView_initWithWidgetHostView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CD2E30]) ^ 1;

  return v3;
}

@end
