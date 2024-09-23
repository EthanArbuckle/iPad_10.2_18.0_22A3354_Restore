@implementation PKAccountWebServicePayLaterContentResponse

- (PKAccountWebServicePayLaterContentResponse)initWithData:(id)a3
{
  PKAccountWebServicePayLaterContentResponse *v3;
  PKAccountWebServicePayLaterContentResponse *v4;
  void *v5;
  void *v6;
  PKPayLaterDynamicContent *v7;
  PKPayLaterDynamicContent *dynamicContent;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  PKPayLaterBusinessChatTopic *v17;
  PKPayLaterBusinessChatTopic *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  PKAccountWebServicePayLaterContentResponse *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PKAccountWebServicePayLaterContentResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v32, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_21:
    v26 = v4;
    goto LABEL_22;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("dynamicContent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PKPayLaterDynamicContent initWithDictionary:]([PKPayLaterDynamicContent alloc], "initWithDictionary:", v6);
      dynamicContent = v4->_dynamicContent;
      v4->_dynamicContent = v7;

    }
    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("reportIssueTopics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v17 = [PKPayLaterBusinessChatTopic alloc];
          v18 = -[PKPayLaterBusinessChatTopic initWithDictionary:](v17, "initWithDictionary:", v16, (_QWORD)v28);
          objc_msgSend(v10, "safelyAddObject:", v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v13);
    }

    v19 = objc_msgSend(v10, "count");
    if (v19)
      v20 = (void *)objc_msgSend(v10, "copy");
    else
      v20 = 0;
    objc_storeStrong((id *)&v4->_reportIssueTopics, v20);
    if (v19)

    goto LABEL_21;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v23;
    v36 = 2114;
    v37 = v25;
    _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v26 = 0;
LABEL_22:

  return v26;
}

- (PKPayLaterDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSArray)reportIssueTopics
{
  return self->_reportIssueTopics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportIssueTopics, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
}

@end
