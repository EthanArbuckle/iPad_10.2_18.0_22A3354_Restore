@implementation SearchUIGridRowModel

- (SearchUIGridRowModel)initWithResult:(id)a3 cardSection:(id)a4 gridLayoutManager:(id)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v12;
  id v13;
  SearchUIGridRowModel *v14;
  SearchUIGridRowModel *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SearchUIGridRowModel;
  v14 = -[SearchUICardSectionRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:](&v20, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, a3, v12, 0, a6, a7);
  v15 = v14;
  if (v14)
  {
    -[SearchUIGridRowModel setGridLayoutManager:](v14, "setGridLayoutManager:", v13);
    -[SearchUIGridRowModel gridLayoutManager](v15, "gridLayoutManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tableRowForTableRowCardSection:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIGridRowModel setShouldHide:](v15, "setShouldHide:", +[SearchUIGridLayoutManager shouldHideViewForRichData:](SearchUIGridLayoutManager, "shouldHideViewForRichData:", v18));

  }
  return v15;
}

- (BOOL)prefersNoSeparatorAbove
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchUIGridRowModel gridLayoutManager](self, "gridLayoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "tableContainsRowHeaders");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasLeadingImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SearchUIGridRowModel gridLayoutManager](self, "gridLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRowModel cardSection](self, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableRowForTableRowCardSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasOnlyImage");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIGridRowModel;
  v4 = -[SearchUICardSectionRowModel copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SearchUIGridRowModel gridLayoutManager](self, "gridLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGridLayoutManager:", v5);

  objc_msgSend(v4, "setShouldHide:", -[SearchUIGridRowModel shouldHide](self, "shouldHide"));
  return v4;
}

- (SearchUIGridLayoutManager)gridLayoutManager
{
  return self->_gridLayoutManager;
}

- (void)setGridLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_gridLayoutManager, a3);
}

- (BOOL)shouldHide
{
  return self->_shouldHide;
}

- (void)setShouldHide:(BOOL)a3
{
  self->_shouldHide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridLayoutManager, 0);
}

@end
