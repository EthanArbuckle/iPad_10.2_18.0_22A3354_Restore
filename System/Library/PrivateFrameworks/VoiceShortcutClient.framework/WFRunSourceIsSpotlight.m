@implementation WFRunSourceIsSpotlight

void __WFRunSourceIsSpotlight_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("spotlight-search");
  v2[1] = CFSTR("spotlight-search-detail-page");
  v2[2] = CFSTR("spotlight_prediction");
  v2[3] = CFSTR("contextual-action-spotlight-unknown");
  v2[4] = CFSTR("contextual-action-spotlight-search");
  v2[5] = CFSTR("contextual-action-spotlight-prediction");
  v2[6] = CFSTR("contextual-action-spotlight-top-hit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WFRunSourceIsSpotlight_s_spotlightRunSources;
  WFRunSourceIsSpotlight_s_spotlightRunSources = v0;

}

@end
