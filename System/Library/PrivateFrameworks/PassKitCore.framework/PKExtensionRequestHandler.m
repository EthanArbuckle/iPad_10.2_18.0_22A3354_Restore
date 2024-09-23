@implementation PKExtensionRequestHandler

- (PKExtensionRequestHandler)init
{

  return 0;
}

- (id)_initWithExtension:(id)a3 extensionRequestOptions:(unint64_t)a4
{
  id v7;
  PKExtensionRequestHandler *v8;
  PKExtensionRequestHandler *v9;
  id *p_extension;
  NSExtension *extension;
  uint64_t v12;
  id v13;
  NSCopying *requestIdentifier;
  BOOL v15;
  uint64_t v16;
  NSExtensionContext *extensionContext;
  NSObject *v18;
  id v19;
  PKExtensionRequestHandler *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v23.receiver = self;
    v23.super_class = (Class)PKExtensionRequestHandler;
    v8 = -[PKExtensionRequestHandler init](&v23, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_lock._os_unfair_lock_opaque = 0;
      p_extension = (id *)&v8->_extension;
      objc_storeStrong((id *)&v8->_extension, a3);
      extension = v9->_extension;
      v22 = 0;
      -[NSExtension beginExtensionRequestWithOptions:inputItems:error:](extension, "beginExtensionRequestWithOptions:inputItems:error:", a4, 0, &v22);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v22;
      requestIdentifier = v9->_requestIdentifier;
      v9->_requestIdentifier = (NSCopying *)v12;

      if (v9->_requestIdentifier)
        v15 = v13 == 0;
      else
        v15 = 0;
      if (v15)
      {
        -[NSExtension _extensionContextForUUID:](v9->_extension, "_extensionContextForUUID:");
        v16 = objc_claimAutoreleasedReturnValue();
        extensionContext = v9->_extensionContext;
        v9->_extensionContext = (NSExtensionContext *)v16;

      }
      if (!v9->_extensionContext)
      {
        v9->_invalidated = 1;
        PKLogFacilityTypeGetObject(6uLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *p_extension;
          *(_DWORD *)buf = 138412546;
          v25 = v19;
          v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "PKExtensionRequestHandler: failed to begin extension request for extension %@, with error %@", buf, 0x16u);
        }

        if (v9->_requestIdentifier)
          objc_msgSend(*p_extension, "cancelExtensionRequestWithIdentifier:");
      }

    }
    self = v9;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[PKExtensionRequestHandler invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKExtensionRequestHandler;
  -[PKExtensionRequestHandler dealloc](&v3, sel_dealloc);
}

- (NSExtensionContext)extensionContext
{
  os_unfair_lock_s *p_lock;
  NSExtensionContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_extensionContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSExtensionContext *extensionContext;
  NSObject *v5;
  NSExtension *extension;
  NSCopying *requestIdentifier;
  int v8;
  NSExtension *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  extensionContext = self->_extensionContext;
  self->_extensionContext = 0;

  if (self->_requestIdentifier)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      extension = self->_extension;
      v8 = 138412290;
      v9 = extension;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Canceled extension request for extension %@", (uint8_t *)&v8, 0xCu);
    }

    -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:", self->_requestIdentifier);
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = 0;

  }
  self->_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  PKExtensionRequestHandler *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
