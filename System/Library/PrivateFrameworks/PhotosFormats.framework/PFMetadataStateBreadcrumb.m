@implementation PFMetadataStateBreadcrumb

- (PFMetadataStateBreadcrumb)initWithTimeInterval:(double)a3 message:(id)a4
{
  id v6;
  PFMetadataStateBreadcrumb *v7;
  PFMetadataStateBreadcrumb *v8;
  uint64_t v9;
  NSString *message;
  PFMetadataStateBreadcrumb *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFMetadataStateBreadcrumb;
  v7 = -[PFMetadataStateBreadcrumb init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_timeInterval = a3;
    v9 = objc_msgSend(v6, "copy");
    message = v8->_message;
    v8->_message = (NSString *)v9;

    v8->_qualityOfService = qos_class_self();
    pthread_threadid_np(0, &v8->_threadID);
    v11 = v8;
  }

  return v8;
}

- (NSString)breadcrumbDescription
{
  void *v3;
  signed int qualityOfService;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D71088], "stringFromTimestamp:", self->_timeInterval);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  qualityOfService = self->_qualityOfService;
  v5 = CFSTR("UI");
  v6 = CFSTR("UT");
  v7 = CFSTR("DF");
  v8 = CFSTR("IN");
  if (qualityOfService != 25)
    v8 = CFSTR("UI");
  if (qualityOfService != 21)
    v7 = v8;
  if (qualityOfService != 17)
    v6 = v7;
  if (qualityOfService == 9)
    v5 = CFSTR("BG");
  if (!qualityOfService)
    v5 = CFSTR("UN");
  if (qualityOfService <= 16)
    v9 = v5;
  else
    v9 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Thread 0x%-8llx QoS %@ %@"), v3, self->_threadID, v9, self->_message);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (unsigned)qualityOfService
{
  return self->_qualityOfService;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
