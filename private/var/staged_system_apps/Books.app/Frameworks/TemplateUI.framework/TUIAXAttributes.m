@implementation TUIAXAttributes

- (TUIAXAttributes)initWithAXAttributes:(id)a3
{
  id v4;
  TUIAXAttributes *v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  void *v14;
  NSString *v15;
  NSString *axIdentifier;
  void *v17;
  NSString *v18;
  NSString *axLabel;
  void *v20;
  NSString *v21;
  NSString *axValue;
  void *v23;
  NSString *v24;
  NSString *axHint;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TUIAXAttributes;
  v5 = -[TUIAXAttributes init](&v27, "init");
  if (v5)
  {
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFFE | (unsigned __int16)objc_msgSend(v4, "axDisabled");
    if (objc_msgSend(v4, "isAXElement"))
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFFD | v6;
    if (objc_msgSend(v4, "axTouchContainer"))
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFFB | v7;
    if (objc_msgSend(v4, "axButton"))
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFF7 | v8;
    if (objc_msgSend(v4, "axImage"))
      v9 = 16;
    else
      v9 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFEF | v9;
    if (objc_msgSend(v4, "axHeading"))
      v10 = 32;
    else
      v10 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFDF | v10;
    if (objc_msgSend(v4, "axAdjustable"))
      v11 = 64;
    else
      v11 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFFBF | v11;
    if (objc_msgSend(v4, "axToggle"))
      v12 = 128;
    else
      v12 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFF7F | v12;
    if (objc_msgSend(v4, "axStaticText"))
      v13 = 256;
    else
      v13 = 0;
    *(_WORD *)&v5->_flags = *(_WORD *)&v5->_flags & 0xFEFF | v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axIdentifier"));
    v15 = (NSString *)objc_msgSend(v14, "copy");
    axIdentifier = v5->_axIdentifier;
    v5->_axIdentifier = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axLabel"));
    v18 = (NSString *)objc_msgSend(v17, "copy");
    axLabel = v5->_axLabel;
    v5->_axLabel = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axValue"));
    v21 = (NSString *)objc_msgSend(v20, "copy");
    axValue = v5->_axValue;
    v5->_axValue = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axHint"));
    v24 = (NSString *)objc_msgSend(v23, "copy");
    axHint = v5->_axHint;
    v5->_axHint = v24;

  }
  return v5;
}

- (BOOL)axHasNonDefaultAttributess
{
  return 1;
}

- (BOOL)axDisabled
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)isAXElement
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)axTouchContainer
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)axButton
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)axImage
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)axHeading
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)axAdjustable
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)axToggle
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)axStaticText
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (NSString)axValue
{
  return self->_axValue;
}

- (NSString)axHint
{
  return self->_axHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHint, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_axLabel, 0);
  objc_storeStrong((id *)&self->_axIdentifier, 0);
}

@end
