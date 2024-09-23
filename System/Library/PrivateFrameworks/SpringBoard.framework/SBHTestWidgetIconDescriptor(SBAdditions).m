@implementation SBHTestWidgetIconDescriptor(SBAdditions)

+ (id)todayNewsWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.news.widget"), CFSTR("com.apple.news"), CFSTR("today"), v4);

  return v5;
}

+ (id)overviewStocksWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.stocks.widget"), CFSTR("com.apple.stock"), CFSTR("overview"), v4);

  return v5;
}

+ (id)calendarWidgetIconDescriptorForSizeClass:()SBAdditions
{
  const __CFString *v3;
  const __CFString *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (*MEMORY[0x1E0DAA768])
    v3 = CFSTR("com.apple.CalendarWidget.CalendarListWidget");
  else
    v3 = CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget");
  if (*MEMORY[0x1E0DAA758])
    v4 = CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget");
  else
    v4 = v3;
  v5 = (objc_class *)MEMORY[0x1E0DAA568];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.mobilecal"), v4, v6);

  return v7;
}

+ (id)weatherWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), CFSTR("com.apple.weather"), v4);

  return v5;
}

+ (id)mapsWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.Maps.GeneralMapsWidget"), CFSTR("com.apple.Maps"), CFSTR("com.apple.Maps"), v4);

  return v5;
}

+ (id)relivePhotosWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), v4);

  return v5;
}

+ (id)gasparWatchDogWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.Gaspar.WatchdogWidget"), CFSTR("com.apple.Gaspar"), CFSTR("watchdogWidget"), v4);

  return v5;
}

+ (id)mobileNotesWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.mobilenotes.WidgetExtension"), CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.mobilenotes.FolderWidget"), v4);

  return v5;
}

+ (id)remindersWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.reminders.WidgetExtension"), CFSTR("com.apple.reminders"), CFSTR("com.apple.reminders.widget"), v4);

  return v5;
}

+ (id)tvWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.tv.TVWidgetExtension"), CFSTR("com.apple.tv"), CFSTR("com.apple.tv"), v4);

  return v5;
}

+ (id)podcastWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.podcasts.widget"), CFSTR("com.apple.podcasts"), CFSTR("com.apple.podcasts.widget.upnext"), v4);

  return v5;
}

+ (id)recentsWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0DAA458];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA560]), "initWithElement:sizeClass:", v5, v4);

  return v6;
}

+ (id)notesWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.mobilenotes.WidgetExtension"), CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.mobilenotes.FolderWidget"), v4);

  return v5;
}

+ (id)dateTimeWidgetIconDescriptorForSizeClass:()SBAdditions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA568];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:containerBundleIdentifier:widgetIdentifier:sizeClass:", CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"), CFSTR("com.apple.mobiletimer.datetime"), v4);

  return v5;
}

@end
