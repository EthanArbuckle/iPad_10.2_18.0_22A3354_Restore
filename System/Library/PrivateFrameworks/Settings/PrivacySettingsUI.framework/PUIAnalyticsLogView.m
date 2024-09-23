@implementation PUIAnalyticsLogView

id __PUIAnalyticsLogView_block_invoke(_QWORD *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v1 = &stru_1EA26D430;
  v5[0] = CFSTR("view");
  v5[1] = CFSTR("bundleID");
  v2 = (const __CFString *)a1[4];
  v3 = (const __CFString *)a1[5];
  if (!v2)
    v2 = &stru_1EA26D430;
  if (!v3)
    v3 = &stru_1EA26D430;
  v6[0] = v2;
  v6[1] = v3;
  v5[2] = CFSTR("category");
  if (a1[6])
    v1 = (const __CFString *)a1[6];
  v6[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
