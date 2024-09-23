@implementation ZN5zhtok18LatticeSessionData14resetSentinelsEv

char *___ZN5zhtok18LatticeSessionData14resetSentinelsEv_block_invoke(uint64_t a1)
{
  char **v1;
  uint64_t v2;
  char *v3;

  v1 = *(char ***)(a1 + 32);
  v2 = **((_QWORD **)*v1 + 2);
  v3 = zhtok::ObjectPool<zhtok::Hypothesis>::alloc(v1 + 2);
  zhtok::Hypothesis::init(v3, v2, 0, 0.0);
  return v3;
}

@end
