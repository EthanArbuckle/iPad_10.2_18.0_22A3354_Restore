@implementation VUIActionSearchRAC

- (VUIActionSearchRAC)initWithContextData:(id)a3
{
  id v4;
  VUIActionSearchRAC *v5;
  NSDictionary *v6;
  NSDictionary *additionalSubmissionParameters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIActionSearchRAC;
  v5 = -[VUIActionSearchRAC init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (NSDictionary *)v4;
    else
      v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    additionalSubmissionParameters = v5->_additionalSubmissionParameters;
    v5->_additionalSubmissionParameters = v6;

  }
  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (+[VUIJSDevice isSearchEnabled](VUIJSDevice, "isSearchEnabled"))
    +[SearchRACViewPresenter launchRACSheetWithAdditionalParameters:](_TtC8VideosUI22SearchRACViewPresenter, "launchRACSheetWithAdditionalParameters:", self->_additionalSubmissionParameters);
  else
    NSLog(CFSTR("Ignoring Search RAC Launch. NLS feature is disabled"));
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    v5 = v6;
  }

}

- (NSDictionary)additionalSubmissionParameters
{
  return self->_additionalSubmissionParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSubmissionParameters, 0);
}

@end
