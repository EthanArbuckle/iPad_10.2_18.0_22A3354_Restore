@implementation BKLibraryBookshelfLibraryBaseViewConfiguration

- (unint64_t)collectionType
{
  return 0;
}

- (BOOL)providesReviewData
{
  return 0;
}

- (BOOL)providesProductInfoData
{
  return 1;
}

- (NSPredicate)productInfoFilter
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("storeID != NULL"));
}

- (BOOL)stackedSortControl
{
  return 0;
}

- (BOOL)showsSortControl
{
  return 1;
}

- (unint64_t)initialSortMode
{
  return 6;
}

- (BOOL)canChangeViewMode
{
  return 1;
}

- (NSString)moreText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("More"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)collectionDescriptionPlaceholderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Description"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)noBooksDescriptionHeader
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  unsigned int v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collectionID](self, "collectionID"));
  if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultAll))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Library is Empty");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDAudiobooks))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("No Audiobooks");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDPDFs))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("No PDFs");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDSamples))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("No Samples");
  }
  else
  {
    v8 = objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDDownloaded);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    if (v8)
      v5 = CFSTR("No Downloaded Books");
    else
      v5 = CFSTR("No Books");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10091C438, 0));

  return (NSString *)v6;
}

- (NSString)noBooksDescription
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collectionID](self, "collectionID"));
  if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultAll))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Visit the store to add books and audiobooks to your library.");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDWantToRead))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("To add to this collection, tap any book or audiobook in the store and select Want to Read.");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDFinished))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("As you mark books and audiobooks finished, they’ll be added to this collection.");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDBooks))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("All the books you purchase will automatically be added to this collection.");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDAudiobooks))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("All the audiobooks you purchase will automatically be added to this collection.");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDPDFs))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("PDFs in your library will automatically be added to this collection.");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDSamples))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("To add to this collection, tap any book in the store and select Sample.");
  }
  else if (objc_msgSend(v2, "isEqualToString:", kBKCollectionDefaultIDDownloaded))
  {
    v6 = +[BCDevice deviceClass](BCDevice, "deviceClass");
    if (v6 == (id)3)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("All the books you download to this iPad will automatically be added to this collection.");
    }
    else if (v6 == (id)2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("All the books you download to this iPod touch will automatically be added to this collection.");
    }
    else if (v6 == (id)1)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("All the books you download to this iPhone will automatically be added to this collection.");
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("All the books you download to this device will automatically be added to this collection.");
    }
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("To add to this collection, choose Add to Collection from a book or audiobook menu.");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10091C438, 0));

  return (NSString *)v7;
}

- (NSString)readingListButtonText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Collections"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)cloudDownloadImageName
{
  return (NSString *)CFSTR("icloud");
}

- (NSString)cloudUploadingImageName
{
  return (NSString *)CFSTR("books.icloud.dashed");
}

- (NSString)cloudErrorImageName
{
  return (NSString *)CFSTR("exclamationmark.icloud");
}

- (NSString)actionMenuImageName
{
  return (NSString *)CFSTR("ellipsis");
}

- (NSString)reviewBackgroundName
{
  return (NSString *)CFSTR("ios_collections_finished_review_bg");
}

- (NSString)dragBarName
{
  return (NSString *)CFSTR("line.horizontal.3");
}

- (NSString)selectedCheckmarkName
{
  return (NSString *)CFSTR("checkmark.circle.fill");
}

- (NSString)unselectedCheckmarkName
{
  return (NSString *)CFSTR("circle");
}

- (NSString)infoBarDownloading
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DOWNLOADING…"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarDownloadWaiting
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WAITING…"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarDownloadPaused
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PAUSED…"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarNew
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NEW"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarNext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarProof
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PROOF"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarPreOrderable
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PRE-ORDER"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarPreOrdered
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PRE-ORDERED"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarSample
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SAMPLE"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoBarBuy
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BUY"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (NSString)infoExpectedDateString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Expected %@"), &stru_10091C438, 0));

  return (NSString *)v3;
}

- (BOOL)supportsReadingListsButton
{
  return 0;
}

- (BOOL)includeCollectionInfo
{
  return 1;
}

- (NSString)viewTitle
{
  return (NSString *)&stru_10091C438;
}

- (NSString)viewDescription
{
  return (NSString *)&stru_10091C438;
}

- (NSArray)sortControlConfig
{
  return 0;
}

- (NSString)infoBarAudiobookImageName
{
  return (NSString *)CFSTR("headphones");
}

- (NSString)seriesID
{
  return 0;
}

- (BOOL)hideTopSeparatorLine
{
  return 0;
}

- (BOOL)supplementalContentPDFPicker
{
  return 0;
}

- (NSString)supplementalContentPDFTitle
{
  return (NSString *)&stru_10091C438;
}

- (BOOL)showCancelNavigationBarItem
{
  return 0;
}

- (unint64_t)initialViewMode
{
  return self->_initialViewMode;
}

- (void)setInitialViewMode:(unint64_t)a3
{
  self->_initialViewMode = a3;
}

- (NSString)supplementalContentStorePlaylistID
{
  return self->_supplementalContentStorePlaylistID;
}

- (void)setSupplementalContentStorePlaylistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)fromActionMenu
{
  return self->fromActionMenu;
}

- (void)setFromActionMenu:(BOOL)a3
{
  self->fromActionMenu = a3;
}

- (BKCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_supplementalContentStorePlaylistID, 0);
}

@end
