@implementation TFLaunchScreen

- (TFLaunchScreen)initWithLockup:(id)a3 testerNotes:(id)a4 howToScreenshotSupportUrl:(id)a5
{
  id v9;
  id v10;
  id v11;
  TFLaunchScreen *v12;
  TFLaunchScreen *v13;
  uint64_t v14;
  NSString *testerNotes;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TFLaunchScreen;
  v12 = -[TFLaunchScreen init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lockup, a3);
    v14 = objc_msgSend(v10, "copy");
    testerNotes = v13->_testerNotes;
    v13->_testerNotes = (NSString *)v14;

    objc_storeStrong((id *)&v13->_howToScreenshotSupportUrl, a5);
  }

  return v13;
}

- (TFAppLockup)lockup
{
  return self->_lockup;
}

- (NSString)testerNotes
{
  return self->_testerNotes;
}

- (NSURL)howToScreenshotSupportUrl
{
  return self->_howToScreenshotSupportUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_howToScreenshotSupportUrl, 0);
  objc_storeStrong((id *)&self->_testerNotes, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
}

@end
