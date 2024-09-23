@implementation WGCalendarWidgetInfo

+ (BOOL)isCalendarExtension:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.mobilecal")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.UpNextWidget"));

  return v4;
}

- (WGCalendarWidgetInfo)initWithExtension:(id)a3
{
  WGCalendarWidgetInfo *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WGCalendarWidgetInfo;
  v3 = -[WGWidgetInfo initWithExtension:](&v7, sel_initWithExtension_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGCalendarWidgetInfo _setDate:](v3, "_setDate:", v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__handleSignificantTimeChange_, *MEMORY[0x24BDF75A0], 0);

  }
  return v3;
}

- (id)_queue_iconWithSize:(CGSize)a3 scale:(double)a4 forWidgetWithIdentifier:(id)a5 extension:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v25;

  height = a3.height;
  width = a3.width;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithDate:calendar:format:", v13, v14, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", width, height, a4);
  objc_msgSend(v15, "imageForImageDescriptor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDF6AC8];
  v19 = objc_msgSend(v17, "CGImage");
  objc_msgSend(v17, "scale");
  objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WGCalendarWidgetInfo;
    -[WGWidgetInfo _queue_iconWithSize:scale:forWidgetWithIdentifier:extension:](&v25, sel__queue_iconWithSize_scale_forWidgetWithIdentifier_extension_, v11, v12, width, height, a4);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  return v23;
}

- (id)_queue_iconWithOutlineForWidgetWithIdentifier:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithDate:calendar:format:", v8, v9, 0);
  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AE0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDrawBorder:", 1);
  objc_msgSend(v10, "imageForImageDescriptor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDF6AC8];
  v14 = objc_msgSend(v12, "CGImage");
  objc_msgSend(v12, "scale");
  objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)WGCalendarWidgetInfo;
    -[WGWidgetInfo _queue_iconWithOutlineForWidgetWithIdentifier:extension:](&v20, sel__queue_iconWithOutlineForWidgetWithIdentifier_extension_, v6, v7);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

- (void)_resetIconsImpl
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGCalendarWidgetInfo _setDate:](self, "_setDate:", v3);

  v4.receiver = self;
  v4.super_class = (Class)WGCalendarWidgetInfo;
  -[WGWidgetInfo _resetIconsImpl](&v4, sel__resetIconsImpl);
}

- (void)_handleSignificantTimeChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDateInToday:", self->_date) & 1) == 0)
    -[WGWidgetInfo _resetIcons](self, "_resetIcons");

}

- (NSDate)date
{
  return self->_date;
}

- (void)_setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
