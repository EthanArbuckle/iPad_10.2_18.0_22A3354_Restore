@implementation ICTTZoomController

- (id)zoomFontInAttributes:(id)a3
{
  return -[ICTTZoomController reallyZoomFontInAttributes:zoomDirection:](self, "reallyZoomFontInAttributes:zoomDirection:", a3, 1);
}

- (id)reallyZoomFontInAttributes:(id)a3 zoomDirection:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[ICTTZoomController zoomFont:](self, "zoomFont:", v9);
    else
      -[ICTTZoomController unzoomFont:](self, "unzoomFont:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v7);

  }
  return v6;
}

- (id)zoomFont:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[ICTTZoomController zoomFactor](self, "zoomFactor");
  if (v5 == 1.0)
  {
    v9 = objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(v4, "pointSize");
    v7 = v6;
    -[ICTTZoomController zoomFactor](self, "zoomFactor");
    objc_msgSend(v4, "ic_fontConvertedToSize:", v7 * v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (ICTTZoomController)init
{
  ICTTZoomController *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICTTZoomController;
  result = -[ICTTZoomController init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_zoomFactor = _Q0;
  }
  return result;
}

- (double)checklistZoomFactor
{
  return self->_checklistZoomFactor;
}

- (id)unzoomFontInAttributes:(id)a3
{
  return -[ICTTZoomController reallyZoomFontInAttributes:zoomDirection:](self, "reallyZoomFontInAttributes:zoomDirection:", a3, 0);
}

- (id)zoomAttributes:(id)a3
{
  return -[ICTTZoomController reallyZoomAttributes:zoomDirection:](self, "reallyZoomAttributes:zoomDirection:", a3, 1);
}

- (id)unzoomAttributes:(id)a3
{
  return -[ICTTZoomController reallyZoomAttributes:zoomDirection:](self, "reallyZoomAttributes:zoomDirection:", a3, 0);
}

- (id)reallyZoomAttributes:(id)a3 zoomDirection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63910]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "pointSize");
      v14 = v13;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        +[ICTTTextController preferredFontForICTTTextStyle:](ICTTTextController, "preferredFontForICTTTextStyle:", objc_msgSend(v15, "style"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "pointSize");
          v14 = v19;
        }
        else
        {
          v14 = -1.0;
        }

      }
      else
      {
        v14 = -1.0;
      }

    }
    if (v14 > 0.0 || (-[ICTTZoomController zoomFactor](self, "zoomFactor"), v20 == 1.0))
    {
      if (v14 <= 0.0)
      {
LABEL_23:

        goto LABEL_24;
      }
      if (v4)
      {
        -[ICTTZoomController zoomFactor](self, "zoomFactor");
        v23 = v14 * v22;
        v24 = v10;
      }
      else
      {
        v24 = v10;
        v23 = v14;
      }
      objc_msgSend(v24, "ic_fontConvertedToSize:", v23);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
        -[ICTTZoomController zoomFont:](self, "zoomFont:", v10);
      else
        -[ICTTZoomController unzoomFont:](self, "unzoomFont:", v10);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v21;

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v8);
    v10 = v25;
    goto LABEL_23;
  }
LABEL_24:

  return v7;
}

- (id)zoomAttributedString:(id)a3
{
  return -[ICTTZoomController reallyZoomAttributedString:zoomDirection:](self, "reallyZoomAttributedString:zoomDirection:", a3, 1);
}

- (id)unzoomAttributedString:(id)a3
{
  return -[ICTTZoomController reallyZoomAttributedString:zoomDirection:](self, "reallyZoomAttributedString:zoomDirection:", a3, 0);
}

- (id)reallyZoomAttributedString:(id)a3 zoomDirection:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  ICTTZoomController *v13;
  BOOL v14;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = objc_msgSend(v6, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__ICTTZoomController_reallyZoomAttributedString_zoomDirection___block_invoke;
  v11[3] = &unk_1E5C22FD0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = a4;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v11);
  v9 = v8;

  return v9;
}

void __63__ICTTZoomController_reallyZoomAttributedString_zoomDirection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "reallyZoomAttributes:zoomDirection:", v10, *(unsigned __int8 *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributes:range:", v9, a3, a4);

  }
}

- (id)unzoomFont:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[ICTTZoomController zoomFactor](self, "zoomFactor");
  if (v5 == 1.0)
  {
    v9 = objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(v4, "pointSize");
    v7 = v6;
    -[ICTTZoomController zoomFactor](self, "zoomFactor");
    objc_msgSend(v4, "ic_fontConvertedToSize:", v7 / v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (void)setChecklistZoomFactor:(double)a3
{
  self->_checklistZoomFactor = a3;
}

@end
