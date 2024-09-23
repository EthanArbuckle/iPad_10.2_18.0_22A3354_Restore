@implementation ICAnalyticsObserver

+ (id)sharedObserver
{
  if (qword_100028A38[0] != -1)
    dispatch_once(qword_100028A38, &stru_100020D80);
  return (id)qword_100028A30;
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
  objc_class *v5;
  NSString *v6;
  void *v7;
  ICNAEventReporter *v8;
  ICNAEventReporter *v9;

  eventReporter = self->_eventReporter;
  if (!eventReporter)
  {
    v4 = objc_alloc((Class)ICNAEventReporter);
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (ICNAEventReporter *)objc_msgSend(v4, "initWithSubTrackerName:", v7);
    v9 = self->_eventReporter;
    self->_eventReporter = v8;

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
