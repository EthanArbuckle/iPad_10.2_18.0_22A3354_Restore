@implementation boringssl_concrete_boringssl_session_state

- (void)dealloc
{
  objc_super v3;

  OPENSSL_free((_QWORD *)self->serialized_session);
  v3.receiver = self;
  v3.super_class = (Class)boringssl_concrete_boringssl_session_state;
  -[boringssl_concrete_boringssl_session_state dealloc](&v3, sel_dealloc);
}

@end
