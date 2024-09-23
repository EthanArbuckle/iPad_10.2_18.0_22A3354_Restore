@implementation DarwinNotificationWatcher

+ (id)monitorNotificationKey:(id)a3 forReason:(id)a4 queue:(id)a5 handler:(id)a6
{
  char *v10;
  TMSimpleAssertion *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = (int *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10 = (char *)objc_msgSend(a3, "UTF8String");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C300;
  v14[3] = &unk_10007CFF8;
  v14[4] = a6;
  sub_1000358D8(v10, v16 + 6, a5, v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C34C;
  v13[3] = &unk_10007D020;
  v13[4] = &v15;
  v11 = -[TMSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]([TMSimpleAssertion alloc], "initWithIdentifier:forReason:invalidationBlock:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DarwinNotification (%@)"), a3), a4, v13);
  _Block_object_dispose(&v15, 8);
  return v11;
}

@end
