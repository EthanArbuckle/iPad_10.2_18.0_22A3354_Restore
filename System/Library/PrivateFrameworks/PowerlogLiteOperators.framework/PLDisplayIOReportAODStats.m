@implementation PLDisplayIOReportAODStats

- (PLDisplayIOReportAODStats)init
{
  PLDisplayIOReportAODStats *v3;
  objc_super v5;

  if (+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PLDisplayIOReportAODStats;
    self = -[PLIOReportStats initWithGroup:andSubGroup:](&v5, sel_initWithGroup_andSubGroup_, CFSTR("DCP"), CFSTR("aod stats"));
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (PLDisplayAODStats)displayAODStats
{
  return (PLDisplayAODStats *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayAODStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAODStats, 0);
}

@end
