@implementation PKLiveRenderedShaderSet

- (PKLiveRenderedShaderSet)initWithDataAccessor:(id)a3 suffix:(id)a4
{
  id v6;
  id v7;
  PKLiveRenderedShaderSet *v8;
  __CFString *v9;
  __CFString *v10;
  PKBundleResourceDescriptor *v11;
  __CFString *v12;
  PKBundleResourceDescriptor *v13;
  __CFString *v14;
  __CFString *v15;
  PKBundleResourceDescriptor *v16;
  __CFString *v17;
  __CFString *v18;
  PKBundleResourceDescriptor *v19;
  void *v20;
  void *v21;
  PKBundleResourceDescriptor *v22;
  PKBundleResourceDescriptor *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *geometryEntryPointShader;
  void *v29;
  uint64_t v30;
  NSString *lightingModelEntryPointShader;
  void *v32;
  uint64_t v33;
  NSString *surfaceEntryPointShader;
  void *v35;
  uint64_t v36;
  NSString *fragmentEntryPointShader;
  __CFString *v39;
  __CFString *v40;
  void *context;
  id v42;
  void *v43;
  objc_super v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PKLiveRenderedShaderSet;
  v8 = -[PKLiveRenderedShaderSet init](&v44, sel_init);
  if (v8)
  {
    context = (void *)MEMORY[0x19400CFE8]();
    if (v7)
    {
      objc_msgSend(CFSTR("geometry"), "stringByAppendingString:", v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR("geometry");
    }
    v10 = v9;
    v11 = -[PKBundleResourceDescriptor initWithName:extension:]([PKBundleResourceDescriptor alloc], "initWithName:extension:", v9, CFSTR("metal"));
    if (v7)
    {
      objc_msgSend(CFSTR("lighting"), "stringByAppendingString:", v7);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("lighting");
    }
    v40 = v10;
    v39 = v12;
    v13 = -[PKBundleResourceDescriptor initWithName:extension:]([PKBundleResourceDescriptor alloc], "initWithName:extension:", v12, CFSTR("metal"));
    if (v7)
    {
      objc_msgSend(CFSTR("surface"), "stringByAppendingString:", v7);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("surface");
    }
    v15 = v14;
    v43 = v6;
    v16 = -[PKBundleResourceDescriptor initWithName:extension:]([PKBundleResourceDescriptor alloc], "initWithName:extension:", v14, CFSTR("metal"));
    v42 = v7;
    if (v7)
    {
      objc_msgSend(CFSTR("fragment"), "stringByAppendingString:", v7);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = CFSTR("fragment");
    }
    v18 = v17;
    v19 = -[PKBundleResourceDescriptor initWithName:extension:]([PKBundleResourceDescriptor alloc], "initWithName:extension:", v17, CFSTR("metal"));
    v20 = (void *)MEMORY[0x1E0C99E60];
    v45[0] = v11;
    v45[1] = v13;
    v45[2] = v16;
    v45[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = v13;
    v23 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dataForBundleResources:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(context);
    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v26, 1);
        geometryEntryPointShader = v8->_geometryEntryPointShader;
        v8->_geometryEntryPointShader = (NSString *)v27;
      }
      else
      {
        geometryEntryPointShader = v8->_geometryEntryPointShader;
        v8->_geometryEntryPointShader = 0;
      }

      objc_msgSend(v25, "objectForKeyedSubscript:", v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v29, 1);
        lightingModelEntryPointShader = v8->_lightingModelEntryPointShader;
        v8->_lightingModelEntryPointShader = (NSString *)v30;
      }
      else
      {
        lightingModelEntryPointShader = v8->_lightingModelEntryPointShader;
        v8->_lightingModelEntryPointShader = 0;
      }

      objc_msgSend(v25, "objectForKeyedSubscript:", v16);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v32, 1);
        surfaceEntryPointShader = v8->_surfaceEntryPointShader;
        v8->_surfaceEntryPointShader = (NSString *)v33;
      }
      else
      {
        surfaceEntryPointShader = v8->_surfaceEntryPointShader;
        v8->_surfaceEntryPointShader = 0;
      }

      objc_msgSend(v25, "objectForKeyedSubscript:", v19);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v35, 1);
        fragmentEntryPointShader = v8->_fragmentEntryPointShader;
        v8->_fragmentEntryPointShader = (NSString *)v36;
      }
      else
      {
        fragmentEntryPointShader = v8->_fragmentEntryPointShader;
        v8->_fragmentEntryPointShader = 0;
      }

    }
    v7 = v42;
    v6 = v43;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *geometryEntryPointShader;
  id v5;

  geometryEntryPointShader = self->_geometryEntryPointShader;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", geometryEntryPointShader, CFSTR("geometry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lightingModelEntryPointShader, CFSTR("lighting"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_surfaceEntryPointShader, CFSTR("surface"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fragmentEntryPointShader, CFSTR("fragment"));

}

- (PKLiveRenderedShaderSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKLiveRenderedShaderSet *v6;
  uint64_t v7;
  NSString *geometryEntryPointShader;
  uint64_t v9;
  NSString *lightingModelEntryPointShader;
  uint64_t v11;
  NSString *surfaceEntryPointShader;
  uint64_t v13;
  NSString *fragmentEntryPointShader;
  objc_super v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x19400CFE8]();
  v16.receiver = self;
  v16.super_class = (Class)PKLiveRenderedShaderSet;
  v6 = -[PKLiveRenderedShaderSet init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geometry"));
    v7 = objc_claimAutoreleasedReturnValue();
    geometryEntryPointShader = v6->_geometryEntryPointShader;
    v6->_geometryEntryPointShader = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lighting"));
    v9 = objc_claimAutoreleasedReturnValue();
    lightingModelEntryPointShader = v6->_lightingModelEntryPointShader;
    v6->_lightingModelEntryPointShader = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("surface"));
    v11 = objc_claimAutoreleasedReturnValue();
    surfaceEntryPointShader = v6->_surfaceEntryPointShader;
    v6->_surfaceEntryPointShader = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fragment"));
    v13 = objc_claimAutoreleasedReturnValue();
    fragmentEntryPointShader = v6->_fragmentEntryPointShader;
    v6->_fragmentEntryPointShader = (NSString *)v13;

  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (NSString)geometryEntryPointShader
{
  return self->_geometryEntryPointShader;
}

- (NSString)surfaceEntryPointShader
{
  return self->_surfaceEntryPointShader;
}

- (NSString)lightingModelEntryPointShader
{
  return self->_lightingModelEntryPointShader;
}

- (NSString)fragmentEntryPointShader
{
  return self->_fragmentEntryPointShader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentEntryPointShader, 0);
  objc_storeStrong((id *)&self->_lightingModelEntryPointShader, 0);
  objc_storeStrong((id *)&self->_surfaceEntryPointShader, 0);
  objc_storeStrong((id *)&self->_geometryEntryPointShader, 0);
}

@end
