@implementation SUIBNLRouterSummaryMutation

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)setRewrittenUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
}

@end
