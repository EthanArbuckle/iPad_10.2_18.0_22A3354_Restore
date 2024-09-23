@implementation NavdDoomIncident

- (NavdDoomIncident)initWithUniqueID:(id)a3 destinationID:(id)a4 expiryDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NavdDoomIncident *v11;
  NSString *v12;
  NSString *uniqueID;
  NSString *v14;
  NSString *destinationID;
  NSDate *v16;
  NSDate *expiryDate;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NavdDoomIncident;
  v11 = -[NavdDoomIncident init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    uniqueID = v11->_uniqueID;
    v11->_uniqueID = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    destinationID = v11->_destinationID;
    v11->_destinationID = v14;

    v16 = (NSDate *)objc_msgSend(v10, "copy");
    expiryDate = v11->_expiryDate;
    v11->_expiryDate = v16;

  }
  return v11;
}

- (NavdDoomIncident)initWithCoder:(id)a3
{
  id v4;
  NavdDoomIncident *v5;
  id v6;
  uint64_t v7;
  NSString *uniqueID;
  id v9;
  uint64_t v10;
  NSString *destinationID;
  id v12;
  uint64_t v13;
  NSDate *expiryDate;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NavdDoomIncident;
  v5 = -[NavdDoomIncident init](&v16, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("uniqueID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("destinationID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    destinationID = v5->_destinationID;
    v5->_destinationID = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("expiryDate"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v13;

    v5->_shouldSuppress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppress"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident uniqueID](self, "uniqueID"));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("uniqueID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident destinationID](self, "destinationID"));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("destinationID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident expiryDate](self, "expiryDate"));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("expiryDate"));

  objc_msgSend(v7, "encodeBool:forKey:", -[NavdDoomIncident shouldSuppress](self, "shouldSuppress"), CFSTR("shouldSuppress"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NavdDoomIncident *v4;
  void *v5;
  void *v6;
  void *v7;
  NavdDoomIncident *v8;

  v4 = +[NavdDoomIncident allocWithZone:](NavdDoomIncident, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident uniqueID](self, "uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident destinationID](self, "destinationID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident expiryDate](self, "expiryDate"));
  v8 = -[NavdDoomIncident initWithUniqueID:destinationID:expiryDate:](v4, "initWithUniqueID:destinationID:expiryDate:", v5, v6, v7);

  if (v8)
    v8->_shouldSuppress = -[NavdDoomIncident shouldSuppress](self, "shouldSuppress");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NavdDoomIncident *v4;
  uint64_t v5;
  NavdDoomIncident *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t Log;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;

  v4 = (NavdDoomIncident *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v5 = objc_opt_class(NavdDoomIncident);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident uniqueID](self, "uniqueID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident uniqueID](v6, "uniqueID"));
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident destinationID](self, "destinationID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident destinationID](v6, "destinationID"));
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomIncident");
      v13 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v15 = 136446978;
        v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomIncident.mm";
        v17 = 1024;
        v18 = 91;
        v19 = 2082;
        v20 = "-[NavdDoomIncident isEqual:]";
        v21 = 2082;
        v22 = "NO == [object isKindOfClass:[NavdDoomIncident class]]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Passed object is not an incident", (uint8_t *)&v15, 0x26u);
      }

      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  char *v4;
  void *v5;
  char *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident uniqueID](self, "uniqueID"));
  v4 = (char *)objc_msgSend(v3, "hash");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident destinationID](self, "destinationID"));
  v6 = &v4[(_QWORD)objc_msgSend(v5, "hash")];

  return (unint64_t)v6;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NavdDoomIncident;
  v3 = -[NavdDoomIncident description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident uniqueID](self, "uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident destinationID](self, "destinationID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident expiryDate](self, "expiryDate"));
  v8 = MapsSuggestionsStringFromDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ uniqueID=%@ destinationID=%@ expiryDate=%@"), v4, v5, v6, v9));

  return (NSString *)v10;
}

- (id)objectForJSON
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  MSg *v9;
  NSDate *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];

  v15[0] = CFSTR("uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident uniqueID](self, "uniqueID"));
  v4 = MSg::jsonFor();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v16[0] = v5;
  v15[1] = CFSTR("destinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident destinationID](self, "destinationID"));
  v7 = MSg::jsonFor();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v16[1] = v8;
  v15[2] = CFSTR("expiryDate");
  v9 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomIncident expiryDate](self, "expiryDate"));
  v11 = MSg::jsonFor(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v16[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

  return v13;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (BOOL)shouldSuppress
{
  return self->_shouldSuppress;
}

- (void)setShouldSuppress:(BOOL)a3
{
  self->_shouldSuppress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
