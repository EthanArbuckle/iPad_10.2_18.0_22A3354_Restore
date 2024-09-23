@implementation PILevelsRGBAutoCalculator

- (id)calculateSettingsForImageHistogram:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "red");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PILevelsAutoCalculator calculateSettingsForSingleChannelHistogram:suffix:](self, "calculateSettingsForSingleChannelHistogram:suffix:", v7, CFSTR("Red"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v8);

  objc_msgSend(v5, "green");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PILevelsAutoCalculator calculateSettingsForSingleChannelHistogram:suffix:](self, "calculateSettingsForSingleChannelHistogram:suffix:", v9, CFSTR("Green"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v10);

  objc_msgSend(v5, "blue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PILevelsAutoCalculator calculateSettingsForSingleChannelHistogram:suffix:](self, "calculateSettingsForSingleChannelHistogram:suffix:", v11, CFSTR("Blue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v12);

  return v6;
}

@end
