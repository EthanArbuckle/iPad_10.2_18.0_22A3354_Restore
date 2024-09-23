@implementation WBSWKDataTaskDelegate

- (void)dataTask:(id)a3 didReceiveData:(id)a4
{
  void (**didReceiveData)(id, id, id);

  didReceiveData = (void (**)(id, id, id))self->_didReceiveData;
  if (didReceiveData)
    didReceiveData[2](didReceiveData, a3, a4);
}

- (void)dataTask:(id)a3 didCompleteWithError:(id)a4
{
  void (**didCompleteWithError)(id, id, id);

  didCompleteWithError = (void (**)(id, id, id))self->_didCompleteWithError;
  if (didCompleteWithError)
    didCompleteWithError[2](didCompleteWithError, a3, a4);
}

- (id)didReceiveData
{
  return self->_didReceiveData;
}

- (void)setDidReceiveData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)didCompleteWithError
{
  return self->_didCompleteWithError;
}

- (void)setDidCompleteWithError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didCompleteWithError, 0);
  objc_storeStrong(&self->_didReceiveData, 0);
}

@end
