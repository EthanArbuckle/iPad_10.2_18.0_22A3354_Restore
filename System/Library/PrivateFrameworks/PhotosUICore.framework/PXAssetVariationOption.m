@implementation PXAssetVariationOption

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqualToVariationOption:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToVariationOption:(id)a3
{
  id v4;
  int64_t v5;
  int v6;
  int v7;
  _BOOL4 v8;

  v4 = a3;
  v5 = -[PXAssetVariationOption variationType](self, "variationType");
  if (v5 == objc_msgSend(v4, "variationType")
    && (v6 = -[PXAssetVariationOption isRecommended](self, "isRecommended"),
        v6 == objc_msgSend(v4, "isRecommended")))
  {
    v8 = -[PXAssetVariationOption isCurrent](self, "isCurrent");
    v7 = v8 ^ objc_msgSend(v4, "isCurrent") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXAssetVariationOption;
  v3 = -[PXAssetVariationOption hash](&v7, sel_hash);
  v4 = -[PXAssetVariationOption variationType](self, "variationType");
  v5 = v4 ^ -[PXAssetVariationOption isRecommended](self, "isRecommended");
  return v5 ^ -[PXAssetVariationOption isCurrent](self, "isCurrent") ^ v3;
}

- (int64_t)variationType
{
  return self->_variationType;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isRecommended
{
  return self->_recommended;
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
}

+ (id)variationOptionWithType:(int64_t)a3 recommended:(BOOL)a4 current:(BOOL)a5
{
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v9 = objc_alloc_init((Class)a1);
  v9[2] = a3;
  objc_msgSend(a1, "_localizedNameForVariationType:", a3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v9[3];
  v9[3] = v10;

  *((_BYTE *)v9 + 8) = a4;
  *((_BYTE *)v9 + 9) = a5;
  return v9;
}

+ (id)_localizedNameForVariationType:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v8;

  v4 = CFSTR("PXAssetVariationTypeNone");
  switch(a3)
  {
    case -1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetVariationOption.m"), 76, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 0:
      goto LABEL_6;
    case 1:
      v4 = CFSTR("PXAssetVariationTypeAutoloop");
      goto LABEL_6;
    case 2:
      v4 = CFSTR("PXAssetVariationTypeMirror");
      goto LABEL_6;
    case 3:
      v4 = CFSTR("PXAssetVariationTypeLongExposure");
LABEL_6:
      PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

@end
