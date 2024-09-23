@implementation TPSAnalyticsEventServiceRequest

- (id)_initWithType:(id)a3 metrics:(id)a4
{
  id v7;
  id v8;
  TPSAnalyticsEventServiceRequest *v9;
  TPSAnalyticsEventServiceRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *url;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *etag;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  objc_super v46;

  v7 = a3;
  v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)TPSAnalyticsEventServiceRequest;
  v9 = -[TPSAnalyticsEvent initWithDate:](&v46, sel_initWithDate_, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_msgSend(v8, "transactionMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v14 = objc_claimAutoreleasedReturnValue();
    url = v10->_url;
    v10->_url = (NSURL *)v14;

    objc_msgSend(v12, "response");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v10->_statusCode = objc_msgSend(v16, "statusCode");
      objc_msgSend(v17, "valueForHTTPHeaderField:", CFSTR("Etag"));
      v18 = objc_claimAutoreleasedReturnValue();
      etag = v10->_etag;
      v10->_etag = (NSString *)v18;

    }
    v10->_responseSize = objc_msgSend(v12, "countOfResponseBodyBytesAfterDecoding");
    objc_msgSend(v12, "requestEndDate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v12, "requestStartDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v12, "requestEndDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "requestStartDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceDate:", v24);
        v10->_requestTime = (unint64_t)v25;

      }
    }
    objc_msgSend(v12, "responseStartDate");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      objc_msgSend(v12, "responseEndDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v12, "responseStartDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "responseEndDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v30);
        v10->_responseTime = (unint64_t)v31;

      }
    }
    objc_msgSend(v12, "responseStartDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "responseStartDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "timeIntervalSinceDate:", v34);
      v10->_requestTtfb = (unint64_t)v35;

    }
    objc_msgSend(v8, "taskInterval");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "endDate");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      objc_msgSend(v8, "taskInterval");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "startDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
LABEL_16:
        v10->_responseHeadersSize = objc_msgSend(v12, "countOfResponseHeaderBytesReceived");

        goto LABEL_17;
      }
      objc_msgSend(v8, "taskInterval");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "endDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "taskInterval");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "startDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeIntervalSinceDate:", v43);
      v10->_timeToDownloadResponse = (unint64_t)v44;

    }
    goto LABEL_16;
  }
LABEL_17:

  return v10;
}

+ (id)serviceRequestEventWithType:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithType:metrics:", v7, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventServiceRequest)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventServiceRequest *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSURL *url;
  uint64_t v10;
  NSString *etag;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventServiceRequest;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v5->_statusCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("response_status_code"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("etag"));
    v10 = objc_claimAutoreleasedReturnValue();
    etag = v5->_etag;
    v5->_etag = (NSString *)v10;

    v5->_requestTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("request_time"));
    v5->_requestTtfb = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("request_ttfb"));
    v5->_responseHeadersSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("response_headers_size"));
    v5->_responseSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("response_size"));
    v5->_responseTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("response_time"));
    v5->_timeToDownloadResponse = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("time_to_download_response"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventServiceRequest;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_statusCode, CFSTR("response_status_code"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_etag, CFSTR("etag"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_requestTime, CFSTR("request_time"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_requestTtfb, CFSTR("request_ttfb"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_responseHeadersSize, CFSTR("response_headers_size"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_responseSize, CFSTR("response_size"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_responseTime, CFSTR("response_time"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_timeToDownloadResponse, CFSTR("time_to_download_response"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("service_request"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_type, CFSTR("type"));
  -[NSURL absoluteString](self->_url, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("url"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_statusCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("response_status_code"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_etag, CFSTR("etag"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("request_time"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestTtfb);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("request_ttfb"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_responseHeadersSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("response_headers_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_responseSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("response_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_responseTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("response_time"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_timeToDownloadResponse);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("time_to_download_response"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
