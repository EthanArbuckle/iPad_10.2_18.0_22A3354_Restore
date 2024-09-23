@implementation VUIRentalExpirationLabel

+ (id)labelForRentalExpirationDate:(id)a3 downloadExpirationDate:(id)a4 contentAvailabilityDate:(id)a5 downloadStatus:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
    goto LABEL_8;
  if (a6 - 1 < 2 || (objc_msgSend(MEMORY[0x1E0C99D68], "shouldShowLabelForDownloadExpirationDate:", v10) & 1) == 0)
  {

LABEL_8:
    if (!v9)
    {
      v10 = 0;
      v15 = 0;
      goto LABEL_14;
    }
    v14 = v9;
    v10 = 0;
    goto LABEL_10;
  }
  if (!v9)
  {
    v17 = v10;
    v10 = v17;
    if (v11)
    {
      v13 = objc_msgSend(v11, "vui_isInThePast") ^ 1;
      v12 = 1;
      v14 = v10;
      goto LABEL_12;
    }
    v12 = 1;
    v14 = v17;
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "compare:", v10) == -1)
  {
    v14 = v9;
LABEL_10:
    v12 = 0;
LABEL_11:
    v13 = 1;
    goto LABEL_12;
  }
  v10 = v10;
  v12 = 0;
  v13 = 1;
  v14 = v10;
LABEL_12:
  +[VUIRentalExpirationLabel labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:forDownload:contentIsAvailable:](VUIRentalExpirationLabel, "labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:forDownload:contentIsAvailable:", v14, 0, 0, CFSTR("EXPIRATION_LEFT"), v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v15;
}

+ (id)labelWithTextLayout:(id)a3 existingLabel:(id)a4 locStringPrefix:(id)a5
{
  VUITextLayout *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v7 = (VUITextLayout *)a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v7 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v7, "setTextStyle:", 20);
    -[VUITextLayout setFontWeight:](v7, "setFontWeight:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v7, "setColor:", v10);

    -[VUITextLayout setNumberOfLines:](v7, "setNumberOfLines:", 1);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  +[VUILabel labelWithString:textLayout:existingLabel:](VUIRentalExpirationLabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLocStringPrefix:", v9);
  objc_msgSend(v12, "setContentIsAvailable:", 1);

  return v12;
}

+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6
{
  id v9;
  void *v10;

  v9 = a3;
  +[VUIRentalExpirationLabel labelWithTextLayout:existingLabel:locStringPrefix:](VUIRentalExpirationLabel, "labelWithTextLayout:existingLabel:locStringPrefix:", a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUseWarningColor:", 1);
  objc_msgSend(v10, "setExpirationDate:", v9);

  return v10;
}

+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6 useWarningColor:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;

  v7 = a7;
  v11 = a3;
  +[VUIRentalExpirationLabel labelWithTextLayout:existingLabel:locStringPrefix:](VUIRentalExpirationLabel, "labelWithTextLayout:existingLabel:locStringPrefix:", a4, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUseWarningColor:", v7);
  objc_msgSend(v12, "setExpirationDate:", v11);

  return v12;
}

+ (id)labelWithExpirationDate:(id)a3 textLayout:(id)a4 existingLabel:(id)a5 locStringPrefix:(id)a6 forDownload:(BOOL)a7 contentIsAvailable:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  VUITextLayout *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v8 = a8;
  v9 = a7;
  v13 = a3;
  v14 = (VUITextLayout *)a4;
  v15 = a5;
  v16 = a6;
  if (!v14)
  {
    v14 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v14, "setTextStyle:", 20);
    -[VUITextLayout setFontWeight:](v14, "setFontWeight:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v14, "setColor:", v17);

    -[VUITextLayout setNumberOfLines:](v14, "setNumberOfLines:", 1);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v15;
  else
    v18 = 0;
  +[VUILabel labelWithString:textLayout:existingLabel:](VUIRentalExpirationLabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocStringPrefix:", v16);
  objc_msgSend(v19, "setForDownload:", v9);
  objc_msgSend(v19, "setUseWarningColor:", 1);
  objc_msgSend(v19, "setContentIsAvailable:", v8);
  objc_msgSend(v19, "setExpirationDate:", v13);

  return v19;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIRentalExpirationLabel;
  v4 = a3;
  -[VUIRentalExpirationLabel willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);
  -[VUIRentalExpirationLabel vui_willMoveToWindow:](self, "vui_willMoveToWindow:", v4, v5.receiver, v5.super_class);

}

- (void)vui_willMoveToWindow:(id)a3
{
  if (a3)
    -[VUIRentalExpirationLabel _computeExpirationLabel:](self, "_computeExpirationLabel:");
  else
    -[VUIRentalExpirationLabel invalidateTimer](self, "invalidateTimer");
}

- (void)dealloc
{
  objc_super v3;

  -[VUIRentalExpirationLabel invalidateTimer](self, "invalidateTimer");
  v3.receiver = self;
  v3.super_class = (Class)VUIRentalExpirationLabel;
  -[VUILabel dealloc](&v3, sel_dealloc);
}

- (void)setExpirationDate:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_expirationDate, a3);
  -[VUIRentalExpirationLabel window](self, "window");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIRentalExpirationLabel _computeExpirationLabel:](self, "_computeExpirationLabel:", v4);

}

- (void)invalidateTimer
{
  NSTimer *expiryUpdateTimer;

  -[NSTimer invalidate](self->_expiryUpdateTimer, "invalidate");
  expiryUpdateTimer = self->_expiryUpdateTimer;
  self->_expiryUpdateTimer = 0;

}

- (void)_computeExpirationLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSTimer *expiryUpdateTimer;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSTimer *v27;
  NSTimer *v28;
  _QWORD v29[4];
  id v30;
  id location;
  uint64_t v32;
  char v33;

  v4 = a3;
  if (!self->_expirationDate)
  {
    -[NSTimer invalidate](self->_expiryUpdateTimer, "invalidate");
    expiryUpdateTimer = self->_expiryUpdateTimer;
    self->_expiryUpdateTimer = 0;

    goto LABEL_20;
  }
  v33 = 0;
  v32 = 0;
  if (self->_contentIsAvailable)
  {
    objc_msgSend((id)objc_opt_class(), "_calculateExpirationStringForDate:displayWarningColor:updateInterval:locStringPrefix:", self->_expirationDate, &v33, &v32, self->_locStringPrefix);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_forDownload)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:", CFSTR("EXPIRED"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "isEqualToString:", v7);

      if (v8)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:", CFSTR("RENEW"));
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v10;
      }
    }
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:", CFSTR("NOT_AVAILABLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 1;
  }
  -[VUILabel textLayout](self, "textLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v33 && self->_useWarningColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColor:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setColor:", v18);

    }
    objc_msgSend(v14, "darkColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v16;
  objc_msgSend(v14, "setDarkColor:", v16);

LABEL_16:
  objc_msgSend(v14, "attributedStringWithString:view:", v5, self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILabel setVuiAttributedText:](self, "setVuiAttributedText:", v21);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rentalExpirationLabelNeedsRelayout:", self);

  if (v4 && v32 >= 1)
  {
    objc_initWeak(&location, self);
    -[NSTimer invalidate](self->_expiryUpdateTimer, "invalidate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0C99E88];
    objc_msgSend(v23, "doubleValue");
    v26 = v25;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__VUIRentalExpirationLabel__computeExpirationLabel___block_invoke;
    v29[3] = &unk_1E9F9C288;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v24, "scheduledTimerWithTimeInterval:repeats:block:", 0, v29, v26);
    v27 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v28 = self->_expiryUpdateTimer;
    self->_expiryUpdateTimer = v27;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

LABEL_20:
}

void __52__VUIRentalExpirationLabel__computeExpirationLabel___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_computeExpirationLabel:", v1);

}

+ (id)calculateExpirationStringForDate:(id)a3 updateInterval:(int64_t *)a4 locStringPrefix:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v11;

  v11 = 0;
  v7 = a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_calculateExpirationStringForDate:displayWarningColor:updateInterval:locStringPrefix:", v8, &v11, a4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_calculateExpirationStringForDate:(id)a3 displayWarningColor:(BOOL *)a4 updateInterval:(int64_t *)a5 locStringPrefix:(id)a6
{
  const __CFString *v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  double v21;
  double v22;
  uint64_t v23;
  int64_t v24;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  int64_t *v37;
  __CFString *v38;

  v9 = (const __CFString *)a6;
  v10 = (objc_class *)MEMORY[0x1E0C99D48];
  v11 = a3;
  v12 = [v10 alloc];
  v13 = (void *)objc_msgSend(v12, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "components:fromDate:toDate:options:", 240, v14, v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "day");
  v17 = objc_msgSend(v15, "hour");
  v18 = objc_msgSend(v15, "minute");
  v19 = objc_msgSend(v15, "second");
  v20 = CFSTR("COUNT");
  if (v9)
    v20 = v9;
  v38 = (__CFString *)v20;
  objc_msgSend(v11, "timeIntervalSinceNow");
  v22 = v21;

  if (v22 > 0.0)
  {
    if (v16 >= 2)
    {
      v37 = a5;
      v23 = v19 + 5;
      if ((unint64_t)v16 >= 6)
        v23 = 0;
      v24 = 3600 * v17 + 60 * v18 + v23;
      if (v17 <= 0 && v18 <= 0 && v19 <= 0)
        v18 = v16;
      else
        v18 = v16 + 1;
      v27 = CFSTR("_DAYS");
      goto LABEL_27;
    }
    if (v16 != 1 && v17 <= 0)
    {
      if (v18 >= 1)
      {
        v37 = a5;
        v24 = v19 + 5;
        v27 = CFSTR("_MINUTES");
        goto LABEL_27;
      }
      if (v19 >= 1)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:", CFSTR("EXPIRES_LESS_THAN_ONE_MIN"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = v19 + 5;
        goto LABEL_28;
      }
      v24 = 0;
    }
    else
    {
      v24 = v19 + 60 * v18 + 5;
      if (v17 + 24 * v16)
      {
        v37 = a5;
        v27 = CFSTR("_HOURS");
        v18 = v17 + 24 * v16;
LABEL_27:
        -[__CFString stringByAppendingString:](v38, "stringByAppendingString:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithValidatedFormat:validFormatSpecifiers:error:", v34, CFSTR("%d"), 0, v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        a5 = v37;
LABEL_28:
        if (a4 && !*a4 && v16 <= 4)
          goto LABEL_31;
        goto LABEL_32;
      }
    }
    v29 = 0;
    goto LABEL_28;
  }
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:", CFSTR("EXPIRED"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  if (a4)
LABEL_31:
    *a4 = 1;
LABEL_32:
  if (a5)
    *a5 = v24;

  return v29;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (VUIRentalExpirationLabelDelegate)delegate
{
  return (VUIRentalExpirationLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)locStringPrefix
{
  return self->_locStringPrefix;
}

- (void)setLocStringPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSTimer)expiryUpdateTimer
{
  return self->_expiryUpdateTimer;
}

- (void)setExpiryUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expiryUpdateTimer, a3);
}

- (BOOL)contentIsAvailable
{
  return self->_contentIsAvailable;
}

- (void)setContentIsAvailable:(BOOL)a3
{
  self->_contentIsAvailable = a3;
}

- (BOOL)forDownload
{
  return self->_forDownload;
}

- (void)setForDownload:(BOOL)a3
{
  self->_forDownload = a3;
}

- (BOOL)useWarningColor
{
  return self->_useWarningColor;
}

- (void)setUseWarningColor:(BOOL)a3
{
  self->_useWarningColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locStringPrefix, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
