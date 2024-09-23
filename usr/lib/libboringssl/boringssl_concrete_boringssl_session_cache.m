@implementation boringssl_concrete_boringssl_session_cache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->association, 0);
}

@end
