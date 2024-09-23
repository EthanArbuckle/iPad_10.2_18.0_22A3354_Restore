@implementation BlockingThreadElement

- (BlockingThreadElement)init
{
  BlockingThreadElement *v2;
  BlockingThreadElement *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BlockingThreadElement;
  v2 = -[BlockingThreadElement init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[BlockingThreadElement setCumulativeTime:](v2, "setCumulativeTime:", 0);
    -[BlockingThreadElement setMaxBlockingTime:](v3, "setMaxBlockingTime:", 0);
    -[BlockingThreadElement setStartThreadTime:](v3, "setStartThreadTime:", 0);
    -[BlockingThreadElement setEndThreadTime:](v3, "setEndThreadTime:", 0);
  }
  return v3;
}

- (int64_t)compareCumulativeTime:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[BlockingThreadElement cumulativeTime](self, "cumulativeTime");
  if (v5 <= (unint64_t)objc_msgSend(v4, "cumulativeTime"))
  {
    v7 = -[BlockingThreadElement cumulativeTime](self, "cumulativeTime");
    if (v7 >= (unint64_t)objc_msgSend(v4, "cumulativeTime"))
      v6 = 0;
    else
      v6 = -1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int64_t)compareMaxBlockingTime:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[BlockingThreadElement maxBlockingTime](self, "maxBlockingTime");
  if (v5 <= (unint64_t)objc_msgSend(v4, "maxBlockingTime"))
  {
    v7 = -[BlockingThreadElement maxBlockingTime](self, "maxBlockingTime");
    if (v7 >= (unint64_t)objc_msgSend(v4, "maxBlockingTime"))
      v6 = 0;
    else
      v6 = -1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (unint64_t)cumulativeTime
{
  return self->_cumulativeTime;
}

- (void)setCumulativeTime:(unint64_t)a3
{
  self->_cumulativeTime = a3;
}

- (unint64_t)maxBlockingTime
{
  return self->_maxBlockingTime;
}

- (void)setMaxBlockingTime:(unint64_t)a3
{
  self->_maxBlockingTime = a3;
}

- (unint64_t)startThreadTime
{
  return self->_startThreadTime;
}

- (void)setStartThreadTime:(unint64_t)a3
{
  self->_startThreadTime = a3;
}

- (unint64_t)endThreadTime
{
  return self->_endThreadTime;
}

- (void)setEndThreadTime:(unint64_t)a3
{
  self->_endThreadTime = a3;
}

@end
