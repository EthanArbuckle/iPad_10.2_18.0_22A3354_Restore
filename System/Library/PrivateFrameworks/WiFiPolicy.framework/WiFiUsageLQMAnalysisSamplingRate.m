@implementation WiFiUsageLQMAnalysisSamplingRate

- (WiFiUsageLQMAnalysisSamplingRate)initWithValue:(id)a3
{
  id v4;
  WiFiUsageLQMAnalysisSamplingRate *v5;
  double v6;
  unsigned int v7;
  int v8;
  int v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageLQMAnalysisSamplingRate;
  v5 = -[WiFiUsageLQMAnalysisSamplingRate init](&v11, sel_init);
  v5->_samplingBase = 100;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  v5->_samplingRate = v6;
  v8 = 5;
  do
  {
    if (v6 == (double)v7)
      break;
    v6 = v6 * 10.0;
    v7 = v6;
    v9 = 10 * v5->_samplingBase;
    v5->_samplingRate = v6;
    v5->_samplingBase = v9;
    --v8;
  }
  while (v8);

  return v5;
}

- (id)description
{
  unint64_t v2;
  unint64_t v3;

  LODWORD(v2) = self->_samplingRate;
  LODWORD(v3) = self->_samplingBase;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.03f%%"), (double)v2 * 100.0 / (double)v3);
}

- (unsigned)samplingRate
{
  return self->_samplingRate;
}

- (unsigned)samplingBase
{
  return self->_samplingBase;
}

@end
