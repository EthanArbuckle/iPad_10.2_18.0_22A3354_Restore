@implementation TITypologyStatisticCurrentAutocorrections

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_autocorrections, 0);
}

- (void)visitRecordAutocorrections:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "autocorrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyStatisticCurrentAutocorrections setAutocorrections:](self, "setAutocorrections:", v5);

  objc_msgSend(v4, "requestToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[TITypologyStatisticCurrentAutocorrections setRequestToken:](self, "setRequestToken:", v6);
}

- (TIAutocorrectionList)autocorrections
{
  return self->_autocorrections;
}

- (void)setAutocorrections:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrections, a3);
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_requestToken, a3);
}

@end
