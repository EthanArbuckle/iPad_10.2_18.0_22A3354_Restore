@implementation SSUIService

- (SSUIService)init
{
  SSUIService *v2;
  SSUIServiceClient *v3;
  SSUIServiceClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUIService;
  v2 = -[SSUIService init](&v6, sel_init);
  v3 = objc_alloc_init(SSUIServiceClient);
  client = v2->_client;
  v2->_client = v3;

  return v2;
}

- (void)showScreenshotUI
{
  SSUIShowScreenshotServiceRequest *v3;

  v3 = objc_alloc_init(SSUIShowScreenshotServiceRequest);
  -[SSUIServiceClient sendRequest:withCompletion:](self->_client, "sendRequest:withCompletion:", v3, 0);

}

- (void)takeScreenshotWithOptions:(id)a3
{
  id v4;
  SSUIShowScreenshotServiceRequest *v5;

  v4 = a3;
  v5 = objc_alloc_init(SSUIShowScreenshotServiceRequest);
  -[SSUIShowScreenshotServiceRequest setOptions:](v5, "setOptions:", v4);

  -[SSUIServiceClient sendRequest:withCompletion:](self->_client, "sendRequest:withCompletion:", v5, 0);
}

- (void)showScreenshotUIForImage:(id)a3 options:(id)a4
{
  -[SSUIService showScreenshotUIForImage:options:withCompletion:](self, "showScreenshotUIForImage:options:withCompletion:", a3, a4, 0);
}

- (void)showScreenshotUIForImage:(id)a3 options:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SSUIShowScreenshotUIWithImageServiceRequest *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(SSUIShowScreenshotUIWithImageServiceRequest);
  -[SSUIShowScreenshotUIWithImageServiceRequest setImage:](v11, "setImage:", v10);

  -[SSUIShowScreenshotUIWithImageServiceRequest setOptions:](v11, "setOptions:", v9);
  -[SSUIServiceClient sendRequest:withCompletion:](self->_client, "sendRequest:withCompletion:", v11, v8);

}

- (void)_runPPTNamed:(id)a3 numberOfRequiredScreenshots:(unint64_t)a4
{
  id v6;
  SSUIRunPPTServiceRequest *v7;

  v6 = a3;
  v7 = objc_alloc_init(SSUIRunPPTServiceRequest);
  -[SSUIRunPPTServiceRequest setTestName:](v7, "setTestName:", v6);

  -[SSUIRunPPTServiceRequest setNumberOfRequiredScreenshots:](v7, "setNumberOfRequiredScreenshots:", a4);
  -[SSUIServiceClient sendRequest:withCompletion:](self->_client, "sendRequest:withCompletion:", v7, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
