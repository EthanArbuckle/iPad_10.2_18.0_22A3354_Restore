@implementation SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation

void __SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_block_invoke()
{
  uint64_t v0;

  v0 = SBHScreenTypeForCurrentDevice();
  if (SBHScreenTypeIsPad(v0))
  {
    SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sCurrentScreenType = v0;
    _uncachedMetricsForScreenTypeAndInterfaceOrientation(v0, 3, (uint64_t)&SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sLandscapeMetrics);
    _uncachedMetricsForScreenTypeAndInterfaceOrientation(v0, 1, (uint64_t)&SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sPortraitMetrics);
  }
}

@end
