@implementation CRLWPStyleRun

- (CRLWPStyleRun)init
{
  CRLWPStyleRun *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPStyleRun;
  result = -[CRLWPStyleRun init](&v3, "init");
  if (result)
    result->_charIndex = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLWPStyleRun *v4;
  void *v5;
  void *v6;
  _OWORD v8[12];

  v4 = objc_opt_new(CRLWPStyleRun);
  -[CRLWPStyleRun setCharIndex:](v4, "setCharIndex:", -[CRLWPStyleRun charIndex](self, "charIndex"));
  -[CRLWPStyleRun setRunLength:](v4, "setRunLength:", -[CRLWPStyleRun runLength](self, "runLength"));
  -[CRLWPStyleRun setFlags:](v4, "setFlags:", -[CRLWPStyleRun flags](self, "flags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStyleRun characterStyle](self, "characterStyle"));
  -[CRLWPStyleRun setCharacterStyle:](v4, "setCharacterStyle:", v5);

  -[CRLWPStyleRun setCtFont:](v4, "setCtFont:", -[CRLWPStyleRun ctFont](self, "ctFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStyleRun attributes](self, "attributes"));
  -[CRLWPStyleRun setAttributes:](v4, "setAttributes:", v6);

  -[CRLWPStyleRun fontHeightInfo](self, "fontHeightInfo");
  v8[2] = v8[8];
  v8[3] = v8[9];
  v8[4] = v8[10];
  v8[5] = v8[11];
  v8[0] = v8[6];
  v8[1] = v8[7];
  -[CRLWPStyleRun setFontHeightInfo:](v4, "setFontHeightInfo:", v8);
  return v4;
}

- (BOOL)coalesceWith:(id)a3
{
  void *v3;
  id v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  __CTFont *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;

  v5 = a3;
  v6 = -[CRLWPStyleRun charIndex](self, "charIndex");
  v7 = -[CRLWPStyleRun runLength](self, "runLength");
  if ((id)(v7 + v6) != objc_msgSend(v5, "charIndex"))
    goto LABEL_19;
  v8 = -[CRLWPStyleRun flags](self, "flags");
  if (v8 != objc_msgSend(v5, "flags"))
    goto LABEL_19;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStyleRun characterStyle](self, "characterStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "characterStyle"));
  if (v9 != v10)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStyleRun characterStyle](self, "characterStyle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "characterStyle"));
    if (!objc_msgSend(v21, "isEqual:", v3))
      goto LABEL_14;
  }
  v11 = -[CRLWPStyleRun ctFont](self, "ctFont");
  if (v11 != objc_msgSend(v5, "ctFont")
    && !CFEqual(-[CRLWPStyleRun ctFont](self, "ctFont"), objc_msgSend(v5, "ctFont")))
  {
    v18 = v9;
    if (v9 == v10)
    {
LABEL_15:

      goto LABEL_19;
    }
LABEL_14:

    v18 = v10;
    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStyleRun attributes](self, "attributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributes"));
  if (v12 == v13)
  {

    v17 = v9;
    if (v9 != v10)
    {

      v17 = v10;
    }

    goto LABEL_18;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStyleRun attributes](self, "attributes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributes"));
  v16 = objc_msgSend(v14, "isEqualToDictionary:", v15);

  if (v9 == v10)
  {

  }
  else
  {

  }
  if ((v16 & 1) == 0)
  {
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
LABEL_18:
  -[CRLWPStyleRun setRunLength:](self, "setRunLength:", (char *)objc_msgSend(v5, "runLength") + -[CRLWPStyleRun runLength](self, "runLength"));
  v19 = 1;
LABEL_20:

  return v19;
}

- (_NSRange)range
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[CRLWPStyleRun charIndex](self, "charIndex");
  v4 = -[CRLWPStyleRun runLength](self, "runLength");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (unint64_t)charIndex
{
  return self->_charIndex;
}

- (void)setCharIndex:(unint64_t)a3
{
  self->_charIndex = a3;
}

- (unint64_t)runLength
{
  return self->_runLength;
}

- (void)setRunLength:(unint64_t)a3
{
  self->_runLength = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (_TtC8Freeform19CRLWPCharacterStyle)characterStyle
{
  return self->_characterStyle;
}

- (void)setCharacterStyle:(id)a3
{
  objc_storeStrong((id *)&self->_characterStyle, a3);
}

- (__CTFont)ctFont
{
  return self->_ctFont;
}

- (void)setCtFont:(__CTFont *)a3
{
  self->_ctFont = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (CRLWPFontHeightInfo)fontHeightInfo
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[1].attachmentHeight;
  *(_OWORD *)&retstr->descent = *(_OWORD *)&self->underlineThickness;
  *(_OWORD *)&retstr->leadingBelow = v3;
  v4 = *(_OWORD *)&self[1].leadingAbove;
  *(_OWORD *)&retstr->verticalHeight = *(_OWORD *)&self[1].capHeight;
  *(_OWORD *)&retstr->underlinePosition = v4;
  v5 = *(_OWORD *)&self->xHeight;
  *(_OWORD *)&retstr->spaceBefore = *(_OWORD *)&self->spaceAfter;
  *(_OWORD *)&retstr->ascent = v5;
  return self;
}

- (void)setFontHeightInfo:(CRLWPFontHeightInfo *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->spaceBefore;
  *(_OWORD *)&self->_fontHeightInfo.ascent = *(_OWORD *)&a3->ascent;
  *(_OWORD *)&self->_fontHeightInfo.spaceBefore = v3;
  v4 = *(_OWORD *)&a3->descent;
  v5 = *(_OWORD *)&a3->leadingBelow;
  v6 = *(_OWORD *)&a3->verticalHeight;
  *(_OWORD *)&self->_fontHeightInfo.underlinePosition = *(_OWORD *)&a3->underlinePosition;
  *(_OWORD *)&self->_fontHeightInfo.verticalHeight = v6;
  *(_OWORD *)&self->_fontHeightInfo.leadingBelow = v5;
  *(_OWORD *)&self->_fontHeightInfo.descent = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_characterStyle, 0);
}

@end
