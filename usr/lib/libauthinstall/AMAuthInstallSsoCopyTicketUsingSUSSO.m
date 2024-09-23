@implementation AMAuthInstallSsoCopyTicketUsingSUSSO

CFTypeRef ___AMAuthInstallSsoCopyTicketUsingSUSSO_block_invoke(_QWORD *a1)
{
  CFTypeRef result;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = _AMAuthInstallSsoSUSSOCopyToken(a1[7], *(_QWORD *)(a1[5] + 8) + 24);
  SafeRetain(*(CFTypeRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  result = SafeRetain(*(CFTypeRef *)(*(_QWORD *)(a1[5] + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return result;
}

@end
