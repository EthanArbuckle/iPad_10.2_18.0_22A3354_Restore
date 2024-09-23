@implementation SSDateFormatManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)sharedDateFormatManager;
    sharedDateFormatManager = v2;

  }
}

- (SSDateFormatManager)init
{
  SSDateFormatManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSDateFormatManager;
  v2 = -[SSDateFormatManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_purgeMemory, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), 0);

  }
  return v2;
}

+ (void)purgeMemory
{
  objc_msgSend((id)sharedDateFormatManager, "purgeMemory");
}

- (void)purgeMemory
{
  CNDateComponentsFormatter *birthdayDateComponentsFormatter;
  NSDateComponentsFormatter *dateComponentsFormatter;
  NSDateFormatter *shortRelativeDateFormatter;
  NSDateFormatter *mediumRelativeDateFormatter;
  NSDateFormatter *dayOfWeekFormatter;
  NSDateFormatter *shortDayOfWeekFormatter;
  NSDateFormatter *shortDateTimeFormatter;
  NSDateFormatter *shortTimeFormatter;
  NSDateFormatter *dateFormatter;
  NSDateIntervalFormatter *shortDateTimeIntervalFormatter;
  NSDateIntervalFormatter *mediumDayOfWeekDateTimeIntervalFormatter;
  NSDateIntervalFormatter *shortDateIntervalFormatter;
  NSDateIntervalFormatter *mediumDayOfWeekDateIntervalFormatter;
  NSDateIntervalFormatter *allDayDateFormatter;
  NSDateIntervalFormatter *dateIntervalFormatter;

  birthdayDateComponentsFormatter = self->_birthdayDateComponentsFormatter;
  self->_birthdayDateComponentsFormatter = 0;

  dateComponentsFormatter = self->_dateComponentsFormatter;
  self->_dateComponentsFormatter = 0;

  shortRelativeDateFormatter = self->_shortRelativeDateFormatter;
  self->_shortRelativeDateFormatter = 0;

  mediumRelativeDateFormatter = self->_mediumRelativeDateFormatter;
  self->_mediumRelativeDateFormatter = 0;

  dayOfWeekFormatter = self->_dayOfWeekFormatter;
  self->_dayOfWeekFormatter = 0;

  shortDayOfWeekFormatter = self->_shortDayOfWeekFormatter;
  self->_shortDayOfWeekFormatter = 0;

  shortDateTimeFormatter = self->_shortDateTimeFormatter;
  self->_shortDateTimeFormatter = 0;

  shortTimeFormatter = self->_shortTimeFormatter;
  self->_shortTimeFormatter = 0;

  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = 0;

  shortDateTimeIntervalFormatter = self->_shortDateTimeIntervalFormatter;
  self->_shortDateTimeIntervalFormatter = 0;

  mediumDayOfWeekDateTimeIntervalFormatter = self->_mediumDayOfWeekDateTimeIntervalFormatter;
  self->_mediumDayOfWeekDateTimeIntervalFormatter = 0;

  shortDateIntervalFormatter = self->_shortDateIntervalFormatter;
  self->_shortDateIntervalFormatter = 0;

  mediumDayOfWeekDateIntervalFormatter = self->_mediumDayOfWeekDateIntervalFormatter;
  self->_mediumDayOfWeekDateIntervalFormatter = 0;

  allDayDateFormatter = self->_allDayDateFormatter;
  self->_allDayDateFormatter = 0;

  dateIntervalFormatter = self->_dateIntervalFormatter;
  self->_dateIntervalFormatter = 0;

}

- (CNDateComponentsFormatter)birthdayDateComponentsFormatter
{
  CNDateComponentsFormatter **p_birthdayDateComponentsFormatter;
  CNDateComponentsFormatter *v4;
  void *v5;

  p_birthdayDateComponentsFormatter = &self->_birthdayDateComponentsFormatter;
  v4 = self->_birthdayDateComponentsFormatter;
  if (!v4)
  {
    v4 = (CNDateComponentsFormatter *)objc_opt_new();
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDateComponentsFormatter setLocale:](v4, "setLocale:", v5);

    objc_storeStrong((id *)p_birthdayDateComponentsFormatter, v4);
  }
  return v4;
}

- (NSDateComponentsFormatter)dateComponentsFormatter
{
  NSDateComponentsFormatter **p_dateComponentsFormatter;
  NSDateComponentsFormatter *v3;

  p_dateComponentsFormatter = &self->_dateComponentsFormatter;
  v3 = self->_dateComponentsFormatter;
  if (!v3)
  {
    v3 = (NSDateComponentsFormatter *)objc_opt_new();
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v3, "setZeroFormattingBehavior:", 0);
    -[NSDateComponentsFormatter setUnitsStyle:](v3, "setUnitsStyle:", 0);
    objc_storeStrong((id *)p_dateComponentsFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)shortRelativeDateFormatter
{
  NSDateFormatter **p_shortRelativeDateFormatter;
  NSDateFormatter *v3;

  p_shortRelativeDateFormatter = &self->_shortRelativeDateFormatter;
  v3 = self->_shortRelativeDateFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setFormattingContext:](v3, "setFormattingContext:", 1);
    -[NSDateFormatter setDateStyle:](v3, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v3, "setTimeStyle:", 0);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v3, "setDoesRelativeDateFormatting:", 1);
    objc_storeStrong((id *)p_shortRelativeDateFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)mediumRelativeDateFormatter
{
  NSDateFormatter **p_mediumRelativeDateFormatter;
  NSDateFormatter *v3;

  p_mediumRelativeDateFormatter = &self->_mediumRelativeDateFormatter;
  v3 = self->_mediumRelativeDateFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setFormattingContext:](v3, "setFormattingContext:", 1);
    -[NSDateFormatter setDateStyle:](v3, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v3, "setTimeStyle:", 0);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v3, "setDoesRelativeDateFormatting:", 1);
    objc_storeStrong((id *)p_mediumRelativeDateFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)dayOfWeekFormatter
{
  NSDateFormatter **p_dayOfWeekFormatter;
  NSDateFormatter *v4;
  void *v5;
  void *v6;
  void *v7;

  p_dayOfWeekFormatter = &self->_dayOfWeekFormatter;
  v4 = self->_dayOfWeekFormatter;
  if (!v4)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    v5 = (void *)MEMORY[0x1E0CB3578];
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", v7);

    objc_storeStrong((id *)p_dayOfWeekFormatter, v4);
  }
  return v4;
}

- (NSDateFormatter)shortDayOfWeekFormatter
{
  NSDateFormatter **p_shortDayOfWeekFormatter;
  NSDateFormatter *v4;
  void *v5;
  void *v6;
  void *v7;

  p_shortDayOfWeekFormatter = &self->_shortDayOfWeekFormatter;
  v4 = self->_shortDayOfWeekFormatter;
  if (!v4)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    v5 = (void *)MEMORY[0x1E0CB3578];
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFormatFromTemplate:options:locale:", CFSTR("E"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", v7);

    objc_storeStrong((id *)p_shortDayOfWeekFormatter, v4);
  }
  return v4;
}

- (NSDateFormatter)shortDateTimeFormatter
{
  NSDateFormatter **p_shortDateTimeFormatter;
  NSDateFormatter *v3;

  p_shortDateTimeFormatter = &self->_shortDateTimeFormatter;
  v3 = self->_shortDateTimeFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setFormattingContext:](v3, "setFormattingContext:", 1);
    -[NSDateFormatter setDateStyle:](v3, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v3, "setTimeStyle:", 1);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v3, "setDoesRelativeDateFormatting:", 1);
    objc_storeStrong((id *)p_shortDateTimeFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)shortTimeFormatter
{
  NSDateFormatter **p_shortTimeFormatter;
  NSDateFormatter *v3;

  p_shortTimeFormatter = &self->_shortTimeFormatter;
  v3 = self->_shortTimeFormatter;
  if (!v3)
  {
    v3 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setFormattingContext:](v3, "setFormattingContext:", 1);
    -[NSDateFormatter setDateStyle:](v3, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](v3, "setTimeStyle:", 1);
    objc_storeStrong((id *)p_shortTimeFormatter, v3);
  }
  return v3;
}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter **p_dateFormatter;
  NSDateFormatter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_dateFormatter = &self->_dateFormatter;
  v4 = self->_dateFormatter;
  if (!v4)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    objc_msgSend(CFSTR("EMMMdyyyy"), "stringByAppendingString:", CFSTR("jmma"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setFormattingContext:](v4, "setFormattingContext:", 1);
    v6 = (void *)MEMORY[0x1E0CB3578];
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v5, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", v8);

    objc_storeStrong((id *)p_dateFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)shortDateTimeIntervalFormatter
{
  NSDateIntervalFormatter **p_shortDateTimeIntervalFormatter;
  NSDateIntervalFormatter *v3;

  p_shortDateTimeIntervalFormatter = &self->_shortDateTimeIntervalFormatter;
  v3 = self->_shortDateTimeIntervalFormatter;
  if (!v3)
  {
    v3 = (NSDateIntervalFormatter *)objc_opt_new();
    -[NSDateIntervalFormatter setDateStyle:](v3, "setDateStyle:", 1);
    -[NSDateIntervalFormatter setTimeStyle:](v3, "setTimeStyle:", 1);
    objc_storeStrong((id *)p_shortDateTimeIntervalFormatter, v3);
  }
  return v3;
}

- (NSDateIntervalFormatter)mediumDayOfWeekDateTimeIntervalFormatter
{
  NSDateIntervalFormatter **p_mediumDayOfWeekDateTimeIntervalFormatter;
  NSDateIntervalFormatter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  p_mediumDayOfWeekDateTimeIntervalFormatter = &self->_mediumDayOfWeekDateTimeIntervalFormatter;
  v4 = self->_mediumDayOfWeekDateTimeIntervalFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    v11[0] = CFSTR("E");
    v11[1] = CFSTR("MMMd");
    v11[2] = CFSTR("jma");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", &stru_1E6E549F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3578];
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFormatFromTemplate:options:locale:", v6, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setDateTemplate:](v4, "setDateTemplate:", v9);

    objc_storeStrong((id *)p_mediumDayOfWeekDateTimeIntervalFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)shortDateIntervalFormatter
{
  NSDateIntervalFormatter **p_shortDateIntervalFormatter;
  NSDateIntervalFormatter *v3;

  p_shortDateIntervalFormatter = &self->_shortDateIntervalFormatter;
  v3 = self->_shortDateIntervalFormatter;
  if (!v3)
  {
    v3 = (NSDateIntervalFormatter *)objc_opt_new();
    -[NSDateIntervalFormatter setDateStyle:](v3, "setDateStyle:", 1);
    -[NSDateIntervalFormatter setTimeStyle:](v3, "setTimeStyle:", 0);
    objc_storeStrong((id *)p_shortDateIntervalFormatter, v3);
  }
  return v3;
}

- (NSDateIntervalFormatter)mediumDayOfWeekDateIntervalFormatter
{
  NSDateIntervalFormatter **p_mediumDayOfWeekDateIntervalFormatter;
  NSDateIntervalFormatter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  p_mediumDayOfWeekDateIntervalFormatter = &self->_mediumDayOfWeekDateIntervalFormatter;
  v4 = self->_mediumDayOfWeekDateIntervalFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    v11[0] = CFSTR("E");
    v11[1] = CFSTR("MMMd");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", &stru_1E6E549F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3578];
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFormatFromTemplate:options:locale:", v6, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setDateTemplate:](v4, "setDateTemplate:", v9);

    objc_storeStrong((id *)p_mediumDayOfWeekDateIntervalFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)allDayDateFormatter
{
  NSDateIntervalFormatter **p_allDayDateFormatter;
  NSDateIntervalFormatter *v4;
  void *v5;
  void *v6;
  void *v7;

  p_allDayDateFormatter = &self->_allDayDateFormatter;
  v4 = self->_allDayDateFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    v5 = (void *)MEMORY[0x1E0CB3578];
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFormatFromTemplate:options:locale:", CFSTR("EMMMdyyyy"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setDateTemplate:](v4, "setDateTemplate:", v7);

    objc_storeStrong((id *)p_allDayDateFormatter, v4);
  }
  return v4;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  NSDateIntervalFormatter **p_dateIntervalFormatter;
  NSDateIntervalFormatter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_dateIntervalFormatter = &self->_dateIntervalFormatter;
  v4 = self->_dateIntervalFormatter;
  if (!v4)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    objc_msgSend(CFSTR("EMMMdyyyy"), "stringByAppendingString:", CFSTR("jmma"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3578];
    -[SSDateFormatManager currentLocale](self, "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v5, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setDateTemplate:](v4, "setDateTemplate:", v8);

    objc_storeStrong((id *)p_dateIntervalFormatter, v4);
  }
  return v4;
}

+ (id)allFormatters
{
  return (id)objc_msgSend((id)sharedDateFormatManager, "allFormatters");
}

- (id)allFormatters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[17];

  v20[15] = *MEMORY[0x1E0C80C00];
  -[SSDateFormatManager birthdayDateComponentsFormatter](self, "birthdayDateComponentsFormatter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  -[SSDateFormatManager dateComponentsFormatter](self, "dateComponentsFormatter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v18;
  -[SSDateFormatManager shortRelativeDateFormatter](self, "shortRelativeDateFormatter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v17;
  -[SSDateFormatManager mediumRelativeDateFormatter](self, "mediumRelativeDateFormatter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  -[SSDateFormatManager dayOfWeekFormatter](self, "dayOfWeekFormatter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v15;
  -[SSDateFormatManager shortDayOfWeekFormatter](self, "shortDayOfWeekFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v3;
  -[SSDateFormatManager shortDateTimeFormatter](self, "shortDateTimeFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v4;
  -[SSDateFormatManager shortTimeFormatter](self, "shortTimeFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v5;
  -[SSDateFormatManager dateFormatter](self, "dateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v6;
  -[SSDateFormatManager shortDateTimeIntervalFormatter](self, "shortDateTimeIntervalFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v7;
  -[SSDateFormatManager mediumDayOfWeekDateTimeIntervalFormatter](self, "mediumDayOfWeekDateTimeIntervalFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v8;
  -[SSDateFormatManager shortDateIntervalFormatter](self, "shortDateIntervalFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v9;
  -[SSDateFormatManager mediumDayOfWeekDateIntervalFormatter](self, "mediumDayOfWeekDateIntervalFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v10;
  -[SSDateFormatManager allDayDateFormatter](self, "allDayDateFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[13] = v11;
  -[SSDateFormatManager dateIntervalFormatter](self, "dateIntervalFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[14] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 15);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)currentLocale
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[SSDateFormatManager overrideLocale](self, "overrideLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)calendar
{
  return (id)objc_msgSend((id)sharedDateFormatManager, "calendar");
}

- (id)calendar
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDateFormatManager currentLocale](self, "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  return v3;
}

+ (id)tomorrow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDay:", 1);
  objc_msgSend(a1, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "compare:", a4) != -1 && objc_msgSend(v7, "compare:", v8) != 1;

  return v9;
}

+ (BOOL)isDate:(id)a3 withinTimeInterval:(double)a4 includePast:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  double v8;

  if (!a3)
    return 0;
  v5 = a5;
  objc_msgSend(a3, "timeIntervalSinceNow");
  v8 = fabs(v7);
  if (v5)
    v7 = v8;
  return v7 <= a4 && v7 >= 0.0;
}

+ (BOOL)isDateWithinWeeksTime:(id)a3
{
  return objc_msgSend(a1, "isDate:withinTimeInterval:includePast:", a3, 1, 604800.0);
}

+ (BOOL)isDateWithinMonthsTime:(id)a3
{
  return objc_msgSend(a1, "isDate:withinTimeInterval:includePast:", a3, 1, 2592000.0);
}

+ (BOOL)hasRelativeFormatForDate:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)sharedDateFormatManager, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isDateInYesterday:", v3) & 1) != 0 || (objc_msgSend(v4, "isDateInToday:", v3) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "isDateInTomorrow:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)shortDateTimeStringFromDate:(id)a3 isAllDay:(BOOL)a4
{
  return (id)objc_msgSend(a1, "shortDateTimeStringFromDate:isAllDay:showAllDayString:", a3, a4, 1);
}

+ (id)shortDateTimeStringFromDate:(id)a3 isAllDay:(BOOL)a4 showAllDayString:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ALL_DAY_SHORT_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = CFSTR("%@");
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)sharedDateFormatManager, "shortRelativeDateFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)sharedDateFormatManager, "shortDateTimeFormatter");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringFromDate:](v9, "stringFromDate:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)dynamicCompactStringFromDate:(id)a3
{
  return (id)objc_msgSend(a1, "dynamicStringFromDate:isCompact:", a3, 1);
}

+ (id)dynamicMediumStringFromDate:(id)a3
{
  return (id)objc_msgSend(a1, "dynamicStringFromDate:isCompact:", a3, 0);
}

+ (id)dynamicStringFromDate:(id)a3 isCompact:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  if (v6)
  {
    v7 = (id)sharedDateFormatManager;
    v8 = v7;
    if (a4)
      objc_msgSend(v7, "shortRelativeDateFormatter");
    else
      objc_msgSend(v7, "mediumRelativeDateFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)sharedDateFormatManager, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isDateInToday:", v6);

    if (v12)
    {
      objc_msgSend(v8, "shortTimeFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(a1, "hasRelativeFormatForDate:", v6) & 1) != 0
        || !objc_msgSend(a1, "isDateWithinWeeksTime:", v6))
      {
        goto LABEL_12;
      }
      objc_msgSend(v8, "dayOfWeekFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    objc_msgSend(v13, "stringFromDate:", v6);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v15;
LABEL_12:

    goto LABEL_13;
  }
  v9 = &stru_1E6E549F0;
LABEL_13:

  return v9;
}

+ (id)dyanmicStringFromDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (id)sharedDateFormatManager;
  objc_msgSend(v5, "shortRelativeDateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "hasRelativeFormatForDate:", v4) & 1) == 0
    && objc_msgSend(a1, "isDateWithinMonthsTime:", v4))
  {
    objc_msgSend(v5, "mediumDayOfWeekDateIntervalFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:toDate:", v4, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

+ (id)dynamicDateTimeStringsFromDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)sharedDateFormatManager;
  objc_msgSend((id)sharedDateFormatManager, "shortRelativeDateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "hasRelativeFormatForDate:", v4) & 1) == 0
    && objc_msgSend(a1, "isDateWithinMonthsTime:", v4))
  {
    objc_msgSend(v5, "mediumDayOfWeekDateIntervalFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:toDate:", v4, v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v5, "shortTimeFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v11)
  {
    v18 = v7;
    v19 = v11;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v18;
    v14 = 2;
  }
  else
  {
    if (!v7)
    {
      v15 = 0;
      goto LABEL_10;
    }
    v17 = v7;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v17;
    v14 = 1;
  }
  objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

+ (id)stringsFromDate:(id)a3 toDate:(id)a4 isAllDay:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[3];

  v5 = a5;
  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a3)
  {
    v9 = (id)sharedDateFormatManager;
    v10 = a3;
    if (objc_msgSend(a1, "isDateWithinMonthsTime:", v10)
      && (!v8 || objc_msgSend(a1, "isDateWithinMonthsTime:", v8)))
    {
      if (v5)
        objc_msgSend(v9, "mediumDayOfWeekDateIntervalFormatter");
      else
        objc_msgSend(v9, "mediumDayOfWeekDateTimeIntervalFormatter");
    }
    else if (v5)
    {
      objc_msgSend(v9, "shortDateIntervalFormatter");
    }
    else
    {
      objc_msgSend(v9, "shortDateTimeIntervalFormatter");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    if (v8)
      v14 = v8;
    else
      v14 = v10;
    objc_msgSend(v11, "stringFromDate:toDate:", v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v20[0] = v15;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ALL_DAY"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)stringFromBirthdayComponents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)sharedDateFormatManager;
  v4 = a3;
  objc_msgSend(v3, "birthdayDateComponentsFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDateComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)icalConformingStringFromDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);

  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd_HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v7);

  objc_msgSend(v5, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringFromTimeInterval:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;

  objc_msgSend((id)sharedDateFormatManager, "dateComponentsFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = round(a3);
  if (v6 < 3600.0)
    v7 = 192;
  else
    v7 = 224;
  objc_msgSend(v4, "setAllowedUnits:", v7);
  objc_msgSend(v5, "stringFromTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)dateFormatter
{
  return (id)objc_msgSend((id)sharedDateFormatManager, "dateFormatter");
}

+ (id)shortDateTimeFormatter
{
  return (id)objc_msgSend((id)sharedDateFormatManager, "shortDateTimeFormatter");
}

+ (id)allDayDateFormatter
{
  return (id)objc_msgSend((id)sharedDateFormatManager, "allDayDateFormatter");
}

+ (id)dateIntervalFormatter
{
  return (id)objc_msgSend((id)sharedDateFormatManager, "dateIntervalFormatter");
}

+ (id)dateModifiedStringFormat
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_MODIFIED_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dateDueStringFormat
{
  __CFString *v2;
  void *v3;

  if ((SSSnippetModernizationEnabled() & 1) != 0)
  {
    v2 = CFSTR("%@");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DATE_DUE_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

+ (id)dateLastOpenedStringFormat
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_LAST_OPENED_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dateLastPlayedStringFormat
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_LAST_PLAYED_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dateLastCalledStringFormat
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_LAST_CALLED_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dateCreatedStringFormat
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_CREATED_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dateCompletedStringFormat
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATE_COMPLETED_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nextUpcomingDateForDateComponents:(id)a3 fromDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v8, "setMonth:", objc_msgSend(v6, "month"));
  objc_msgSend(v8, "setLeapMonth:", objc_msgSend(v6, "isLeapMonth"));
  v9 = objc_msgSend(v6, "day");

  objc_msgSend(v8, "setDay:", v9);
  objc_msgSend(v8, "setHour:", 12);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextDateAfterDate:matchingHour:minute:second:options:", v5, 0, 0, 0, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nextDateAfterDate:matchingComponents:options:", v11, v8, 256);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)overrideLocale:(id)a3
{
  objc_msgSend((id)sharedDateFormatManager, "setOverrideLocale:", a3);
  objc_msgSend((id)sharedDateFormatManager, "purgeMemory");
}

+ (id)mediumDayOfWeekDateTimeIntervalFormatter
{
  return (id)objc_msgSend((id)sharedDateFormatManager, "mediumDayOfWeekDateTimeIntervalFormatter");
}

- (NSLocale)overrideLocale
{
  return (NSLocale *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOverrideLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setBirthdayDateComponentsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_birthdayDateComponentsFormatter, a3);
}

- (void)setDateComponentsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateComponentsFormatter, a3);
}

- (void)setShortRelativeDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortRelativeDateFormatter, a3);
}

- (void)setMediumRelativeDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_mediumRelativeDateFormatter, a3);
}

- (void)setDayOfWeekFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dayOfWeekFormatter, a3);
}

- (void)setShortDayOfWeekFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortDayOfWeekFormatter, a3);
}

- (void)setShortDateTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortDateTimeFormatter, a3);
}

- (void)setShortTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortTimeFormatter, a3);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void)setShortDateTimeIntervalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortDateTimeIntervalFormatter, a3);
}

- (void)setMediumDayOfWeekDateTimeIntervalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_mediumDayOfWeekDateTimeIntervalFormatter, a3);
}

- (void)setShortDateIntervalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_shortDateIntervalFormatter, a3);
}

- (void)setMediumDayOfWeekDateIntervalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_mediumDayOfWeekDateIntervalFormatter, a3);
}

- (void)setAllDayDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_allDayDateFormatter, a3);
}

- (void)setDateIntervalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateIntervalFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_allDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_mediumDayOfWeekDateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_mediumDayOfWeekDateTimeIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateTimeIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_shortTimeFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_shortDayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_mediumRelativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_shortRelativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_birthdayDateComponentsFormatter, 0);
  objc_storeStrong((id *)&self->_overrideLocale, 0);
}

@end
