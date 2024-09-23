@implementation VUIFormatting

- (id)formatLocalizedNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6 currencyCode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (objc_class *)MEMORY[0x1E0C99DE8];
  v26 = a3;
  v17 = objc_alloc_init(v16);
  v18 = v17;
  if (v12)
    objc_msgSend(v17, "addObject:", v12);
  if (v13)
    objc_msgSend(v18, "addObject:", v13);
  if (v14)
    objc_msgSend(v18, "addObject:", v14);
  if (v15)
    objc_msgSend(v18, "addObject:", v15);
  objc_msgSend(v18, "valueForKey:", CFSTR("description"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("|"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_numberFormattersLock);
  -[NSMutableDictionary objectForKey:](self->_numberFormatters, "objectForKey:", v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("noStyle")) & 1) != 0)
    {
      v22 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("decimal")) & 1) != 0)
    {
      v22 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("currency")) & 1) != 0)
    {
      v22 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("percent")) & 1) != 0)
    {
      v22 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("scientific")) & 1) != 0)
    {
      v22 = 4;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("spellOut")))
    {
      v22 = 5;
    }
    else
    {
      v22 = 1;
    }
    v21 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v21, "setNumberStyle:", v22);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocale:", v23);

    if (objc_msgSend(v13, "length"))
      objc_msgSend(v21, "setPositiveFormat:", v13);
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v21, "setNegativeFormat:", v14);
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v21, "setCurrencyCode:", v15);
    if (v21)
      -[NSMutableDictionary setObject:forKey:](self->_numberFormatters, "setObject:forKey:", v21, v20);
  }
  os_unfair_lock_unlock(&self->_numberFormattersLock);
  objc_msgSend(v21, "stringFromNumber:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_22);
  return (id)sharedInstance_sSharedInstance_0;
}

void __31__VUIFormatting_sharedInstance__block_invoke()
{
  VUIFormatting *v0;
  void *v1;

  v0 = objc_alloc_init(VUIFormatting);
  v1 = (void *)sharedInstance_sSharedInstance_0;
  sharedInstance_sSharedInstance_0 = (uint64_t)v0;

}

- (VUIFormatting)init
{
  VUIFormatting *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dateFormatters;
  NSMutableDictionary *v5;
  NSMutableDictionary *numberFormatters;
  NSNumberFormatter *v7;
  NSNumberFormatter *durationFormatter;
  NSNumberFormatter *v9;
  NSNumberFormatter *durationPaddedFormatter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIFormatting;
  v2 = -[VUIFormatting init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dateFormatters = v2->_dateFormatters;
    v2->_dateFormatters = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    numberFormatters = v2->_numberFormatters;
    v2->_numberFormatters = v5;

    v2->_dateFormattersLock._os_unfair_lock_opaque = 0;
    v2->_numberFormattersLock._os_unfair_lock_opaque = 0;
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    durationFormatter = v2->_durationFormatter;
    v2->_durationFormatter = v7;

    -[NSNumberFormatter setNumberStyle:](v2->_durationFormatter, "setNumberStyle:", 1);
    v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    durationPaddedFormatter = v2->_durationPaddedFormatter;
    v2->_durationPaddedFormatter = v9;

    -[NSNumberFormatter setNumberStyle:](v2->_durationPaddedFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setPositiveFormat:](v2->_durationPaddedFormatter, "setPositiveFormat:", CFSTR("00"));
  }
  return v2;
}

+ (id)rfc1123DateFormatter
{
  if (rfc1123DateFormatter_onceToken != -1)
    dispatch_once(&rfc1123DateFormatter_onceToken, &__block_literal_global_1_0);
  return (id)rfc1123DateFormatter_sRFC1123Formatter;
}

void __37__VUIFormatting_rfc1123DateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  rfc1123DateFormatter_sRFC1123Formatter = (uint64_t)v0;

  v2 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)rfc1123DateFormatter_sRFC1123Formatter, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
  v4 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

+ (id)isoDateFormatter
{
  if (isoDateFormatter_onceToken != -1)
    dispatch_once(&isoDateFormatter_onceToken, &__block_literal_global_8_1);
  return (id)isoDateFormatter_sISOFormatter;
}

void __33__VUIFormatting_isoDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)isoDateFormatter_sISOFormatter;
  isoDateFormatter_sISOFormatter = (uint64_t)v0;

  v2 = (void *)isoDateFormatter_sISOFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)isoDateFormatter_sISOFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  v4 = (void *)isoDateFormatter_sISOFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

- (id)formatDate:(id)a3 format:(id)a4
{
  __CFString *v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (__CFString *)a4;
  v7 = a3;
  v8 = -[__CFString length](v6, "length");
  v9 = CFSTR("default");
  if (v8)
    v9 = v6;
  v10 = v9;

  os_unfair_lock_lock(&self->_dateFormattersLock);
  -[NSMutableDictionary objectForKey:](self->_dateFormatters, "objectForKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("default")))
    {
      objc_msgSend(v11, "setDateStyle:", 2);
      objc_msgSend(v11, "setTimeStyle:", 0);
      if (!v11)
        goto LABEL_9;
      goto LABEL_8;
    }
    v12 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFormatFromTemplate:options:locale:", v10, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDateFormat:", v14);
    if (v11)
LABEL_8:
      -[NSMutableDictionary setObject:forKey:](self->_dateFormatters, "setObject:forKey:", v11, v10);
  }
LABEL_9:
  os_unfair_lock_unlock(&self->_dateFormattersLock);
  objc_msgSend(v11, "stringFromDate:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)formatDuration:(id)a3 format:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSNumberFormatter *durationFormatter;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSNumberFormatter *durationPaddedFormatter;
  void *v39;
  void *v40;
  void *v42;

  v5 = a3;
  v6 = a4;
  v42 = v5;
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(v5, "integerValue");
    goto LABEL_5;
  }
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("k"));
  v8 = objc_msgSend(v5, "integerValue");
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v9 = v8 / 3600;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:
  v10 = v8 - 3600 * v9;
  v11 = ((unsigned __int128)(v10 * (__int128)(uint64_t)0x8888888888888889) >> 64) + v10;
  v12 = v11 >> 5;
  v13 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFormatFromTemplate:options:locale:", v6, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v9 >= 1)
  {
    v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("HH"));
    if (v17 != 0x7FFFFFFFFFFFFFFFLL
      || (v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("H")), v17 != 0x7FFFFFFFFFFFFFFFLL)
      || (v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("kk")), v17 != 0x7FFFFFFFFFFFFFFFLL)
      || (v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("k")), v17 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v19 = v17;
      v20 = v18;
      durationFormatter = self->_durationFormatter;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](durationFormatter, "stringFromNumber:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "replaceCharactersInRange:withString:", v19, v20, v23);
      v12 = v11 >> 5;
    }
  }
  v24 = v12 + ((unint64_t)v11 >> 63);
  v25 = objc_msgSend(v16, "rangeOfString:", CFSTR("mm"));
  if (v25 != 0x7FFFFFFFFFFFFFFFLL
    || (v25 = objc_msgSend(v16, "rangeOfString:", CFSTR("m")), v25 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v27 = v25;
    v28 = v26;
    v29 = 40;
    if (v9 > 0)
      v29 = 48;
    v30 = (void *)MEMORY[0x1E0CB37E8];
    v31 = *(id *)((char *)&self->super.isa + v29);
    objc_msgSend(v30, "numberWithInteger:", v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringFromNumber:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "replaceCharactersInRange:withString:", v27, v28, v33);
  }
  v34 = objc_msgSend(v16, "rangeOfString:", CFSTR("ss"));
  if (v34 != 0x7FFFFFFFFFFFFFFFLL
    || (v34 = objc_msgSend(v16, "rangeOfString:", CFSTR("s")), v34 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v36 = v34;
    v37 = v35;
    durationPaddedFormatter = self->_durationPaddedFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 - 60 * v24);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](durationPaddedFormatter, "stringFromNumber:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "replaceCharactersInRange:withString:", v36, v37, v40);
  }

  return v16;
}

- (id)formatNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99DE8];
  v14 = a3;
  v15 = objc_alloc_init(v13);
  v16 = v15;
  if (v10)
    objc_msgSend(v15, "addObject:", v10);
  if (v11)
    objc_msgSend(v16, "addObject:", v11);
  if (v12)
    objc_msgSend(v16, "addObject:", v12);
  objc_msgSend(v16, "valueForKey:", CFSTR("description"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR("_"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_numberFormattersLock);
  -[NSMutableDictionary objectForKey:](self->_numberFormatters, "objectForKey:", v18);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("noStyle")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("decimal")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("currency")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("percent")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("scientific")) & 1) != 0)
    {
      v20 = 4;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("spellOut")))
    {
      v20 = 5;
    }
    else
    {
      v20 = 1;
    }
    v19 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v19, "setNumberStyle:", v20);
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v19, "setPositiveFormat:", v11);
    if (objc_msgSend(v12, "length"))
      objc_msgSend(v19, "setNegativeFormat:", v12);
    if (v19)
      -[NSMutableDictionary setObject:forKey:](self->_numberFormatters, "setObject:forKey:", v19, v18);
  }
  os_unfair_lock_unlock(&self->_numberFormattersLock);
  objc_msgSend(v19, "stringFromNumber:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)formatLocalizedLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForLocaleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForLocaleIdentifier:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)joinComponents:(id)a3 withASCII:(id)a4 arabic:(id)a5 ethiopic:(id)a6 ideograph:(id)a7
{
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  int32x4_t v28;
  void *v29;
  id v30;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v33 = a7;
  v12 = objc_msgSend(v11, "count");
  if (!v12)
  {
    v14 = &stru_1E9FF3598;
    goto LABEL_36;
  }
  v39 = v12 - 1;
  if (v12 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v32 = v11;
    obj = v11;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        v34 = v19;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v21), "description", v32);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");
          if (v23)
          {
            v24 = v23;
            objc_msgSend(v16, "appendString:", v22);
            if (v19 != v39)
            {
              while (1)
              {
                v25 = v24 - 1;
                v26 = objc_msgSend(v22, "characterAtIndex:", v24 - 1);
                if ((objc_msgSend(v15, "characterIsMember:", v26) & 1) != 0)
                  goto LABEL_31;
                if (v24 >= 2 && (v26 & 0xFC00) == 0xDC00)
                {
                  v27 = objc_msgSend(v22, "characterAtIndex:", v24 - 2);
                  if ((v27 & 0xFC00) != 0xD800)
                    goto LABEL_23;
                  LODWORD(v26) = v26 + (v27 << 10) - 56613888;
                  --v24;
                }
                v28 = vdupq_n_s32(v26);
                if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DA1C1AC0, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1DA1C1AB0)))) & 1) != 0|| (v26 & 0xFFFFFF00) == 0x600)
                {
                  v29 = v36;
                  goto LABEL_30;
                }
                if ((v26 - 4608) < 0x1A0)
                {
                  v29 = v35;
                  goto LABEL_30;
                }
                if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1DA1C1AF0, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1DA1C1AD0)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1DA1C1B00, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1DA1C1AE0))))) & 1) != 0|| (v26 - 194560) < 0x220)
                {
                  v29 = v33;
LABEL_30:
                  v30 = v29;
                  if (v30)
                    goto LABEL_32;
                  goto LABEL_31;
                }
                v25 = v24 - 1;
LABEL_23:
                v24 = v25;
                if (!v25)
                  goto LABEL_31;
              }
            }
          }
          else if (v19 != v39)
          {
LABEL_31:
            v30 = v37;
LABEL_32:
            objc_msgSend(v16, "appendString:", v30);

          }
          ++v19;

          ++v21;
        }
        while (v21 != v18);
        v19 = v34 + v18;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v18);
    }

    v14 = (__CFString *)objc_msgSend(v16, "copy");
    v11 = v32;
    goto LABEL_36;
  }
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_36:
  return v14;
}

- (id)joinComponentsWithLocalizedCommaAndSpace:(id)a3
{
  return -[VUIFormatting joinComponents:withASCII:arabic:ethiopic:ideograph:](self, "joinComponents:withASCII:arabic:ethiopic:ideograph:", a3, CFSTR(", "), CFSTR("، "), CFSTR("፣ "), CFSTR("、"));
}

- (id)joinComponentsWithLocalizedSemicolonAndSpace:(id)a3
{
  return -[VUIFormatting joinComponents:withASCII:arabic:ethiopic:ideograph:](self, "joinComponents:withASCII:arabic:ethiopic:ideograph:", a3, CFSTR("; "),
           CFSTR("؛ "),
           CFSTR("፤ "),
           CFSTR("、"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationPaddedFormatter, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatters, 0);
  objc_storeStrong((id *)&self->_dateFormatters, 0);
}

@end
