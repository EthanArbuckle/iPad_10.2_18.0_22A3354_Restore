@implementation SUIBRequestProgressMutation

- (unint64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(unint64_t)a3
{
  self->_progressType = a3;
}

- (SUIBNLRouterSummary)nlRouterSummary
{
  return self->_nlRouterSummary;
}

- (void)setNlRouterSummary:(id)a3
{
  objc_storeStrong((id *)&self->_nlRouterSummary, a3);
}

- (SUIBIntelligenceFlowActionSummary)intelligenceFlowActionSummary
{
  return self->_intelligenceFlowActionSummary;
}

- (void)setIntelligenceFlowActionSummary:(id)a3
{
  objc_storeStrong((id *)&self->_intelligenceFlowActionSummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligenceFlowActionSummary, 0);
  objc_storeStrong((id *)&self->_nlRouterSummary, 0);
}

@end
