@implementation SPRMonitorLog

- (SPRMonitorLog)initWithEvent:(unsigned __int16)a3 details:(id)a4 origin:(id)a5 component:(id)a6
{
  uint64_t v8;
  NSData *v10;
  NSString *v11;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  NSString *event;
  NSData *details;
  NSData *v20;
  NSString *origin;
  NSString *v22;
  NSString *component;

  v8 = a3;
  v10 = (NSData *)a4;
  v11 = (NSString *)a5;
  v12 = (NSString *)a6;
  objc_msgSend_getEventString_(SPRMonitorLog, v13, v8, v14, v15, v16);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  self->_event = v17;

  details = self->_details;
  self->_details = v10;
  v20 = v10;

  origin = self->_origin;
  self->_origin = v11;
  v22 = v11;

  component = self->_component;
  self->_component = v12;

  self->_logType = 0;
  return self;
}

- (SPRMonitorLog)initWithAudit:(id)a3 details:(id)a4 origin:(id)a5 component:(id)a6
{
  NSString *v10;
  NSData *v11;
  NSString *v12;
  NSString *v13;
  NSString *event;
  NSString *v15;
  NSData *details;
  NSData *v17;
  NSString *origin;
  NSString *v19;
  NSString *component;

  v10 = (NSString *)a3;
  v11 = (NSData *)a4;
  v12 = (NSString *)a5;
  v13 = (NSString *)a6;
  event = self->_event;
  self->_event = v10;
  v15 = v10;

  details = self->_details;
  self->_details = v11;
  v17 = v11;

  origin = self->_origin;
  self->_origin = v12;
  v19 = v12;

  component = self->_component;
  self->_component = v13;

  self->_logType = 0;
  return self;
}

- (SPRMonitorLog)initWithIncident:(id)a3 details:(id)a4 origin:(id)a5 component:(id)a6
{
  NSString *v10;
  NSData *v11;
  NSString *v12;
  NSString *v13;
  NSString *event;
  NSString *v15;
  NSData *details;
  NSData *v17;
  NSString *origin;
  NSString *v19;
  NSString *component;

  v10 = (NSString *)a3;
  v11 = (NSData *)a4;
  v12 = (NSString *)a5;
  v13 = (NSString *)a6;
  event = self->_event;
  self->_event = v10;
  v15 = v10;

  details = self->_details;
  self->_details = v11;
  v17 = v11;

  origin = self->_origin;
  self->_origin = v12;
  v19 = v12;

  component = self->_component;
  self->_component = v13;

  self->_logType = 1;
  return self;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;

  if (self->_details)
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    v10 = objc_msgSend_initWithData_encoding_(v6, v7, (uint64_t)self->_details, 4, v8, v9);
    if (v10)
    {
      v15 = (__CFString *)v10;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("{event: %@, details: %@, origin: %@, component: %@}"), v12, v13, v14, self->_event, v10, self->_origin, self->_component);
    }
    else
    {
      v15 = CFSTR("not printable");
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("{event: %@, details: %@, origin: %@, component: %@}"), v12, v13, v14, self->_event, CFSTR("not printable"), self->_origin, self->_component);
    }
  }
  else
  {
    v15 = CFSTR("nil");
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("{event: %@, details: %@, origin: %@, component: %@}"), v2, v3, v4, self->_event, CFSTR("nil"), self->_origin, self->_component);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)getEventString:(unsigned __int16)a3
{
  if ((a3 - 13) > 0x14)
    return CFSTR("UNKNOWN_MONITORING_EVENT");
  else
    return off_24D3CCBA8[(__int16)(a3 - 13)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRMonitorLog)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *event;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSData *v19;
  NSData *details;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v25;
  NSString *origin;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  NSString *component;

  v4 = a3;
  self->_logType = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("logType"), v6, v7, v8);
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("event"), v11, v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  self->_event = v13;

  v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("details"), v17, v18);
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  details = self->_details;
  self->_details = v19;

  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("origin"), v23, v24);
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  origin = self->_origin;
  self->_origin = v25;

  v27 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("component"), v29, v30);
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();

  component = self->_component;
  self->_component = v31;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t logType;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  logType = self->_logType;
  v20 = a3;
  objc_msgSend_encodeInteger_forKey_(v20, v5, logType, (uint64_t)CFSTR("logType"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v8, (uint64_t)self->_event, (uint64_t)CFSTR("event"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v20, v11, (uint64_t)self->_details, (uint64_t)CFSTR("details"), v12, v13);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)self->_origin, (uint64_t)CFSTR("origin"), v15, v16);
  objc_msgSend_encodeObject_forKey_(v20, v17, (uint64_t)self->_component, (uint64_t)CFSTR("component"), v18, v19);

}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSData)details
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetails:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)origin
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOrigin:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)component
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setComponent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)logType
{
  return self->_logType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
