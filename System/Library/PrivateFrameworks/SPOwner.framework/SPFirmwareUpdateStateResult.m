@implementation SPFirmwareUpdateStateResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateDate, CFSTR("stateDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentSystemVersion, CFSTR("currentSystemVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (SPFirmwareUpdateStateResult)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *stateDate;
  NSString *v7;
  NSString *currentSystemVersion;
  NSError *v9;
  NSError *error;

  v4 = a3;
  self->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateDate"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  stateDate = self->_stateDate;
  self->_stateDate = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentSystemVersion"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentSystemVersion = self->_currentSystemVersion;
  self->_currentSystemVersion = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v9 = (NSError *)objc_claimAutoreleasedReturnValue();

  error = self->_error;
  self->_error = v9;

  return self;
}

- (id)firmwareUpdateState
{
  int64_t v2;

  v2 = -[SPFirmwareUpdateStateResult state](self, "state");
  if ((unint64_t)(v2 + 1) > 7)
    return CFSTR("completed");
  else
    return off_1E5E168A0[v2 + 1];
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[SPFirmwareUpdateStateResult firmwareUpdateState](self, "firmwareUpdateState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("FirmwareUpdateState"));

  -[SPFirmwareUpdateStateResult stateDate](self, "stateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Date"));

  -[SPFirmwareUpdateStateResult currentSystemVersion](self, "currentSystemVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("SystemVersion"));

  -[SPFirmwareUpdateStateResult error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Error"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SPFirmwareUpdateStateResult dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)stateDate
{
  return self->_stateDate;
}

- (void)setStateDate:(id)a3
{
  objc_storeStrong((id *)&self->_stateDate, a3);
}

- (NSString)currentSystemVersion
{
  return self->_currentSystemVersion;
}

- (void)setCurrentSystemVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentSystemVersion, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentSystemVersion, 0);
  objc_storeStrong((id *)&self->_stateDate, 0);
}

@end
