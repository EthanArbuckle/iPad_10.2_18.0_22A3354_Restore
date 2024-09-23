@implementation STExtractionOriginator

- (void)remote_setExtractionProgress:(double)a3
{
  void *v4;
  id v5;

  -[STExtractionOriginator originator](self, "originator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "remote_setExtractionProgress:", a3);
    v4 = v5;
  }

}

- (void)remote_extractionCompleteAtArchivePath:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[STExtractionOriginator originator](self, "originator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "remote_extractionCompleteAtArchivePath:", v6);

}

- (void)remote_extractionEnteredPassthroughMode
{
  void *v2;
  id v3;

  -[STExtractionOriginator originator](self, "originator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "remote_extractionEnteredPassthroughMode");
    v2 = v3;
  }

}

- (STExtractionOriginatorProtocol)originator
{
  return (STExtractionOriginatorProtocol *)objc_loadWeakRetained((id *)&self->_originator);
}

- (void)setOriginator:(id)a3
{
  objc_storeWeak((id *)&self->_originator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originator);
}

@end
