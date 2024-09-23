@implementation TILexicon

- (id)copyWithZone:(_NSZone *)a3
{
  TILexicon *v4;
  uint64_t v5;
  NSArray *entries;

  v4 = objc_alloc_init(TILexicon);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_entries, 1);
  entries = v4->_entries;
  v4->_entries = (NSArray *)v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TILexicon entries](self, "entries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[TILexicon entries](self, "entries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (TILexicon)initWithCoder:(id)a3
{
  id v4;
  TILexicon *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *entries;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TILexicon;
  v5 = -[TILexicon init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("entries"));
    v9 = objc_claimAutoreleasedReturnValue();
    entries = v5->_entries;
    v5->_entries = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *entries;

  entries = self->_entries;
  if (entries)
    objc_msgSend(a3, "encodeObject:forKey:", entries, CFSTR("entries"));
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)lexiconWithEntries:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (void)requestLexiconFromBundlePath:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      if (requestLexiconFromBundlePath_completionHandler__onceToken != -1)
        dispatch_once(&requestLexiconFromBundlePath_completionHandler__onceToken, &__block_literal_global_859);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.lexicon-server"), 4096);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A760);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v9);

      objc_msgSend(v8, "_setQueue:", requestLexiconFromBundlePath_completionHandler____xpc_queue);
      objc_msgSend(v8, "resume");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__TILexicon_requestLexiconFromBundlePath_completionHandler___block_invoke_2;
      v13[3] = &unk_1E243A720;
      v10 = v7;
      v14 = v10;
      objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "requestLexiconFromBundlePath:completionHandler:", v5, v10);
      else
        (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

uint64_t __60__TILexicon_requestLexiconFromBundlePath_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("UIInputViewController sent a lexicon request to the lexicon server but received error %@"), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__TILexicon_requestLexiconFromBundlePath_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.lexicon-request", v2);
  v1 = (void *)requestLexiconFromBundlePath_completionHandler____xpc_queue;
  requestLexiconFromBundlePath_completionHandler____xpc_queue = (uint64_t)v0;

}

@end
