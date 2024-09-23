@implementation PLDisplayIOReportStats

- (PLDisplayIOReportStats)init
{
  PLDisplayIOReportStats *v3;
  PLDisplayIOReportStats *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (+[PLDisplayAgent shouldLogFromDCP](PLDisplayAgent, "shouldLogFromDCP"))
    {
      if (objc_msgSend(MEMORY[0x1E0D80020], "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0))
      {
        v7.receiver = self;
        v7.super_class = (Class)PLDisplayIOReportStats;
        v4 = -[PLIOReportStats initWithGroup:andSubGroup:](&v7, sel_initWithGroup_andSubGroup_, CFSTR("DCP0"), CFSTR("display stats"));
      }
      else
      {
        v6.receiver = self;
        v6.super_class = (Class)PLDisplayIOReportStats;
        v4 = -[PLIOReportStats initWithGroup:andSubGroup:](&v6, sel_initWithGroup_andSubGroup_, CFSTR("DCP"), CFSTR("display stats"));
      }
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)PLDisplayIOReportStats;
      v4 = -[PLIOReportStats initWithGroup:andSubGroup:](&v8, sel_initWithGroup_andSubGroup_, CFSTR("IOMFB Reporting"), CFSTR("display stats"));
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (PLDisplayAPLStats)displayAPLStats
{
  return (PLDisplayAPLStats *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayAPLStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLDisplayAZLStats)displayAZLStats
{
  return (PLDisplayAZLStats *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayAZLStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAZLStats, 0);
  objc_storeStrong((id *)&self->_displayAPLStats, 0);
}

@end
