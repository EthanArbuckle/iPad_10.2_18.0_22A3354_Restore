@implementation WFSevereWeatherEvent

- (WFSevereWeatherEvent)initWithIdentifier:(id)a3 areaName:(id)a4 eventDescription:(id)a5 source:(id)a6 expirationDate:(id)a7 URL:(id)a8 importance:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFSevereWeatherEvent *v21;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *areaName;
  uint64_t v26;
  NSString *eventDescription;
  uint64_t v28;
  NSString *source;
  void *v30;
  void *v31;
  NSDate *v32;
  NSDate *expirationDate;
  uint64_t v34;
  NSURL *URL;
  objc_super v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v37.receiver = self;
  v37.super_class = (Class)WFSevereWeatherEvent;
  v21 = -[WFSevereWeatherEvent init](&v37, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    areaName = v21->_areaName;
    v21->_areaName = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    eventDescription = v21->_eventDescription;
    v21->_eventDescription = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    source = v21->_source;
    v21->_source = (NSString *)v28;

    v30 = (void *)objc_msgSend(v19, "copy");
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    expirationDate = v21->_expirationDate;
    v21->_expirationDate = v32;

    v34 = objc_msgSend(v20, "copy");
    URL = v21->_URL;
    v21->_URL = (NSURL *)v34;

    v21->_importance = a9;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_identifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_areaName, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_eventDescription, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSString copy](self->_source, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSDate copy](self->_expirationDate, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSURL copy](self->_URL, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v4[7] = self->_importance;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFSevereWeatherEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFSevereWeatherEventIdentifierKey"));

  -[WFSevereWeatherEvent areaName](self, "areaName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WFSevereWeatherEventAreaNameKey"));

  -[WFSevereWeatherEvent eventDescription](self, "eventDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WFSevereWeatherEventDescription"));

  -[WFSevereWeatherEvent source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WFSevereWeatherEventSourceKey"));

  -[WFSevereWeatherEvent expirationDate](self, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WFSevereWeatherEventExpirationDateKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFSevereWeatherEvent importance](self, "importance"), CFSTR("WFSevereWeatherEventImportanceKey"));
  -[WFSevereWeatherEvent URL](self, "URL");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WFSevereWeatherEventURLKey"));

}

- (WFSevereWeatherEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WFSevereWeatherEvent *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFSevereWeatherEventIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFSevereWeatherEventAreaNameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFSevereWeatherEventDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFSevereWeatherEventSourceKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFSevereWeatherEventExpirationDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFSevereWeatherEventURLKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFSevereWeatherEventImportanceKey"));

  v12 = -[WFSevereWeatherEvent initWithIdentifier:areaName:eventDescription:source:expirationDate:URL:importance:](self, "initWithIdentifier:areaName:eventDescription:source:expirationDate:URL:importance:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)areaName
{
  return self->_areaName;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (NSString)source
{
  return self->_source;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSURL)URL
{
  return self->_URL;
}

- (unint64_t)importance
{
  return self->_importance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_areaName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
