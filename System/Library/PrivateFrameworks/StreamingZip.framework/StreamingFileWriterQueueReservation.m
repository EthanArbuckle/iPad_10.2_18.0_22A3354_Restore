@implementation StreamingFileWriterQueueReservation

- (StreamingFileWriterQueueReservation)initWithReservationSize:(int64_t)a3
{
  StreamingFileWriterQueueReservation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StreamingFileWriterQueueReservation;
  result = -[StreamingFileWriterQueueReservation init](&v5, sel_init);
  if (result)
  {
    result->_reservedSize = a3;
    result->_valid = 1;
  }
  return result;
}

- (int64_t)reservedSize
{
  return self->_reservedSize;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
