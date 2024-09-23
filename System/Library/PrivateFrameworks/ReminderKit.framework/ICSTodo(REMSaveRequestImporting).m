@implementation ICSTodo(REMSaveRequestImporting)

- (__CFString)rem_nonNilSummary
{
  void *v2;
  __CFString *v3;

  objc_msgSend(a1, "summary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "summary");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E67FB1F0;
  }

  return v3;
}

@end
