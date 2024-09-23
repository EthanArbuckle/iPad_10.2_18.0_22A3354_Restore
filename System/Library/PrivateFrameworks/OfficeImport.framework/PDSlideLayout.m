@implementation PDSlideLayout

- (PDSlideLayout)initWithSlideMaster:(id)a3
{
  id v4;
  PDSlideLayout *v5;
  PDSlideLayout *v6;

  v4 = a3;
  v5 = -[PDSlideChild init](self, "init");
  v6 = v5;
  if (v5)
  {
    LODWORD(v5->super.mColorMapOverride) = 0;
    objc_storeWeak((id *)&v5->mSlideLayoutType, v4);
  }

  return v6;
}

- (void)setSlideMaster:(id)a3
{
  objc_storeWeak((id *)&self->mSlideLayoutType, a3);
}

- (void)setSlideLayoutType:(int)a3
{
  LODWORD(self->super.mColorMapOverride) = a3;
}

- (PDSlideMaster)slideMaster
{
  return (PDSlideMaster *)objc_loadWeakRetained((id *)&self->mSlideLayoutType);
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = objc_opt_class();
  -[PDSlideLayout slideMaster](self, "slideMaster");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v8, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v11, (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "textBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textListStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = v16;
  }
  else
  {
    -[PDSlideLayout slideMaster](self, "slideMaster");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentTextStyleForPlaceholderType:placeholderTypeIndex:defaultTextListStyle:overrideIndex:", v8, v7, v10, v6);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v9 = objc_opt_class();
  -[PDSlideLayout slideMaster](self, "slideMaster");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v9, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "textBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v9 = objc_opt_class();
  -[PDSlideLayout slideMaster](self, "slideMaster");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v9, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shapeProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  -[PDSlideLayout slideMaster](self, "slideMaster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v7, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)slideLayoutType
{
  return (int)self->super.mColorMapOverride;
}

- (id)background
{
  OADBackground *v3;
  int *p_mSlideLayoutType;
  id WeakRetained;
  id v6;

  v3 = self->super.super.mBackground;
  if (!v3)
  {
    p_mSlideLayoutType = &self->mSlideLayoutType;
    WeakRetained = objc_loadWeakRetained((id *)&self->mSlideLayoutType);

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)p_mSlideLayoutType);
      objc_msgSend(v6, "background");
      v3 = (OADBackground *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)defaultTheme
{
  void *v2;
  void *v3;

  -[PDSlideLayout slideMaster](self, "slideMaster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)parentTextStyleForTables
{
  void *v2;
  void *v3;

  -[PDSlideLayout slideMaster](self, "slideMaster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentTextStyleForTables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)transition
{
  PDTransition *v3;
  int *p_mSlideLayoutType;
  id WeakRetained;
  id v6;

  v3 = self->super.super.mTransition;
  if (!v3)
  {
    p_mSlideLayoutType = &self->mSlideLayoutType;
    WeakRetained = objc_loadWeakRetained((id *)&self->mSlideLayoutType);

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)p_mSlideLayoutType);
      objc_msgSend(v6, "transition");
      v3 = (PDTransition *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)doneWithContent
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PDSlideLayout;
  -[PDSlideChild doneWithContent](&v2, sel_doneWithContent);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSlideLayout;
  -[PDSlideChild description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mSlideLayoutType);
}

@end
