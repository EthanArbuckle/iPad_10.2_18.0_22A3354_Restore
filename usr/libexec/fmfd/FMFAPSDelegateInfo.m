@implementation FMFAPSDelegateInfo

- (NSString)topic
{
  return self->_topic;
}

- (FMFAPSDelegate)delegate
{
  return (FMFAPSDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
