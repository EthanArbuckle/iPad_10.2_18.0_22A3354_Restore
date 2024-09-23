@implementation MPVoicemailQueueManager

- (MPVoicemailQueueManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return -[MPVoicemailQueueManager init](&v3, "init");
}

+ (OS_dispatch_queue_serial)serialQueue
{
  return (OS_dispatch_queue_serial *)sub_100041790((uint64_t)a1, (uint64_t)a2, &qword_1000A1EA8, (id *)&qword_1000A49C8, (uint64_t)sub_10004172C);
}

@end
