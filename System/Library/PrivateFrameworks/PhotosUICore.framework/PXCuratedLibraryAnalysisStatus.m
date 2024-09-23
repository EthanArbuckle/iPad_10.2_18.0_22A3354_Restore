@implementation PXCuratedLibraryAnalysisStatus

- (void)didPerformChanges
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  PXCuratedLibraryAnalysisStatus *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  -[PXCuratedLibraryAnalysisStatus didPerformChanges](&v4, sel_didPerformChanges);
  if (-[PXCuratedLibraryAnalysisStatus currentChanges](self, "currentChanges"))
  {
    PLCuratedLibraryGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryAnalysisStatus] Did transition to %@", buf, 0xCu);
    }

    -[PXCuratedLibraryAnalysisStatus _updateEventsTracking](self, "_updateEventsTracking");
  }
}

- (PXCuratedLibraryAnalysisStatus)initWithDataSourceManager:(id)a3
{
  id v4;
  _BOOL4 v5;
  __objc2_class **v6;
  PXCuratedLibraryAnalysisStatus *v7;

  v4 = a3;
  v5 = +[PXMockCuratedLibraryAnalysisStatus shouldUseMock](PXMockCuratedLibraryAnalysisStatus, "shouldUseMock");
  v6 = off_1E50B66F8;
  if (v5)
    v6 = off_1E50B3590;
  v7 = (PXCuratedLibraryAnalysisStatus *)objc_msgSend(objc_alloc(*v6), "initWithDataSourceManager:", v4);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_alternateTitleTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  -[PXCuratedLibraryAnalysisStatus dealloc](&v3, sel_dealloc);
}

- (id)_initWithDataSourceManager:(id)a3
{
  id v5;
  PXCuratedLibraryAnalysisStatus *v6;
  PXCuratedLibraryAnalysisStatus *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  v6 = -[PXCuratedLibraryAnalysisStatus init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    -[PXCuratedLibraryAnalysisStatus dataSourceManagerDidChange](v7, "dataSourceManagerDidChange");
  }

  return v7;
}

- (PXCuratedLibraryAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (int64_t)alternateTitleIndex
{
  return self->_alternateTitleIndex;
}

- (int64_t)state
{
  return self->_state;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)isDaysMonthsYearsStructureEnabled
{
  return self->_isDaysMonthsYearsStructureEnabled;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXCuratedLibraryAnalysisStatus signalChange:](self, "signalChange:", 1);
  }
}

- (void)setProgress:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_progress = a3;
    -[PXCuratedLibraryAnalysisStatus signalChange:](self, "signalChange:", 8);
  }
}

- (void)setLocalizedTitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *localizedTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_localizedTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      localizedTitle = self->_localizedTitle;
      self->_localizedTitle = v6;

      -[PXCuratedLibraryAnalysisStatus signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setLocalizedDescription:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *localizedDescription;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_localizedDescription;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      localizedDescription = self->_localizedDescription;
      self->_localizedDescription = v6;

      -[PXCuratedLibraryAnalysisStatus signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setIsDevicePlugged:(BOOL)a3
{
  if (self->_isDevicePlugged != a3)
  {
    self->_isDevicePlugged = a3;
    -[PXCuratedLibraryAnalysisStatus signalChange:](self, "signalChange:", 64);
  }
}

- (void)setIsDaysMonthsYearsStructureEnabled:(BOOL)a3
{
  if (self->_isDaysMonthsYearsStructureEnabled != a3)
  {
    self->_isDaysMonthsYearsStructureEnabled = a3;
    -[PXCuratedLibraryAnalysisStatus signalChange:](self, "signalChange:", 32);
  }
}

- (void)setDisplayProgress:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_displayProgress = a3;
    -[PXCuratedLibraryAnalysisStatus signalChange:](self, "signalChange:", 16);
  }
}

- (void)setEventTracker:(id)a3
{
  PXCuratedLibraryEventTracker *v5;
  PXCuratedLibraryEventTracker *v6;

  v5 = (PXCuratedLibraryEventTracker *)a3;
  if (self->_eventTracker != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_eventTracker, a3);
    -[PXCuratedLibraryAnalysisStatus _updateEventsTracking](self, "_updateEventsTracking");
    v5 = v6;
  }

}

- (void)_updateEventsTracking
{
  id v3;

  if (-[PXCuratedLibraryAnalysisStatus state](self, "state"))
  {
    -[PXCuratedLibraryAnalysisStatus eventTracker](self, "eventTracker");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryAnalysisStatus progress](self, "progress");
    objc_msgSend(v3, "logAnalysisProgress:");

  }
}

- (PXCuratedLibraryEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_alternateTitleTimer, 0);
}

- (PXCuratedLibraryAnalysisStatus)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryAnalysisStatus;
  return -[PXCuratedLibraryAnalysisStatus init](&v3, sel_init);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  float v11;
  double v12;
  _BOOL4 v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[PXCuratedLibraryAnalysisStatus state](self, "state");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_1E5138CE8[v5];
  -[PXCuratedLibraryAnalysisStatus localizedTitle](self, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryAnalysisStatus localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryAnalysisStatus progress](self, "progress");
  v10 = v9;
  -[PXCuratedLibraryAnalysisStatus displayProgress](self, "displayProgress");
  v12 = v11;
  v13 = -[PXCuratedLibraryAnalysisStatus isDaysMonthsYearsStructureEnabled](self, "isDaysMonthsYearsStructureEnabled");
  v14 = CFSTR("NO");
  if (v13)
    v14 = CFSTR("YES");
  v15 = v14;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; state: %@; localizedTitle: %@; localizedDescription: %@; progress: %0.2f; displayProgress: %0.2f; isDaysMonthsYearsStructureEnabled: %@>"),
    v4,
    self,
    v6,
    v7,
    v8,
    *(_QWORD *)&v10,
    *(_QWORD *)&v12,
    v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (void)setDataSourceManager:(id)a3
{
  PXCuratedLibraryAssetsDataSourceManager *v5;
  PXCuratedLibraryAssetsDataSourceManager *v6;
  char v7;
  PXCuratedLibraryAssetsDataSourceManager *v8;

  v8 = (PXCuratedLibraryAssetsDataSourceManager *)a3;
  v5 = self->_dataSourceManager;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXCuratedLibraryAssetsDataSourceManager isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSourceManager, a3);
      -[PXCuratedLibraryAnalysisStatus dataSourceManagerDidChange](self, "dataSourceManagerDidChange");
    }
  }

}

- (void)startCyclingThroughAlternateTitles
{
  int64_t numberOfRequestsToCycleThroughAlternateTitles;
  void *v4;
  double v5;
  double v6;
  NSTimer *v7;
  NSTimer *alternateTitleTimer;
  id v9;

  numberOfRequestsToCycleThroughAlternateTitles = self->_numberOfRequestsToCycleThroughAlternateTitles;
  self->_numberOfRequestsToCycleThroughAlternateTitles = numberOfRequestsToCycleThroughAlternateTitles + 1;
  if (!numberOfRequestsToCycleThroughAlternateTitles)
  {
    +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternateTitleCyclingInterval");
    v6 = v5;

    -[NSTimer invalidate](self->_alternateTitleTimer, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "px_timerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleAlternateTitleTimer_, 0, 1, v6);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    alternateTitleTimer = self->_alternateTitleTimer;
    self->_alternateTitleTimer = v7;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTimer:forMode:", self->_alternateTitleTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)stopCyclingThroughAlternateTitles
{
  int64_t v2;
  NSTimer *alternateTitleTimer;

  v2 = self->_numberOfRequestsToCycleThroughAlternateTitles - 1;
  self->_numberOfRequestsToCycleThroughAlternateTitles = v2;
  if (!v2)
  {
    -[NSTimer invalidate](self->_alternateTitleTimer, "invalidate");
    alternateTitleTimer = self->_alternateTitleTimer;
    self->_alternateTitleTimer = 0;

  }
}

- (void)cycleToNextAlternateTitle
{
  ++self->_alternateTitleIndex;
  -[PXCuratedLibraryAnalysisStatus alternateTitleIndexDidChange](self, "alternateTitleIndexDidChange");
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (float)displayProgress
{
  return self->_displayProgress;
}

- (BOOL)isDevicePlugged
{
  return self->_isDevicePlugged;
}

- (BOOL)hasBattery
{
  return self->_hasBattery;
}

+ (id)sharedStatusForLibrary:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCuratedLibraryAnalysisStatus.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  if (sharedStatusForLibrary__onceToken != -1)
    dispatch_once(&sharedStatusForLibrary__onceToken, &__block_literal_global_224705);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__224706;
  v18 = __Block_byref_object_dispose__224707;
  v19 = 0;
  v6 = sharedStatusForLibrary__fetchersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXCuratedLibraryAnalysisStatus_sharedStatusForLibrary___block_invoke_136;
  block[3] = &unk_1E5148AA8;
  v12 = v5;
  v13 = &v14;
  v7 = v5;
  dispatch_sync(v6, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __57__PXCuratedLibraryAnalysisStatus_sharedStatusForLibrary___block_invoke_136(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _PXCuratedLibraryConcreteAnalysisStatus *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)sharedStatusForLibrary__sharedStatusByPhotoLibrary, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_alloc_init(_PXCuratedLibraryConcreteAnalysisStatus);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)sharedStatusForLibrary__sharedStatusByPhotoLibrary, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

void __57__PXCuratedLibraryAnalysisStatus_sharedStatusForLibrary___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedStatusForLibrary__sharedStatusByPhotoLibrary;
  sharedStatusForLibrary__sharedStatusByPhotoLibrary = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.photos.PXCuratedLibraryAnalysisStatus-isolation-queue", v4);
  v3 = (void *)sharedStatusForLibrary__fetchersQueue;
  sharedStatusForLibrary__fetchersQueue = (uint64_t)v2;

}

@end
