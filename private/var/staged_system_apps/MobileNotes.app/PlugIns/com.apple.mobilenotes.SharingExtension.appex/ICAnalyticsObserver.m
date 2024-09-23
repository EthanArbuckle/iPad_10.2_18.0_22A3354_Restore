@implementation ICAnalyticsObserver

+ (id)sharedObserver
{
  if (qword_1000ED6D8 != -1)
    dispatch_once(&qword_1000ED6D8, &stru_1000D5C08);
  return (id)qword_1000ED6D0;
}

- (ICAnalyticsObserver)init
{
  ICAnalyticsObserver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAnalyticsObserver;
  v2 = -[ICAnalyticsObserver init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "noteAddAttachment:", ICNoteAnalyticsAddAttachmentNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAnalyticsObserver;
  -[ICAnalyticsObserver dealloc](&v4, "dealloc");
}

- (void)noteAddAttachment:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", ICNoteAnalyticsAddAttachmentNotificationAttachmentKey));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICAnalyticsObserver eventReporter](self, "eventReporter"));
    objc_msgSend(v5, "submitAttachmentAddEventForAttachment:", v6);

  }
}

- (ICNAEventReporter)eventReporter
{
  ICNAEventReporter *eventReporter;
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  ICNAEventReporter *v9;
  ICNAEventReporter *v10;

  eventReporter = self->_eventReporter;
  if (!eventReporter)
  {
    v4 = objc_alloc((Class)ICNAEventReporter);
    v6 = (objc_class *)objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (ICNAEventReporter *)objc_msgSend(v4, "initWithSubTrackerName:", v8);
    v10 = self->_eventReporter;
    self->_eventReporter = v9;

    eventReporter = self->_eventReporter;
  }
  return eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
