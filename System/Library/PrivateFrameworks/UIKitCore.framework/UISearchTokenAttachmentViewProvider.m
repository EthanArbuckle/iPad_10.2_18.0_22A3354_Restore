@implementation UISearchTokenAttachmentViewProvider

uint64_t __66___UISearchTokenAttachmentViewProvider_isLastAttachmentBeforeText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "characterAtIndex:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result != 65532;
  *a5 = 1;
  return result;
}

@end
