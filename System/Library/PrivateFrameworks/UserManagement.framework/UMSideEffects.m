@implementation UMSideEffects

- (UMLibNotifyProviding)libNotify
{
  return self->_libNotify;
}

- (void)setLibNotify:(id)a3
{
  objc_storeStrong((id *)&self->_libNotify, a3);
}

- (void)setLibInfo:(id)a3
{
  objc_storeStrong((id *)&self->_libInfo, a3);
}

- (UMLibInfoProviding)libInfo
{
  return self->_libInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libNotify, 0);
  objc_storeStrong((id *)&self->_libInfo, 0);
}

@end
