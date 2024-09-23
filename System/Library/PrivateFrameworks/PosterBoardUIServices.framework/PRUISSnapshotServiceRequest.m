@implementation PRUISSnapshotServiceRequest

- (PRUISSnapshotServiceRequest)initWithSnapshotRequest:(id)a3
{
  id v6;
  void *v7;
  PRUISSnapshotServiceRequest *v8;
  PRUISSnapshotServiceRequest *v9;
  PRUISSnapshotServiceRequest *result;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)PRUISSnapshotServiceRequest;
    v8 = -[PRUISSnapshotServiceRequest init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_posterSnapshotRequest, a3);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("request"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISSnapshotServiceRequest initWithSnapshotRequest:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (PRUISSnapshotServiceRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRUISSnapshotServiceRequest)initWithCoder:(id)a3
{
  id v4;
  PRUISSnapshotServiceRequest *v5;
  uint64_t v6;
  PUIPosterSnapshotRequest *posterSnapshotRequest;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISSnapshotServiceRequest;
  v5 = -[PRUISSnapshotServiceRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posterSnapshotRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    posterSnapshotRequest = v5->_posterSnapshotRequest;
    v5->_posterSnapshotRequest = (PUIPosterSnapshotRequest *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_posterSnapshotRequest, CFSTR("_posterSnapshotRequest"));
}

- (PUIPosterSnapshotRequest)posterSnapshotRequest
{
  return self->_posterSnapshotRequest;
}

- (BSAuditToken)requestOriginAuditToken
{
  return self->_requestOriginAuditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestOriginAuditToken, 0);
  objc_storeStrong((id *)&self->_posterSnapshotRequest, 0);
}

- (void)initWithSnapshotRequest:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PRUISSnapshotServiceRequest.m");
  v16 = 1024;
  v17 = 16;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2445ED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
