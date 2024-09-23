@implementation WFRemoteWebSheetViewControllerErrorContext

- (NSError)error
{
  return self->error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
}

@end
