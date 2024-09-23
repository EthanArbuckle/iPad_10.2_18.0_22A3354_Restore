@implementation SFUIPeopleSuggestionImageRequest

- (SFUIPeopleSuggestionImageRequest)initWithRequestID:(int)a3 peopleSuggestion:(id)a4 type:(int64_t)a5 resultHandler:(id)a6
{
  uint64_t v9;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  SFUIPeopleSuggestionImageRequest *v15;
  SFUIPeopleSuggestionImageRequest *v16;
  objc_super v18;

  v9 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a6;
  if (a5 == 1)
  {
    objc_msgSend(v11, "transportBundleIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a5)
  {
    objc_msgSend(v11, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_7;
  }
  v14 = 0;
LABEL_7:
  v18.receiver = self;
  v18.super_class = (Class)SFUIPeopleSuggestionImageRequest;
  v15 = -[SFUIImageRequest initWithRequestID:identifier:synchronous:resultHandler:](&v18, sel_initWithRequestID_identifier_synchronous_resultHandler_, v9, v14, 0, v12);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_peopleSuggestion, a4);
    v16->_type = a5;
  }

  return v16;
}

- (SFPeopleSuggestion)peopleSuggestion
{
  return self->_peopleSuggestion;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSuggestion, 0);
}

@end
