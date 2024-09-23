@implementation CRFormAdjustFieldHeightStep

- (CRFormAdjustFieldHeightStep)init
{
  CRFormAdjustFieldHeightStep *v2;
  void *v3;
  void *v4;
  float v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRFormAdjustFieldHeightStep;
  v2 = -[CRFormAdjustFieldHeightStep init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.CoreRecognition.signature_field_height"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "floatValue");
      v6 = v5;
    }
    else
    {
      v6 = 1.15;
    }
    v2->_underlinedSignatureFieldHeightScaling = v6;

  }
  return v2;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double underlinedSignatureFieldHeightScaling;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CRNormalizedQuad *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  CRNormalizedQuad *v36;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v7, "_flattenedFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        CRCastAsClass<CRFormTextFieldOutputRegion>(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          && (objc_msgSend(v12, "hasBoundedHeight") & 1) == 0
          && objc_msgSend(v12, "hasBoundedWidth"))
        {
          underlinedSignatureFieldHeightScaling = 1.15;
          if (objc_msgSend(v12, "textContentType") == 50)
            underlinedSignatureFieldHeightScaling = self->_underlinedSignatureFieldHeightScaling;
          objc_msgSend(v12, "boundingQuad");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "topLeft");
          v17 = v16;
          v19 = v18;
          objc_msgSend(v15, "topRight");
          v21 = v20;
          v38 = v22;
          v39 = v17;
          objc_msgSend(v15, "size");
          v24 = v23;
          v25 = [CRNormalizedQuad alloc];
          objc_msgSend(v15, "bottomRight");
          v27 = v26;
          v29 = v28;
          objc_msgSend(v15, "bottomLeft");
          v31 = v30;
          v33 = v32;
          objc_msgSend(v15, "normalizationSize");
          v36 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v25, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v39, v19 - (underlinedSignatureFieldHeightScaling + -1.0) * v24, v38, v21 - (underlinedSignatureFieldHeightScaling + -1.0) * v24, v27, v29, v31, v33, v34, v35);
          objc_msgSend(v13, "setBoundingQuad:", v36);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v9);
  }

  return v7;
}

@end
