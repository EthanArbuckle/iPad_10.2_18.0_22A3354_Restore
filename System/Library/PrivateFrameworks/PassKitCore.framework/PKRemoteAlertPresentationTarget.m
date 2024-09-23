@implementation PKRemoteAlertPresentationTarget

+ (id)createForSceneID:(id)a3 inProcess:(id)a4
{
  id v6;
  id v7;
  PKRemoteAlertPresentationTarget *v8;
  id v9;
  id v10;
  void *v11;
  PKRemoteAlertPresentationTarget *v12;
  id *v13;
  id *v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v6 = a4;
  v7 = a3;
  v8 = [PKRemoteAlertPresentationTarget alloc];
  v9 = v7;
  v10 = v6;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v18.receiver = v8;
    v18.super_class = (Class)PKRemoteAlertPresentationTarget;
    v13 = objc_msgSendSuper2(&v18, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a4);
      v15 = objc_msgSend(v9, "copy");
      v16 = v14[2];
      v14[2] = (id)v15;

    }
    v8 = v14;
    v12 = v8;
  }

  return v12;
}

- (PKRemoteAlertPresentationTarget)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteAlertPresentationTarget)initWithCoder:(id)a3
{
  id v4;
  PKRemoteAlertPresentationTarget *v5;
  uint64_t v6;
  RBSProcessHandle *process;
  uint64_t v8;
  NSString *sceneID;
  PKRemoteAlertPresentationTarget *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKRemoteAlertPresentationTarget;
  v5 = -[PKRemoteAlertPresentationTarget init](&v13, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("process"));
  v6 = objc_claimAutoreleasedReturnValue();
  process = v5->_process;
  v5->_process = (RBSProcessHandle *)v6;

  if (!v5->_process)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneID"));
  v8 = objc_claimAutoreleasedReturnValue();
  sceneID = v5->_sceneID;
  v5->_sceneID = (NSString *)v8;

  if (v5->_sceneID)
  {
LABEL_4:
    v10 = v5;
  }
  else
  {
LABEL_5:
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKRemoteAlertPresentationTarget"), 0, 0);
    objc_msgSend(v4, "failWithError:", v11);

    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  RBSProcessHandle *process;
  id v5;

  process = self->_process;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", process, CFSTR("process"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sceneID, CFSTR("sceneID"));

}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end
