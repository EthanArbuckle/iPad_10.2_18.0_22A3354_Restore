@implementation WBSPrivacyReportMetrics

- (WBSPrivacyReportMetrics)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  WBSPrivacyReportMetrics *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  NSString *mostSeenKnownTrackerDomain;
  void *v11;
  WBSPrivacyReportMetrics *v12;

  v4 = a3;
  v5 = -[WBSPrivacyReportMetrics init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("numberOfTrackers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberOfTrackers = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("ratioOfTrackedFirstPartiesToAllVisited"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v5->_ratioOfTrackedFirstPartiesToAllVisited = v8;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("mostSeenKnownTrackerDomain"));
    v9 = objc_claimAutoreleasedReturnValue();
    mostSeenKnownTrackerDomain = v5->_mostSeenKnownTrackerDomain;
    v5->_mostSeenKnownTrackerDomain = (NSString *)v9;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("numberOfFirstParties"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mostSeenKnownTrackerFirstParties = objc_msgSend(v11, "integerValue");

    v12 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *mostSeenKnownTrackerDomain;
  unint64_t mostSeenKnownTrackerFirstParties;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("numberOfTrackers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTrackers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("ratioOfTrackedFirstPartiesToAllVisited");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratioOfTrackedFirstPartiesToAllVisited);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  mostSeenKnownTrackerDomain = &stru_1E5449658;
  mostSeenKnownTrackerFirstParties = self->_mostSeenKnownTrackerFirstParties;
  if (self->_mostSeenKnownTrackerDomain)
    mostSeenKnownTrackerDomain = (const __CFString *)self->_mostSeenKnownTrackerDomain;
  v12[1] = v4;
  v12[2] = mostSeenKnownTrackerDomain;
  v11[2] = CFSTR("mostSeenKnownTrackerDomain");
  v11[3] = CFSTR("numberOfFirstParties");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", mostSeenKnownTrackerFirstParties);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)numberOfTrackers
{
  return self->_numberOfTrackers;
}

- (void)setNumberOfTrackers:(unint64_t)a3
{
  self->_numberOfTrackers = a3;
}

- (double)ratioOfTrackedFirstPartiesToAllVisited
{
  return self->_ratioOfTrackedFirstPartiesToAllVisited;
}

- (void)setRatioOfTrackedFirstPartiesToAllVisited:(double)a3
{
  self->_ratioOfTrackedFirstPartiesToAllVisited = a3;
}

- (NSString)mostSeenKnownTrackerDomain
{
  return self->_mostSeenKnownTrackerDomain;
}

- (void)setMostSeenKnownTrackerDomain:(id)a3
{
  objc_storeStrong((id *)&self->_mostSeenKnownTrackerDomain, a3);
}

- (unint64_t)mostSeenKnownTrackerFirstParties
{
  return self->_mostSeenKnownTrackerFirstParties;
}

- (void)setMostSeenKnownTrackerFirstParties:(unint64_t)a3
{
  self->_mostSeenKnownTrackerFirstParties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostSeenKnownTrackerDomain, 0);
}

@end
