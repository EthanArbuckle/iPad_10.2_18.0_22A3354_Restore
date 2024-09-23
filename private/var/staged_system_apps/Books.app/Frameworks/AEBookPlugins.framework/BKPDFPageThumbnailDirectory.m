@implementation BKPDFPageThumbnailDirectory

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKPDFPageThumbnailDirectory calculatePageCount](self, "calculatePageCount");
  v5.receiver = self;
  v5.super_class = (Class)BKPDFPageThumbnailDirectory;
  -[BKThumbnailDirectory viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPDFPageThumbnailDirectory;
  -[BKContentViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
}

- (void)setPdfDocument:(id)a3
{
  PDFDocument *v5;
  PDFDocument *v6;

  v5 = (PDFDocument *)a3;
  if (self->_pdfDocument != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pdfDocument, a3);
    -[BKPDFPageThumbnailDirectory calculatePageCount](self, "calculatePageCount");
    v5 = v6;
  }

}

- (void)setShowBookmarksOnly:(BOOL)a3
{
  if (self->_showBookmarksOnly != a3)
  {
    self->_showBookmarksOnly = a3;
    -[BKPDFPageThumbnailDirectory calculatePageCount](self, "calculatePageCount");
  }
}

- (void)calculatePageCount
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  BKPDFPageThumbnailDirectory *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory pdfDocument](self, "pdfDocument"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory pdfDocument](self, "pdfDocument"));
    v5 = objc_msgSend(v4, "pageCount");

    if (v5 && -[BKPDFPageThumbnailDirectory showBookmarksOnly](self, "showBookmarksOnly"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory pdfDocument](self, "pdfDocument"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookmarkedPages"));

      v9 = _NSConcreteStackBlock;
      v10 = 3221225472;
      v11 = sub_B9858;
      v12 = &unk_1C1088;
      v13 = self;
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
      v8 = v14;
      objc_msgSend(v7, "enumerateIndexesUsingBlock:", &v9);
      -[BKPDFPageThumbnailDirectory setBookmarkedPages:](self, "setBookmarkedPages:", v8, v9, v10, v11, v12, v13);
      v5 = objc_msgSend(v8, "count");

    }
  }
  else
  {
    v5 = 0;
  }
  if ((id)self->_pageCount != v5)
  {
    self->_pageCount = (unint64_t)v5;
    -[BKPDFPageThumbnailDirectory reloadData](self, "reloadData");
  }
}

- (int64_t)numberOfCellsInGridView:(id)a3
{
  unsigned int v4;
  int64_t result;

  v4 = -[BKThumbnailDirectory showSpreads](self, "showSpreads", a3);
  result = -[BKPDFPageThumbnailDirectory pageCount](self, "pageCount");
  if (v4)
    return vcvtps_s32_f32((float)(unint64_t)(result + 1) * 0.5);
  return result;
}

- (int64_t)leftPageNumberAtIndex:(unint64_t)a3
{
  unint64_t v5;

  if (-[BKViewController layoutDirection](self, "layoutDirection"))
  {
    v5 = (2 * a3) | 1;
    if (v5 <= -[BKPDFPageThumbnailDirectory pageCount](self, "pageCount"))
      return v5;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a3)
  {
    return 2 * a3;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)rightPageNumberAtIndex:(unint64_t)a3
{
  unint64_t v6;

  if (-[BKViewController layoutDirection](self, "layoutDirection"))
  {
    if (a3)
      return 2 * a3;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = (2 * a3) | 1;
    if (v6 <= -[BKPDFPageThumbnailDirectory pageCount](self, "pageCount"))
      return v6;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)pageNumberForCellIndex:(unint64_t)a3
{
  int64_t result;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int64_t v12;

  if (-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
  {
    if (-[BKViewController layoutDirection](self, "layoutDirection"))
    {
      result = -[BKPDFPageThumbnailDirectory rightPageNumberAtIndex:](self, "rightPageNumberAtIndex:", a3);
      if (result == 0x7FFFFFFFFFFFFFFFLL)
        return -[BKPDFPageThumbnailDirectory leftPageNumberAtIndex:](self, "leftPageNumberAtIndex:", a3);
    }
    else
    {
      result = -[BKPDFPageThumbnailDirectory leftPageNumberAtIndex:](self, "leftPageNumberAtIndex:", a3);
      if (result == 0x7FFFFFFFFFFFFFFFLL)
        return -[BKPDFPageThumbnailDirectory rightPageNumberAtIndex:](self, "rightPageNumberAtIndex:", a3);
    }
  }
  else if (-[BKPDFPageThumbnailDirectory showBookmarksOnly](self, "showBookmarksOnly"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory bookmarkedPages](self, "bookmarkedPages"));
    v7 = objc_msgSend(v6, "count");

    if ((unint64_t)v7 <= a3)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory bookmarkedPages](self, "bookmarkedPages"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a3));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory pdfDocument](self, "pdfDocument"));
      v11 = objc_msgSend(v10, "indexForPage:", v9);

      v12 = +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", v11);
      return v12;
    }
  }
  else
  {
    return +[BKPDFModernBookViewController pageNumberForPageIndex:](BKPDFModernBookViewController, "pageNumberForPageIndex:", a3);
  }
  return result;
}

- (int64_t)indexForPageNumber:(unint64_t)a3
{
  int64_t v5;

  if (-[BKThumbnailDirectory showSpreads](self, "showSpreads"))
    v5 = a3 >> 1;
  else
    v5 = a3 - 1;
  if (v5 < 0
    || v5 >= -[BKPDFPageThumbnailDirectory numberOfCellsInGridView:](self, "numberOfCellsInGridView:", self->super._gridView))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (id)locationAtIndex:(unint64_t)a3
{
  return -[BKDirectoryContent locationForPageNumber:](self, "locationForPageNumber:", -[BKPDFPageThumbnailDirectory pageNumberForCellIndex:](self, "pageNumberForCellIndex:", a3));
}

- (unint64_t)indexForLocation:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[BKPDFPageThumbnailDirectory showBookmarksOnly](self, "showBookmarksOnly"))
  {
    v5 = +[BKPDFModernBookViewController pageIndexForPageNumber:](BKPDFModernBookViewController, "pageIndexForPageNumber:", -[BKDirectoryContent pageNumberForLocation:](self, "pageNumberForLocation:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory pdfDocument](self, "pdfDocument"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pageAtIndex:", v5));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory bookmarkedPages](self, "bookmarkedPages"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_B9CFC;
    v12[3] = &unk_1C10B0;
    v9 = v7;
    v13 = v9;
    v14 = &v15;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

    v10 = v16[3];
  }
  else
  {
    v10 = -[BKPDFPageThumbnailDirectory indexForPageNumber:](self, "indexForPageNumber:", -[BKDirectoryContent pageNumberForLocation:](self, "pageNumberForLocation:", v4));
    v16[3] = v10;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKPDFPageThumbnailDirectory;
  -[BKThumbnailDirectory configureCell:atIndex:](&v9, "configureCell:atIndex:", v6, a4);
  if (-[BKPDFPageThumbnailDirectory showBookmarks](self, "showBookmarks"))
  {
    if (-[BKPDFPageThumbnailDirectory showBookmarksOnly](self, "showBookmarksOnly"))
    {
      objc_msgSend(v6, "setHasRibbon:", 1);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory pdfDocument](self, "pdfDocument"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pageAtIndex:", a4));

      if (objc_msgSend(v8, "isBookmarked"))
        objc_msgSend(v6, "setHasRibbon:", 1);

    }
  }

}

- (id)_noBookmarksView
{
  BKTOCBookmarksDescription *noBookmarksView;
  BKTOCBookmarksDescription *v4;
  BKTOCBookmarksDescription *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  noBookmarksView = self->_noBookmarksView;
  if (!noBookmarksView)
  {
    v4 = -[BKTOCBookmarksDescription initWithFrame:]([BKTOCBookmarksDescription alloc], "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
    v5 = self->_noBookmarksView;
    self->_noBookmarksView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[BKTOCBookmarksDescription setBackgroundColor:](self->_noBookmarksView, "setBackgroundColor:", v6);

    v7 = -[BKTOCBookmarksDescription setAutoresizingMask:](self->_noBookmarksView, "setAutoresizingMask:", 18);
    v9 = isPad(v7, v8);
    v10 = 27.0;
    if (!v9)
      v10 = 17.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription titleLabel](self->_noBookmarksView, "titleLabel"));
    objc_msgSend(v12, "setFont:", v11);

    v15 = isPad(v13, v14);
    v16 = 13.0;
    if (v15)
      v16 = 17.0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription descriptionLabel](self->_noBookmarksView, "descriptionLabel"));
    objc_msgSend(v18, "setFont:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription titleLabel](self->_noBookmarksView, "titleLabel"));
    v20 = AEBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Adding Bookmarks…"), &stru_1C3088, 0));
    objc_msgSend(v19, "setText:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
    objc_msgSend(v19, "setTextColor:", v23);

    v24 = AEBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("When you’re reading a PDF,\ntap the Bookmark button to\nmark the current page."), &stru_1C3088, 0));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCBookmarksDescription descriptionLabel](self->_noBookmarksView, "descriptionLabel"));
    objc_msgSend(v27, "setText:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
    objc_msgSend(v27, "setTextColor:", v28);

    objc_msgSend(v27, "setNumberOfLines:", 0);
    noBookmarksView = self->_noBookmarksView;
  }
  return noBookmarksView;
}

- (void)reloadData
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  BKTOCBookmarksDescription *noBookmarksView;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKPDFPageThumbnailDirectory;
  -[BKThumbnailDirectory reloadData](&v10, "reloadData");
  if (-[BKPDFPageThumbnailDirectory isViewLoaded](self, "isViewLoaded"))
  {
    if (!-[BKPDFPageThumbnailDirectory showBookmarksOnly](self, "showBookmarksOnly")
      || (v3 = objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory bookmarkedPages](self, "bookmarkedPages"))) != 0
      && (v4 = (void *)v3,
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory bookmarkedPages](self, "bookmarkedPages")),
          v6 = objc_msgSend(v5, "count"),
          v5,
          v4,
          v6))
    {
      -[BKTOCBookmarksDescription removeFromSuperview](self->_noBookmarksView, "removeFromSuperview");
      noBookmarksView = self->_noBookmarksView;
      self->_noBookmarksView = 0;
    }
    else
    {
      noBookmarksView = (BKTOCBookmarksDescription *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory _noBookmarksView](self, "_noBookmarksView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory view](self, "view"));
      objc_msgSend(v8, "bounds");
      -[BKTOCBookmarksDescription setFrame:](noBookmarksView, "setFrame:");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPDFPageThumbnailDirectory view](self, "view"));
      objc_msgSend(v9, "addSubview:", noBookmarksView);

    }
  }
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (PDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (BOOL)showBookmarksOnly
{
  return self->_showBookmarksOnly;
}

- (BOOL)showBookmarks
{
  return self->_showBookmarks;
}

- (void)setShowBookmarks:(BOOL)a3
{
  self->_showBookmarks = a3;
}

- (NSArray)bookmarkedPages
{
  return self->_bookmarkedPages;
}

- (void)setBookmarkedPages:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkedPages, a3);
}

- (BKTOCBookmarksDescription)noBookmarksView
{
  return self->_noBookmarksView;
}

- (void)setNoBookmarksView:(id)a3
{
  objc_storeStrong((id *)&self->_noBookmarksView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBookmarksView, 0);
  objc_storeStrong((id *)&self->_bookmarkedPages, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
}

@end
