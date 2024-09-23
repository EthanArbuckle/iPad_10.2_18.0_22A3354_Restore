@implementation WiFiUsageSessionCAConfig

- (WiFiUsageSessionCAConfig)initWithSampling:(unint64_t)a3 minInterval:(double)a4
{
  WiFiUsageSessionCAConfig *v6;
  WiFiUsageSessionCAConfig *v7;
  NSDate *ca_lastSubmission;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageSessionCAConfig;
  v6 = -[WiFiUsageSessionCAConfig init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ca_sampling = a3;
    v6->_ca_minTimeIntervalBetweenSubmissions = a4;
    ca_lastSubmission = v6->_ca_lastSubmission;
    v6->_ca_lastSubmission = 0;

  }
  return v7;
}

- (void)countSubmission
{
  NSDate *v3;
  NSDate *ca_lastSubmission;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  ca_lastSubmission = self->_ca_lastSubmission;
  self->_ca_lastSubmission = v3;

}

- (BOOL)canSubmit
{
  void *v3;
  double v4;
  double v5;
  double ca_minTimeIntervalBetweenSubmissions;

  if (self->_ca_lastSubmission
    && (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "timeIntervalSinceDate:", self->_ca_lastSubmission),
        v5 = v4,
        ca_minTimeIntervalBetweenSubmissions = self->_ca_minTimeIntervalBetweenSubmissions,
        v3,
        v5 < ca_minTimeIntervalBetweenSubmissions))
  {
    return 0;
  }
  else
  {
    return +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", self->_ca_sampling);
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[WiFiUsagePrivacyFilter describeSampleRate:](WiFiUsagePrivacyFilter, "describeSampleRate:", self->_ca_sampling);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter getHumanSecondsFromTimeInterval:](WiFiUsagePrivacyFilter, "getHumanSecondsFromTimeInterval:", self->_ca_minTimeIntervalBetweenSubmissions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("samplingRate:%@, minTimeInterval:%@ lastSubmission:%@"), v4, v5, self->_ca_lastSubmission);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)ca_sampling
{
  return self->_ca_sampling;
}

- (double)ca_minTimeIntervalBetweenSubmissions
{
  return self->_ca_minTimeIntervalBetweenSubmissions;
}

- (NSDate)ca_lastSubmission
{
  return self->_ca_lastSubmission;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ca_lastSubmission, 0);
}

@end
