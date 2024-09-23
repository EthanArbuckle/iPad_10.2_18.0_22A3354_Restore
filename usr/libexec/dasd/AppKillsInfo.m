@implementation AppKillsInfo

- (AppKillsInfo)init
{
  char *v2;
  AppKillsInfo *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AppKillsInfo;
  v2 = -[AppKillsInfo init](&v6, "init");
  v3 = (AppKillsInfo *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

  }
  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Means kills because of springboard: %f, runningboard: %f, jetsam: %f, others: %f"), *(_QWORD *)&self->_meanSpringBoardKills, *(_QWORD *)&self->_meanRunningBoardKills, *(_QWORD *)&self->_meanJetsamKills, *(_QWORD *)&self->_meanOtherKills);
}

- (double)meanSpringBoardKills
{
  return self->_meanSpringBoardKills;
}

- (void)setMeanSpringBoardKills:(double)a3
{
  self->_meanSpringBoardKills = a3;
}

- (double)meanRunningBoardKills
{
  return self->_meanRunningBoardKills;
}

- (void)setMeanRunningBoardKills:(double)a3
{
  self->_meanRunningBoardKills = a3;
}

- (double)meanJetsamKills
{
  return self->_meanJetsamKills;
}

- (void)setMeanJetsamKills:(double)a3
{
  self->_meanJetsamKills = a3;
}

- (double)meanOtherKills
{
  return self->_meanOtherKills;
}

- (void)setMeanOtherKills:(double)a3
{
  self->_meanOtherKills = a3;
}

- (NSDate)firstKillEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFirstKillEventDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstKillEventDate, 0);
}

@end
