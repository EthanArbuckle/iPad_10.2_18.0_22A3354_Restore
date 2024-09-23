@implementation SFDynamicURLImageResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPixelWidth:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pixelWidth = a3;
}

- (BOOL)hasPixelWidth
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPixelHeight:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pixelHeight = a3;
}

- (BOOL)hasPixelHeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSupportsResizing:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportsResizing = a3;
}

- (BOOL)hasSupportsResizing
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFDynamicURLImageResource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDynamicURLImageResource *v6;
  SFDynamicURLImageResource *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBDynamicURLImageResource initWithData:]([_SFPBDynamicURLImageResource alloc], "initWithData:", v5);
  v7 = -[SFDynamicURLImageResource initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBDynamicURLImageResource *v6;

  v4 = a3;
  v6 = -[_SFPBDynamicURLImageResource initWithFacade:]([_SFPBDynamicURLImageResource alloc], "initWithFacade:", self);
  -[_SFPBDynamicURLImageResource data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBDynamicURLImageResource *v2;
  void *v3;

  v2 = -[_SFPBDynamicURLImageResource initWithFacade:]([_SFPBDynamicURLImageResource alloc], "initWithFacade:", self);
  -[_SFPBDynamicURLImageResource dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBDynamicURLImageResource *v2;
  void *v3;

  v2 = -[_SFPBDynamicURLImageResource initWithFacade:]([_SFPBDynamicURLImageResource alloc], "initWithFacade:", self);
  -[_SFPBDynamicURLImageResource jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFDynamicURLImageResource pixelWidth](self, "pixelWidth");
  objc_msgSend(v4, "setPixelWidth:");
  -[SFDynamicURLImageResource pixelHeight](self, "pixelHeight");
  objc_msgSend(v4, "setPixelHeight:");
  -[SFDynamicURLImageResource formatURL](self, "formatURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setFormatURL:", v6);

  objc_msgSend(v4, "setSupportsResizing:", -[SFDynamicURLImageResource supportsResizing](self, "supportsResizing"));
  -[SFDynamicURLImageResource imageOptions](self, "imageOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setImageOptions:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFDynamicURLImageResource *v5;
  SFDynamicURLImageResource *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;

  v5 = (SFDynamicURLImageResource *)a3;
  if (self == v5)
  {
    v17 = 1;
  }
  else
  {
    if (-[SFDynamicURLImageResource isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFDynamicURLImageResource pixelWidth](self, "pixelWidth");
      v8 = v7;
      -[SFDynamicURLImageResource pixelWidth](v6, "pixelWidth");
      if (vabdd_f64(v8, v9) >= 2.22044605e-16
        || (-[SFDynamicURLImageResource pixelHeight](self, "pixelHeight"),
            v11 = v10,
            -[SFDynamicURLImageResource pixelHeight](v6, "pixelHeight"),
            vabdd_f64(v11, v12) >= 2.22044605e-16))
      {
        v17 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[SFDynamicURLImageResource formatURL](self, "formatURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDynamicURLImageResource formatURL](v6, "formatURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 == 0) == (v14 != 0))
      {
        v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[SFDynamicURLImageResource formatURL](self, "formatURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[SFDynamicURLImageResource formatURL](self, "formatURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDynamicURLImageResource formatURL](v6, "formatURL");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "isEqual:", v3))
        {
          v17 = 0;
          goto LABEL_21;
        }
        v27 = v16;
      }
      v18 = -[SFDynamicURLImageResource supportsResizing](self, "supportsResizing");
      if (v18 == -[SFDynamicURLImageResource supportsResizing](v6, "supportsResizing"))
      {
        -[SFDynamicURLImageResource imageOptions](self, "imageOptions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDynamicURLImageResource imageOptions](v6, "imageOptions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if ((v19 == 0) != (v20 != 0))
        {
          -[SFDynamicURLImageResource imageOptions](self, "imageOptions");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            -[SFDynamicURLImageResource imageOptions](self, "imageOptions");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFDynamicURLImageResource imageOptions](v6, "imageOptions");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v26, "isEqual:", v25);

          }
          else
          {

            v17 = 1;
          }
LABEL_20:
          v16 = v27;
          if (!v15)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_21:

          goto LABEL_22;
        }

      }
      v17 = 0;
      goto LABEL_20;
    }
    v17 = 0;
  }
LABEL_25:

  return v17;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  long double v5;
  unint64_t v6;
  double v7;
  double v8;
  long double v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  -[SFDynamicURLImageResource pixelWidth](self, "pixelWidth");
  v4 = -v3;
  if (v3 >= 0.0)
    v4 = v3;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  -[SFDynamicURLImageResource pixelHeight](self, "pixelHeight");
  v8 = -v7;
  if (v7 >= 0.0)
    v8 = v7;
  v9 = round(v8);
  v10 = (unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL);
  -[SFDynamicURLImageResource formatURL](self, "formatURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = -[SFDynamicURLImageResource supportsResizing](self, "supportsResizing");
  -[SFDynamicURLImageResource imageOptions](self, "imageOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12 ^ v13 ^ v6 ^ v10 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (double)pixelWidth
{
  return self->_pixelWidth;
}

- (double)pixelHeight
{
  return self->_pixelHeight;
}

- (NSString)formatURL
{
  return self->_formatURL;
}

- (void)setFormatURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)supportsResizing
{
  return self->_supportsResizing;
}

- (NSArray)imageOptions
{
  return self->_imageOptions;
}

- (void)setImageOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_formatURL, 0);
}

- (id)sf_urlForSettings:(id)a3
{
  return -[SFDynamicURLImageResource _sf_urlForSettings:shouldResize:width:height:](self, "_sf_urlForSettings:shouldResize:width:height:", a3, 0, 0.0, 0.0);
}

- (id)sf_urlForSettings:(id)a3 size:(CGSize)a4
{
  return -[SFDynamicURLImageResource _sf_urlForSettings:shouldResize:width:height:](self, "_sf_urlForSettings:shouldResize:width:height:", a3, 1, a4.width, a4.height);
}

- (id)_sf_urlForSettings:(id)a3 shouldResize:(BOOL)a4 width:(double)a5 height:(double)a6
{
  _BOOL4 v8;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  SFDynamicURLImageResource *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;

  v8 = a4;
  v10 = a3;
  if (v8 && -[SFDynamicURLImageResource supportsResizing](self, "supportsResizing"))
  {
    v11 = round(a5);
    v12 = round(a6);
  }
  else
  {
    -[SFDynamicURLImageResource pixelWidth](self, "pixelWidth");
    v11 = v13;
    -[SFDynamicURLImageResource pixelHeight](self, "pixelHeight");
    v12 = v14;
  }
  -[SFDynamicURLImageResource formatURL](self, "formatURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\{[^}]+\\}"), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDynamicURLImageResource formatURL](self, "formatURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    -[SFDynamicURLImageResource formatURL](self, "formatURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "matchesInString:options:range:", v20, 0, 0, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __87__SFDynamicURLImageResource_SiriSupport___sf_urlForSettings_shouldResize_width_height___block_invoke;
    v28 = &unk_1E40416A8;
    v29 = v20;
    v33 = (uint64_t)v11;
    v34 = (uint64_t)v12;
    v30 = v16;
    v31 = self;
    v32 = v10;
    v22 = v20;
    objc_msgSend(v21, "enumerateObjectsWithOptions:usingBlock:", 2, &v25);

  }
  if (objc_msgSend(v16, "length", v25, v26, v27, v28))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_sf_replacementStringForPropertyEntryKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[SFDynamicURLImageResource imageOptions](self, "imageOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__SFDynamicURLImageResource_SiriSupport___sf_replacementStringForPropertyEntryKey_value___block_invoke;
  v13[3] = &unk_1E40416D0;
  v9 = v6;
  v14 = v9;
  v16 = &v17;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __89__SFDynamicURLImageResource_SiriSupport___sf_replacementStringForPropertyEntryKey_value___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", a1[4]);

  if (v7)
  {
    v8 = a1[5];
    if (v8)
    {
      objc_msgSend(v10, "options");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", a1[5]);
    }
    else
    {
      objc_msgSend(v10, "defaultValue");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v9);
    if (v8)
    {

      v9 = v6;
    }

    *a4 = 1;
  }

}

void __87__SFDynamicURLImageResource_SiriSupport___sf_urlForSettings_shouldResize_width_height___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "range") + 1;
  objc_msgSend(v3, "range");
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v5 - 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("w")))
  {
    v7 = *(void **)(a1 + 40);
    v8 = objc_msgSend(v3, "range");
    v10 = v9;
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = *(_QWORD *)(a1 + 64);
LABEL_5:
    objc_msgSend(v12, "numberWithInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replaceCharactersInRange:withString:", v8, v10, v16);

    goto LABEL_15;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("h")))
  {
    v7 = *(void **)(a1 + 40);
    v8 = objc_msgSend(v3, "range");
    v10 = v14;
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = *(_QWORD *)(a1 + 72);
    goto LABEL_5;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("color-profile")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("f")))
  {
    v17 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_sf_replacementStringForPropertyEntryKey:value:", v6, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = *(void **)(a1 + 40);
      v21 = objc_msgSend(v3, "range");
      objc_msgSend(v20, "replaceCharactersInRange:withString:", v21, v22, v19);
    }
    else
    {
      if (PARLogHandleForCategory_onceToken != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken, &__block_literal_global);
      v23 = (void *)PARLogHandleForCategory_logHandles_1;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1, OS_LOG_TYPE_ERROR))
      {
        v24 = *(void **)(a1 + 56);
        v25 = v23;
        objc_msgSend(v24, "objectForKeyedSubscript:", v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v29 = v6;
        v30 = 2112;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        _os_log_error_impl(&dword_19E535000, v25, OS_LOG_TYPE_ERROR, "Could not find formatReplacement for key: %@, value: %@, in image resource: %@", buf, 0x20u);

      }
    }

  }
LABEL_15:

}

- (SFDynamicURLImageResource)initWithProtobuf:(id)a3
{
  id v4;
  SFDynamicURLImageResource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  SFImageOption *v19;
  SFDynamicURLImageResource *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFDynamicURLImageResource;
  v5 = -[SFDynamicURLImageResource init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pixelWidth");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "pixelWidth");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      -[SFDynamicURLImageResource setPixelWidth:](v5, "setPixelWidth:");

    }
    objc_msgSend(v4, "pixelHeight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "pixelHeight");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[SFDynamicURLImageResource setPixelHeight:](v5, "setPixelHeight:");

    }
    objc_msgSend(v4, "formatURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "formatURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDynamicURLImageResource setFormatURL:](v5, "setFormatURL:", v11);

    }
    if (objc_msgSend(v4, "supportsResizing"))
      -[SFDynamicURLImageResource setSupportsResizing:](v5, "setSupportsResizing:", objc_msgSend(v4, "supportsResizing"));
    objc_msgSend(v4, "imageOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "imageOptions", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = -[SFImageOption initWithProtobuf:]([SFImageOption alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v16);
    }

    -[SFDynamicURLImageResource setImageOptions:](v5, "setImageOptions:", v13);
    v20 = v5;

  }
  return v5;
}

@end
