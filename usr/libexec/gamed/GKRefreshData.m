@implementation GKRefreshData

- (unsigned)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unsigned int)a3
{
  self->_dataType = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
