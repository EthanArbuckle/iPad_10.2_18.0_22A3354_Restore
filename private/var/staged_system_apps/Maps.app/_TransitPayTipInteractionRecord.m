@implementation _TransitPayTipInteractionRecord

- (_TransitPayTipInteractionRecord)initWithTipType:(int)a3 isTourist:(BOOL)a4
{
  _TransitPayTipInteractionRecord *v6;
  _TransitPayTipInteractionRecord *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *displayCountForSinks;
  NSDate *dismissalDate;
  NSDate *lastDisplayed;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_TransitPayTipInteractionRecord;
  v6 = -[_TransitPayTipInteractionRecord init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    v6->_isTourist = a4;
    v6->_tipType = a3;
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    displayCountForSinks = v7->_displayCountForSinks;
    v7->_displayCountForSinks = v8;

    dismissalDate = v7->_dismissalDate;
    v7->_dismissalDate = 0;

    lastDisplayed = v7->_lastDisplayed;
    v7->_lastDisplayed = 0;

  }
  return v7;
}

- (id)incrementDisplayCountForSink:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  NSDate *v8;
  NSDate *lastDisplayed;

  v3 = *(_QWORD *)&a3;
  v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", (char *)-[_TransitPayTipInteractionRecord displayCountForSink:](self, "displayCountForSink:") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_displayCountForSinks, "setObject:forKeyedSubscript:", v5, v7);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  lastDisplayed = self->_lastDisplayed;
  self->_lastDisplayed = v8;

  return v5;
}

- (int64_t)displayCountForSink:(int)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  int64_t v11;
  id v12;
  int v14;
  const __CFString *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_displayCountForSinks, "objectForKey:", v6));
    if (!v7)
    {
      v8 = sub_10043253C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = CFSTR("UNKNOWN SINK TYPE");
        if (a3 == 4)
          v10 = CFSTR("SinkTypeRoutePlanning");
        if (a3 == 2)
          v10 = CFSTR("SinkTypeMapsHome");
        v14 = 138412290;
        v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ did not have a display count, setting to 0", (uint8_t *)&v14, 0xCu);
      }

      v7 = &off_10126F8E0;
    }
    v11 = (int)-[NSObject intValue](v7, "intValue");
  }
  else
  {
    v12 = sub_10043253C();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Sink type key is null, this should never happen", (uint8_t *)&v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)userDismissedInSink:(int)a3
{
  uint64_t v3;
  NSDate *v5;
  NSDate *dismissalDate;

  v3 = *(_QWORD *)&a3;
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  dismissalDate = self->_dismissalDate;
  self->_dismissalDate = v5;

  -[_TransitPayTipInteractionRecord _resetTipDisplayCountForSink:](self, "_resetTipDisplayCountForSink:", v3);
}

- (void)_resetTipDisplayCountForSink:(int)a3
{
  NSMutableDictionary *displayCountForSinks;
  void *v5;
  void *v6;
  NSDate *lastDisplayed;

  displayCountForSinks = self->_displayCountForSinks;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](displayCountForSinks, "setObject:forKeyedSubscript:", &off_10126F8E0, v6);
  lastDisplayed = self->_lastDisplayed;
  self->_lastDisplayed = 0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TransitPayTipInteractionRecord)initWithCoder:(id)a3
{
  id v4;
  _TransitPayTipInteractionRecord *v5;
  id v6;
  uint64_t v7;
  NSDate *dismissalDate;
  id v9;
  uint64_t v10;
  NSDate *lastDisplayed;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *displayCountForSinks;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_TransitPayTipInteractionRecord;
  v5 = -[_TransitPayTipInteractionRecord init](&v20, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("dismissalDate"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    dismissalDate = v5->_dismissalDate;
    v5->_dismissalDate = (NSDate *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("lastDisplayed"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    lastDisplayed = v5->_lastDisplayed;
    v5->_lastDisplayed = (NSDate *)v10;

    v5->_isTourist = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTourist"));
    v5->_tipType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("tipType"));
    v12 = objc_opt_class(NSDictionary);
    v13 = objc_opt_class(NSString);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, objc_opt_class(NSNumber), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("displayCountForSinks")));
    v17 = (NSMutableDictionary *)objc_msgSend(v16, "mutableCopy");
    displayCountForSinks = v5->_displayCountForSinks;
    v5->_displayCountForSinks = v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *dismissalDate;
  id v5;
  id v6;

  dismissalDate = self->_dismissalDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dismissalDate, CFSTR("dismissalDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDisplayed, CFSTR("lastDisplayed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isTourist, CFSTR("isTourist"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_tipType, CFSTR("tipType"));
  v6 = -[NSMutableDictionary copy](self->_displayCountForSinks, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("displayCountForSinks"));

}

- (NSDate)lastDisplayed
{
  return self->_lastDisplayed;
}

- (void)setLastDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_lastDisplayed, a3);
}

- (int)tipType
{
  return self->_tipType;
}

- (void)setTipType:(int)a3
{
  self->_tipType = a3;
}

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(BOOL)a3
{
  self->_isTourist = a3;
}

- (NSMutableDictionary)displayCountForSinks
{
  return self->_displayCountForSinks;
}

- (void)setDisplayCountForSinks:(id)a3
{
  objc_storeStrong((id *)&self->_displayCountForSinks, a3);
}

- (NSDate)dismissalDate
{
  return self->_dismissalDate;
}

- (void)setDismissalDate:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalDate, 0);
  objc_storeStrong((id *)&self->_displayCountForSinks, 0);
  objc_storeStrong((id *)&self->_lastDisplayed, 0);
}

@end
