@implementation __SwiftDeferredNSArray

- (int64_t)count
{
  return *(_QWORD *)(*(_QWORD *)self->_nativeStorage + 16);
}

@end
