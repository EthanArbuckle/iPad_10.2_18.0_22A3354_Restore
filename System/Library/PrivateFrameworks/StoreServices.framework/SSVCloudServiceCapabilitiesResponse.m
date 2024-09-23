@implementation SSVCloudServiceCapabilitiesResponse

- (id)_descriptionWithSubscriptionStatusDescriptorBlock:(id)a3
{
  void (**v4)(id, void *);
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@: %p"), v7, self);

  if (v4)
    v4[2](v4, v8);
  if (self->_supportsMusicCatalogPlayback)
    objc_msgSend(v8, "appendString:", CFSTR("; supportsMusicCatalogPlayback = YES"));
  if (self->_supportsAddToCloudMusicLibrary)
    objc_msgSend(v8, "appendString:", CFSTR("; supportsAddToCloudMusicLibrary = YES"));
  if (self->_canSubscribeToMusicCatalog)
    objc_msgSend(v8, "appendString:", CFSTR("; canSubscribeToMusicCatalog = YES"));
  objc_msgSend(v8, "appendString:", CFSTR(">"));

  return v8;
}

- (NSString)description
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SSVCloudServiceCapabilitiesResponse_description__block_invoke;
  v3[3] = &unk_1E47B9708;
  v3[4] = self;
  -[SSVCloudServiceCapabilitiesResponse _descriptionWithSubscriptionStatusDescriptorBlock:](self, "_descriptionWithSubscriptionStatusDescriptorBlock:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

void __50__SSVCloudServiceCapabilitiesResponse_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v7 = a2;
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("; subscriptionStatus = <%@: %p>"),
      v5,
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    v6 = (void *)v5;
  }
  else
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("; subscriptionStatus = %@"), 0);
    v6 = v7;
  }

}

- (NSString)debugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__SSVCloudServiceCapabilitiesResponse_debugDescription__block_invoke;
  v3[3] = &unk_1E47B9708;
  v3[4] = self;
  -[SSVCloudServiceCapabilitiesResponse _descriptionWithSubscriptionStatusDescriptorBlock:](self, "_descriptionWithSubscriptionStatusDescriptorBlock:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

void __55__SSVCloudServiceCapabilitiesResponse_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v2, "debugDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; subscriptionStatus = %@"), v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[SSVSubscriptionStatus copy](self->_subscriptionStatus, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_BYTE *)(v4 + 8) = self->_supportsMusicCatalogPlayback;
  *(_BYTE *)(v4 + 9) = self->_supportsAddToCloudMusicLibrary;
  *(_BYTE *)(v4 + 10) = self->_canSubscribeToMusicCatalog;
  return (id)v4;
}

- (SSVCloudServiceCapabilitiesResponse)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVCloudServiceCapabilitiesResponse *v6;
  SSVSubscriptionStatus *v8;
  void *v9;
  uint64_t v10;
  SSVSubscriptionStatus *subscriptionStatus;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVCloudServiceCapabilitiesResponse;
    v6 = -[SSVCloudServiceCapabilitiesResponse init](&v12, sel_init);
    if (v6)
    {
      v8 = [SSVSubscriptionStatus alloc];
      xpc_dictionary_get_dictionary(v5, "0");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSVSubscriptionStatus initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);
      subscriptionStatus = v6->_subscriptionStatus;
      v6->_subscriptionStatus = (SSVSubscriptionStatus *)v10;

      v6->_supportsMusicCatalogPlayback = xpc_dictionary_get_BOOL(v5, "1");
      v6->_supportsAddToCloudMusicLibrary = xpc_dictionary_get_BOOL(v5, "2");
      v6->_canSubscribeToMusicCatalog = xpc_dictionary_get_BOOL(v5, "3");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_subscriptionStatus);
  xpc_dictionary_set_BOOL(v3, "1", self->_supportsMusicCatalogPlayback);
  xpc_dictionary_set_BOOL(v3, "2", self->_supportsAddToCloudMusicLibrary);
  xpc_dictionary_set_BOOL(v3, "3", self->_canSubscribeToMusicCatalog);
  return v3;
}

- (SSVSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setSubscriptionStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)supportsMusicCatalogPlayback
{
  return self->_supportsMusicCatalogPlayback;
}

- (void)setSupportsMusicCatalogPlayback:(BOOL)a3
{
  self->_supportsMusicCatalogPlayback = a3;
}

- (BOOL)supportsAddToCloudMusicLibrary
{
  return self->_supportsAddToCloudMusicLibrary;
}

- (void)setSupportsAddToCloudMusicLibrary:(BOOL)a3
{
  self->_supportsAddToCloudMusicLibrary = a3;
}

- (BOOL)canSubscribeToMusicCatalog
{
  return self->_canSubscribeToMusicCatalog;
}

- (void)setCanSubscribeToMusicCatalog:(BOOL)a3
{
  self->_canSubscribeToMusicCatalog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
}

@end
