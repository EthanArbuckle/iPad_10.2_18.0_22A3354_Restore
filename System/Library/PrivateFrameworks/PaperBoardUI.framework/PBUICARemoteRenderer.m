@implementation PBUICARemoteRenderer

+ (NSSet)secureCodableRequestClasses
{
  if (secureCodableRequestClasses_onceToken != -1)
    dispatch_once(&secureCodableRequestClasses_onceToken, &__block_literal_global_19);
  return (NSSet *)(id)secureCodableRequestClasses_result;
}

void __51__PBUICARemoteRenderer_secureCodableRequestClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)secureCodableRequestClasses_result;
  secureCodableRequestClasses_result = v2;

}

- (PBUICARemoteRenderer)init
{
  void *v3;
  PBUICARemoteRenderer *v4;

  +[PBUIRemoteRendererXPCConnection defaultConnection](PBUIRemoteRendererXPCConnection, "defaultConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PBUICARemoteRenderer initWithUnderlyingConnection:](self, "initWithUnderlyingConnection:", v3);

  return v4;
}

- (PBUICARemoteRenderer)initWithUnderlyingConnection:(id)a3
{
  id v5;
  PBUICARemoteRenderer *v6;
  PBUICARemoteRenderer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUICARemoteRenderer;
  v6 = -[PBUICARemoteRenderer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingConnection, a3);
    v7->_colorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PBUICARemoteRenderer;
  -[PBUICARemoteRenderer dealloc](&v3, sel_dealloc);
}

+ (PBUIRenderer)remoteRendererIfPossible
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PBUICARemoteRenderer_remoteRendererIfPossible__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (remoteRendererIfPossible_onceToken != -1)
    dispatch_once(&remoteRendererIfPossible_onceToken, block);
  return (PBUIRenderer *)(id)remoteRendererIfPossible___renderer;
}

void __48__PBUICARemoteRenderer_remoteRendererIfPossible__block_invoke(uint64_t a1)
{
  PBUICARemoteRenderer *v1;
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldUseXPCServiceForRendering"))
    v1 = objc_alloc_init(PBUICARemoteRenderer);
  else
    v1 = -[PBUICALocalRenderer initWithColorSpace:]([PBUICALocalRenderer alloc], "initWithColorSpace:", 0);
  v2 = (void *)remoteRendererIfPossible___renderer;
  remoteRendererIfPossible___renderer = (uint64_t)v1;

}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (BOOL)supportsRequest:(id)a3 orError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) != 0)
  {
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v11[0] = *MEMORY[0x1E0CB2D60];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request cannot be rendered remotely."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v11[1] = *MEMORY[0x1E0CB2D68];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.PBUIRenderer"), 1, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)renderRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;

  v6 = a3;
  v31 = 0;
  v7 = -[PBUICARemoteRenderer supportsRequest:orError:](self, "supportsRequest:orError:", v6, &v31);
  v8 = v31;
  v9 = v8;
  if (v7)
  {
    v10 = v6;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__6;
    v29 = __Block_byref_object_dispose__6;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__6;
    v23 = __Block_byref_object_dispose__6;
    v24 = 0;
    -[PBUICARemoteRenderer underlyingConnection](self, "underlyingConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __44__PBUICARemoteRenderer_renderRequest_error___block_invoke;
    v18[3] = &unk_1E6B96818;
    v18[4] = &v19;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __44__PBUICARemoteRenderer_renderRequest_error___block_invoke_2;
      v17[3] = &unk_1E6B96840;
      v17[4] = &v19;
      v17[5] = &v25;
      objc_msgSend(v13, "renderRequest:reply:", v10, v17);
      if (a4)
      {
        v14 = (void *)v20[5];
        if (v14)
          *a4 = objc_retainAutorelease(v14);
      }
      v15 = (id)v26[5];
    }
    else
    {
      v15 = 0;
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v15;
}

void __44__PBUICARemoteRenderer_renderRequest_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __44__PBUICARemoteRenderer_renderRequest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)renderRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v8 = -[PBUICARemoteRenderer supportsRequest:orError:](self, "supportsRequest:orError:", v6, &v19);
  v9 = v19;
  if (v8)
  {
    v10 = v6;
    -[PBUICARemoteRenderer underlyingConnection](self, "underlyingConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke;
    v17[3] = &unk_1E6B96868;
    v13 = v7;
    v18 = v13;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke_2;
      v15[3] = &unk_1E6B96890;
      v16 = v13;
      objc_msgSend(v14, "renderRequest:reply:", v10, v15);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
  }

}

uint64_t __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__PBUICARemoteRenderer_renderRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)shouldUseXPCServiceForRendering
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFrontBoard");

  return v3;
}

- (PBUIRemoteRendererConnection)underlyingConnection
{
  return self->_underlyingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingConnection, 0);
}

@end
