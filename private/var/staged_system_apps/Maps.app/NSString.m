@implementation NSString

- (CGSize)_maps_sizeWithFont:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSAttributedStringKey v12;
  id v13;
  CGSize result;

  if (a3)
  {
    v12 = NSFontAttributeName;
    v13 = a3;
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));

  }
  else
  {
    v5 = 0;
  }
  -[NSString sizeWithAttributes:](self, "sizeWithAttributes:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSAttributedStringKey v15;
  id v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  if (a3)
  {
    v15 = NSFontAttributeName;
    v16 = a3;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  }
  else
  {
    v8 = 0;
  }
  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", 0, v8, 0, width, height);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)_maps_sizeWithFont:(id)a3 constrainedToSize:(CGSize)a4 options:(int64_t)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSAttributedStringKey v17;
  id v18;
  CGSize result;

  height = a4.height;
  width = a4.width;
  if (a3)
  {
    v17 = NSFontAttributeName;
    v18 = a3;
    v9 = a3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  }
  else
  {
    v10 = 0;
  }
  -[NSString boundingRectWithSize:options:attributes:context:](self, "boundingRectWithSize:options:attributes:context:", a5, v10, 0, width, height);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)_maps_drawAtPoint:(CGPoint)a3 withFont:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  NSAttributedStringKey v9;
  id v10;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v9 = NSFontAttributeName;
    v10 = a4;
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  }
  else
  {
    v8 = 0;
  }
  -[NSString drawAtPoint:withAttributes:](self, "drawAtPoint:withAttributes:", v8, x, y);

}

- (void)_maps_drawInRect:(CGRect)a3 withFont:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  NSAttributedStringKey v11;
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    v11 = NSFontAttributeName;
    v12 = a4;
    v9 = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  }
  else
  {
    v10 = 0;
  }
  -[NSString drawInRect:withAttributes:](self, "drawInRect:withAttributes:", v10, x, y, width, height);

}

+ (id)_maps_ridesharingETA:(id)a3 partySize:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", 60 * (_QWORD)objc_msgSend(a3, "unsignedIntegerValue"), 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ wait [ridesharing]"), CFSTR("localized string not found"), 0));
    a3 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingPairDetailString:withPartySize:](NSString, "_maps_ridesharingPairDetailString:withPartySize:", a3, v5));

  return v9;
}

+ (id)_maps_ridesharingScheduledPickupWindowStart:(id)a3 partySize:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v32;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v25 = 0;
LABEL_19:
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingPairDetailString:withPartySize:](NSString, "_maps_ridesharingPairDetailString:withPartySize:", v25, v6));
    goto LABEL_20;
  }
  if (qword_1014D20E8 != -1)
    dispatch_once(&qword_1014D20E8, &stru_1011B16D8);
  objc_msgSend((id)qword_1014D20E0, "setTimeStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  objc_msgSend((id)qword_1014D20E0, "setLocale:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  objc_msgSend((id)qword_1014D20E0, "setTimeZone:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFromComponents:", v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D20E0, "stringFromDate:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "abbreviation"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeZone"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v17 = objc_msgSend(v15, "isEqualToTimeZone:", v16);

  if ((_DWORD)v17)
  {

    v13 = 0;
  }
  v32 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar autoupdatingCurrentCalendar](NSCalendar, "autoupdatingCurrentCalendar"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v10, 4, v19, &v32));

  v21 = objc_msgSend(v5, "hour");
  if (v13)
  {
    if (v21 == (id)1 || objc_msgSend(v5, "hour") == (id)13)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = v22;
      v24 = CFSTR("Pickup date and time with TimeZone [Ridesharing] at 1");
LABEL_14:
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, CFSTR("localized string not found"), 0));

      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v20, v11));
      v27 = 0;
      v25 = 0;
      goto LABEL_18;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    v30 = CFSTR("Pickup date and time with timezone [Ridesharing] not at 1");
  }
  else
  {
    if (v21 == (id)1 || objc_msgSend(v5, "hour") == (id)13)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = v22;
      v24 = CFSTR("Pickup date and time [Ridesharing] at 1");
      goto LABEL_14;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = v28;
    v30 = CFSTR("Pickup date and time [Ridesharing] not at 1");
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v30, CFSTR("localized string not found"), 0));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v20, v11));
  v27 = 1;
LABEL_18:

  if (v27)
    goto LABEL_19;
LABEL_20:

  return v17;
}

+ (id)_maps_ridesharingPairDetailString:(id)a3 withPartySize:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _maps_ridesharingPartySizeString:](NSString, "_maps_ridesharingPartySizeString:", v6));

  if (v5 && v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("detail • party size [ridesharing]"), CFSTR("localized string not found"), 0));
    v11 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5, v8));

    v7 = v9;
LABEL_9:

    v7 = (void *)v11;
    goto LABEL_10;
  }
  if (v5)
  {
    v12 = v5;
LABEL_8:
    v11 = (uint64_t)v12;
    goto LABEL_9;
  }
  if (v8)
  {
    v12 = v8;
    goto LABEL_8;
  }
LABEL_10:

  return v7;
}

+ (id)_maps_ridesharingPartySizeString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[ridesharing] max party size"), CFSTR("localized string not found"), 0));

    v6 = objc_msgSend(v3, "unsignedLongLongValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_maps_prefixMatchesForSearchString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSUInteger v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  void *context;
  id obj;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  context = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_msgSend(v4, "length");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10039DBFC;
  v43[3] = &unk_1011B3AD0;
  v8 = v6;
  v44 = v8;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 1027, v43);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = -[NSString length](self, "length");
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10039DC08;
  v41[3] = &unk_1011B3AD0;
  v11 = v9;
  v42 = v11;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 1027, v41);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v31)
  {
    v29 = v11;
    v30 = *(_QWORD *)v38;
    v26 = v4;
    v32 = v5;
    while (1)
    {
      v12 = 0;
LABEL_4:
      if (*(_QWORD *)v38 != v30)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = objc_msgSend(v11, "copy");
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (!v15)
        break;
      v16 = v15;
      v17 = *(_QWORD *)v34;
LABEL_8:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
        v22 = objc_msgSend(v21, "rangeValue");

        if (!objc_msgSend(v20, "localizedStandardRangeOfString:", v13))
          break;

        if (v16 == (id)++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          if (v16)
            goto LABEL_8;
          goto LABEL_18;
        }
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v22, objc_msgSend(v13, "length")));
      objc_msgSend(v32, "addObject:", v23);

      v11 = v29;
      objc_msgSend(v29, "removeObject:", v19);

      if ((id)++v12 != v31)
        goto LABEL_4;
      v4 = v26;
      v5 = v32;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (!v31)
        goto LABEL_17;
    }
LABEL_18:

    objc_autoreleasePoolPop(context);
    v24 = 0;
    v4 = v26;
    v5 = v32;
  }
  else
  {
LABEL_17:

    objc_autoreleasePoolPop(context);
    v24 = v5;
  }

  return v24;
}

- (NSString)sha1Hash
{
  id v2;
  id v3;
  uint64_t i;
  unsigned __int8 md[20];

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4)));
  CC_SHA1(objc_msgSend(v2, "bytes"), (CC_LONG)objc_msgSend(v2, "length"), md);
  v3 = objc_alloc_init((Class)NSMutableString);
  for (i = 0; i != 20; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);

  return (NSString *)v3;
}

- (BOOL)_maps_containsExcessiveHeightCharacters
{
  void *v3;
  BOOL v4;

  if (!-[NSString length](self, "length"))
    return 0;
  v3 = (void *)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v4 = -[NSString rangeOfCharacterFromSet:](self, "rangeOfCharacterFromSet:", v3) != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (unint64_t)_rap_charactersCount
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10060EFC8;
  v4[3] = &unk_1011BE128;
  v4[4] = &v5;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, -[NSString length](self, "length"), 2, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)_rap_substringWithNumberOfCharacters:(unint64_t)a3
{
  NSUInteger v5;
  id v6;
  _QWORD v8[6];
  id v9[2];
  id location;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[4];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10060F158;
  v15 = sub_10060F168;
  v16 = 0;
  objc_initWeak(&location, self);
  v5 = -[NSString length](self, "length");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10060F170;
  v8[3] = &unk_1011BE150;
  v8[4] = v17;
  v9[1] = (id)a3;
  objc_copyWeak(v9, &location);
  v8[5] = &v11;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  v6 = (id)v12[5];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return v6;
}

- (id)_maps_dataFromDataDescription
{
  NSUInteger v3;
  NSMutableData *v4;
  void *v5;
  unint64_t v7;
  _BYTE v8[3];
  int v9;

  v3 = -[NSString length](self, "length");
  v4 = objc_opt_new(NSMutableData);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", self));
  if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
  {
    do
    {
      v7 = v3 - (_QWORD)objc_msgSend(v5, "scanLocation");
      v9 = 0;
      objc_msgSend(v5, "scanHexInt:", &v9);
      if (v7 < 5)
      {
        while (v7 != 2)
          -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v8[v7--], 1);
      }
      else
      {
        -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", (char *)&v9 + 3, 1);
        -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", (char *)&v9 + 2, 1);
        -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", (char *)&v9 + 1, 1);
        -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v9, 1);
      }
    }
    while (!objc_msgSend(v5, "isAtEnd"));
  }

  return v4;
}

- (id)stringByRemovingPunctuation
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  NSString *v11;
  uint64_t v13;

  if (!qword_1014D3848)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](NSCharacterSet, "punctuationCharacterSet"));
    v4 = (void *)qword_1014D3848;
    qword_1014D3848 = v3;

  }
  v5 = -[NSString length](self, "length");
  v6 = (char *)&v13 - ((2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  -[NSString getCharacters:](self, "getCharacters:", &v13);
  if (!v5)
    goto LABEL_10;
  v7 = 0;
  v8 = 0;
  v9 = 1;
  do
  {
    if ((objc_msgSend((id)qword_1014D3848, "characterIsMember:", *(unsigned __int16 *)&v6[2 * v7]) & 1) == 0)
      *(_WORD *)&v6[2 * v8++] = *(_WORD *)&v6[2 * v7];
    v7 = v9;
  }
  while (v5 > v9++);
  if (v8)
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v6, v8));
  else
LABEL_10:
    v11 = self;
  return v11;
}

+ (id)_maps_stringWithRemainingTime:(double)a3
{
  if (a3 < 0.0)
    a3 = -a3;
  return objc_msgSend(a1, "_navigation_stringWithSeconds:abbreviated:", vcvtad_u64_f64(a3), 1);
}

+ (id)distanceStringFromLocation:(id)a3 toMapItem:(id)a4 showsDistance:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "_coordinate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "distanceStringFromLocation:toCoordinate:withMapItem:showsDistance:onlyUseThreshold:maximumDistance:useShortThreshold:", v9, v8, a5, 0, 0, 1));

  return v10;
}

+ (id)distanceStringFromLocation:(id)a3 toCoordinate:(CLLocationCoordinate2D)a4 withMapItem:(id)a5 showsDistance:(BOOL *)a6 onlyUseThreshold:(BOOL)a7 maximumDistance:(id)a8 useShortThreshold:(BOOL)a9
{
  double longitude;
  double latitude;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v16 = a3;
  v17 = a5;
  v18 = a8;
  if (!v16)
    goto LABEL_8;
  v19 = 0;
  if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
  {
    v20 = objc_msgSend(v16, "coordinate");
    v23 = GEOCalculateDistance(v20, v21, v22, latitude, longitude);
    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      if (v23 > v24)
      {
LABEL_8:
        v19 = 0;
        goto LABEL_9;
      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_geoMapItem"));
    v27 = (double)objc_msgSend(v26, "_resultSnippetDistanceDisplayThreshold");

    if (v23 < v27
      || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_geoMapItem")),
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_resultSnippetLocationString")),
          v29,
          v28,
          v19 = 0,
          !v29)
      && !a7)
    {
      if (v23 <= 50.0 && a9)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Less than %@"), CFSTR("localized string not found"), 0));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0, 50.0));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v32));

      }
      else
      {
        *a6 = 1;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:](NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, 1, 0, 0, 0, v23));
      }
    }
  }
LABEL_9:

  return v19;
}

- (int64_t)fileCreationDateDescendingSort:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSComparisonResult v11;
  double v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", self, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileModificationDate"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesOfItemAtPath:error:", v4, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileModificationDate"));

  if (objc_msgSend(v7, "isEqualToDate:", v10))
  {
    v11 = -[NSString compare:](self, "compare:", v4);
  }
  else
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v10);
    if (v12 <= 0.0)
      v11 = NSOrderedDescending;
    else
      v11 = NSOrderedAscending;
  }

  return v11;
}

- (NSString)_maps_stringByTrimmingLeadingWhitespace
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  NSString *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (-[NSString length](self, "length"))
  {
    v4 = 0;
    while (objc_msgSend(v3, "characterIsMember:", -[NSString characterAtIndex:](self, "characterAtIndex:", v4)))
    {
      if (++v4 >= -[NSString length](self, "length"))
        goto LABEL_7;
    }
    if (!v4)
      goto LABEL_8;
LABEL_7:
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", v4));
  }
  else
  {
LABEL_8:
    v5 = self;
  }
  v6 = v5;

  return v6;
}

- (BOOL)_maps_isEqualToSearchStringForCurrentLocationSearchResult
{
  NSString *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = MKLocalizedStringForCurrentLocation(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = -[NSString localizedCaseInsensitiveCompare:](v2, "localizedCaseInsensitiveCompare:", v4) == NSOrderedSame;

  return (char)v2;
}

- (BOOL)maps_isSubstringStartingAtRangeEscaped:(_NSRange)a3
{
  void *v3;
  unsigned __int8 v4;

  if (!a3.location)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self, "substringWithRange:", a3.location - 1, 1));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("\\"));

  return v4;
}

- (BOOL)_mapstest_isCurrentLocationString
{
  return -[NSString isEqualToString:](self, "isEqualToString:", CFSTR("CURRENT_LOCATION"));
}

- (NSString)_maps_sha1Hash
{
  id v2;
  id v3;
  uint64_t i;
  unsigned __int8 md[20];

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4)));
  CC_SHA1(objc_msgSend(v2, "bytes"), (CC_LONG)objc_msgSend(v2, "length"), md);
  v3 = objc_alloc_init((Class)NSMutableString);
  for (i = 0; i != 20; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);

  return (NSString *)v3;
}

@end
