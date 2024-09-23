@implementation PRSPosterSnapshot

- (PRSPosterSnapshot)initWithCodableImage:(id)a3
{
  return -[PRSPosterSnapshot initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:](self, "initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:", a3, 0, 0, 0, -1, -1);
}

- (PRSPosterSnapshot)initWithCodableImage:(id)a3 imageOrientation:(int64_t)a4 switcherConfigurationPath:(id)a5 homeScreenConfigurationPath:(id)a6 variant:(int64_t)a7 configurationType:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PRSPosterSnapshot *v20;
  PRSPosterSnapshot *v21;
  void *v23;
  objc_super v24;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = v16;
  if (v18)
  {
    NSClassFromString(CFSTR("PFServerPosterPath"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterSnapshot initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:].cold.2();
LABEL_13:
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A499CD00);
    }
  }

  v19 = v17;
  if (v19)
  {
    NSClassFromString(CFSTR("PFServerPosterPath"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterSnapshot initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:].cold.1();
      goto LABEL_13;
    }
  }

  v24.receiver = self;
  v24.super_class = (Class)PRSPosterSnapshot;
  v20 = -[PRSPosterSnapshot init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_codableImage, a3);
    objc_storeStrong((id *)&v21->_switcherConfigurationPath, a5);
    objc_storeStrong((id *)&v21->_homeScreenConfigurationPath, a6);
    v21->_variant = a7;
    v21->_configurationType = a8;
    v21->_imageOrientation = a4;
  }

  return v21;
}

- (IOSurface)surface
{
  return (IOSurface *)-[PRSCodableImage surfaceCreatingIfNecessary:](self->_codableImage, "surfaceCreatingIfNecessary:", 1);
}

- (CGImage)image
{
  return -[PRSCodableImage CGImage](self->_codableImage, "CGImage");
}

- (PRSPosterSnapshot)initWithIOSurface:(id)a3
{
  return -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:](self, "initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:", a3, 0, 0, 0, -1, -1);
}

- (PRSPosterSnapshot)initWithIOSurface:(id)a3 imageOrientation:(int64_t)a4 switcherConfigurationPath:(id)a5 homeScreenConfigurationPath:(id)a6 variant:(int64_t)a7 configurationType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PRSCodableImage *v20;
  PRSCodableImage *v21;
  PRSPosterSnapshot *v22;
  PRSPosterSnapshot *v23;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = v14;
  if (v17)
  {
    NSClassFromString(CFSTR("IOSurface"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:IOSurfaceClass]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:].cold.4();
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A499CFDCLL);
    }
  }

  v18 = v15;
  if (v18)
  {
    NSClassFromString(CFSTR("PFServerPosterPath"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:].cold.3();
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A499D040);
    }
  }

  v19 = v16;
  if (v19)
  {
    NSClassFromString(CFSTR("PFServerPosterPath"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:].cold.2();
LABEL_22:
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A499CF78);
    }
  }

  v20 = -[PRSCodableImage initWithIOSurface:scale:error:]([PRSCodableImage alloc], "initWithIOSurface:scale:error:", v17, 0, 1.0);
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("codableImage"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:].cold.1();
    goto LABEL_22;
  }
  v21 = v20;
  v28.receiver = self;
  v28.super_class = (Class)PRSPosterSnapshot;
  v22 = -[PRSPosterSnapshot init](&v28, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_codableImage, v21);
    objc_storeStrong((id *)&v23->_switcherConfigurationPath, a5);
    objc_storeStrong((id *)&v23->_homeScreenConfigurationPath, a6);
    v23->_variant = a7;
    v23->_configurationType = a8;
    v23->_imageOrientation = a4;
  }

  return v23;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PRSCodableImage *codableImage;
  id v5;

  codableImage = self->_codableImage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codableImage, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_switcherConfigurationPath, CFSTR("_switcherConfigurationPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenConfigurationPath, CFSTR("_homeScreenConfigurationPath"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_variant, CFSTR("_variant"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_configurationType, CFSTR("_configurationType"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_imageOrientation, CFSTR("_imageOrientation"));

}

- (PRSPosterSnapshot)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PRSPosterSnapshot *v14;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("image"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("_switcherConfigurationPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("_homeScreenConfigurationPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_variant"));
  v12 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_configurationType"));
  v13 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_imageOrientation"));

  v14 = -[PRSPosterSnapshot initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:](self, "initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:", v6, v13, v8, v10, v11, v12);
  return v14;
}

- (PFServerPosterPath)switcherConfigurationPath
{
  return self->_switcherConfigurationPath;
}

- (PFServerPosterPath)homeScreenConfigurationPath
{
  return self->_homeScreenConfigurationPath;
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (PRSCodableImage)codableImage
{
  return self->_codableImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableImage, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigurationPath, 0);
  objc_storeStrong((id *)&self->_switcherConfigurationPath, 0);
}

- (void)initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
