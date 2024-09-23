@implementation PPEventHighlight

- (PPEventHighlight)initWithEventIdentifier:(id)a3 externalURI:(id)a4 title:(id)a5 startDate:(id)a6 endDate:(id)a7 location:(id)a8 organizer:(id)a9 calendarColor:(CGColor *)a10 prominentFeature:(unint64_t)a11 features:(id)a12 score:(double)a13 isExtraordinary:(BOOL)a14
{
  id v21;
  id v22;
  id v23;
  id v24;
  PPEventHighlight *v25;
  uint64_t v26;
  NSString *eventIdentifier;
  uint64_t v28;
  NSString *title;
  uint64_t v30;
  NSString *location;
  uint64_t v32;
  NSString *organizer;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a4;
  v21 = a5;
  v36 = a6;
  v35 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a12;
  v39.receiver = self;
  v39.super_class = (Class)PPEventHighlight;
  v25 = -[PPEventHighlight init](&v39, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v38, "copy");
    eventIdentifier = v25->_eventIdentifier;
    v25->_eventIdentifier = (NSString *)v26;

    objc_storeStrong((id *)&v25->_externalURI, a4);
    v28 = objc_msgSend(v21, "copy");
    title = v25->_title;
    v25->_title = (NSString *)v28;

    objc_storeStrong((id *)&v25->_startDate, a6);
    objc_storeStrong((id *)&v25->_endDate, a7);
    v30 = objc_msgSend(v22, "copy");
    location = v25->_location;
    v25->_location = (NSString *)v30;

    v32 = objc_msgSend(v23, "copy");
    organizer = v25->_organizer;
    v25->_organizer = (NSString *)v32;

    v25->_calendarColor = CGColorRetain(a10);
    v25->_prominentFeature = a11;
    objc_storeStrong((id *)&v25->_features, a12);
    v25->_score = a13;
    v25->_isExtraordinary = a14;
  }

  return v25;
}

- (id)description
{
  id v3;
  NSString *title;
  NSString *location;
  double score;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  title = self->_title;
  location = self->_location;
  score = self->_score;
  if (self->_isExtraordinary)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  +[PPEventHighlight describeProminentFeature:](PPEventHighlight, "describeProminentFeature:", self->_prominentFeature);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPEventHighlight t:'%@' l:'%@' s:'%f' e:'%@' p:'%@' f:'%@'"), title, location, *(_QWORD *)&score, v7, v8, self->_features);

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSArray *features;
  unint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString hash](self->_eventIdentifier, "hash");
  v4 = -[NSURL hash](self->_externalURI, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_title, "hash") - v4 + 32 * v4;
  v6 = -[NSDate hash](self->_startDate, "hash") - v5 + 32 * v5;
  v7 = -[NSDate hash](self->_endDate, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_location, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_organizer, "hash");
  features = self->_features;
  v11 = self->_prominentFeature - (v9 - v8 + 32 * v8) + 32 * (v9 - v8 + 32 * v8);
  v12 = (unint64_t)self->_score - v11 + 32 * v11;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = features;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17++), "unsignedIntegerValue", (_QWORD)v21)
            - v12
            + 32 * v12;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExtraordinary);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  return v19 - v12 + 32 * v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eventIdentifier;
  id v5;

  eventIdentifier = self->_eventIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventIdentifier, CFSTR("eid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalURI, CFSTR("eur"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("ttl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("std"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("end"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("loc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizer, CFSTR("org"));
  PPEncodeCalendarColor(v5, self->_calendarColor);
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_prominentFeature), CFSTR("pft"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_features, CFSTR("fea"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("scr"), self->_score);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isExtraordinary, CFSTR("ise"));

}

- (PPEventHighlight)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  CGColor *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  PPEventHighlight *v22;
  NSObject *v23;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("eid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eur"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("ttl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("std"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("end"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x18D7805AC]();
  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("fea"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)v10;
  if (v6 && v7 && v8 && v9 && v10 && v15)
  {
    v17 = PPCreateCalendarColorWithDecoder(v3);
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("loc"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("org"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (int)objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("pft"));
    objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("scr"));
    v21 = v20;
    LOBYTE(v25) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("ise"));
    v22 = -[PPEventHighlight initWithEventIdentifier:externalURI:title:startDate:endDate:location:organizer:calendarColor:prominentFeature:features:score:isExtraordinary:](self, "initWithEventIdentifier:externalURI:title:startDate:endDate:location:organizer:calendarColor:prominentFeature:features:score:isExtraordinary:", v6, v7, v8, v9, v16, v26, v21, v18, v17, v19, v15, v25);

    CGColorRelease(v17);
    self = v22;
  }
  else
  {
    pp_events_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v3;
      _os_log_error_impl(&dword_18BE3A000, v23, OS_LOG_TYPE_ERROR, "failed to decode eventIdentifier, externalURI, title, startDate, endDate, or features from %@", buf, 0xCu);
    }

    v22 = 0;
  }

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_eventIdentifier, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = -[NSURL copyWithZone:](self->_externalURI, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    v16 = -[NSString copyWithZone:](self->_location, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    v18 = -[NSString copyWithZone:](self->_organizer, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v18;

    *(_QWORD *)(v5 + 72) = CGColorCreateCopy(self->_calendarColor);
    *(_QWORD *)(v5 + 80) = self->_prominentFeature;
    *(double *)(v5 + 96) = self->_score;
    v20 = -[NSArray copyWithZone:](self->_features, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v20;

    *(_BYTE *)(v5 + 8) = self->_isExtraordinary;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  PPEventHighlight *v4;
  PPEventHighlight *v5;
  BOOL v6;

  v4 = (PPEventHighlight *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPEventHighlight isEqualToEventHighlight:](self, "isEqualToEventHighlight:", v5);

  return v6;
}

- (BOOL)isEqualToEventHighlight:(id)a3
{
  id *v4;
  id *v5;
  NSString *eventIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSURL *externalURI;
  NSURL *v12;
  NSURL *v13;
  NSURL *v14;
  char v15;
  NSString *title;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSDate *startDate;
  NSDate *v22;
  NSDate *v23;
  NSDate *v24;
  char v25;
  NSDate *endDate;
  NSDate *v27;
  NSDate *v28;
  NSDate *v29;
  char v30;
  NSString *location;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *organizer;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  char v40;
  unint64_t prominentFeature;
  double score;
  double v43;
  NSArray *features;
  void *v45;
  int isExtraordinary;
  BOOL v47;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_35;
  eventIdentifier = self->_eventIdentifier;
  v7 = (NSString *)v4[2];
  if (eventIdentifier == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = eventIdentifier;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_35:
      v47 = 0;
      goto LABEL_36;
    }
  }
  externalURI = self->_externalURI;
  v12 = (NSURL *)v5[3];
  if (externalURI == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = externalURI;
    v15 = -[NSURL isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_35;
  }
  title = self->_title;
  v17 = (NSString *)v5[4];
  if (title == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = title;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_35;
  }
  startDate = self->_startDate;
  v22 = (NSDate *)v5[5];
  if (startDate == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = startDate;
    v25 = -[NSDate isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_35;
  }
  endDate = self->_endDate;
  v27 = (NSDate *)v5[6];
  if (endDate == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = endDate;
    v30 = -[NSDate isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_35;
  }
  location = self->_location;
  v32 = (NSString *)v5[7];
  if (location == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = location;
    v35 = -[NSString isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_35;
  }
  organizer = self->_organizer;
  v37 = (NSString *)v5[8];
  if (organizer == v37)
  {

  }
  else
  {
    v38 = v37;
    v39 = organizer;
    v40 = -[NSString isEqual:](v39, "isEqual:", v38);

    if ((v40 & 1) == 0)
      goto LABEL_35;
  }
  if (!CGColorEqualToColor(self->_calendarColor, (CGColorRef)objc_msgSend(v5, "calendarColor")))
    goto LABEL_35;
  prominentFeature = self->_prominentFeature;
  if (prominentFeature != objc_msgSend(v5, "prominentFeature"))
    goto LABEL_35;
  score = self->_score;
  objc_msgSend(v5, "score");
  if (score != v43)
    goto LABEL_35;
  features = self->_features;
  objc_msgSend(v5, "features");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray isEqualToArray:](features, "isEqualToArray:", v45))
  {
    isExtraordinary = self->_isExtraordinary;
    v47 = isExtraordinary == objc_msgSend(v5, "isExtraordinary");
  }
  else
  {
    v47 = 0;
  }

LABEL_36:
  return v47;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_calendarColor);
  v3.receiver = self;
  v3.super_class = (Class)PPEventHighlight;
  -[PPEventHighlight dealloc](&v3, sel_dealloc);
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (NSURL)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
  objc_storeStrong((id *)&self->_externalURI, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)organizer
{
  return self->_organizer;
}

- (void)setOrganizer:(id)a3
{
  objc_storeStrong((id *)&self->_organizer, a3);
}

- (CGColor)calendarColor
{
  return self->_calendarColor;
}

- (void)setCalendarColor:(CGColor *)a3
{
  self->_calendarColor = a3;
}

- (unint64_t)prominentFeature
{
  return self->_prominentFeature;
}

- (void)setProminentFeature:(unint64_t)a3
{
  self->_prominentFeature = a3;
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (BOOL)isExtraordinary
{
  return self->_isExtraordinary;
}

- (void)setIsExtraordinary:(BOOL)a3
{
  self->_isExtraordinary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_organizer, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

+ (id)eventHighlightWithEKEvent:(id)a3 score:(double)a4 prominentFeature:(unint64_t)a5 features:(id)a6 isExtraordinary:(BOOL)a7
{
  id v10;
  CGColorSpace *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  PPEventHighlight *v24;
  PPEventHighlight *v26;
  void *context;
  CGColor *CopyByMatchingToColorSpace;
  id v29;

  v10 = a3;
  v29 = a6;
  v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  objc_msgSend(v10, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v11, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(v12, "CGColor"), 0);

  CGColorSpaceRelease(v11);
  objc_msgSend(v10, "locationWithoutPrediction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  if (!objc_msgSend(v14, "length"))
  {

    v14 = 0;
  }
  context = (void *)MEMORY[0x18D7805AC]();
  v24 = [PPEventHighlight alloc];
  objc_msgSend(v10, "eventIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "externalURI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "organizer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = a7;
  v26 = -[PPEventHighlight initWithEventIdentifier:externalURI:title:startDate:endDate:location:organizer:calendarColor:prominentFeature:features:score:isExtraordinary:](v24, "initWithEventIdentifier:externalURI:title:startDate:endDate:location:organizer:calendarColor:prominentFeature:features:score:isExtraordinary:", v15, v16, v17, v18, v19, v14, a4, v21, CopyByMatchingToColorSpace, a5, v29, v23);

  objc_autoreleasePoolPop(context);
  CGColorRelease(CopyByMatchingToColorSpace);

  return v26;
}

+ (id)eventHighlightWithEvent:(id)a3 score:(double)a4 prominentFeature:(unint64_t)a5 features:(id)a6 isExtraordinary:(BOOL)a7
{
  id v9;
  id v10;
  void *v11;
  PPEventHighlight *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PPEventHighlight *v20;
  uint64_t v22;
  uint64_t v23;

  v9 = a6;
  v10 = a3;
  objc_msgSend(v10, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v11, "color");

  v12 = [PPEventHighlight alloc];
  objc_msgSend(v10, "eventIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "externalURI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "organizerName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v22) = a7;
  v20 = -[PPEventHighlight initWithEventIdentifier:externalURI:title:startDate:endDate:location:organizer:calendarColor:prominentFeature:features:score:isExtraordinary:](v12, "initWithEventIdentifier:externalURI:title:startDate:endDate:location:organizer:calendarColor:prominentFeature:features:score:isExtraordinary:", v13, v14, v15, v16, v17, v18, a4, v19, v23, a5, v9, v22);

  return v20;
}

+ (id)describeProminentFeature:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("Calendar");
  else
    return (id)*((_QWORD *)&off_1E226BB50 + a3 - 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
