@implementation PLBasebandExtraCode

- (void)logWithLogger:(id)a3
{
  id v3;

  -[PLBasebandMessage agent](self, "agent", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventNoneBBReportBy:withAction:", 7, 6);

}

@end
