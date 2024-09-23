@implementation VKCImageAnalysis(__PX_Additions__)

- (uint64_t)hasTexts
{
  return objc_msgSend(a1, "hasResultsForAnalysisTypes:", 1);
}

- (BOOL)hasDataDetectors
{
  return objc_msgSend(a1, "countOfDataDetectorsWithTypes:", -1) != 0;
}

- (uint64_t)hasVisualSearchResults
{
  return objc_msgSend(a1, "hasResultsForAnalysisTypes:", 16);
}

@end
