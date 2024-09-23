@implementation PPXProductPageContext

+ (PPXProductPageContext)sharedContext
{
  if (qword_1000356D8 != -1)
    dispatch_once(&qword_1000356D8, &stru_10002D410);
  return (PPXProductPageContext *)(id)qword_1000356D0;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
