@implementation SVXRadarFiler

- (SVXRadarFiler)init
{
  SVXRadarFiler *v2;
  uint64_t v3;
  SVXTapToRadarService *ttrService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SVXRadarFiler;
  v2 = -[SVXRadarFiler init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(getTapToRadarServiceClass(), "shared");
    v3 = objc_claimAutoreleasedReturnValue();
    ttrService = v2->_ttrService;
    v2->_ttrService = (SVXTapToRadarService *)v3;

  }
  return v2;
}

- (BOOL)supportsRadarFiling
{
  return getTapToRadarServiceClass() != 0;
}

- (void)fileRadar:(id)a3 processName:(id)a4 displayReason:(id)a5 completion:(id)a6
{
  -[SVXTapToRadarService createDraft:forProcessNamed:withDisplayReason:completionHandler:](self->_ttrService, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrService, 0);
}

@end
