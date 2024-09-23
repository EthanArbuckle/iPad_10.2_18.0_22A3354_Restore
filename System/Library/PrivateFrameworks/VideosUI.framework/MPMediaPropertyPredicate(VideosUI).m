@implementation MPMediaPropertyPredicate(VideosUI)

+ (id)vui_mediaPropertyPredicateWithProperty:()VideosUI predicateOperatorType:value:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(a1, "vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:", a4);
  objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:()VideosUI
{
  uint64_t result;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 103;
      break;
    case 1:
      result = 104;
      break;
    case 2:
      result = 101;
      break;
    case 3:
      result = 102;
      break;
    case 4:
    case 5:
      return result;
    case 6:
    case 7:
      goto LABEL_4;
    case 8:
      result = 105;
      break;
    case 9:
      result = 106;
      break;
    case 10:
      result = 108;
      break;
    default:
      if (a3 == 99)
      {
        result = 1;
      }
      else
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported operator type (%lu)"), a3);
        result = 0;
      }
      break;
  }
  return result;
}

@end
