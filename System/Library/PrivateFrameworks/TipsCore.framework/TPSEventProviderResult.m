@implementation TPSEventProviderResult

- (NSDictionary)observationMap
{
  return self->_observationMap;
}

- (void)setResultDate:(id)a3
{
  objc_storeStrong((id *)&self->_resultDate, a3);
}

- (void)setObservationMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_resultDate, 0);
  objc_storeStrong((id *)&self->_observationMap, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)debugDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("identifier"), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("ResultDate"), self->_resultDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("ObservationMap"), self->_observationMap);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("bookmark"), self->_bookmark);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("userInfo"), self->_userInfo);
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)resultDate
{
  return self->_resultDate;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (id)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong(&self->_bookmark, a3);
}

@end
