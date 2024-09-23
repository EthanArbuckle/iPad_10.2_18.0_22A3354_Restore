@implementation boringssl_concrete_boringssl_context_state

- (void)dealloc
{
  objc_super v3;

  SSL_CTX_free(self->ssl_ctx);
  v3.receiver = self;
  v3.super_class = (Class)boringssl_concrete_boringssl_context_state;
  -[boringssl_concrete_boringssl_context_state dealloc](&v3, sel_dealloc);
}

@end
