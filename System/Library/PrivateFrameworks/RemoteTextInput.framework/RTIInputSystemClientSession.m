@implementation RTIInputSystemClientSession

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (RTISessionOptions)beginOptions
{
  return self->_beginOptions;
}

- (void)setDocumentTraits:(id)a3
{
  objc_storeStrong((id *)&self->_documentTraits, a3);
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
}

- (void)setBeginOptions:(id)a3
{
  objc_storeStrong((id *)&self->_beginOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong((id *)&self->_beginOptions, 0);
}

@end
