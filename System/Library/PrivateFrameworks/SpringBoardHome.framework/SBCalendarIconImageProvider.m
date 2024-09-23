@implementation SBCalendarIconImageProvider

- (SBCalendarIconImageProvider)init
{
  void *v3;
  SBCalendarIconImageProvider *v4;

  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBCalendarIconImageProvider initWithDateTimeController:](self, "initWithDateTimeController:", v3);

  return v4;
}

- (SBCalendarIconImageProvider)initWithDateTimeController:(id)a3
{
  id v5;
  SBCalendarIconImageProvider *v6;
  SBCalendarIconImageProvider *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCalendarIconImageProvider;
  v6 = -[SBCalendarIconImageProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateTimeController, a3);
    objc_msgSend(v5, "addObserver:", v7);
    objc_msgSend(v5, "overrideDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[SBCalendarIconImageProvider controller:didChangeOverrideDateFromDate:](v7, "controller:didChangeOverrideDateFromDate:", v5, 0);
    else
      -[SBCalendarIconImageProvider _startListeningForSignificantTimeChanges](v7, "_startListeningForSignificantTimeChanges");

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFDateTimeController removeObserver:](self->_dateTimeController, "removeObserver:", self);
  -[SBCalendarIconImageProvider _stopListeningForSignificantTimeChanges](self, "_stopListeningForSignificantTimeChanges");
  v3.receiver = self;
  v3.super_class = (Class)SBCalendarIconImageProvider;
  -[SBCalendarIconImageProvider dealloc](&v3, sel_dealloc);
}

+ (NSString)significantTimeChangeNotificationName
{
  if (significantTimeChangeNotificationName)
    return (NSString *)(id)significantTimeChangeNotificationName;
  else
    return (NSString *)(id)*MEMORY[0x1E0DC4838];
}

+ (void)setSignificantTimeChangeNotificationName:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)significantTimeChangeNotificationName;
  significantTimeChangeNotificationName = v3;

}

- (void)reloadIconImage
{
  id v3;

  -[SBCalendarIconImageProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarIconImageProviderHasChanged:", self);

}

- (void)_startListeningForSignificantTimeChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "significantTimeChangeNotificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_reloadIconImage, v3, 0);

}

- (void)_stopListeningForSignificantTimeChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "significantTimeChangeNotificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

}

- (id)preparedISIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBCalendarIconImageProvider dateTimeController](self, "dateTimeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithDate:calendar:format:", v3, v4, 0);

  return v5;
}

- (id)iconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v10 = (void *)MEMORY[0x1D17DF4E4](self, a2, a3);
  -[SBCalendarIconImageProvider preparedISIcon](self, "preparedISIcon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v8, v7, v6);
  objc_msgSend(v11, "prepareImageForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3870];
  v15 = objc_msgSend(v13, "CGImage");
  objc_msgSend(v13, "scale");
  objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  return v16;
}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v10 = (void *)MEMORY[0x1D17DF4E4](self, a2, a3);
  -[SBCalendarIconImageProvider preparedISIcon](self, "preparedISIcon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v8, v7, v6);
  objc_msgSend(v12, "setShouldApplyMask:", 0);
  objc_msgSend(v11, "prepareImageForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3870];
  v15 = objc_msgSend(v13, "CGImage");
  objc_msgSend(v13, "scale");
  objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  return v16;
}

- (id)iconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  SBIconImageInfo *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v8 = (int)a4;
  v9 = v7;
  v10 = v6;
  v11 = v5;
  v13 = a3;
  v14 = (void *)MEMORY[0x1D17DF4E4]();
  -[SBCalendarIconImageProvider preparedISIcon](self, "preparedISIcon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v11, v10, v9);
  v17 = SBHIconServicesOptionsForImageOptions(v8);
  SBHModifyImageDescriptorWithTraitCollection(v16, (uint64_t)v13, v17);
  objc_msgSend(v15, "prepareImageForDescriptor:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0DC3870];
  v20 = objc_msgSend(v18, "CGImage");
  objc_msgSend(v18, "scale");
  objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v14);
  return v21;
}

- (void)controller:(id)a3 didChangeOverrideDateFromDate:(id)a4
{
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "overrideDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (a4 || !v6)
  {
    if (a4 && !v6)
      -[SBCalendarIconImageProvider _startListeningForSignificantTimeChanges](self, "_startListeningForSignificantTimeChanges");
  }
  else
  {
    -[SBCalendarIconImageProvider _stopListeningForSignificantTimeChanges](self, "_stopListeningForSignificantTimeChanges");
  }
  -[SBCalendarIconImageProvider reloadIconImage](self, "reloadIconImage");

}

- (SBCalendarIconImageProviderDelegate)delegate
{
  return (SBCalendarIconImageProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFDateTimeController)dateTimeController
{
  return self->_dateTimeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTimeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
