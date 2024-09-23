@implementation CHCachedRecognizerWrapper

- (CHCachedRecognizerWrapper)initWithRecognizer:(id)a3
{
  id v5;
  CHCachedRecognizerWrapper *v6;
  CHCachedRecognizerWrapper *v7;
  double v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHCachedRecognizerWrapper;
  v6 = -[CHCachedRecognizerWrapper init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recognizer, a3);
    v7->_activeRequestCount = 0;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v7->_lastActiveTimestamp = v8;
    v7->_targetIdleLifetime = 120.0;
    v9 = objc_opt_class(CHRecognizer);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0 && objc_msgSend(v5, "recognitionMode") == 6)
      v7->_targetIdleLifetime = 12.0;
  }

  return v7;
}

- (id)checkOutRecognizer
{
  ++self->_activeRequestCount;
  return self->_recognizer;
}

- (void)checkInRecognizer
{
  int64_t activeRequestCount;
  NSObject *v4;
  double v5;
  uint8_t v6[16];

  activeRequestCount = self->_activeRequestCount;
  self->_activeRequestCount = activeRequestCount - 1;
  if (activeRequestCount <= 0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v4 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Recognizer is already fully checked in.", v6, 2u);
    }

  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_lastActiveTimestamp = v5;
}

- (void)dealloc
{
  CHRecognizing *recognizer;
  objc_super v4;

  recognizer = self->_recognizer;
  self->_recognizer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CHCachedRecognizerWrapper;
  -[CHCachedRecognizerWrapper dealloc](&v4, "dealloc");
}

- (double)lastActiveTimestamp
{
  return self->_lastActiveTimestamp;
}

- (double)targetIdleLifetime
{
  return self->_targetIdleLifetime;
}

- (int64_t)activeRequestCount
{
  return self->_activeRequestCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end
