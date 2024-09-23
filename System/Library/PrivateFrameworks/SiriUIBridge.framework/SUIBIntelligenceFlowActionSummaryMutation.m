@implementation SUIBIntelligenceFlowActionSummaryMutation

- (NSString)formatString
{
  return self->_formatString;
}

- (void)setFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)parameterSummaries
{
  return self->_parameterSummaries;
}

- (void)setParameterSummaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSummaries, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

@end
