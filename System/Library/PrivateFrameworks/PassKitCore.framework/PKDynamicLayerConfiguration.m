@implementation PKDynamicLayerConfiguration

- (PKDynamicLayerConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKDynamicLayerConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKDynamicLayerEmitterConfiguration *v9;
  PKDynamicLayerEmitterConfiguration *backgroundParallaxEmitter;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  PKDynamicLayerEmitterConfiguration *v14;
  PKDynamicLayerEmitterConfiguration *neutralEmitter;
  uint64_t v16;
  void *v17;
  BOOL v18;
  PKDynamicLayerEmitterConfiguration *v19;
  PKDynamicLayerEmitterConfiguration *foregroundParallaxEmitter;
  uint64_t v21;
  void *v22;
  BOOL v23;
  PKDynamicLayerEmitterConfiguration *v24;
  PKDynamicLayerEmitterConfiguration *staticOverlayEmitter;
  PKDynamicLayerTransactionEffectConfiguration *v26;
  void *v27;
  uint64_t v28;
  PKDynamicLayerTransactionEffectConfiguration *transactionEffect;
  PKDynamicLayerCrossDissolveConfiguration *v30;
  void *v31;
  uint64_t v32;
  PKDynamicLayerCrossDissolveConfiguration *crossDissolve;
  PKDynamicLayerConfiguration *v34;
  NSObject *v35;
  uint8_t v37[16];
  objc_super v38;

  v4 = a3;
  if (v4)
  {
    v38.receiver = self;
    v38.super_class = (Class)PKDynamicLayerConfiguration;
    v5 = -[PKDynamicLayerConfiguration init](&v38, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "PKNumberForKey:", CFSTR("version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v5->_version = objc_msgSend(v6, "unsignedIntegerValue");
        v5->_parallaxEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("parallaxEnabled"));
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("backgroundParallaxEmitter"));
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = -[PKDynamicLayerEmitterConfiguration initWithDictionary:]([PKDynamicLayerEmitterConfiguration alloc], "initWithDictionary:", v8);
          backgroundParallaxEmitter = v5->_backgroundParallaxEmitter;
          v5->_backgroundParallaxEmitter = v9;

        }
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("neutralEmitter"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v8)
          v13 = 1;
        else
          v13 = v11 == 0;
        if (!v13)
        {
          v14 = -[PKDynamicLayerEmitterConfiguration initWithDictionary:]([PKDynamicLayerEmitterConfiguration alloc], "initWithDictionary:", v11);
          neutralEmitter = v5->_neutralEmitter;
          v5->_neutralEmitter = v14;

        }
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("foregroundParallaxEmitter"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v8 | v12)
          v18 = 1;
        else
          v18 = v16 == 0;
        if (!v18)
        {
          v19 = -[PKDynamicLayerEmitterConfiguration initWithDictionary:]([PKDynamicLayerEmitterConfiguration alloc], "initWithDictionary:", v16);
          foregroundParallaxEmitter = v5->_foregroundParallaxEmitter;
          v5->_foregroundParallaxEmitter = v19;

        }
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("staticOverlayEmitter"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v17)
          v23 = 1;
        else
          v23 = (v8 | v12) != 0;
        if (!v23 && v21)
        {
          v24 = -[PKDynamicLayerEmitterConfiguration initWithDictionary:]([PKDynamicLayerEmitterConfiguration alloc], "initWithDictionary:", v21);
          staticOverlayEmitter = v5->_staticOverlayEmitter;
          v5->_staticOverlayEmitter = v24;

        }
        v26 = [PKDynamicLayerTransactionEffectConfiguration alloc];
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("transactionEffect"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[PKDynamicLayerTransactionEffectConfiguration initWithDictionary:](v26, "initWithDictionary:", v27);
        transactionEffect = v5->_transactionEffect;
        v5->_transactionEffect = (PKDynamicLayerTransactionEffectConfiguration *)v28;

        v30 = [PKDynamicLayerCrossDissolveConfiguration alloc];
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("crossDissolve"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[PKDynamicLayerCrossDissolveConfiguration initWithDictionary:](v30, "initWithDictionary:", v31);
        crossDissolve = v5->_crossDissolve;
        v5->_crossDissolve = (PKDynamicLayerCrossDissolveConfiguration *)v32;

      }
      else
      {
        PKLogFacilityTypeGetObject(0);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_18FC92000, v35, OS_LOG_TYPE_DEFAULT, "No dynamic layer version included, default to unsupported", v37, 2u);
        }

        v5->_version = 0;
      }

    }
    self = v5;
    v34 = self;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (BOOL)isSupported
{
  return self->_version - 1 < 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKDynamicLayerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDynamicLayerConfiguration;
  v5 = -[PKDynamicLayerConfiguration init](&v13, sel_init);
  if (v5)
  {
    -[PKDynamicLayerConfiguration setVersion:](v5, "setVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")));
    -[PKDynamicLayerConfiguration setParallaxEnabled:](v5, "setParallaxEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parallaxEnabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundParallaxEmitter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicLayerConfiguration setBackgroundParallaxEmitter:](v5, "setBackgroundParallaxEmitter:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("neutralEmitter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicLayerConfiguration setNeutralEmitter:](v5, "setNeutralEmitter:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundParallaxEmitter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicLayerConfiguration setForegroundParallaxEmitter:](v5, "setForegroundParallaxEmitter:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staticOverlayEmitter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicLayerConfiguration setStaticOverlayEmitter:](v5, "setStaticOverlayEmitter:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionEffect"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicLayerConfiguration setTransactionEffect:](v5, "setTransactionEffect:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crossDissolve"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicLayerConfiguration setCrossDissolve:](v5, "setCrossDissolve:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_parallaxEnabled, CFSTR("parallaxEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundParallaxEmitter, CFSTR("backgroundParallaxEmitter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_neutralEmitter, CFSTR("neutralEmitter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_foregroundParallaxEmitter, CFSTR("foregroundParallaxEmitter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_staticOverlayEmitter, CFSTR("staticOverlayEmitter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionEffect, CFSTR("transactionEffect"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_crossDissolve, CFSTR("crossDissolve"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDynamicLayerConfiguration *v5;
  PKDynamicLayerEmitterConfiguration *v6;
  PKDynamicLayerEmitterConfiguration *backgroundParallaxEmitter;
  PKDynamicLayerEmitterConfiguration *v8;
  PKDynamicLayerEmitterConfiguration *neutralEmitter;
  PKDynamicLayerEmitterConfiguration *v10;
  PKDynamicLayerEmitterConfiguration *foregroundParallaxEmitter;
  PKDynamicLayerEmitterConfiguration *v12;
  PKDynamicLayerEmitterConfiguration *staticOverlayEmitter;
  PKDynamicLayerTransactionEffectConfiguration *v14;
  PKDynamicLayerTransactionEffectConfiguration *transactionEffect;
  PKDynamicLayerCrossDissolveConfiguration *v16;
  PKDynamicLayerCrossDissolveConfiguration *crossDissolve;

  v5 = -[PKDynamicLayerConfiguration init](+[PKDynamicLayerConfiguration allocWithZone:](PKDynamicLayerConfiguration, "allocWithZone:"), "init");
  v5->_version = self->_version;
  v5->_parallaxEnabled = self->_parallaxEnabled;
  v6 = -[PKDynamicLayerEmitterConfiguration copyWithZone:](self->_backgroundParallaxEmitter, "copyWithZone:", a3);
  backgroundParallaxEmitter = v5->_backgroundParallaxEmitter;
  v5->_backgroundParallaxEmitter = v6;

  v8 = -[PKDynamicLayerEmitterConfiguration copyWithZone:](self->_neutralEmitter, "copyWithZone:", a3);
  neutralEmitter = v5->_neutralEmitter;
  v5->_neutralEmitter = v8;

  v10 = -[PKDynamicLayerEmitterConfiguration copyWithZone:](self->_foregroundParallaxEmitter, "copyWithZone:", a3);
  foregroundParallaxEmitter = v5->_foregroundParallaxEmitter;
  v5->_foregroundParallaxEmitter = v10;

  v12 = -[PKDynamicLayerEmitterConfiguration copyWithZone:](self->_staticOverlayEmitter, "copyWithZone:", a3);
  staticOverlayEmitter = v5->_staticOverlayEmitter;
  v5->_staticOverlayEmitter = v12;

  v14 = -[PKDynamicLayerTransactionEffectConfiguration copyWithZone:](self->_transactionEffect, "copyWithZone:", a3);
  transactionEffect = v5->_transactionEffect;
  v5->_transactionEffect = v14;

  v16 = -[PKDynamicLayerCrossDissolveConfiguration copyWithZone:](self->_crossDissolve, "copyWithZone:", a3);
  crossDissolve = v5->_crossDissolve;
  v5->_crossDissolve = v16;

  return v5;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (PKDynamicLayerEmitterConfiguration)backgroundParallaxEmitter
{
  return self->_backgroundParallaxEmitter;
}

- (void)setBackgroundParallaxEmitter:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundParallaxEmitter, a3);
}

- (PKDynamicLayerEmitterConfiguration)neutralEmitter
{
  return self->_neutralEmitter;
}

- (void)setNeutralEmitter:(id)a3
{
  objc_storeStrong((id *)&self->_neutralEmitter, a3);
}

- (PKDynamicLayerEmitterConfiguration)foregroundParallaxEmitter
{
  return self->_foregroundParallaxEmitter;
}

- (void)setForegroundParallaxEmitter:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundParallaxEmitter, a3);
}

- (PKDynamicLayerEmitterConfiguration)staticOverlayEmitter
{
  return self->_staticOverlayEmitter;
}

- (void)setStaticOverlayEmitter:(id)a3
{
  objc_storeStrong((id *)&self->_staticOverlayEmitter, a3);
}

- (PKDynamicLayerTransactionEffectConfiguration)transactionEffect
{
  return self->_transactionEffect;
}

- (void)setTransactionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_transactionEffect, a3);
}

- (PKDynamicLayerCrossDissolveConfiguration)crossDissolve
{
  return self->_crossDissolve;
}

- (void)setCrossDissolve:(id)a3
{
  objc_storeStrong((id *)&self->_crossDissolve, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossDissolve, 0);
  objc_storeStrong((id *)&self->_transactionEffect, 0);
  objc_storeStrong((id *)&self->_staticOverlayEmitter, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxEmitter, 0);
  objc_storeStrong((id *)&self->_neutralEmitter, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxEmitter, 0);
}

@end
