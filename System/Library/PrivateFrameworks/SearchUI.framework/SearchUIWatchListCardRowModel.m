@implementation SearchUIWatchListCardRowModel

- (SearchUIWatchListCardRowModel)initWithResult:(id)a3 cardSection:(id)a4 asyncRowManager:(id)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v12;
  SearchUIWatchListCardRowModel *v13;
  SearchUIWatchListCardRowModel *v14;
  objc_super v16;

  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIWatchListCardRowModel;
  v13 = -[SearchUICardSectionRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:](&v16, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, a3, a4, 0, a6, a7);
  v14 = v13;
  if (v13)
  {
    -[SearchUIWatchListCardRowModel setManager:](v13, "setManager:", v12);
    objc_msgSend(v12, "addWatchListRowModelObserver:", v14);
  }

  return v14;
}

- (void)updateWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SearchUIWatchListCardRowModel setHasLoaded:](self, "setHasLoaded:", 1);
  -[SearchUIWatchListCardRowModel setTitle:](self, "setTitle:", v7);

  -[SearchUIWatchListCardRowModel setSubtitle:](self, "setSubtitle:", v6);
  -[SearchUIWatchListCardRowModel delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didUpdateRowModel:animate:", self, 0);

}

- (void)updateWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 punchout:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[SearchUIWatchListCardRowModel setHasLoaded:](self, "setHasLoaded:", 1);
  -[SearchUIWatchListCardRowModel setTitle:](self, "setTitle:", v13);

  -[SearchUIWatchListCardRowModel setSubtitle:](self, "setSubtitle:", v12);
  -[SearchUIWatchListCardRowModel setImage:](self, "setImage:", v11);

  -[SearchUIWatchListCardRowModel setPunchout:](self, "setPunchout:", v10);
  -[SearchUIWatchListCardRowModel delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didUpdateRowModel:animate:", self, 1);

}

- (void)setHasError:(BOOL)a3
{
  id v4;

  self->_hasError = a3;
  -[SearchUIWatchListCardRowModel setHasLoaded:](self, "setHasLoaded:", 1);
  -[SearchUIWatchListCardRowModel delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didUpdateRowModel:animate:", self, 1);

}

- (id)punchouts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIWatchListCardRowModel punchout](self, "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUIWatchListCardRowModel punchout](self, "punchout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isDraggable
{
  return 0;
}

- (int)separatorStyle
{
  objc_super v4;

  if (-[SearchUIWatchListCardRowModel hasError](self, "hasError"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SearchUIWatchListCardRowModel;
  return -[SearchUICardSectionRowModel separatorStyle](&v4, sel_separatorStyle);
}

- (SearchUIWatchListCardRowModelDelegate)delegate
{
  return (SearchUIWatchListCardRowModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (SearchUIWatchListCardsManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
