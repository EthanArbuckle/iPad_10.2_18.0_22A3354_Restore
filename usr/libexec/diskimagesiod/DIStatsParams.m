@implementation DIStatsParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIStatsParams)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DIStatsParams *v6;
  id v7;
  uint64_t v8;
  NSUUID *statInstanceID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIStatsParams;
  v6 = -[DIBaseParams initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("statInstanceID"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    statInstanceID = v6->_statInstanceID;
    v6->_statInstanceID = (NSUUID *)v8;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIStatsParams;
  v4 = a3;
  -[DIBaseParams encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_statInstanceID, CFSTR("statInstanceID"), v5.receiver, v5.super_class);

}

- (DIStatsParams)initWithURL:(id)a3 instanceId:(id)a4 error:(id *)a5
{
  id v9;
  DIStatsParams *v10;
  id *p_isa;
  DIStatsParams *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DIStatsParams;
  v10 = -[DIBaseParams initWithURL:error:](&v14, "initWithURL:error:", a3, a5);
  p_isa = (id *)&v10->super.super.isa;
  if (v10)
  {
    if (!-[DIBaseParams openExistingImageWithFlags:error:](v10, "openExistingImageWithFlags:error:", 0, a5))
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong(p_isa + 7, a4);
  }
  v12 = p_isa;
LABEL_6:

  return v12;
}

- (id)statsWithError:(id *)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  DIClient2Controller_XPCHandler *v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100099278;
  v19 = sub_100099288;
  v20 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if ((objc_msgSend((id)v16[5], "connectWithError:", a3) & 1) != 0)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_100099278;
    v13 = sub_100099288;
    v14 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "remoteProxy"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100099290;
    v8[3] = &unk_1001805A0;
    v8[4] = &v9;
    v8[5] = &v15;
    objc_msgSend(v5, "retrieveStatsWithParams:reply:", self, v8);

    if ((objc_msgSend((id)v16[5], "completeCommandWithError:", a3) & 1) != 0)
      v6 = (id)v10[5];
    else
      v6 = 0;
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v6;
}

- (NSUUID)instanceID
{
  NSUUID *statInstanceID;
  NSUUID *v4;
  objc_super v5;

  statInstanceID = self->_statInstanceID;
  if (statInstanceID)
    return statInstanceID;
  v5.receiver = self;
  v5.super_class = (Class)DIStatsParams;
  v4 = -[DIBaseParams instanceID](&v5, "instanceID");
  return (NSUUID *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (NSUUID)statInstanceID
{
  return self->_statInstanceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statInstanceID, 0);
}

@end
