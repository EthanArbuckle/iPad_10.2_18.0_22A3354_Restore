@implementation _SBLoadApplicationResult

- (BOOL)isSuccess
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (uint64_t)setSuccess:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (void)setErrorDescription:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end
