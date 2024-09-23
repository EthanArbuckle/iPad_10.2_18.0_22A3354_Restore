@implementation _UIViewLFLDChangeRecord

- (_UIViewLFLDChangeRecord)init
{
  _UIViewLFLDChangeRecord *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIViewLFLDChangeRecord;
  v2 = -[_UIViewLFLDChangeRecord init](&v4, sel_init);
  if (v2)
    v2->_timestamp = CFAbsoluteTimeGetCurrent();
  return v2;
}

- (double)timestamp
{
  return self->_timestamp;
}

@end
