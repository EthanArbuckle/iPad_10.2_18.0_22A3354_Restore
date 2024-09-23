@implementation ReportLinkFactory

- (id)createModelForType:(int64_t)a3
{
  id v3;
  void *v4;

  if ((unint64_t)a3 > 4)
    v3 = 0;
  else
    v3 = objc_alloc_init(*(&off_1011DD688)[a3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "createReportLink"));

  return v4;
}

@end
