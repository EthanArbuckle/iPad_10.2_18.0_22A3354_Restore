@implementation NSNotificationCenter

+ (id)notificationOperationQueue
{
  if (qword_543280 != -1)
    dispatch_once(&qword_543280, &stru_429B60);
  return (id)qword_543278;
}

- (id)addBackgroundObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  _QWORD v7[6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10A39C;
  v7[3] = &unk_429B88;
  v7[4] = a3;
  v7[5] = a4;
  return -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](self, "addObserverForName:object:queue:usingBlock:", a5, a6, objc_msgSend((id)objc_opt_class(self), "notificationOperationQueue"), v7);
}

- (id)addNonBlockingObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  _QWORD v12[7];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10A458;
  v12[3] = &unk_429BB0;
  v12[5] = +[NSThread currentThread](NSThread, "currentThread");
  v12[6] = a4;
  v12[4] = a3;
  return -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](self, "addObserverForName:object:queue:usingBlock:", a5, a6, objc_msgSend((id)objc_opt_class(self), "notificationOperationQueue"), v12);
}

@end
