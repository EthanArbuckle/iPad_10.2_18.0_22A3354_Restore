@implementation TVPSecureKeyLoader

- (void)startLoadingCertificateDataForRequest:(id)a3
{
  -[TVPSecureKeyLoader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)startLoadingContentIdentifierDataForRequest:(id)a3
{
  -[TVPSecureKeyLoader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)startLoadingKeyResponseDataForRequest:(id)a3
{
  -[TVPSecureKeyLoader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (TVPSecureKeyLoaderDelegate)delegate
{
  return (TVPSecureKeyLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (void)setEventCollection:(id)a3
{
  objc_storeStrong((id *)&self->_eventCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
