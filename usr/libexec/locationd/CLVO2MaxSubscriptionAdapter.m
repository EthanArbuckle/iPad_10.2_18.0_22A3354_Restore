@implementation CLVO2MaxSubscriptionAdapter

- (CLVO2MaxSubscriptionAdapter)initWithSubscription:(void *)a3
{
  CLVO2MaxSubscriptionAdapter *v4;
  CLVO2MaxSubscriptionAdapter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLVO2MaxSubscriptionAdapter;
  v4 = -[CLVO2MaxSubscriptionAdapter init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_subscription = a3;
    -[CLVO2MaxSubscriptionAdapter setValid:](v4, "setValid:", 1);
  }
  return v5;
}

- (void)onRetrocomputeStatusUpdate:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (a3)
  {
    sub_100F0A044((uint64_t)self->_subscription, (uint64_t)a3);
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102192258);
    v3 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Attempting to notify nil retrocompute state", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102192258);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 17, "Attempting to notify nil retrocompute state", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxSubscriptionAdapter onRetrocomputeStatusUpdate:]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (void)invalidate
{
  -[CLVO2MaxSubscriptionAdapter setValid:](self, "setValid:", 0);
  self->_subscription = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
