@implementation VIAEntryPointEvent

+ (id)startEventWithQueryID:(unint64_t)a3 viewAppearEvent:(unint64_t)a4 originatingApplication:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueryID:type:viewAppearEvent:originatingApplication:", a3, 1, a4, v8);

  return v9;
}

+ (id)endEventWithOriginatingApplication:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQueryID:type:viewAppearEvent:originatingApplication:", 0, 2, 0, v4);

  return v5;
}

- (VIAEntryPointEvent)initWithQueryID:(unint64_t)a3 type:(int64_t)a4 viewAppearEvent:(unint64_t)a5 originatingApplication:(id)a6
{
  id v10;
  VIAEntryPointEvent *v11;
  VIAEntryPointEvent *v12;
  uint64_t v13;
  NSString *originatingApplication;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)VIAEntryPointEvent;
  v11 = -[VIAEntryPointEvent init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_queryID = a3;
    v11->_type = a4;
    v11->_viewAppearEvent = a5;
    v13 = objc_msgSend(v10, "copy");
    originatingApplication = v12->_originatingApplication;
    v12->_originatingApplication = (NSString *)v13;

    v12->_shouldReportDirectly = 0;
  }

  return v12;
}

- (id)feedback
{
  int64_t type;
  void *v4;

  type = self->_type;
  if (type == 2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6C0]), "initWithEvent:", 16);
  }
  else if (type == 1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6B8]), "initWithEvent:", self->_viewAppearEvent);
    objc_msgSend(v4, "setOriginatingApp:", self->_originatingApplication);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (BOOL)shouldReportDirectly
{
  return self->_shouldReportDirectly;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)viewAppearEvent
{
  return self->_viewAppearEvent;
}

- (NSString)originatingApplication
{
  return self->_originatingApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingApplication, 0);
}

@end
