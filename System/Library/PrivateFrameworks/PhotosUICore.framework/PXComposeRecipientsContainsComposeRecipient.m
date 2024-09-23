@implementation PXComposeRecipientsContainsComposeRecipient

uint64_t __PXComposeRecipientsContainsComposeRecipient_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = PXComposeRecipientEqualToComposeRecipient(a2, *(void **)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
