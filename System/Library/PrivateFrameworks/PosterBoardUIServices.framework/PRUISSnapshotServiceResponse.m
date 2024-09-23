@implementation PRUISSnapshotServiceResponse

+ (id)snapshotResponseForRequest:(id)a3 snapshotBundle:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  v9 = v5;

  objc_msgSend(v9, "posterSnapshotRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pui_posterContents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "role");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BE74D20];
  objc_msgSend(v6, "bundleURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "temporaryPathForURL:role:", v15, v13);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v7[1];
  v7[1] = v16;

  return v7;
}

+ (id)errorResponseForRequest:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  v9 = v5;

  v10 = (void *)v7[3];
  v7[3] = v6;

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PFPosterPath invalidate](self->_snapshotBundlePath, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRUISSnapshotServiceResponse;
  -[PRUISSnapshotServiceResponse dealloc](&v3, sel_dealloc);
}

- (PUIPosterSnapshotBundle)snapshotBundle
{
  id v3;
  void *v4;
  void *v5;

  if (self->_snapshotBundlePath)
  {
    v3 = objc_alloc(MEMORY[0x24BE74ED0]);
    -[PFPosterPath contentsURL](self->_snapshotBundlePath, "contentsURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  }
  else
  {
    v5 = 0;
  }
  return (PUIPosterSnapshotBundle *)v5;
}

- (BSInvalidatable)sandboxExtensionToken
{
  return self->_snapshotBundlePath;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRUISSnapshotServiceResponse)initWithCoder:(id)a3
{
  id v4;
  PRUISSnapshotServiceResponse *v5;
  uint64_t v6;
  PRUISSnapshotServiceRequest *request;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  PFPosterPath *snapshotBundlePath;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRUISSnapshotServiceResponse;
  v5 = -[PRUISSnapshotServiceResponse init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_request"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (PRUISSnapshotServiceRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_snapshotBundlePath"));
    v10 = objc_claimAutoreleasedReturnValue();
    snapshotBundlePath = v5->_snapshotBundlePath;
    v5->_snapshotBundlePath = (PFPosterPath *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PRUISSnapshotServiceRequest *request;
  id v5;
  id v6;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", request, CFSTR("_request"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("_error"));
  -[PFPosterPath extendContentsReadAccessToAuditToken:error:](self->_snapshotBundlePath, "extendContentsReadAccessToAuditToken:error:", 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_snapshotBundlePath"));

}

- (PRUISSnapshotServiceRequest)request
{
  return self->_request;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_snapshotBundlePath, 0);
}

@end
