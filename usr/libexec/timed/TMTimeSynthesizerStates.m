@implementation TMTimeSynthesizerStates

- (double)utc_var
{
  return self->_utc_var;
}

- (double)utc
{
  return self->_utc;
}

- (void)setUtc_var:(double)a3
{
  self->_utc_var = a3;
}

- (void)setUtc_sf_cov:(double)a3
{
  self->_utc_sf_cov = a3;
}

- (void)setUtc:(double)a3
{
  self->_utc = a3;
}

- (void)setSf_var:(double)a3
{
  self->_sf_var = a3;
}

- (void)setRtc:(double)a3
{
  self->_rtc = a3;
}

- (void)setRateSf:(double)a3
{
  self->_rateSf = a3;
}

- (double)sf_var
{
  return self->_sf_var;
}

- (double)rtc
{
  return self->_rtc;
}

- (double)rateSf
{
  return self->_rateSf;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  -[TMTimeSynthesizerStates rtc](self, "rtc");
  v4 = v3;
  -[TMTimeSynthesizerStates utc](self, "utc");
  v6 = v5;
  -[TMTimeSynthesizerStates rateSf](self, "rateSf");
  v8 = v7;
  -[TMTimeSynthesizerStates utc_var](self, "utc_var");
  v10 = sqrt(v9);
  -[TMTimeSynthesizerStates sf_var](self, "sf_var");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("rtc,%.3lf,utc,%.3lf,sf,%.8lf,utcStd,%.8lf,sfStd,%.8lf"), v4, v6, v8, *(_QWORD *)&v10, sqrt(v11));
}

- (double)utc_sf_cov
{
  return self->_utc_sf_cov;
}

@end
