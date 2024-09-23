@implementation PUPhotoStreamAlbumsTableViewController

- (PUPhotoStreamAlbumsTableViewController)initWithStyle:(int64_t)a3
{
  PUPhotoStreamAlbumsTableViewController *v3;
  uint64_t v4;
  NSMutableSet *selectedAlbumGuids;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoStreamAlbumsTableViewController;
  v3 = -[PUPhotoStreamAlbumsTableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    selectedAlbumGuids = v3->_selectedAlbumGuids;
    v3->_selectedAlbumGuids = (NSMutableSet *)v4;

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoStreamAlbumsTableViewController;
  -[PUPhotoStreamAlbumsTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PUPhotoStreamAlbumsTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PUPhotoStreamAlbumsTableViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoStreamAlbumsTableViewController;
  -[PUPhotoStreamAlbumsTableViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PUPhotoStreamAlbumsTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUPhotoStreamAlbumsTableViewController;
  -[PUPhotoStreamAlbumsTableViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)addSelectedCloudGuid:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_selectedAlbumGuids, "addObject:");
}

- (void)reloadActions
{
  id v2;

  -[PUPhotoStreamAlbumsTableViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (id)posterImageForAlbum:(id)a3 imageView:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v7, "keyAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "approximateCount")
    && v9
    && (!objc_msgSend(v9, "isCloudSharedAsset") || (int)objc_msgSend(v9, "cloudPlaceholderKind") > 2))
  {
    objc_msgSend(v7, "posterImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("icloud"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithSymbolConfiguration:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setContentMode:", 4);
  }

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSOrderedSet *albumsOrderedSet;
  void *v6;
  NSOrderedSet *v7;
  NSOrderedSet *v8;

  albumsOrderedSet = self->_albumsOrderedSet;
  if (!albumsOrderedSet)
  {
    objc_msgSend((id)objc_opt_class(), "albumListForContentMode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containers");
    v7 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_albumsOrderedSet;
    self->_albumsOrderedSet = v7;

    albumsOrderedSet = self->_albumsOrderedSet;
  }
  return -[NSOrderedSet count](albumsOrderedSet, "count", a3, a4) + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  PUPhotoStreamAlbumLargeTextTableViewCell *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3470];
  v8 = a3;
  objc_msgSend(v7, "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("PUPhotoStreamAlbumsLargeTextTableViewControllerCell"));
    v12 = (PUPhotoStreamAlbumLargeTextTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      v12 = -[PUPhotoStreamAlbumLargeTextTableViewCell initWithStyle:reuseIdentifier:]([PUPhotoStreamAlbumLargeTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PUPhotoStreamAlbumsLargeTextTableViewControllerCell"));
    -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](v12, "albumImageView");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("PUPhotoStreamAlbumsTableViewControllerCell"));
    v12 = (PUPhotoStreamAlbumLargeTextTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v12 = -[PUPhotoStreamAlbumTableViewCell initWithStyle:reuseIdentifier:]([PUPhotoStreamAlbumTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PUPhotoStreamAlbumsTableViewControllerCell"));
      -[PUPhotoStreamAlbumLargeTextTableViewCell textLabel](v12, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFont:", v15);

      -[PUPhotoStreamAlbumLargeTextTableViewCell detailTextLabel](v12, "detailTextLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v17);

    }
    -[PUPhotoStreamAlbumLargeTextTableViewCell imageView](v12, "imageView");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v13;
  if (objc_msgSend(v6, "row") < 1)
  {
    PULocalizedString(CFSTR("NEW_PHOTO_STREAM"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoStreamAlbumLargeTextTableViewCell setText:](v12, "setText:", v25);

    -[PUPhotoStreamAlbumLargeTextTableViewCell setDetailText:](v12, "setDetailText:", &stru_1E58AD278);
    objc_msgSend(v18, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageWithSymbolConfiguration:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setImage:", v20);
    -[PUPhotoStreamAlbumLargeTextTableViewCell setAccessoryType:](v12, "setAccessoryType:", 1);
  }
  else
  {
    -[NSOrderedSet objectAtIndex:](self->_albumsOrderedSet, "objectAtIndex:", objc_msgSend(v6, "row") - 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cloudGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->_selectedAlbumGuids, "containsObject:", v20))
      v21 = 3;
    else
      v21 = 0;
    -[PUPhotoStreamAlbumLargeTextTableViewCell setAccessoryType:](v12, "setAccessoryType:", v21);
    objc_msgSend(v19, "localizedTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoStreamAlbumLargeTextTableViewCell setText:](v12, "setText:", v22);

    objc_msgSend(v19, "localizedSharedWithLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoStreamAlbumLargeTextTableViewCell setDetailText:](v12, "setDetailText:", v23);

    -[PUPhotoStreamAlbumsTableViewController posterImageForAlbum:imageView:](self, "posterImageForAlbum:imageView:", v19, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v24);

  }
  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
    return *MEMORY[0x1E0DC53D8];
  +[PUPhotoStreamAlbumTableViewCell cellHeight](PUPhotoStreamAlbumTableViewCell, "cellHeight");
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  +[PUPhotoStreamAlbumTableViewCell cellHeight](PUPhotoStreamAlbumTableViewCell, "cellHeight", a3, a4);
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a4;
  objc_msgSend(v5, "clearColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row"))
  {
    -[NSOrderedSet objectAtIndex:](self->_albumsOrderedSet, "objectAtIndex:", objc_msgSend(v7, "row") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EED7B898))
    {
      objc_msgSend(v8, "cloudGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableSet containsObject:](self->_selectedAlbumGuids, "containsObject:", v9))
      {
        if (self->_allowsMutlipleSelection
          && -[NSMutableSet containsObject:](self->_selectedAlbumGuids, "containsObject:", v9))
        {
          -[NSMutableSet removeObject:](self->_selectedAlbumGuids, "removeObject:", v9);
          objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAccessoryType:", 0);

        }
      }
      else
      {
        if (!self->_allowsMutlipleSelection)
        {
          -[NSMutableSet removeAllObjects](self->_selectedAlbumGuids, "removeAllObjects");
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          objc_msgSend(v6, "visibleCells", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setAccessoryType:", 0);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            }
            while (v13);
          }

        }
        -[NSMutableSet addObject:](self->_selectedAlbumGuids, "addObject:", v9);
        objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAccessoryType:", 3);

        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
        -[PUPhotoStreamAlbumsTableViewController pickerDelegate](self, "pickerDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "controller:didSelectAlbum:", self, v8);

      }
    }
  }
  else
  {
    -[PUPhotoStreamAlbumsTableViewController pickerDelegate](self, "pickerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controllerWillCreateNewAlbum:", self);
  }

}

- (CGSize)contentSizeForViewInPopover
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationFrame");
  v5 = v4;
  v7 = v6;

  -[PUPhotoStreamAlbumsTableViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  v14 = v7 + v11 * -2.0 - v5;
  v15 = v13;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  int IsAccessibilityCategory;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUPhotoStreamAlbumsTableViewController;
  v4 = a3;
  -[PUPhotoStreamAlbumsTableViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v10.receiver, v10.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = UIContentSizeCategoryIsAccessibilityCategory(v5);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if ((_DWORD)v4 != IsAccessibilityCategory)
  {
    -[PUPhotoStreamAlbumsTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

  }
}

- (BOOL)allowsMutlipleSelection
{
  return self->_allowsMutlipleSelection;
}

- (void)setAllowsMutlipleSelection:(BOOL)a3
{
  self->_allowsMutlipleSelection = a3;
}

- (PUPhotoStreamsAlbumsTableViewControllerDelegate)pickerDelegate
{
  return (PUPhotoStreamsAlbumsTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_pickerDelegate);
}

- (void)setPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pickerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pickerDelegate);
  objc_storeStrong((id *)&self->_selectedAlbumGuids, 0);
  objc_storeStrong((id *)&self->_albumsOrderedSet, 0);
}

+ (id)albumListForContentMode:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumListForContentMode:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71760], "filteredAlbumList:filter:", v6, 0x4000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D71B38]);
  objc_msgSend(a1, "_albumsComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAlbumList:sortComparator:", v7, v9);

  return v10;
}

+ (id)_albumsComparator
{
  return (id)objc_msgSend(&__block_literal_global_67583, "copy");
}

uint64_t __59__PUPhotoStreamAlbumsTableViewController__albumsComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EED7B898)
    && objc_msgSend(v5, "conformsToProtocol:", &unk_1EED7B898))
  {
    objc_msgSend(v4, "cloudLastContributionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudLastContributionDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (v7)
        v9 = objc_msgSend(v7, "compare:", v6);
      else
        v9 = -1;
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
