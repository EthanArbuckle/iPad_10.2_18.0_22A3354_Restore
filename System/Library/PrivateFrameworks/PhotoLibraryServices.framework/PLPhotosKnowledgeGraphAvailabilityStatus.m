@implementation PLPhotosKnowledgeGraphAvailabilityStatus

- (PLPhotosKnowledgeGraphAvailabilityStatus)initWithDictionary:(id)a3
{
  id v4;
  PLPhotosKnowledgeGraphAvailabilityStatus *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PLPhotosKnowledgeGraphAvailabilityStatus *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLPhotosKnowledgeGraphAvailabilityStatus;
  v5 = -[PLPhotosKnowledgeGraphAvailabilityStatus init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("graphStatusDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = CFSTR("No status description");
    objc_storeStrong((id *)&v5->_statusDescription, v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("graphIsReadyStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("graphIsReadyStatus"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "BOOLValue"))
        v11 = 2;
      else
        v11 = 1;

    }
    else
    {
      v11 = 1;
    }

    v5->_availability = v11;
    v12 = v5;
  }

  return v5;
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (int64_t)availability
{
  return self->_availability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
}

@end
