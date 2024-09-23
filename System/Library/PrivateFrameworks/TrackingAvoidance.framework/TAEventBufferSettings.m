@implementation TAEventBufferSettings

- (double)bufferTimeIntervalOfRetention
{
  return self->_bufferTimeIntervalOfRetention;
}

- (TAEventBufferSettings)initWithBufferCapacity:(unint64_t)a3 bufferTimeIntervalOfRetention:(double)a4
{
  TAEventBufferSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TAEventBufferSettings;
  result = -[TAEventBufferSettings init](&v7, sel_init);
  if (result)
  {
    result->_bufferCapacity = a3;
    result->_bufferTimeIntervalOfRetention = a4;
  }
  return result;
}

- (TAEventBufferSettings)initWithBufferCapacityOrDefault:(id)a3 bufferTimeIntervalOfRetentionOrDefault:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  TAEventBufferSettings *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v9 = 10000;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v10 = 1800.0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v6, "unsignedIntegerValue");
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "doubleValue");
LABEL_6:
  v11 = -[TAEventBufferSettings initWithBufferCapacity:bufferTimeIntervalOfRetention:](self, "initWithBufferCapacity:bufferTimeIntervalOfRetention:", v9, v10);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TAEventBufferSettings initWithBufferCapacity:bufferTimeIntervalOfRetention:](+[TAEventBufferSettings allocWithZone:](TAEventBufferSettings, "allocWithZone:", a3), "initWithBufferCapacity:bufferTimeIntervalOfRetention:", self->_bufferCapacity, self->_bufferTimeIntervalOfRetention);
}

- (unint64_t)bufferCapacity
{
  return self->_bufferCapacity;
}

@end
