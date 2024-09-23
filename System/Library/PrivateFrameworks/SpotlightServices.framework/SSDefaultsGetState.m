@implementation SSDefaultsGetState

void __SSDefaultsGetState_block_invoke(uint64_t a1)
{
  char v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  int v7;
  void *v8;

  v2 = 0;
  v3 = CFSTR("SPBullseyeFilterLocalSuggestions");
  switch(*(_QWORD *)(a1 + 32))
  {
    case 0:
      v2 = 0;
      v3 = CFSTR("SPBullseyeResultNoiseReduction");
      goto LABEL_8;
    case 1:
      v2 = 0;
      v3 = CFSTR("SPUIBullseyeSuggestions");
      goto LABEL_8;
    case 2:
      v2 = 0;
      v3 = CFSTR("SPSearchEnableBullseyeRanking");
      goto LABEL_8;
    case 3:
      v3 = CFSTR("SPBullseyeAllowDictionaryTopResult");
      goto LABEL_7;
    case 4:
      goto LABEL_8;
    case 6:
      v3 = CFSTR("SPUIBullseyeShowDebugLocalSuggestions");
LABEL_7:
      v2 = 1;
LABEL_8:
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
      objc_msgSend(v4, "objectForKey:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v8;
      if ((v2 & 1) == 0 && !v8
        || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5 = v8, (isKindOfClass & 1) != 0)
        && (v7 = objc_msgSend(v8, "BOOLValue"), v5 = v8, v7))
      {
        state_enabled_values[*(_QWORD *)(a1 + 32)] = 1;
      }

      break;
    default:
      return;
  }
}

@end
