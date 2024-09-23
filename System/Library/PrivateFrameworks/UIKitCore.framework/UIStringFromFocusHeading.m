@implementation UIStringFromFocusHeading

uint64_t ___UIStringFromFocusHeading_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  const __CFString *v4;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v4 = CFSTR(" & ");
  else
    v4 = &stru_1E16EDF20;
  result = objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v4, a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end
