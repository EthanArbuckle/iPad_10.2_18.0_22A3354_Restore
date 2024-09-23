@implementation APEventSessionActiveState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APEventSessionActiveState)initWithCoder:(id)a3
{
  id v4;
  APEventSessionActiveState *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *activeSessions;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APEventSessionActiveState;
  v5 = -[APEventSessionActiveState init](&v13, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSString);
    v7 = objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(NSNumber), CFSTR("sessions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
      v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v8));
    else
      v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    activeSessions = v5->_activeSessions;
    v5->_activeSessions = (NSMutableDictionary *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("start"));
    v5->_activeSessionStartTime = v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *activeSessions;

  if (self)
  {
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("start"), self->_activeSessionStartTime);
    activeSessions = self->_activeSessions;
  }
  else
  {
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("start"), 0.0);
    activeSessions = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", activeSessions, CFSTR("sessions"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSessions, 0);
}

@end
