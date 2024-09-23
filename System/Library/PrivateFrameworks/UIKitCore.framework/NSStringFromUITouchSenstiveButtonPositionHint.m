@implementation NSStringFromUITouchSenstiveButtonPositionHint

uint64_t ___NSStringFromUITouchSenstiveButtonPositionHint_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t result;

  v3 = 0;
  switch(a2)
  {
    case 1:
      v3 = CFSTR("fastSwipe");
      break;
    case 2:
      v3 = CFSTR("lowConfidenceSwipe");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 4:
      v3 = CFSTR("liftOffPredicted");
      break;
    case 8:
      v3 = CFSTR("clickDownPredicted");
      break;
    default:
      v3 = CFSTR("clickReleaseWindow");
      if (a2 != 16)
        v3 = 0;
      break;
  }
  v4 = *(void **)(a1 + 32);
  v5 = 48;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v5 = 40;
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + v5), v3);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  return result;
}

@end
