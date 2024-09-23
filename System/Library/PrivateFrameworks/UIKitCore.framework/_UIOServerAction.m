@implementation _UIOServerAction

- (_UIOServerAction)initWithOriginContext:(id)a3 info:(id)a4 responder:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _UIOServerAction *v16;
  _UIOServerAction *v17;
  void *v19;
  objc_super v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      v11 = (id)objc_msgSend(v9, "mutableCopy");
      goto LABEL_6;
    }
  }
  else
  {
    +[_UIOServerActionOriginContext defaultOriginContext](_UIOServerActionOriginContext, "defaultOriginContext");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_3;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0D017D0]);
LABEL_6:
  v12 = v11;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (v14)
  {
    UIOLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_error_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Error encoding origin context data: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v12, "setObject:forSetting:", v13, 512);
  }
  v20.receiver = self;
  v20.super_class = (Class)_UIOServerAction;
  v16 = -[_UIOServerAction initWithInfo:responder:](&v20, sel_initWithInfo_responder_, v12, v10);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_originContext, v8);

  return v17;
}

- (_UIOServerActionOriginContext)originContext
{
  _UIOServerActionOriginContext *originContext;
  void *v4;
  void *v5;
  _UIOServerActionOriginContext *v6;
  id v7;
  _UIOServerActionOriginContext *v8;
  NSObject *v9;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  originContext = self->_originContext;
  if (!originContext)
  {
    -[_UIOServerAction info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 512);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v12);
    v6 = (_UIOServerActionOriginContext *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    v8 = self->_originContext;
    self->_originContext = v6;

    if (v7)
    {
      UIOLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_error_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Error decoding origin context data: %@", buf, 0xCu);

      }
    }

    originContext = self->_originContext;
  }
  return originContext;
}

- (void)performActionFromConnection:(id)a3
{
  objc_class *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOServerAction.m"), 62, CFSTR("_UIOServerAction subclass <%@: %p> did not override -performActionFromConnection:"), v6, self);

}

- (BOOL)isPermitted
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originContext, 0);
}

@end
