@implementation TIInputModeLocaleIdentifierOverrideMapping

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TIInputModeLocaleIdentifierOverrideMapping_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __60__TIInputModeLocaleIdentifierOverrideMapping_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (unsigned)localeIdentifierHasOverride:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIInputModeLocaleIdentifierOverrideMapping overrideMapping](self, "overrideMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)overrideLocaleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIInputModeLocaleIdentifierOverrideMapping overrideMapping](self, "overrideMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)overrideMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__TIInputModeLocaleIdentifierOverrideMapping_overrideMapping__block_invoke;
  block[3] = &unk_1E243B440;
  block[4] = self;
  if (overrideMapping_onceToken != -1)
    dispatch_once(&overrideMapping_onceToken, block);
  return self->_overrideMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMapping, 0);
}

void __61__TIInputModeLocaleIdentifierOverrideMapping_overrideMapping__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = &unk_1E24B42D0;

}

@end
