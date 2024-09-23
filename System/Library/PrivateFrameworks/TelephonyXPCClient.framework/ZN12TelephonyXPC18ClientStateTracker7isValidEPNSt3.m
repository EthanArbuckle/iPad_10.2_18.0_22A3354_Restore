@implementation ZN12TelephonyXPC18ClientStateTracker7isValidEPNSt3

std::__shared_weak_count *___ZN12TelephonyXPC18ClientStateTracker7isValidEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke@<X0>(std::__shared_weak_count *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t shared_owners;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  shared_owners = result[1].__shared_owners_;
  v4 = *(_QWORD **)(shared_owners + 24);
  v5 = *(_QWORD **)(shared_owners + 32);
  if (v4 != v5)
  {
    while (*v4 != result[1].__shared_weak_owners_)
    {
      if (++v4 == v5)
      {
        v4 = v5;
        break;
      }
    }
  }
  if (v4 == v5)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    v6 = (_QWORD *)*v4;
    *a2 = 0;
    a2[1] = 0;
    result = (std::__shared_weak_count *)v6[1];
    if (result)
    {
      result = std::__shared_weak_count::lock(result);
      a2[1] = result;
      if (result)
        *a2 = *v6;
    }
  }
  return result;
}

@end
