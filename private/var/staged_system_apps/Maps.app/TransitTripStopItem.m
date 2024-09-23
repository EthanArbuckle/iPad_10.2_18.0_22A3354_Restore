@implementation TransitTripStopItem

- (TransitTripStopItem)initWithPlaceHolderType:(unint64_t)a3 numCollapsedStops:(unint64_t)a4
{
  TransitTripStopItem *v6;
  TransitTripStopItem *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *identifier;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TransitTripStopItem;
  v6 = -[TransitTripStopItem init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    v6->_numberOfCollapsedStops = a4;
    v6->_type = a3;
    v8 = CFSTR("PostAlightingPlaceholder");
    if (a3 == 1)
      v8 = CFSTR("PreBoardingPlaceholder");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lu-%@"), v9, a4, v11));

    identifier = v7->_identifier;
    v7->_identifier = v12;

  }
  return v7;
}

- (TransitTripStopItem)initWithTransitTripStop:(id)a3 stopIndex:(unint64_t)a4
{
  id v7;
  TransitTripStopItem *v8;
  TransitTripStopItem *v9;
  uint64_t v10;
  NSObject *identifier;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TransitTripStopItem;
  v8 = -[TransitTripStopItem init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transitTripStop, a3);
    v9->_type = 0;
    v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    identifier = v9->_identifier;
    v9->_identifier = v10;

  }
  return v9;
}

- (BOOL)isPlaceholder
{
  return self->_numberOfCollapsedStops != 0;
}

- (id)placeholderTextForLine:(id)a3
{
  unsigned int v4;
  unint64_t type;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend(a3, "isBus");
  type = self->_type;
  if (type == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("[Transit Schedule] (Bus) Additional bus stops");
    else
      v7 = CFSTR("[Transit Schedule] (Non-bus) Additional non-bus stops text");
    goto LABEL_10;
  }
  if (type == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v4)
      v7 = CFSTR("[Transit Schedule] (Bus) Previous stops text");
    else
      v7 = CFSTR("[Transit Schedule] (Non-bus) Previous stops text");
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, self->_numberOfCollapsedStops));
    return v8;
  }
  v8 = 0;
  return v8;
}

- (id)description
{
  if (self->_type)
    return self->_identifier;
  else
    return (id)objc_claimAutoreleasedReturnValue(-[GEOTransitTripStop description](self->_transitTripStop, "description"));
}

- (unint64_t)type
{
  return self->_type;
}

- (GEOTransitTripStop)transitTripStop
{
  return self->_transitTripStop;
}

- (unint64_t)numberOfCollapsedStops
{
  return self->_numberOfCollapsedStops;
}

- (void)setNumberOfCollapsedStops:(unint64_t)a3
{
  self->_numberOfCollapsedStops = a3;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_transitTripStop, 0);
}

@end
