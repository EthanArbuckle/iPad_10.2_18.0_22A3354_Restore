@implementation VMUCallTreeRootWithBacktrace

- (NSString)backtraceString
{
  return self->_backtraceString;
}

- (void)setBacktraceString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backtraceString, 0);
}

@end
