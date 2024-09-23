@implementation SLDActiveCallViewSlotTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tagForMaxWidth:(double)a3 callActive:(BOOL)a4 activeCallGroupPhotoData:(id)a5 activeCallDisplayName:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  SLDActiveCallViewSlotTag *v11;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = -[SLDActiveCallViewSlotTag initWithMaxWidth:callActive:activeCallGroupPhotoData:activeCallDisplayName:]([SLDActiveCallViewSlotTag alloc], "initWithMaxWidth:callActive:activeCallGroupPhotoData:activeCallDisplayName:", v7, v10, v9, a3);

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLDActiveCallViewSlotTag maxWidthNumber](self, "maxWidthNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SLDActiveCallViewSlotTag isCallActive](self, "isCallActive");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SLDActiveCallViewSlotTag: %p> maxWidth:[%@], callActive: [%@]"), self, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SLDActiveCallViewSlotTag)initWithMaxWidth:(double)a3 callActive:(BOOL)a4 activeCallGroupPhotoData:(id)a5 activeCallDisplayName:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  SLDActiveCallViewSlotTag *v13;
  double v14;
  SLDActiveCallViewSlotTag *v15;
  uint64_t v16;
  NSNumber *maxWidthNumber;
  uint64_t v18;
  NSNumber *callActiveNumber;
  objc_super v21;

  v8 = a4;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SLDActiveCallViewSlotTag;
  v13 = -[SLDActiveCallViewSlotTag init](&v21, sel_init);
  v15 = v13;
  if (v13)
  {
    v13->_maxWidth = a3;
    *(float *)&v14 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    maxWidthNumber = v15->_maxWidthNumber;
    v15->_maxWidthNumber = (NSNumber *)v16;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v18 = objc_claimAutoreleasedReturnValue();
    callActiveNumber = v15->_callActiveNumber;
    v15->_callActiveNumber = (NSNumber *)v18;

    objc_storeStrong((id *)&v15->_activeCallGroupPhotoData, a5);
    objc_storeStrong((id *)&v15->_activeCallDisplayName, a6);
  }

  return v15;
}

- (BOOL)isCallActive
{
  void *v2;
  char v3;

  -[SLDActiveCallViewSlotTag callActiveNumber](self, "callActiveNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CGColorRef ConstantColor;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0DC5C60];
  v3 = a3;
  v4 = objc_msgSend(v3, "accessibilityButtonShapes");
  v5 = objc_msgSend(v3, "accessibilityContrast");
  v6 = objc_msgSend(v3, "displayScale");
  v7 = objc_msgSend(v3, "layoutDirection");
  objc_msgSend(v3, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "preferredContentSizeCategory");
  ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E8]);
  v11 = objc_msgSend(v3, "userInterfaceIdiom");
  v12 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(v15, "slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", v4, v5, 1, v6, v7, 0, v8, v9, ConstantColor, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SLDActiveCallViewSlotTag)initWithCoder:(id)a3
{
  id v4;
  SLDActiveCallViewSlotTag *v5;
  double v6;
  uint64_t v7;
  NSNumber *maxWidthNumber;
  uint64_t v9;
  NSNumber *callActiveNumber;
  uint64_t v11;
  NSData *activeCallGroupPhotoData;
  uint64_t v13;
  NSString *activeCallDisplayName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLDActiveCallViewSlotTag;
  v5 = -[SLDActiveCallViewSlotTag init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxWidth"));
    v5->_maxWidth = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxWidthNumber"));
    v7 = objc_claimAutoreleasedReturnValue();
    maxWidthNumber = v5->_maxWidthNumber;
    v5->_maxWidthNumber = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callActive"));
    v9 = objc_claimAutoreleasedReturnValue();
    callActiveNumber = v5->_callActiveNumber;
    v5->_callActiveNumber = (NSNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeCallGroupPhotoData"));
    v11 = objc_claimAutoreleasedReturnValue();
    activeCallGroupPhotoData = v5->_activeCallGroupPhotoData;
    v5->_activeCallGroupPhotoData = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeCallDisplayName"));
    v13 = objc_claimAutoreleasedReturnValue();
    activeCallDisplayName = v5->_activeCallDisplayName;
    v5->_activeCallDisplayName = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SLDActiveCallViewSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxWidth"));
  -[SLDActiveCallViewSlotTag maxWidthNumber](self, "maxWidthNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("maxWidthNumber"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SLDActiveCallViewSlotTag isCallActive](self, "isCallActive"), CFSTR("callActive"));
  -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](self, "activeCallGroupPhotoData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activeCallGroupPhotoData"));

  -[SLDActiveCallViewSlotTag activeCallDisplayName](self, "activeCallDisplayName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activeCallDisplayName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SLDActiveCallViewSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v4, "setMaxWidth:");
  -[SLDActiveCallViewSlotTag maxWidthNumber](self, "maxWidthNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxWidthNumber:", v5);

  -[SLDActiveCallViewSlotTag callActiveNumber](self, "callActiveNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallActiveNumber:", v6);

  -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](self, "activeCallGroupPhotoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveCallGroupPhotoData:", v7);

  -[SLDActiveCallViewSlotTag activeCallDisplayName](self, "activeCallDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveCallDisplayName:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  SLDActiveCallViewSlotTag *v6;
  SLDActiveCallViewSlotTag *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SLDActiveCallViewSlotTag *)v5;
    v7 = v6;
    if (v6 == self)
    {
      v19 = 1;
LABEL_40:

      goto LABEL_41;
    }
    -[SLDActiveCallViewSlotTag maxWidth](v6, "maxWidth");
    v9 = v8;
    -[SLDActiveCallViewSlotTag maxWidth](self, "maxWidth");
    if (!SL_CGFloatApproximatelyEqualToFloat(v9, v10))
      goto LABEL_39;
    -[SLDActiveCallViewSlotTag maxWidthNumber](self, "maxWidthNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[SLDActiveCallViewSlotTag maxWidthNumber](v7, "maxWidthNumber"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLDActiveCallViewSlotTag maxWidthNumber](self, "maxWidthNumber");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_35;
      v13 = (void *)v12;
      -[SLDActiveCallViewSlotTag maxWidthNumber](v7, "maxWidthNumber");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_34;
      v15 = (void *)v14;
      -[SLDActiveCallViewSlotTag maxWidthNumber](self, "maxWidthNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDActiveCallViewSlotTag maxWidthNumber](v7, "maxWidthNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

      if (v11)
      {

        if (!v18)
          goto LABEL_39;
      }
      else
      {

        if ((v18 & 1) == 0)
          goto LABEL_39;
      }
    }
    -[SLDActiveCallViewSlotTag callActiveNumber](self, "callActiveNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[SLDActiveCallViewSlotTag callActiveNumber](v7, "callActiveNumber"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLDActiveCallViewSlotTag callActiveNumber](self, "callActiveNumber");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_35;
      v13 = (void *)v20;
      -[SLDActiveCallViewSlotTag callActiveNumber](v7, "callActiveNumber");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_34;
      v22 = (void *)v21;
      -[SLDActiveCallViewSlotTag callActiveNumber](self, "callActiveNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDActiveCallViewSlotTag callActiveNumber](v7, "callActiveNumber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToNumber:", v24);

      if (v11)
      {

        if (!v25)
          goto LABEL_39;
      }
      else
      {

        if ((v25 & 1) == 0)
          goto LABEL_39;
      }
    }
    -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](self, "activeCallGroupPhotoData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](v7, "activeCallGroupPhotoData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_28:
        -[SLDActiveCallViewSlotTag activeCallDisplayName](self, "activeCallDisplayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          -[SLDActiveCallViewSlotTag activeCallDisplayName](v7, "activeCallDisplayName");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            v19 = 1;
LABEL_46:

            goto LABEL_37;
          }
        }
        -[SLDActiveCallViewSlotTag activeCallDisplayName](self, "activeCallDisplayName");
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (void *)v32;
          -[SLDActiveCallViewSlotTag activeCallDisplayName](v7, "activeCallDisplayName");
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v35 = (void *)v34;
            -[SLDActiveCallViewSlotTag activeCallDisplayName](self, "activeCallDisplayName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLDActiveCallViewSlotTag activeCallDisplayName](v7, "activeCallDisplayName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v36, "isEqualToString:", v37);

            if (!v11)
              goto LABEL_46;
LABEL_37:

            goto LABEL_40;
          }

        }
        v19 = 0;
        if (!v11)
          goto LABEL_46;
        goto LABEL_37;
      }
    }
    -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](self, "activeCallGroupPhotoData");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
LABEL_35:
      v19 = 0;
      if (!v11)
        v11 = v3;
      goto LABEL_37;
    }
    v13 = (void *)v26;
    -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](v7, "activeCallGroupPhotoData");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](self, "activeCallGroupPhotoData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](v7, "activeCallGroupPhotoData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqualToData:", v30);

      if (v11)
      {

        if (v31)
          goto LABEL_28;
      }
      else
      {

        if ((v31 & 1) != 0)
          goto LABEL_28;
      }
LABEL_39:
      v19 = 0;
      goto LABEL_40;
    }
LABEL_34:

    goto LABEL_35;
  }
  v19 = 0;
LABEL_41:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[SLDActiveCallViewSlotTag maxWidthNumber](self, "maxWidthNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLDActiveCallViewSlotTag callActiveNumber](self, "callActiveNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SLDActiveCallViewSlotTag activeCallGroupPhotoData](self, "activeCallGroupPhotoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SLDActiveCallViewSlotTag activeCallDisplayName](self, "activeCallDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (NSData)activeCallGroupPhotoData
{
  return self->_activeCallGroupPhotoData;
}

- (void)setActiveCallGroupPhotoData:(id)a3
{
  objc_storeStrong((id *)&self->_activeCallGroupPhotoData, a3);
}

- (NSString)activeCallDisplayName
{
  return self->_activeCallDisplayName;
}

- (void)setActiveCallDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_activeCallDisplayName, a3);
}

- (NSNumber)maxWidthNumber
{
  return self->_maxWidthNumber;
}

- (void)setMaxWidthNumber:(id)a3
{
  objc_storeStrong((id *)&self->_maxWidthNumber, a3);
}

- (NSNumber)callActiveNumber
{
  return self->_callActiveNumber;
}

- (void)setCallActiveNumber:(id)a3
{
  objc_storeStrong((id *)&self->_callActiveNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callActiveNumber, 0);
  objc_storeStrong((id *)&self->_maxWidthNumber, 0);
  objc_storeStrong((id *)&self->_activeCallDisplayName, 0);
  objc_storeStrong((id *)&self->_activeCallGroupPhotoData, 0);
}

@end
