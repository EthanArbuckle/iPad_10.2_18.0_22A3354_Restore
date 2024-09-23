@implementation _UILabelSynthesizedContent

- (BOOL)eliminateShadows
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)overallWritingDirectionFollowsLayoutDirection
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)disableLinkHypenation
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)reverseNaturalAlignment
{
  return _UILabelShouldReverseNaturalAlignment(self->_content, -[_UILabelSynthesizedContent semanticContentAttribute](self, "semanticContentAttribute"));
}

- (BOOL)hasExplicitBaselineOffset
{
  id v3;

  v3 = -[_UILabelSynthesizedContent synthesizedAttributedString](self, "synthesizedAttributedString");
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (NSTextEncapsulation)textEncapsulation
{
  return self->_textEncapsulation;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[_UILabelSynthesizedContent synthesizedAttributedString](self, "synthesizedAttributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)synthesizedAttributes
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  NSTextEncapsulation *textEncapsulation;
  void *v12;

  objc_getAssociatedObject(self, &_MergedGlobals_1343);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UILabelSynthesizedContent overrideTextColor](self, "overrideTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_UILabelSynthesizedContent eliminateShadows](self, "eliminateShadows");
    v6 = -[_UILabelSynthesizedContent reverseNaturalAlignment](self, "reverseNaturalAlignment");
    v7 = v6;
    if (v4 || v5 || v6 || self->_textEncapsulation)
    {
      -[_UILabelContent defaultAttributes](self->_content, "defaultAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      if (v4)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, *(_QWORD *)off_1E1678D98);
      if (v5)
      {
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setShadowColor:", 0);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)off_1E1679048);

      }
      textEncapsulation = self->_textEncapsulation;
      if (textEncapsulation)
      {
        v12 = (void *)-[NSTextEncapsulation copy](textEncapsulation, "copy");
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CA80D0]);

      }
      if (v7)
      {
        _UILabelReverseNaturalAlignment(v9);
        objc_claimAutoreleasedReturnValue();

      }
      v3 = (void *)objc_msgSend(v9, "copy");

    }
    else
    {
      -[_UILabelContent defaultAttributes](self->_content, "defaultAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_setAssociatedObject(self, &_MergedGlobals_1343, v3, (void *)1);

  }
  return v3;
}

- (id)synthesizedAttributedString
{
  void *v3;
  void *v4;

  objc_getAssociatedObject(self, &unk_1ECD82A70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_UILabelSynthesizedContent _synthesizedAttributedString](self, "_synthesizedAttributedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &unk_1ECD82A70, v3, (void *)0x301);
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v3, "attribute:atIndex:longestEffectiveRange:inRange:", *(_QWORD *)off_1E1678C58, 0, 0, 0, objc_msgSend(v3, "length"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | (8 * (v4 != 0));

    }
    else
    {
      *(_BYTE *)&self->_flags &= ~8u;
    }
  }
  return v3;
}

- (id)_synthesizedAttributedString
{
  void *v3;
  _BOOL4 v4;
  _UILabelContent *content;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  char flags;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, void *, uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  if (-[_UILabelContent isNil](self->_content, "isNil"))
    goto LABEL_2;
  v4 = -[_UILabelContent isAttributed](self->_content, "isAttributed");
  content = self->_content;
  if (v4)
  {
    -[_UILabelContent attributedString](content, "attributedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelContent defaultAttributes](self->_content, "defaultAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelSynthesizedContent synthesizedAttributes](self, "synthesizedAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UILabelContent length](self->_content, "length");
    if (v7 == v8)
    {
      -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v6, 0, v9, v7);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v15, "mutableCopy");
    }
    else
    {
      v10 = (void *)objc_msgSend(v6, "mutableCopy");
      v11 = *(_QWORD *)off_1E1678D98;
      objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1678D98);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke;
      v33[3] = &unk_1E16E4C38;
      v14 = v12;
      v34 = v14;
      v15 = v10;
      v35 = v15;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v9, 0, v33);
      if ((*(_BYTE *)&self->_flags & 1) != 0)
      {
        v16 = *(_QWORD *)off_1E1679048;
        objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1679048);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v13;
        v19 = v17;
        v27 = v18;
        v28 = 3221225472;
        v29 = __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke_2;
        v30 = &unk_1E16E4C38;
        v31 = v17;
        v32 = v15;
        v20 = v19;
        objc_msgSend(v32, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v9, 0, &v27);

      }
      -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v15, 0, v9, v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

    }
  }
  else
  {
    -[_UILabelContent string](content, "string");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
LABEL_2:
      v3 = 0;
      return v3;
    }
    v6 = (void *)v23;
    v24 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[_UILabelContent string](self->_content, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILabelSynthesizedContent synthesizedAttributes](self, "synthesizedAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v24, "initWithString:attributes:", v7, v8);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    -[_UILabelSynthesizedContent _isolateStringWritingDirectionInAttributedString:](self, "_isolateStringWritingDirectionInAttributedString:", v22);
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
    -[_UILabelSynthesizedContent _disablingHyphenationIfURLsDetectedInAttributedString:](self, "_disablingHyphenationIfURLsDetectedInAttributedString:", v22);
  v3 = (void *)objc_msgSend(v22, "copy", v27, v28, v29, v30);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->_content);
  *(_QWORD *)(v4 + 24) = self->_semanticContentAttribute;
  objc_storeStrong((id *)(v4 + 16), self->_overrideTextColor);
  *(_BYTE *)(v4 + 40) = self->_flags;
  objc_getAssociatedObject(self, &_MergedGlobals_1343);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(self, &unk_1ECD82A70);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject((id)v4, &_MergedGlobals_1343, v5, (void *)0x301);
  objc_setAssociatedObject((id)v4, &unk_1ECD82A70, v6, (void *)0x301);

  return (id)v4;
}

- (id)mutableCopy
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new();
  objc_storeStrong((id *)(v3 + 8), self->_content);
  *(_QWORD *)(v3 + 24) = self->_semanticContentAttribute;
  objc_storeStrong((id *)(v3 + 16), self->_overrideTextColor);
  *(_BYTE *)(v3 + 40) = self->_flags;
  objc_getAssociatedObject(self, &_MergedGlobals_1343);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(self, &unk_1ECD82A70);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject((id)v3, &_MergedGlobals_1343, v4, (void *)0x301);
  objc_setAssociatedObject((id)v3, &unk_1ECD82A70, v5, (void *)0x301);

  return (id)v3;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_UILabelContent hash](self->_content, "hash");
  return -[UIColor hash](self->_overrideTextColor, "hash") ^ v3 ^ self->_semanticContentAttribute ^ (2 * *(_BYTE *)&self->_flags) & 2 ^ (2 * *(_BYTE *)&self->_flags) & 4 ^ (unint64_t)((2 * *(_BYTE *)&self->_flags) & 8) ^ (2 * *(_BYTE *)&self->_flags) & 0x10;
}

- (BOOL)isEqual:(id)a3
{
  _UILabelSynthesizedContent *v4;
  _UILabelSynthesizedContent *v5;
  int64_t semanticContentAttribute;
  UIColor *overrideTextColor;
  void *v8;
  UIColor *v9;
  _UILabelContent *v10;
  _UILabelContent *v11;
  _BOOL4 v12;
  _UILabelContent *content;
  void *v14;
  _UILabelContent *v15;
  _UILabelContent *v16;

  v4 = (_UILabelSynthesizedContent *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      LOBYTE(v12) = 1;
      goto LABEL_22;
    }
    if (((*(_BYTE *)&v4->_flags ^ *(_BYTE *)&self->_flags) & 7) == 0)
    {
      semanticContentAttribute = self->_semanticContentAttribute;
      if (semanticContentAttribute == -[_UILabelSynthesizedContent semanticContentAttribute](v4, "semanticContentAttribute"))
      {
        overrideTextColor = self->_overrideTextColor;
        -[_UILabelSynthesizedContent overrideTextColor](v5, "overrideTextColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = overrideTextColor;
        v10 = v8;
        v11 = v10;
        if (v9 == (UIColor *)v10)
        {

        }
        else
        {
          LOBYTE(v12) = 0;
          if (!v9 || !v10)
          {
            v15 = v10;
LABEL_20:

LABEL_21:
            goto LABEL_22;
          }
          v12 = -[UIColor isEqual:](v9, "isEqual:", v10);

          if (!v12)
            goto LABEL_21;
        }
        content = self->_content;
        -[_UILabelSynthesizedContent content](v5, "content");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = content;
        v16 = v14;
        v9 = (UIColor *)v16;
        if (v15 == v16)
        {
          LOBYTE(v12) = 1;
        }
        else
        {
          LOBYTE(v12) = 0;
          if (v15 && v16)
            LOBYTE(v12) = -[_UILabelContent isEqual:](v15, "isEqual:", v16);
        }

        goto LABEL_20;
      }
    }
  }
  LOBYTE(v12) = 0;
LABEL_22:

  return v12;
}

- (void)_disablingHyphenationIfURLsDetectedInAttributedString:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  objc_msgSend(v8, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 32, 0);
  objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = *(_QWORD *)off_1E1678F98;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84___UILabelSynthesizedContent__disablingHyphenationIfURLsDetectedInAttributedString___block_invoke;
    v9[3] = &unk_1E16EA3B8;
    v10 = v8;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v4, 0, v9);

  }
}

- (void)_isolateStringWritingDirectionInAttributedString:(id)a3
{
  id v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", self->_semanticContentAttribute) != UIUserInterfaceLayoutDirectionLeftToRight;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    -[_UILabelContent paragraphStyle](self->_content, "paragraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "length");
    v9 = *(_QWORD *)off_1E1678F98;
    v10 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke;
    v39[3] = &unk_1E16EA368;
    v11 = v7;
    v40 = v11;
    v41 = &v43;
    v42 = &v47;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v39);
    v12 = v48[3];
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelSynthesizedContent.m"), 297, CFSTR("should have at least one isolate range (beginning to end)"));

      v12 = v48[3];
    }
    v28 = v11;
    v13 = malloc_type_malloc(16 * v12, 0x100004030AC6366uLL);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    *((_WORD *)v44 + 12) = 0;
    v14 = objc_msgSend(v5, "length");
    v29[0] = v10;
    v29[1] = 3221225472;
    v29[2] = __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke_2;
    v29[3] = &unk_1E16EA390;
    v29[4] = self;
    v31 = &v43;
    v32 = &v35;
    v33 = v13;
    v34 = v6;
    v15 = v5;
    v30 = v15;
    objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v14, 0, v29);
    v16 = v36[3];
    if (v16 != v48[3])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelSynthesizedContent.m"), 324, CFSTR("Number of writing direction changes was inconsistent"));

      v16 = v48[3];
    }
    if (v16)
    {
      v17 = 0;
      v18 = 0;
      v19 = v13 + 1;
      do
      {
        v20 = *((unsigned __int16 *)v19 - 4);
        v21 = *v19 + v18;
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 8297);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "replaceCharactersInRange:withString:", v21, 0, v22);

          ++v21;
          ++v18;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "replaceCharactersInRange:withString:", v21, 0, v23);
        v19 += 2;

        ++v18;
        ++v17;
      }
      while (v17 < v48[3]);
    }
    v24 = objc_msgSend(v15, "length");
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 8297);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceCharactersInRange:withString:", v24, 0, v25);

    free(v13);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  char flags;
  void *v6;
  unint64_t semanticContentAttribute;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("eliminateShadows"));
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addObject:", CFSTR("disableLinkHypenation"));
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_10:
  objc_msgSend(v4, "addObject:", CFSTR("explicitBaselineOffset"));
  if ((*(_BYTE *)&self->_flags & 2) != 0)
LABEL_5:
    objc_msgSend(v4, "addObject:", CFSTR("overallWritingDirectionFollowsLayoutDirection"));
LABEL_6:
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  semanticContentAttribute = self->_semanticContentAttribute;
  if (semanticContentAttribute > 4)
    v8 = CFSTR("?");
  else
    v8 = off_1E16ED870[semanticContentAttribute];
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  -[_UILabelSynthesizedContent synthesizedAttributes](self, "synthesizedAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILabelSynthesizedContent synthesizedAttributedString](self, "synthesizedAttributedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%p attributes=%@ text=%@ semanticContentAttribute=%@ overrideTextColor=%@ flags=(%@)>"), v10, self, v11, v12, v8, self->_overrideTextColor, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (_UILabelContent)content
{
  return self->_content;
}

- (UIColor)overrideTextColor
{
  return self->_overrideTextColor;
}

- (int64_t)semanticContentAttribute
{
  return self->_semanticContentAttribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncapsulation, 0);
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
