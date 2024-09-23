@implementation VIImageRegionDomainInfo

- (VIImageRegionDomainInfo)initWithDomainKey:(id)a3 labelName:(id)a4 glyphName:(id)a5 displayLabel:(id)a6 displayMessage:(id)a7 hasFocalPoint:(BOOL)a8 focalPoint:(CGPoint)a9 isCornerGlyph:(BOOL)a10 ocrResultsRequired:(BOOL)a11 barcodeResultsRequired:(BOOL)a12 isLowConfidence:(BOOL)a13 shouldShowDynamicGlyph:(BOOL)a14
{
  CGFloat y;
  CGFloat x;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  VIImageRegionDomainInfo *v27;
  uint64_t v28;
  NSString *domainKey;
  uint64_t v30;
  NSString *labelName;
  uint64_t v32;
  NSString *glyphName;
  uint64_t v34;
  NSString *displayLabel;
  uint64_t v36;
  NSString *displayMessage;
  objc_super v39;

  y = a9.y;
  x = a9.x;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v39.receiver = self;
  v39.super_class = (Class)VIImageRegionDomainInfo;
  v27 = -[VIImageRegionDomainInfo init](&v39, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v22, "copy");
    domainKey = v27->_domainKey;
    v27->_domainKey = (NSString *)v28;

    v30 = objc_msgSend(v23, "copy");
    labelName = v27->_labelName;
    v27->_labelName = (NSString *)v30;

    v32 = objc_msgSend(v24, "copy");
    glyphName = v27->_glyphName;
    v27->_glyphName = (NSString *)v32;

    v34 = objc_msgSend(v25, "copy");
    displayLabel = v27->_displayLabel;
    v27->_displayLabel = (NSString *)v34;

    v36 = objc_msgSend(v26, "copy");
    displayMessage = v27->_displayMessage;
    v27->_displayMessage = (NSString *)v36;

    v27->_hasFocalPoint = a8;
    v27->_focalPoint.x = x;
    v27->_focalPoint.y = y;
    v27->_isCornerGlyph = a10;
    v27->_ocrResultsRequired = a11;
    v27->_barcodeResultsRequired = a12;
    v27->_isLowConfidence = a13;
    v27->_shouldShowDynamicGlyph = a14;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  VIImageRegionDomainInfo *v4;
  VIImageRegionDomainInfo *v5;
  VIImageRegionDomainInfo *v6;
  NSString *domainKey;
  void *v8;
  NSString *labelName;
  void *v10;
  NSString *glyphName;
  void *v12;
  NSString *displayLabel;
  void *v14;
  NSString *displayMessage;
  void *v16;
  _BOOL4 hasFocalPoint;
  double v18;
  BOOL v19;
  double v20;
  _BOOL4 isCornerGlyph;
  _BOOL4 ocrResultsRequired;
  _BOOL4 barcodeResultsRequired;
  _BOOL4 isLowConfidence;
  _BOOL4 shouldShowDynamicGlyph;

  v4 = (VIImageRegionDomainInfo *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    domainKey = self->_domainKey;
    -[VIImageRegionDomainInfo domainKey](v6, "domainKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!VIObjectIsEqual((unint64_t)domainKey, (uint64_t)v8))
    {
      v19 = 0;
LABEL_28:

      goto LABEL_29;
    }
    labelName = self->_labelName;
    -[VIImageRegionDomainInfo labelName](v6, "labelName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!VIObjectIsEqual((unint64_t)labelName, (uint64_t)v10))
    {
      v19 = 0;
LABEL_27:

      goto LABEL_28;
    }
    glyphName = self->_glyphName;
    -[VIImageRegionDomainInfo glyphName](v6, "glyphName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!VIObjectIsEqual((unint64_t)glyphName, (uint64_t)v12))
    {
      v19 = 0;
LABEL_26:

      goto LABEL_27;
    }
    displayLabel = self->_displayLabel;
    -[VIImageRegionDomainInfo displayLabel](v6, "displayLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!VIObjectIsEqual((unint64_t)displayLabel, (uint64_t)v14))
    {
      v19 = 0;
LABEL_25:

      goto LABEL_26;
    }
    displayMessage = self->_displayMessage;
    -[VIImageRegionDomainInfo displayMessage](v6, "displayMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!VIObjectIsEqual((unint64_t)displayMessage, (uint64_t)v16))
      goto LABEL_23;
    hasFocalPoint = self->_hasFocalPoint;
    if (hasFocalPoint != -[VIImageRegionDomainInfo hasFocalPoint](v6, "hasFocalPoint"))
      goto LABEL_23;
    -[VIImageRegionDomainInfo focalPoint](v6, "focalPoint");
    v19 = 0;
    if (self->_focalPoint.x != v20 || self->_focalPoint.y != v18)
      goto LABEL_24;
    isCornerGlyph = self->_isCornerGlyph;
    if (isCornerGlyph == -[VIImageRegionDomainInfo isCornerGlyph](v6, "isCornerGlyph")
      && (ocrResultsRequired = self->_ocrResultsRequired,
          ocrResultsRequired == -[VIImageRegionDomainInfo ocrResultsRequired](v6, "ocrResultsRequired"))
      && (barcodeResultsRequired = self->_barcodeResultsRequired,
          barcodeResultsRequired == -[VIImageRegionDomainInfo barcodeResultsRequired](v6, "barcodeResultsRequired"))
      && (isLowConfidence = self->_isLowConfidence,
          isLowConfidence == -[VIImageRegionDomainInfo isLowConfidence](v6, "isLowConfidence")))
    {
      shouldShowDynamicGlyph = self->_shouldShowDynamicGlyph;
      v19 = shouldShowDynamicGlyph == -[VIImageRegionDomainInfo shouldShowDynamicGlyph](v6, "shouldShowDynamicGlyph");
    }
    else
    {
LABEL_23:
      v19 = 0;
    }
LABEL_24:

    goto LABEL_25;
  }
  v19 = 1;
LABEL_29:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _BOOL4 hasFocalPoint;
  double x;
  double y;
  double v11;
  long double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  long double v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v3 = -[NSString hash](self->_domainKey, "hash");
  v4 = -[NSString hash](self->_labelName, "hash");
  v5 = -[NSString hash](self->_glyphName, "hash");
  v6 = -[NSString hash](self->_displayLabel, "hash");
  v7 = -[NSString hash](self->_displayMessage, "hash");
  hasFocalPoint = self->_hasFocalPoint;
  x = self->_focalPoint.x;
  y = self->_focalPoint.y;
  v11 = -x;
  if (x >= 0.0)
    v11 = self->_focalPoint.x;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = fmod(v12, 1.84467441e19);
  v15 = 2654435761u * (unint64_t)v14;
  v16 = v15 + (unint64_t)v13;
  if (v13 <= 0.0)
    v16 = 2654435761u * (unint64_t)v14;
  v17 = v15 - (unint64_t)fabs(v13);
  if (v13 < 0.0)
    v18 = v17;
  else
    v18 = v16;
  if (y >= 0.0)
    v19 = y;
  else
    v19 = -y;
  v20 = floor(v19 + 0.5);
  v21 = (v19 - v20) * 1.84467441e19;
  v22 = fmod(v20, 1.84467441e19);
  v23 = 2654435761u * (unint64_t)v22;
  v24 = v23 + (unint64_t)v21;
  if (v21 <= 0.0)
    v24 = 2654435761u * (unint64_t)v22;
  v25 = v23 - (unint64_t)fabs(v21);
  if (v21 >= 0.0)
    v25 = v24;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v25 ^ (2654435761 * hasFocalPoint) ^ v18 ^ (2654435761 * self->_isCornerGlyph) ^ (2654435761 * self->_ocrResultsRequired) ^ (2654435761 * self->_barcodeResultsRequired) ^ (2654435761 * self->_isLowConfidence) ^ (2654435761 * self->_shouldShowDynamicGlyph);
}

- (NSString)domainKey
{
  return self->_domainKey;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (BOOL)shouldShowDynamicGlyph
{
  return self->_shouldShowDynamicGlyph;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (BOOL)hasFocalPoint
{
  return self->_hasFocalPoint;
}

- (CGPoint)focalPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_focalPoint.x;
  y = self->_focalPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isCornerGlyph
{
  return self->_isCornerGlyph;
}

- (BOOL)ocrResultsRequired
{
  return self->_ocrResultsRequired;
}

- (BOOL)barcodeResultsRequired
{
  return self->_barcodeResultsRequired;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_domainKey, 0);
}

@end
