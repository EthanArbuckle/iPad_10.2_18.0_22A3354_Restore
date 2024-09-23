@implementation RCDurationFormatter

- (void)_onQueueReloadLocalizedFormatStrings
{
  NSMutableDictionary *v3;
  NSMutableDictionary *styleToLocalizedDateTimeFormatTemplate;
  uint64_t i;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSNumberFormatter *v9;
  NSNumberFormatter *defaultFormatter;
  NSNumberFormatter *v11;
  NSNumberFormatter *nonPaddedHourMinuteFormatter;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  styleToLocalizedDateTimeFormatTemplate = self->_styleToLocalizedDateTimeFormatTemplate;
  self->_styleToLocalizedDateTimeFormatTemplate = v3;

  for (i = 0; i != 5; ++i)
  {
    objc_msgSend((id)objc_opt_class(), "_localizedDateTimeFormatTemplateForStyle:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = self->_styleToLocalizedDateTimeFormatTemplate;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v6, v8);

    }
  }
  v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
  defaultFormatter = self->_defaultFormatter;
  self->_defaultFormatter = v9;

  -[NSNumberFormatter setNumberStyle:](self->_defaultFormatter, "setNumberStyle:", 0);
  -[NSNumberFormatter setMinimumIntegerDigits:](self->_defaultFormatter, "setMinimumIntegerDigits:", 2);
  -[NSNumberFormatter setPositiveFormat:](self->_defaultFormatter, "setPositiveFormat:", CFSTR("00"));
  v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
  nonPaddedHourMinuteFormatter = self->_nonPaddedHourMinuteFormatter;
  self->_nonPaddedHourMinuteFormatter = v11;

  -[NSNumberFormatter setNumberStyle:](self->_nonPaddedHourMinuteFormatter, "setNumberStyle:", 0);
  -[NSNumberFormatter setMinimumIntegerDigits:](self->_nonPaddedHourMinuteFormatter, "setMinimumIntegerDigits:", 1);
  -[NSNumberFormatter setPositiveFormat:](self->_nonPaddedHourMinuteFormatter, "setPositiveFormat:", CFSTR("0"));
}

+ (id)_localizedDateTimeFormatTemplateForStyle:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *DateFormatFromTemplate;
  void *v11;
  uint64_t v12;

  v5 = objc_alloc(MEMORY[0x1E0C99DC8]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithLocaleIdentifier:", v7);

  objc_msgSend(a1, "_dateTimeFormatTemplateForStyle:", a3);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  DateFormatFromTemplate = (__CFString *)CFDateFormatterCreateDateFormatFromTemplate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, 0, (CFLocaleRef)v8);
  objc_msgSend(v8, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasPrefix:", CFSTR("ee_"))
    && -[__CFString hasPrefix:](DateFormatFromTemplate, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
  {
    -[__CFString substringFromIndex:](DateFormatFromTemplate, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length"));
    v12 = objc_claimAutoreleasedReturnValue();

    DateFormatFromTemplate = (__CFString *)v12;
  }

  return DateFormatFromTemplate;
}

+ (id)_dateTimeFormatTemplateForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)();
  void *v11;
  SEL v12;
  id v13;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __55__RCDurationFormatter__dateTimeFormatTemplateForStyle___block_invoke;
  v11 = &__block_descriptor_48_e5_v8__0l;
  v12 = a2;
  v13 = a1;
  if (_dateTimeFormatTemplateForStyle__onceToken != -1)
    dispatch_once(&_dateTimeFormatTemplateForStyle__onceToken, &v8);
  v4 = (void *)_dateTimeFormatTemplateForStyle__styleToDateTimeFormat;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, v8, v9, v10, v11, v12, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1)
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_4);
  return (id)sharedFormatter_sharedInstance;
}

- (id)localizedStringFromDurationStrings:(RCDurationStrings *)a3 style:(int64_t)a4
{
  NSMutableDictionary *styleToLocalizedDateTimeFormatTemplate;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  styleToLocalizedDateTimeFormatTemplate = self->_styleToLocalizedDateTimeFormatTemplate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](styleToLocalizedDateTimeFormatTemplate, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[RCDurationFormatter _replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:](self, "_replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:", 0, a3->var0, v9);
  -[RCDurationFormatter _replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:](self, "_replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:", 1, a3->var1, v9);
  -[RCDurationFormatter _replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:](self, "_replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:", 2, a3->var2, v9);
  -[RCDurationFormatter _replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:](self, "_replaceComponentPlaceholderForType:withString:inLocalizedDataFormatTemplate:", 3, a3->var3, v9);
  v10 = (void *)objc_msgSend(v9, "copy");

  __destructor_8_s0_s8_s16_s24(&a3->var0);
  return v10;
}

- (void)_replaceComponentPlaceholderForType:(unint64_t)a3 withString:(id)a4 inLocalizedDataFormatTemplate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    if (a3 - 1 > 2)
      v9 = &unk_1E76A9500;
    else
      v9 = (void *)qword_1E769C950[a3 - 1];
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_18);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v8, "containsString:", v15, (_QWORD)v16))
          {
            objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v15, v7, 0, 0, objc_msgSend(v8, "length"));
            goto LABEL_15;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

uint64_t __100__RCDurationFormatter__replaceComponentPlaceholderForType_withString_inLocalizedDataFormatTemplate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v7 = v8 < objc_msgSend(v5, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (RCDurationIntegers)durationIntegersFromDuration:(SEL)a3 byReplacingDigitsWithDigit:(double)a4 style:(int64_t)a5
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v7 = (unint64_t)a4;
  v8 = (unint64_t)(a4 * 100.0) % 0x64;
  v9 = (unint64_t)a4 / 0x3C;
  if (a6 != 4)
    v7 = 0;
  if ((unint64_t)(a6 - 2) < 2)
    v7 = (unint64_t)a4 % 0x3C;
  else
    v9 = 0;
  if ((unint64_t)a6 >= 2)
    v10 = 0;
  else
    v10 = (unint64_t)a4 / 0xE10;
  if ((unint64_t)a6 >= 2)
    v11 = v9;
  else
    v11 = (unint64_t)a4 / 0x3C
        - 60 * ((unint64_t)(((unint64_t)a4 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1);
  if ((unint64_t)a6 >= 2)
    v12 = v7;
  else
    v12 = (unint64_t)a4 % 0x3C;
  if ((a5 & 0x8000000000000000) == 0)
  {
    v14 = objc_msgSend(CFSTR("0"), "length");
    v15 = RCNumberOfDigitsInInteger(v10);
    if (v14 <= v15)
      v16 = v15;
    else
      v16 = v14;
    v10 = a5;
    v17 = v16 - 1;
    if (v17)
    {
      v18 = 10;
      v10 = a5;
      do
      {
        v10 += v18 * a5;
        v18 *= 10;
        --v17;
      }
      while (v17);
    }
    v19 = RCNumberOfDigitsInInteger(v11);
    v20 = 2;
    if (v19 > 2)
      v20 = v19;
    v21 = v20 - 1;
    v22 = 10;
    v11 = a5;
    do
    {
      v11 += v22 * a5;
      v22 *= 10;
      --v21;
    }
    while (v21);
    v23 = RCNumberOfDigitsInInteger(v12);
    v24 = 2;
    if (v23 > 2)
      v24 = v23;
    v25 = v24 - 1;
    v26 = 10;
    v12 = a5;
    do
    {
      v12 += v26 * a5;
      v26 *= 10;
      --v25;
    }
    while (v25);
    self = (RCDurationIntegers *)RCNumberOfDigitsInInteger(v8);
    v27 = 2;
    if ((unint64_t)self > 2)
      v27 = (uint64_t)self;
    v28 = v27 - 1;
    v29 = 10;
    v8 = a5;
    do
    {
      v8 += v29 * a5;
      v29 *= 10;
      --v28;
    }
    while (v28);
  }
  retstr->var0 = v10;
  retstr->var1 = v11;
  retstr->var2 = v12;
  retstr->var3 = v8;
  return self;
}

uint64_t __51__RCDurationFormatter_reloadLocalizedFormatStrings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueReloadLocalizedFormatStrings");
}

void __38__RCDurationFormatter_sharedFormatter__block_invoke()
{
  RCDurationFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(RCDurationFormatter);
  v1 = (void *)sharedFormatter_sharedInstance;
  sharedFormatter_sharedInstance = (uint64_t)v0;

}

- (RCDurationFormatter)init
{
  RCDurationFormatter *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RCDurationFormatter;
  v2 = -[RCDurationFormatter init](&v16, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C99720];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __27__RCDurationFormatter_init__block_invoke;
    v13 = &unk_1E769C858;
    objc_copyWeak(&v14, &location);
    v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, &v10);

    v7 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    -[RCDurationFormatter reloadLocalizedFormatStrings](v2, "reloadLocalizedFormatStrings", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)reloadLocalizedFormatStrings
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RCDurationFormatter_reloadLocalizedFormatStrings__block_invoke;
  block[3] = &unk_1E769BF30;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __55__RCDurationFormatter__dateTimeFormatTemplateForStyle___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E76A95A8;
  v2[1] = &unk_1E76A95C0;
  v3[0] = CFSTR("HHmmssSS");
  v3[1] = CFSTR("HHmmss");
  v2[2] = &unk_1E76A95D8;
  v2[3] = &unk_1E76A95F0;
  v3[2] = CFSTR("mmssSS");
  v3[3] = CFSTR("mmss");
  v2[4] = &unk_1E76A9608;
  v3[4] = CFSTR("sSS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_dateTimeFormatTemplateForStyle__styleToDateTimeFormat;
  _dateTimeFormatTemplateForStyle__styleToDateTimeFormat = v0;

}

void __27__RCDurationFormatter_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadLocalizedFormatStrings");

}

- (id)stringFromDuration:(double)a3 replacingDigitsWithDigit:(unint64_t)a4 style:(int64_t)a5
{
  NSObject *queue;
  id v10;
  void *v13;
  _QWORD block[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (a4 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCDurationFormatter.m"), 79, CFSTR("Invalid replacement digit, must be a single digit"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__RCDurationFormatter_stringFromDuration_replacingDigitsWithDigit_style___block_invoke;
  block[3] = &unk_1E769C880;
  block[4] = self;
  block[5] = &v15;
  *(double *)&block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  dispatch_sync(queue, block);
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __73__RCDurationFormatter_stringFromDuration_replacingDigitsWithDigit_style___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueueStringFromDuration:byReplacingDigitsWithDigit:hideComponentOptions:style:shouldPadMinute:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), 1, *(double *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)stringFromDuration:(double)a3 hideComponentOptions:(int64_t)a4 style:(int64_t)a5 shouldPadMinute:(BOOL)a6
{
  NSObject *queue;
  id v7;
  _QWORD v9[9];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__RCDurationFormatter_stringFromDuration_hideComponentOptions_style_shouldPadMinute___block_invoke;
  v9[3] = &unk_1E769C8A8;
  v9[4] = self;
  v9[5] = &v11;
  *(double *)&v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  v10 = a6;
  dispatch_sync(queue, v9);
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __85__RCDurationFormatter_stringFromDuration_hideComponentOptions_style_shouldPadMinute___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueueStringFromDuration:byReplacingDigitsWithDigit:hideComponentOptions:style:shouldPadMinute:", -1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_onQueueStringFromDuration:(double)a3 byReplacingDigitsWithDigit:(int64_t)a4 hideComponentOptions:(int64_t)a5 style:(int64_t)a6 shouldPadMinute:(BOOL)a7
{
  _BOOL8 v7;
  void *v11;
  id v13[4];
  _OWORD v14[2];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  v7 = a7;
  v16 = 0u;
  v17 = 0u;
  -[RCDurationFormatter durationIntegersFromDuration:byReplacingDigitsWithDigit:style:](self, "durationIntegersFromDuration:byReplacingDigitsWithDigit:style:", a4, a6, a3);
  memset(v15, 0, sizeof(v15));
  v14[0] = v16;
  v14[1] = v17;
  -[RCDurationFormatter durationStringsFromDurationIntegers:hideComponentOptions:style:shouldPadMinute:](self, "durationStringsFromDurationIntegers:hideComponentOptions:style:shouldPadMinute:", v14, a5, a6, v7);
  __copy_constructor_8_8_s0_s8_s16_s24(v13, (id *)v15);
  if (self)
  {
    -[RCDurationFormatter localizedStringFromDurationStrings:style:](self, "localizedStringFromDurationStrings:style:", v13, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __destructor_8_s0_s8_s16_s24(v13);
    v11 = 0;
  }
  __destructor_8_s0_s8_s16_s24((id *)v15);
  return v11;
}

- (RCDurationStrings)durationStringsFromDurationIntegers:(SEL)a3 hideComponentOptions:(RCDurationIntegers *)a4 style:(int64_t)a5 shouldPadMinute:(int64_t)a6
{
  char v8;
  NSNumberFormatter *defaultFormatter;
  id *p_defaultFormatter;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSNumberFormatter *nonPaddedHourMinuteFormatter;
  NSNumberFormatter *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  RCDurationStrings *result;
  id v34;

  v8 = a5;
  p_defaultFormatter = (id *)&self->_defaultFormatter;
  defaultFormatter = self->_defaultFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4->var3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](defaultFormatter, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v8 & 1) != 0)
  {
    _hiddenComponentStringWithString(v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v17 = *p_defaultFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4->var2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringFromNumber:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v8 & 2) != 0)
  {
    _hiddenComponentStringWithString(v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  if (!a7 && (!a4->var0 || a4->var1 >= 0xA))
    p_defaultFormatter = (id *)&self->_nonPaddedHourMinuteFormatter;
  v21 = *p_defaultFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4->var1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromNumber:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v8 & 4) != 0)
  {
    _hiddenComponentStringWithString(v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  if ((unint64_t)a6 > 1)
    nonPaddedHourMinuteFormatter = 0;
  else
    nonPaddedHourMinuteFormatter = self->_nonPaddedHourMinuteFormatter;
  v26 = nonPaddedHourMinuteFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4->var0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v26, "stringFromNumber:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v8 & 8) != 0)
  {
    _hiddenComponentStringWithString(v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v29;
  }
  retstr->var0 = v28;
  retstr->var1 = v23;
  retstr->var2 = v19;
  retstr->var3 = v15;
  v30 = v15;
  v34 = v19;
  v31 = v23;

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonPaddedHourMinuteFormatter, 0);
  objc_storeStrong((id *)&self->_defaultFormatter, 0);
  objc_storeStrong((id *)&self->_styleToLocalizedDateTimeFormatTemplate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
