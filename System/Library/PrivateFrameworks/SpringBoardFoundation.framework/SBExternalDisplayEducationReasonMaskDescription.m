@implementation SBExternalDisplayEducationReasonMaskDescription

uint64_t __SBExternalDisplayEducationReasonMaskDescription_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  const __CFString *v4;

  v3 = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    result = objc_msgSend(*(id *)(result + 32), "appendString:", CFSTR("|"));
  if (a2 == 1)
  {
    v4 = CFSTR(".Satisfied");
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    v4 = CFSTR(".NotSatisfied");
LABEL_7:
    result = objc_msgSend(*(id *)(v3 + 32), "appendString:", v4);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = 0;
  return result;
}

@end
