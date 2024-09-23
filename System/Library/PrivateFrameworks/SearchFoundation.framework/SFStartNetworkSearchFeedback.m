@implementation SFStartNetworkSearchFeedback

- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7
{
  id v12;
  id v13;
  SFStartNetworkSearchFeedback *v14;
  uint64_t v15;
  NSString *url;
  uint64_t v17;
  NSDictionary *headers;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFStartNetworkSearchFeedback;
  v14 = -[SFStartSearchFeedback initWithInput:triggerEvent:](&v20, sel_initWithInput_triggerEvent_, a3, a6);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    url = v14->_url;
    v14->_url = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    headers = v14->_headers;
    v14->_headers = (NSDictionary *)v17;

    v14->_endpoint = a7;
  }

  return v14;
}

- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7 queryId:(unint64_t)a8
{
  SFStartNetworkSearchFeedback *v9;
  SFStartNetworkSearchFeedback *v10;

  v9 = -[SFStartNetworkSearchFeedback initWithInput:url:headers:triggerEvent:endpoint:](self, "initWithInput:url:headers:triggerEvent:endpoint:", a3, a4, a5, a6, a7);
  v10 = v9;
  if (v9)
    -[SFFeedback setQueryId:](v9, "setQueryId:", a8);

  return v10;
}

- (SFStartNetworkSearchFeedback)initWithInput:(id)a3 url:(id)a4 headers:(id)a5 triggerEvent:(unint64_t)a6 endpoint:(unint64_t)a7 queryId:(unint64_t)a8 experimentId:(id)a9 treatmentId:(id)a10
{
  id v17;
  id v18;
  SFStartNetworkSearchFeedback *v19;
  SFStartNetworkSearchFeedback *v20;
  SFStartNetworkSearchFeedback *v21;

  v17 = a9;
  v18 = a10;
  v19 = -[SFStartNetworkSearchFeedback initWithInput:url:headers:triggerEvent:endpoint:queryId:](self, "initWithInput:url:headers:triggerEvent:endpoint:queryId:", a3, a4, a5, a6, a7, a8);
  v20 = v19;
  if (v19)
  {
    -[SFStartNetworkSearchFeedback setExperimentId:](v19, "setExperimentId:", v17);
    -[SFStartNetworkSearchFeedback setTreatmentId:](v20, "setTreatmentId:", v18);
    v21 = v20;
  }

  return v20;
}

- (SFStartNetworkSearchFeedback)initWithCoder:(id)a3
{
  id v4;
  SFStartNetworkSearchFeedback *v5;
  uint64_t v6;
  NSString *url;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *headers;
  uint64_t v14;
  SFIndexState *indexState;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFStartNetworkSearchFeedback;
  v5 = -[SFStartSearchFeedback initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("headers"));
    v12 = objc_claimAutoreleasedReturnValue();
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v12;

    v5->_endpoint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endpoint"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_indexState"));
    v14 = objc_claimAutoreleasedReturnValue();
    indexState = v5->_indexState;
    v5->_indexState = (SFIndexState *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStartNetworkSearchFeedback;
  v4 = a3;
  -[SFStartSearchFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_headers, CFSTR("headers"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_endpoint, CFSTR("endpoint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_indexState, CFSTR("_indexState"));

}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
}

- (unint64_t)rawRequestSize
{
  return self->_rawRequestSize;
}

- (void)setRawRequestSize:(unint64_t)a3
{
  self->_rawRequestSize = a3;
}

- (unint64_t)compressedRequestSize
{
  return self->_compressedRequestSize;
}

- (void)setCompressedRequestSize:(unint64_t)a3
{
  self->_compressedRequestSize = a3;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (SFIndexState)indexState
{
  return self->_indexState;
}

- (void)setIndexState:(id)a3
{
  objc_storeStrong((id *)&self->_indexState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
