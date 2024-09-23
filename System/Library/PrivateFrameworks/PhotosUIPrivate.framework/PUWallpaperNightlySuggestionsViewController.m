@implementation PUWallpaperNightlySuggestionsViewController

- (PUWallpaperNightlySuggestionsViewController)initWithSpec:(id)a3
{
  id v4;
  PUWallpaperNightlySuggestionsDataSource *v5;
  void *v6;
  PUWallpaperNightlySuggestionsDataSource *v7;
  void *v8;
  void *v9;
  PUWallpaperNightlySuggestionsViewController *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [PUWallpaperNightlySuggestionsDataSource alloc];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUWallpaperNightlySuggestionsDataSource initWithPhotoLibrary:](v5, "initWithPhotoLibrary:", v6);

  -[PUWallpaperNightlySuggestionsDataSource delegates](v7, "delegates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPointer:", self);

  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PUWallpaperNightlySuggestionsViewController;
  v10 = -[PUPassiveContentSummaryViewController initWithSpec:dataSource:](&v12, sel_initWithSpec_dataSource_, v4, v9);

  if (v10)
    objc_storeStrong((id *)&v10->_dataSource, v7);

  return v10;
}

- (void)viewDidLoad
{
  NSDate *v3;
  NSDate *currentDate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentDate = self->_currentDate;
  self->_currentDate = v3;

  v9.receiver = self;
  v9.super_class = (Class)PUWallpaperNightlySuggestionsViewController;
  -[PUPassiveContentSummaryViewController viewDidLoad](&v9, sel_viewDidLoad);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel_nextDate_);
  objc_msgSend(v5, "setDirection:", 2);
  -[PUWallpaperNightlySuggestionsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel_previousDate_);
  objc_msgSend(v7, "setDirection:", 1);
  -[PUWallpaperNightlySuggestionsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:", v7);

  -[PUWallpaperNightlySuggestionsDataSource setDate:](self->_dataSource, "setDate:", self->_currentDate);
  -[PUWallpaperNightlySuggestionsDataSource setPosterConfiguration:](self->_dataSource, "setPosterConfiguration:", self->_posterConfiguration);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PUPassiveContentDataSource count](self->_dataSource, "count", a3, a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)nextDate:(id)a3
{
  NSDate *v4;
  NSDate *currentDate;

  -[NSDate dateByAddingTimeInterval:](self->_currentDate, "dateByAddingTimeInterval:", a3, 86400.0);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentDate = self->_currentDate;
  self->_currentDate = v4;

  -[PUWallpaperNightlySuggestionsDataSource setDate:](self->_dataSource, "setDate:", self->_currentDate);
}

- (void)previousDate:(id)a3
{
  NSDate *v4;
  NSDate *currentDate;

  -[NSDate dateByAddingTimeInterval:](self->_currentDate, "dateByAddingTimeInterval:", a3, -86400.0);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentDate = self->_currentDate;
  self->_currentDate = v4;

  -[PUWallpaperNightlySuggestionsDataSource setDate:](self->_dataSource, "setDate:", self->_currentDate);
}

- (void)setPosterConfiguration:(id)a3
{
  PUWallpaperNightlySuggestionsPosterConfiguration *v5;

  v5 = (PUWallpaperNightlySuggestionsPosterConfiguration *)a3;
  if (self->_posterConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    -[PUWallpaperNightlySuggestionsDataSource setPosterConfiguration:](self->_dataSource, "setPosterConfiguration:", v5);
  }

}

- (PUWallpaperNightlySuggestionsPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
