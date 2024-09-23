@implementation UIActivityGetPrintingBasedActivities

void ___UIActivityGetPrintingBasedActivities_block_invoke()
{
  UIOpenInIBooksActivity *v0;
  UICreatePDFActivity *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(UIOpenInIBooksActivity);
  v4[0] = v0;
  v1 = objc_alloc_init(UICreatePDFActivity);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_UIActivityGetPrintingBasedActivities___printingBasedActivities;
  _UIActivityGetPrintingBasedActivities___printingBasedActivities = v2;

}

@end
