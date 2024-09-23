@implementation SKUIAttributedStringLayout

- (SKUIAttributedStringLayout)initWithLayoutRequest:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIAttributedStringLayout *v13;
  uint64_t v14;
  NSAttributedString *attributedString;
  NSStringDrawingContext *v16;
  NSStringDrawingContext *context;
  uint64_t v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  float v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  __int128 v29;
  NSAttributedString *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  NSAttributedString *v34;
  uint64_t v35;
  uint64_t v36;
  SKUIAttributedStringLayout *v37;
  NSAttributedString *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  NSShadow *shadow;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  float height;
  _QWORD v60[5];
  _QWORD v61[4];
  SKUIAttributedStringLayout *v62;
  _QWORD v63[5];
  uint64_t v64;
  double *v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIAttributedStringLayout initWithLayoutRequest:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v70.receiver = self;
  v70.super_class = (Class)SKUIAttributedStringLayout;
  v13 = -[SKUIAttributedStringLayout init](&v70, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "attributedString");
    v14 = objc_claimAutoreleasedReturnValue();
    attributedString = v13->_attributedString;
    v13->_attributedString = (NSAttributedString *)v14;

    v16 = (NSStringDrawingContext *)objc_alloc_init(MEMORY[0x1E0DC12A0]);
    context = v13->_context;
    v13->_context = v16;

    v18 = objc_msgSend(v4, "numberOfLines");
    -[NSStringDrawingContext setCachesLayout:](v13->_context, "setCachesLayout:", 1);
    -[NSStringDrawingContext setMaximumNumberOfLines:](v13->_context, "setMaximumNumberOfLines:", v18);
    -[NSStringDrawingContext setWantsBaselineOffset:](v13->_context, "setWantsBaselineOffset:", objc_msgSend(v4, "wantsBaselineOffset"));
    -[NSStringDrawingContext setWrapsForTruncationMode:](v13->_context, "setWrapsForTruncationMode:", v18 != 1);
    objc_msgSend(v4, "width");
    v20 = v19;
    -[NSAttributedString boundingRectWithSize:options:context:](v13->_attributedString, "boundingRectWithSize:options:context:", 33, v13->_context);
    v23 = v22;
    v24 = ceilf(v23);
    if (v20 < v24)
      v24 = v20;
    v13->_boundingSize.width = v24;
    v13->_boundingSize.height = v21;
    if (initWithLayoutRequest__sOnce != -1)
      dispatch_once(&initWithLayoutRequest__sOnce, &__block_literal_global_60);
    -[NSAttributedString string](v13->_attributedString, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "rangeOfCharacterFromSet:", initWithLayoutRequest__sTallCharactersSet);

    v27 = MEMORY[0x1E0C809B0];
    v28 = (__int128 *)MEMORY[0x1E0DC49E8];
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13->_usesTallCharacterSet = 1;
      v64 = 0;
      v65 = (double *)&v64;
      v66 = 0x4010000000;
      v67 = &unk_1BBF15257;
      v29 = v28[1];
      v68 = *v28;
      v69 = v29;
      v30 = v13->_attributedString;
      v31 = -[NSAttributedString length](v30, "length");
      v32 = *MEMORY[0x1E0DC1138];
      v63[0] = v27;
      v63[1] = 3221225472;
      v63[2] = __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_2;
      v63[3] = &unk_1E73A8F90;
      v63[4] = &v64;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v30, "enumerateAttribute:inRange:options:usingBlock:", v32, 0, v31, 0, v63);
      v33 = v65[4];
      v13->_boundingSize.height = v13->_boundingSize.height + v65[6] + v33;
      v13->_topInset = v33;
      _Block_object_dispose(&v64, 8);
    }
    v34 = v13->_attributedString;
    v35 = *MEMORY[0x1E0DC1198];
    v36 = -[NSAttributedString length](v34, "length");
    v61[0] = v27;
    v61[1] = 3221225472;
    v61[2] = __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_3;
    v61[3] = &unk_1E73A8FB8;
    v37 = v13;
    v62 = v37;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v34, "enumerateAttribute:inRange:options:usingBlock:", v35, 0, v36, 0, v61);
    v64 = 0;
    v65 = (double *)&v64;
    v66 = 0x2020000000;
    v67 = 0;
    v38 = v13->_attributedString;
    v39 = -[NSAttributedString length](v38, "length");
    v40 = *MEMORY[0x1E0DC1178];
    v60[0] = v27;
    v60[1] = 3221225472;
    v60[2] = __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_4;
    v60[3] = &unk_1E73A8FE0;
    v60[4] = &v64;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v38, "enumerateAttribute:inRange:options:usingBlock:", v40, 0, v39, 0, v60);
    v41 = v28[1];
    *(_OWORD *)&v37->_edgeInsetsForShadow.top = *v28;
    *(_OWORD *)&v37->_edgeInsetsForShadow.bottom = v41;
    shadow = v37->_shadow;
    if (shadow)
    {
      -[NSShadow shadowOffset](shadow, "shadowOffset");
      v44 = v43;
      -[NSShadow shadowBlurRadius](v37->_shadow, "shadowBlurRadius");
      v46 = -v44;
      if (v44 >= 0.0)
        v46 = v44;
      v47 = v46 + v45;
      if (*((_QWORD *)v65 + 3) == 1)
      {
        v37->_edgeInsetsForShadow.right = v47 * 0.5;
        v37->_edgeInsetsForShadow.left = v47 * 0.5;
      }
      -[NSShadow shadowOffset](v37->_shadow, "shadowOffset");
      v48 = 80;
      if (v49 < 0.0)
        v48 = 64;
      *(double *)((char *)&v37->super.isa + v48) = v47;
      -[NSShadow shadowOffset](v37->_shadow, "shadowOffset");
      v51 = v50;
      -[NSShadow shadowBlurRadius](v37->_shadow, "shadowBlurRadius");
      v53 = v52;
      -[NSShadow shadowOffset](v37->_shadow, "shadowOffset");
      v55 = -v51;
      if (v51 >= 0.0)
        v55 = v51;
      v56 = v55 + v53;
      v57 = 72;
      if (v54 < 0.0)
        v57 = 56;
      *(double *)((char *)&v37->super.isa + v57) = v56;
    }
    height = v13->_boundingSize.height;
    v13->_boundingSize.height = ceilf(height);
    _Block_object_dispose(&v64, 8);

  }
  return v13;
}

void __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  v2 = (void *)initWithLayoutRequest__sTallCharactersSet;
  initWithLayoutRequest__sTallCharactersSet = (uint64_t)v1;

}

uint64_t __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  __int128 v11;
  __int128 v12;

  v11 = *MEMORY[0x1E0DC49E8];
  v12 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  result = CTFontGetLanguageAwareOutsets();
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(double *)(v3 + 48);
    if (v4 < *(double *)&v12)
      v4 = *(double *)&v12;
    *(double *)(v3 + 48) = v4;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(double *)(v5 + 40);
    if (v6 < *((double *)&v11 + 1))
      v6 = *((double *)&v11 + 1);
    *(double *)(v5 + 40) = v6;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(double *)(v7 + 56);
    if (v8 < *((double *)&v12 + 1))
      v8 = *((double *)&v12 + 1);
    *(double *)(v7 + 56) = v8;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(double *)(v9 + 32);
    if (v10 < *(double *)&v11)
      v10 = *(double *)&v11;
    *(double *)(v9 + 32) = v10;
  }
  return result;
}

void __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
  *a5 = 1;
}

uint64_t __52__SKUIAttributedStringLayout_initWithLayoutRequest___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "alignment");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a5 = 1;
  return result;
}

- (double)baselineOffset
{
  double v3;

  -[NSStringDrawingContext baselineOffset](self->_context, "baselineOffset");
  return v3 + self->_topInset;
}

- (double)firstBaselineOffset
{
  double v3;

  -[NSStringDrawingContext firstBaselineOffset](self->_context, "firstBaselineOffset");
  return v3 + self->_topInset;
}

- (int64_t)numberOfLines
{
  return -[NSStringDrawingContext numberOfLineFragments](self->_context, "numberOfLineFragments");
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGSize)boundingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_boundingSize.width;
  height = self->_boundingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSStringDrawingContext)stringDrawingContext
{
  return self->_context;
}

- (BOOL)usesTallCharacterSet
{
  return self->_usesTallCharacterSet;
}

- (UIEdgeInsets)edgeInsetsForShadow
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsetsForShadow.top;
  left = self->_edgeInsetsForShadow.left;
  bottom = self->_edgeInsetsForShadow.bottom;
  right = self->_edgeInsetsForShadow.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (double)topInset
{
  return self->_topInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (void)initWithLayoutRequest:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
