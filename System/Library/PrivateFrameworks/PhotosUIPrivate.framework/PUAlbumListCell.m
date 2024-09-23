@implementation PUAlbumListCell

- (PUAlbumListCell)initWithFrame:(CGRect)a3
{
  PUAlbumListCell *v3;
  PUAlbumListCell *v4;
  void *v5;
  PUAlbumListCellContentView *v6;
  PUAlbumListCellContentView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListCell;
  v3 = -[PUAlbumListCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUAlbumListCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PUAlbumListCellContentView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[PUAlbumListCellContentView initWithFrame:](v6, "initWithFrame:");
    -[PUAlbumListCellContentView setTag:](v7, "setTag:", 236897);
    -[PUAlbumListCellContentView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[PUAlbumListCellContentView setTopInsetEnabled:](v7, "setTopInsetEnabled:", 1);
    objc_msgSend(v5, "addSubview:", v7);

  }
  return v4;
}

- (PUAlbumListCellContentView)albumListCellContentView
{
  return (PUAlbumListCellContentView *)-[PUAlbumListCell viewWithTag:](self, "viewWithTag:", 236897);
}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v5;
  char isKindOfClass;
  _QWORD v7[5];
  _QWORD v8[5];

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke;
    v8[3] = &unk_1E58ABD10;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.1);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke_2;
    v7[3] = &unk_1E58ABD10;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
  }
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v5;
  char isKindOfClass;
  _QWORD v7[5];

  v5 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__PUAlbumListCell_didTransitionFromLayout_toLayout___block_invoke;
    v7[3] = &unk_1E58ABD10;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.3);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = -[PUAlbumListCell isHighlighted](self, "isHighlighted");
  v7.receiver = self;
  v7.super_class = (Class)PUAlbumListCell;
  -[PUAlbumListCell setHighlighted:](&v7, sel_setHighlighted_, v3);
  if (v5 != -[PUAlbumListCell isHighlighted](self, "isHighlighted"))
  {
    -[PUAlbumListCell albumListCellContentView](self, "albumListCellContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", v3);

  }
}

- (void)setBackgroundCornerRadius:(double)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[PUAlbumListCell backgroundConfiguration](self, "backgroundConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerRadius");
  v7 = v6;

  if (v7 != a3)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", a3);
    -[PUAlbumListCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v8);

  }
}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = a3;
  -[PUAlbumListCell albumListCellContentView](self, "albumListCellContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsDeleteButtonWhenEditing");
  objc_msgSend(v5, "setShowsDeleteButtonWhenEditing:", 0);
  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListCell;
  -[PUAlbumListCell snapshotViewAfterScreenUpdates:](&v9, sel_snapshotViewAfterScreenUpdates_, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsDeleteButtonWhenEditing:", v6);

  return v7;
}

- (id)focusEffect
{
  void *v3;
  void *v4;
  void *v5;

  -[PUAlbumListCell albumListCellContentView](self, "albumListCellContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeHaloEffectForSourceView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __52__PUAlbumListCell_didTransitionFromLayout_toLayout___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "albumListCellContentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowsTitle:animated:", 1, 1);

}

void __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "albumListCellContentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowsTitle:animated:", 0, 1);

}

void __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "albumListCellContentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowsTitle:animated:", 0, 0);

}

@end
