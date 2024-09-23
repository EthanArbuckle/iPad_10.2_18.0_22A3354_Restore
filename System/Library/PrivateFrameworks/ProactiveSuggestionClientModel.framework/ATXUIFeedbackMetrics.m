@implementation ATXUIFeedbackMetrics

- (double)engagementRate
{
  unint64_t engagementCount;
  unint64_t impressionCount;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  impressionCount = self->_impressionCount;
  engagementCount = self->_engagementCount;
  if (impressionCount)
    return (double)engagementCount / (double)impressionCount;
  v4 = 0.0;
  if (engagementCount)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXUIFeedbackMetrics engagementRate].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)rejectionRate
{
  unint64_t impressionCount;
  unint64_t rejectionCount;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  impressionCount = self->_impressionCount;
  rejectionCount = self->_rejectionCount;
  if (impressionCount)
    return (double)rejectionCount / (double)impressionCount;
  v4 = 0.0;
  if (rejectionCount)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXUIFeedbackMetrics rejectionRate].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXUIFeedbackMetrics *v4;
  ATXUIFeedbackMetrics *v5;
  BOOL v6;

  v4 = (ATXUIFeedbackMetrics *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUIFeedbackMetrics isEqualToATXUIFeedbackMetrics:](self, "isEqualToATXUIFeedbackMetrics:", v5);

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackMetrics:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  v5 = *(_OWORD *)&self->_impressionCount == *(_OWORD *)(v4 + 8) && self->_rejectionCount == *((_QWORD *)v4 + 3);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_engagementCount - self->_impressionCount + 32 * self->_impressionCount;
  return self->_rejectionCount - v2 + 32 * v2;
}

- (unint64_t)impressionCount
{
  return self->_impressionCount;
}

- (void)setImpressionCount:(unint64_t)a3
{
  self->_impressionCount = a3;
}

- (unint64_t)engagementCount
{
  return self->_engagementCount;
}

- (void)setEngagementCount:(unint64_t)a3
{
  self->_engagementCount = a3;
}

- (unint64_t)rejectionCount
{
  return self->_rejectionCount;
}

- (void)setRejectionCount:(unint64_t)a3
{
  self->_rejectionCount = a3;
}

- (void)engagementRate
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _engagementCount != 0 while _impressionCount == 0.", a5, a6, a7, a8, 2u);
}

- (void)rejectionRate
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _rejectionCount != 0 while _impressionCount == 0.", a5, a6, a7, a8, 2u);
}

@end
